@interface CHContactChangeManager
- (BOOL)processingNotification;
- (CHContactChangeManager)initWithSpotlightIndexManager:(id)a3 featureFlags:(id)a4;
- (CHFeatureFlags)featureFlags;
- (CHSpotlightIndexManager)spotlightIndexManager;
- (CNContactStore)contactStore;
- (NSData)currentHistoryToken;
- (os_unfair_lock_s)accessorLock;
- (void)contactStoreDidChange:(id)a3;
- (void)fetchContacts;
- (void)fetchContactsAfterDelay;
- (void)setCurrentHistoryToken:(id)a3;
- (void)setNeedsDeferredReindexingForReason:(unint64_t)a3;
- (void)setProcessingNotification:(BOOL)a3;
- (void)triggerReindexingForReason:(unint64_t)a3;
- (void)updateCurrentHistoryToken;
- (void)visitAddContactEvent:(id)a3;
- (void)visitDeleteContactEvent:(id)a3;
- (void)visitDropEverythingEvent:(id)a3;
- (void)visitUpdateContactEvent:(id)a3;
@end

@implementation CHContactChangeManager

- (CHContactChangeManager)initWithSpotlightIndexManager:(id)a3 featureFlags:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CHContactChangeManager;
  v8 = [(CHContactChangeManager *)&v17 initWithName:"CHContactChangeManager"];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_spotlightIndexManager, v6);
    uint64_t v10 = [v6 contactStore];
    contactStore = v9->_contactStore;
    v9->_contactStore = (CNContactStore *)v10;

    objc_storeStrong((id *)&v9->_featureFlags, a4);
    v12 = +[NSUserDefaults standardUserDefaults];
    uint64_t v13 = [v12 valueForKey:@"kCHLastFetchedContactHistoryToken"];
    currentHistoryToken = v9->_currentHistoryToken;
    v9->_currentHistoryToken = (NSData *)v13;

    v15 = +[NSNotificationCenter defaultCenter];
    [v15 addObserver:v9 selector:"contactStoreDidChange:" name:CNContactStoreDidChangeNotification object:0];

    [(CHContactChangeManager *)v9 fetchContactsAfterDelay];
  }

  return v9;
}

- (void)setCurrentHistoryToken:(id)a3
{
  id v6 = (NSData *)a3;
  if ([(CHFeatureFlags *)self->_featureFlags callHistorySearchEnabled]
    && self->_currentHistoryToken != v6)
  {
    objc_storeStrong((id *)&self->_currentHistoryToken, a3);
    v5 = +[NSUserDefaults standardUserDefaults];
    [v5 setValue:v6 forKey:@"kCHLastFetchedContactHistoryToken"];
  }
}

- (BOOL)processingNotification
{
  v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_processingNotification;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setProcessingNotification:(BOOL)a3
{
  BOOL v3 = a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  if (self->_processingNotification != v3) {
    self->_processingNotification = v3;
  }
  os_unfair_lock_unlock(p_accessorLock);
}

- (void)contactStoreDidChange:(id)a3
{
  if ([(CHFeatureFlags *)self->_featureFlags callHistorySearchEnabled])
  {
    v4 = [(CHContactChangeManager *)self logHandle];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CHContactChangeManager: Contacts store reported a change", v5, 2u);
    }

    [(CHContactChangeManager *)self fetchContactsAfterDelay];
  }
}

- (void)fetchContactsAfterDelay
{
  if ([(CHFeatureFlags *)self->_featureFlags callHistorySearchEnabled])
  {
    if (![(CHContactChangeManager *)self processingNotification])
    {
      [(CHContactChangeManager *)self setProcessingNotification:1];
      dispatch_time_t v3 = dispatch_time(0, 5000000000);
      v4 = [(CHContactChangeManager *)self queue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001CC0C;
      block[3] = &unk_100048BC8;
      block[4] = self;
      dispatch_after(v3, v4, block);
    }
  }
}

- (void)fetchContacts
{
  if ([(CHFeatureFlags *)self->_featureFlags callHistorySearchEnabled])
  {
    dispatch_time_t v3 = [(CHContactChangeManager *)self logHandle];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CHContactChangeManager: Fetching contacts from CNContactStore", buf, 2u);
    }

    v4 = [(CHContactChangeManager *)self currentHistoryToken];

    if (v4)
    {
      id v5 = objc_alloc_init((Class)CNChangeHistoryFetchRequest);
      id v6 = [(CHContactChangeManager *)self currentHistoryToken];
      [v5 setStartingToken:v6];

      v41[0] = CNContactEmailAddressesKey;
      v41[1] = CNContactPhoneNumbersKey;
      id v7 = +[NSArray arrayWithObjects:v41 count:2];
      [v5 setAdditionalContactKeyDescriptors:v7];

      v8 = [(CHContactChangeManager *)self contactStore];
      id v37 = 0;
      v9 = [v8 countForFetchRequest:v5 error:&v37];
      id v10 = v37;

      if (v9)
      {
        v11 = [v9 value];
        id v12 = [v11 unsignedIntegerValue];

        if ((unint64_t)v12 < 0x65)
        {
          v21 = [v9 value];
          id v22 = [v21 unsignedIntegerValue];

          if (v22)
          {

            v23 = [(CHContactChangeManager *)self contactStore];
            id v36 = 0;
            v24 = [v23 executeFetchRequest:v5 error:&v36];
            id v10 = v36;

            [(CHContactChangeManager *)self setProcessingNotification:0];
            if (v24)
            {
              v25 = [v24 currentHistoryToken];
              [(CHContactChangeManager *)self setCurrentHistoryToken:v25];

              long long v34 = 0u;
              long long v35 = 0u;
              long long v32 = 0u;
              long long v33 = 0u;
              v26 = objc_msgSend(v24, "value", 0);
              id v27 = [v26 countByEnumeratingWithState:&v32 objects:v38 count:16];
              if (v27)
              {
                id v28 = v27;
                uint64_t v29 = *(void *)v33;
                do
                {
                  for (i = 0; i != v28; i = (char *)i + 1)
                  {
                    if (*(void *)v33 != v29) {
                      objc_enumerationMutation(v26);
                    }
                    [*(id *)(*((void *)&v32 + 1) + 8 * i) acceptEventVisitor:self];
                  }
                  id v28 = [v26 countByEnumeratingWithState:&v32 objects:v38 count:16];
                }
                while (v28);
              }
            }
            else
            {
              v26 = [(CHContactChangeManager *)self logHandle];
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                id v40 = v10;
                _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "CHContactChangeManager: Could not fetch Change History from CNContactStore error: %{public}@", buf, 0xCu);
              }
            }
          }
          else
          {
            v31 = [(CHContactChangeManager *)self logHandle];
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "CHContactChangeManager: Contact store count is 0, no need to reindex", buf, 2u);
            }

            [(CHContactChangeManager *)self setProcessingNotification:0];
          }
          goto LABEL_33;
        }
        uint64_t v13 = [(CHContactChangeManager *)self logHandle];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = [v9 value];
          id v15 = [v14 unsignedIntegerValue];
          *(_DWORD *)buf = 134217984;
          id v40 = v15;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "CHContactChangeManager: Contact store count: %lu is greater than threshold, triggering a full reindex", buf, 0xCu);
        }
        v16 = [v9 currentHistoryToken];
        [(CHContactChangeManager *)self setCurrentHistoryToken:v16];

        objc_super v17 = self;
        uint64_t v18 = 64;
      }
      else
      {
        v20 = [(CHContactChangeManager *)self logHandle];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v40 = v10;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "CHContactChangeManager: Could not fetch Change History Count from CNContactStore error: %{public}@, triggering a full reindex", buf, 0xCu);
        }

        objc_super v17 = self;
        uint64_t v18 = 32;
      }
      [(CHContactChangeManager *)v17 triggerReindexingForReason:v18];
LABEL_33:

      return;
    }
    v19 = [(CHContactChangeManager *)self logHandle];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "CHContactChangeManager: currentHistoryToken is nil , triggering a full reindex", buf, 2u);
    }

    [(CHContactChangeManager *)self triggerReindexingForReason:16];
  }
}

- (void)triggerReindexingForReason:(unint64_t)a3
{
  [(CHContactChangeManager *)self setNeedsDeferredReindexingForReason:a3];
  [(CHContactChangeManager *)self setProcessingNotification:0];
}

- (void)visitDropEverythingEvent:(id)a3
{
  if ([(CHFeatureFlags *)self->_featureFlags callHistorySearchEnabled])
  {
    v4 = [(CHContactChangeManager *)self logHandle];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CHContactChangeManager: Handling a Drop Everything change history event", v5, 2u);
    }

    [(CHContactChangeManager *)self setNeedsDeferredReindexingForReason:128];
  }
}

- (void)visitAddContactEvent:(id)a3
{
  id v4 = a3;
  if ([(CHFeatureFlags *)self->_featureFlags callHistorySearchEnabled])
  {
    id v5 = [(CHContactChangeManager *)self logHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CHContactChangeManager: Handling a Add Contact change history event", (uint8_t *)&v21, 2u);
    }

    id v6 = [v4 contact];
    id v7 = objc_retainBlock(ch_allPhoneNumberLastFourDigits);
    v23[0] = v7;
    id v8 = objc_retainBlock(ch_allEmails);
    v23[1] = v8;
    v9 = +[NSArray arrayWithObjects:v23 count:2];
    id v10 = [v6 handlesIncluding:v9];

    v11 = [(CHContactChangeManager *)self logHandle];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412290;
      id v22 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CHContactChangeManager: Updating calls for handle IDs: %@", (uint8_t *)&v21, 0xCu);
    }

    if (v10)
    {
      id v12 = [(CHContactChangeManager *)self spotlightIndexManager];

      if (v12)
      {
        uint64_t v13 = [(CHContactChangeManager *)self spotlightIndexManager];
        [v13 updateCallsHavingHandles:v10 orContactIdentifier:0];
      }
      else
      {
        uint64_t v13 = [(CHContactChangeManager *)self logHandle];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_10002EF00(v13, v14, v15, v16, v17, v18, v19, v20);
        }
      }
    }
  }
}

- (void)visitUpdateContactEvent:(id)a3
{
  id v4 = a3;
  if ([(CHFeatureFlags *)self->_featureFlags callHistorySearchEnabled])
  {
    id v5 = [(CHContactChangeManager *)self logHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CHContactChangeManager: Handling a Update Contact change history event", (uint8_t *)&v22, 2u);
    }

    id v6 = [v4 contact];
    id v7 = objc_retainBlock(ch_allPhoneNumberLastFourDigits);
    v24[0] = v7;
    id v8 = objc_retainBlock(ch_allEmails);
    v24[1] = v8;
    v9 = +[NSArray arrayWithObjects:v24 count:2];
    id v10 = [v6 handlesIncluding:v9];

    v11 = [(CHContactChangeManager *)self logHandle];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138412290;
      v23 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CHContactChangeManager: Updating calls for handle IDs: %@", (uint8_t *)&v22, 0xCu);
    }

    if (v10)
    {
      id v12 = [(CHContactChangeManager *)self spotlightIndexManager];

      if (v12)
      {
        uint64_t v13 = [(CHContactChangeManager *)self spotlightIndexManager];
        uint64_t v14 = [v6 identifier];
        [v13 updateCallsHavingHandles:v10 orContactIdentifier:v14];
      }
      else
      {
        uint64_t v13 = [(CHContactChangeManager *)self logHandle];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_10002EF00(v13, v15, v16, v17, v18, v19, v20, v21);
        }
      }
    }
  }
}

- (void)visitDeleteContactEvent:(id)a3
{
  id v4 = a3;
  if ([(CHFeatureFlags *)self->_featureFlags callHistorySearchEnabled])
  {
    id v5 = [(CHContactChangeManager *)self logHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CHContactChangeManager: Handling a Delete Contact change history event", v16, 2u);
    }

    id v6 = [v4 contactIdentifier];
    if (v6)
    {
      id v7 = [(CHContactChangeManager *)self spotlightIndexManager];

      if (v7)
      {
        id v8 = [(CHContactChangeManager *)self spotlightIndexManager];
        [v8 updateCallsHavingHandles:0 orContactIdentifier:v6];
      }
      else
      {
        id v8 = [(CHContactChangeManager *)self logHandle];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          sub_10002EF00(v8, v9, v10, v11, v12, v13, v14, v15);
        }
      }
    }
  }
}

- (void)updateCurrentHistoryToken
{
  if ([(CHFeatureFlags *)self->_featureFlags callHistorySearchEnabled])
  {
    dispatch_time_t v3 = [(CHContactChangeManager *)self logHandle];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CHContactChangeManager: Updating current history token", v6, 2u);
    }

    id v4 = [(CHContactChangeManager *)self contactStore];
    id v5 = [v4 currentHistoryToken];
    [(CHContactChangeManager *)self setCurrentHistoryToken:v5];
  }
}

- (void)setNeedsDeferredReindexingForReason:(unint64_t)a3
{
}

- (NSData)currentHistoryToken
{
  return self->_currentHistoryToken;
}

- (CHFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (CHSpotlightIndexManager)spotlightIndexManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_spotlightIndexManager);
  return (CHSpotlightIndexManager *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_spotlightIndexManager);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_currentHistoryToken, 0);
}

@end