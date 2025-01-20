@interface MPVoicemailController
+ (id)_telephonyClient;
- (BOOL)isRestrictedMessage:(id)a3;
- (BOOL)isSetupRequired;
- (BOOL)shouldShowVerifiedBadge;
- (CNContactFormatter)contactFormatter;
- (CNContactStore)contactStore;
- (CNContactStore)suggestedContactStore;
- (MPVoicemailController)init;
- (MPVoicemailController)initWithVoicemailManager:(id)a3 accountManager:(id)a4 callProviderManager:(id)a5 contactStore:(id)a6 suggestedContactStore:(id)a7 metadataCache:(id)a8;
- (MPVoicemailManagerProtocol)voicemailManager;
- (NSArray)audioMessages;
- (NSArray)contactKeyDescriptors;
- (NSArray)messages;
- (NSCache)localizedDowntimeTitleCache;
- (NSCache)localizedSubtitleCache;
- (NSCache)localizedTitleCache;
- (NSMutableDictionary)contactCache;
- (OS_dispatch_queue)completionDispatchQueue;
- (OS_dispatch_queue)serialDispatchQueue;
- (TUCallProviderManager)callProviderManager;
- (TUFeatureFlags)featureFlags;
- (TUMetadataCache)metadataCache;
- (VMVoicemailManager)accountManager;
- (id)attributedStringForDowntimeMessage:(id)a3;
- (id)audioMessagesPassingTest:(id)a3;
- (id)localizedAttributedDowntimeTitleForMessage:(id)a3;
- (id)localizedHandleTitleFromMessage:(id)a3;
- (id)localizedSubtitleForMessage:(id)a3;
- (id)localizedTitleForMessage:(id)a3;
- (id)messagesPassingTest:(id)a3;
- (id)mutableSenderContactForMessage:(id)a3;
- (id)senderContactForMessage:(id)a3;
- (unint64_t)unreadMessageCount;
- (void)audioMessagesPassingTest:(id)a3 withCompletion:(id)a4;
- (void)audioMessagesWithCompletion:(id)a3;
- (void)dealloc;
- (void)deleteMessages:(id)a3;
- (void)fetchContactsForMessages:(id)a3 keyDescriptors:(id)a4;
- (void)fetchLegacyVoicemailsCompletion:(id)a3;
- (void)fetchMessagesCompletion:(id)a3;
- (void)fetchMetadataForMessages:(id)a3;
- (void)handleCNContactStoreDidChangeNotification:(id)a3;
- (void)handleNSCurrentLocaleDidChangeNotification:(id)a3;
- (void)handleRecentsChangedNotification:(id)a3;
- (void)handleTUMetadataCacheDidFinishUpdatingNotification:(id)a3;
- (void)handleUIApplicationSignificantTimeChangeNotification:(id)a3;
- (void)handleUIApplicationWillEnterForegroundNotification:(id)a3;
- (void)handleVoicemailsChangedNotification:(id)a3;
- (void)loadLocalizedTitlesForMessages:(id)a3;
- (void)markMessagesAsRead:(id)a3;
- (void)messageForIdentifier:(id)a3 completionBlock:(id)a4;
- (void)messagesPassingTest:(id)a3 withCompletion:(id)a4;
- (void)moveMessagesToInbox:(id)a3;
- (void)performSynchronousBlock:(id)a3;
- (void)postMPVoicemailControllerMessagesDidChangeNotification;
- (void)postMPVoicemailControllerUnreadMessageCountDidChangeNotification;
- (void)providersChangedForProviderManager:(id)a3;
- (void)setAudioMessages:(id)a3;
- (void)setCompletionDispatchQueue:(id)a3;
- (void)setContactFormatter:(id)a3;
- (void)setMessages:(id)a3;
- (void)setUnreadMessageCount:(unint64_t)a3;
- (void)trashMessages:(id)a3;
@end

@implementation MPVoicemailController

BOOL __37__MPVoicemailController_setMessages___block_invoke(id a1, MPMessage *a2, NSDictionary *a3)
{
  return [(MPMessage *)a2 messageType] != (id)2;
}

void __38__MPVoicemailController_audioMessages__block_invoke(uint64_t a1)
{
}

void __49__MPVoicemailController_fetchMessagesCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) serialDispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __49__MPVoicemailController_fetchMessagesCompletion___block_invoke_2;
  block[3] = &unk_10027CFB8;
  v5 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, block);
}

id __61__MPVoicemailController_handleVoicemailsChangedNotification___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __61__MPVoicemailController_handleVoicemailsChangedNotification___block_invoke_2;
  v3[3] = &unk_10027CCC8;
  v3[4] = v1;
  return [v1 fetchMessagesCompletion:v3];
}

void __134__MPVoicemailController_initWithVoicemailManager_accountManager_callProviderManager_contactStore_suggestedContactStore_metadataCache___block_invoke(uint64_t a1)
{
  v2 = PHDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "MPVoicemailController initWithVoicemailManager, inside serialDispatchQueue", buf, 2u);
  }

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 96), &_dispatch_main_q);
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = &__NSArray0__struct;

  v5 = *(void **)(a1 + 32);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __134__MPVoicemailController_initWithVoicemailManager_accountManager_callProviderManager_contactStore_suggestedContactStore_metadataCache___block_invoke_73;
  v7[3] = &unk_10027CCC8;
  id v8 = v5;
  [v8 fetchMessagesCompletion:v7];
  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:*(void *)(a1 + 32) selector:"handleCNContactStoreDidChangeNotification:" name:CNContactStoreDidChangeNotification object:0];
  [v6 addObserver:*(void *)(a1 + 32) selector:"handleNSCurrentLocaleDidChangeNotification:" name:NSCurrentLocaleDidChangeNotification object:0];
  [v6 addObserver:*(void *)(a1 + 32) selector:"handleTUMetadataCacheDidFinishUpdatingNotification:" name:TUMetadataCacheDidFinishUpdatingNotification object:0];
  [v6 addObserver:*(void *)(a1 + 32) selector:"handleUIApplicationSignificantTimeChangeNotification:" name:UIApplicationSignificantTimeChangeNotification object:0];
  [v6 addObserver:*(void *)(a1 + 32) selector:"handleUIApplicationWillEnterForegroundNotification:" name:UIApplicationWillEnterForegroundNotification object:0];
  [v6 addObserver:*(void *)(a1 + 32) selector:"handleRecentsChangedNotification:" name:kCallHistoryDatabaseChangedNotification object:0];
  [v6 addObserver:*(void *)(a1 + 32) selector:"handleVoicemailsChangedNotification:" name:@"PHVoicemailManagerVoicemailsChanged" object:0];
}

- (void)handleUIApplicationWillEnterForegroundNotification:(id)a3
{
  id v4 = a3;
  v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    id v7 = v6;
    id v8 = [v4 name];
    int v10 = 138412546;
    v11 = v6;
    __int16 v12 = 2112;
    v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", (uint8_t *)&v10, 0x16u);
  }
  id v9 = [(MPVoicemailController *)self voicemailManager];
  [v9 requestInitialStateIfNecessaryAndSendNotifications:1];
}

- (void)fetchMessagesCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(MPVoicemailController *)self serialDispatchQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(MPVoicemailController *)self voicemailManager];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __49__MPVoicemailController_fetchMessagesCompletion___block_invoke;
  v8[3] = &unk_10027CFE0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 fetchMessagesWithCompletion:v8];
}

- (MPVoicemailManagerProtocol)voicemailManager
{
  return self->_voicemailManager;
}

- (id)audioMessagesPassingTest:(id)a3
{
  id v4 = (unsigned int (**)(id, void))a3;
  v5 = +[NSMutableArray array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [(MPVoicemailController *)self audioMessages];
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (v4[2](v4, v11)) {
          [v5 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  id v12 = [v5 copy];

  return v12;
}

- (NSArray)audioMessages
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__2;
  uint64_t v9 = __Block_byref_object_dispose__2;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __38__MPVoicemailController_audioMessages__block_invoke;
  v4[3] = &unk_10027CE88;
  v4[4] = self;
  v4[5] = &v5;
  [(MPVoicemailController *)self performSynchronousBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

- (void)performSynchronousBlock:(id)a3
{
  if (dispatch_get_specific(MPVoicemailControllerSerialQueueContextKey) == self)
  {
    id v6 = (void (*)(void))*((void *)a3 + 2);
    uint64_t v7 = a3;
    v6();
  }
  else
  {
    id v5 = a3;
    uint64_t v7 = [(MPVoicemailController *)self serialDispatchQueue];
    dispatch_sync(v7, v5);
  }
}

- (OS_dispatch_queue)serialDispatchQueue
{
  return self->_serialDispatchQueue;
}

void __134__MPVoicemailController_initWithVoicemailManager_accountManager_callProviderManager_contactStore_suggestedContactStore_metadataCache___block_invoke_73(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PHDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "MPVoicemailController initWithVoicemailManager, fetchMessagesCompletion", v5, 2u);
  }

  [*(id *)(a1 + 32) setMessages:v3];
}

- (void)setMessages:(id)a3
{
  id v10 = (NSArray *)a3;
  id v4 = [(MPVoicemailController *)self serialDispatchQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = v10;
  if (self->_messages != v10)
  {
    id v6 = (NSArray *)[(NSArray *)v10 copy];
    messages = self->_messages;
    self->_messages = v6;

    id v8 = +[NSPredicate predicateWithBlock:&__block_literal_global_6];
    uint64_t v9 = [(NSArray *)v10 filteredArrayUsingPredicate:v8];

    if (self->_audioMessages != v9) {
      objc_storeStrong((id *)&self->_audioMessages, v9);
    }
    [(MPVoicemailController *)self postMPVoicemailControllerMessagesDidChangeNotification];

    id v5 = v10;
  }
}

- (void)postMPVoicemailControllerMessagesDidChangeNotification
{
  id v3 = [(MPVoicemailController *)self completionDispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __79__MPVoicemailController_postMPVoicemailControllerMessagesDidChangeNotification__block_invoke;
  block[3] = &unk_10027C670;
  block[4] = self;
  dispatch_async(v3, block);
}

- (OS_dispatch_queue)completionDispatchQueue
{
  return self->_completionDispatchQueue;
}

uint64_t __49__MPVoicemailController_fetchMessagesCompletion___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [v2 contactKeyDescriptors];
  [v2 fetchContactsForMessages:v3 keyDescriptors:v4];

  [*(id *)(a1 + 32) fetchMetadataForMessages:*(void *)(a1 + 40)];
  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v5();
}

- (void)fetchMetadataForMessages:(id)a3
{
  id v4 = a3;
  id v5 = [(MPVoicemailController *)self serialDispatchQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(MPVoicemailController *)self metadataCache];

  if (v6)
  {
    uint64_t v7 = +[TUMetadataDestinationID metadataDestinationIDsForVMVoicemails:v4];
    id v8 = PHDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134218240;
      id v11 = [v4 count];
      __int16 v12 = 2048;
      id v13 = [v7 count];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Fetching metadata for %lu voicemail messages using %lu handles", (uint8_t *)&v10, 0x16u);
    }

    uint64_t v9 = [(MPVoicemailController *)self metadataCache];
    [v9 updateCacheWithDestinationIDs:v7];
  }
}

- (TUMetadataCache)metadataCache
{
  return self->_metadataCache;
}

- (void)fetchContactsForMessages:(id)a3 keyDescriptors:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MPVoicemailController *)self serialDispatchQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = objc_alloc_init((Class)NSMutableSet);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v10 = v6;
  id v11 = [v10 countByEnumeratingWithState:&v45 objects:v54 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v46;
    do
    {
      long long v14 = 0;
      do
      {
        if (*(void *)v46 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = [*(id *)(*((void *)&v45 + 1) + 8 * (void)v14) senderDestinationID];
        if (v15)
        {
          long long v16 = [(MPVoicemailController *)self contactCache];
          long long v17 = [v16 objectForKeyedSubscript:v15];

          if (!v17) {
            [v9 addObject:v15];
          }
        }

        long long v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v45 objects:v54 count:16];
    }
    while (v12);
  }

  v18 = PHDefaultLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = [v9 count];
    id v20 = [v10 count];
    *(_DWORD *)buf = 134218240;
    id v51 = v19;
    __int16 v52 = 2048;
    id v53 = v20;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Found %lu contact handles in %lu messages", buf, 0x16u);
  }

  if ([v9 count])
  {
    v21 = [(MPVoicemailController *)self contactStore];
    v22 = PHDefaultLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = [v9 count];
      *(_DWORD *)buf = 134218242;
      id v51 = v23;
      __int16 v52 = 2112;
      id v53 = v21;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Fetching contacts for %lu handles using contact store %@", buf, 0x16u);
    }

    v24 = [v9 allObjects];
    v25 = [v21 contactsForHandles:v24 keyDescriptors:v7];

    if (v25)
    {
      v36 = v21;
      id v37 = v10;
      id v38 = v9;
      id v39 = v7;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id obj = v9;
      id v26 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
      if (v26)
      {
        id v27 = v26;
        uint64_t v28 = *(void *)v42;
        do
        {
          v29 = 0;
          do
          {
            if (*(void *)v42 != v28) {
              objc_enumerationMutation(obj);
            }
            uint64_t v30 = *(void *)(*((void *)&v41 + 1) + 8 * (void)v29);
            id v31 = objc_alloc((Class)TUOptionalObject);
            v32 = [v25 objectForKeyedSubscript:v30];
            v33 = [v32 firstObject];
            id v34 = [v31 initWithValue:v33];
            v35 = [(MPVoicemailController *)self contactCache];
            [v35 setObject:v34 forKeyedSubscript:v30];

            v29 = (char *)v29 + 1;
          }
          while (v27 != v29);
          id v27 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
        }
        while (v27);
      }

      id v9 = v38;
      id v7 = v39;
      v21 = v36;
      id v10 = v37;
    }
  }
}

- (NSArray)contactKeyDescriptors
{
  uint64_t v3 = [(MPVoicemailController *)self serialDispatchQueue];
  dispatch_assert_queue_V2(v3);

  contactKeyDescriptors = self->_contactKeyDescriptors;
  if (!contactKeyDescriptors)
  {
    id v5 = +[CNContactFormatter descriptorForRequiredKeysForStyle:0];
    v9[0] = v5;
    v9[1] = CNContactPhoneNumbersKey;
    v9[2] = CNContactEmailAddressesKey;
    id v6 = +[NSArray arrayWithObjects:v9 count:3];
    id v7 = self->_contactKeyDescriptors;
    self->_contactKeyDescriptors = v6;

    contactKeyDescriptors = self->_contactKeyDescriptors;
  }

  return contactKeyDescriptors;
}

id __61__MPVoicemailController_handleVoicemailsChangedNotification___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setMessages:a2];
}

void __79__MPVoicemailController_postMPVoicemailControllerMessagesDidChangeNotification__block_invoke(uint64_t a1)
{
  id v2 = +[NSNotificationCenter defaultCenter];
  [v2 postNotificationName:@"MPVoicemailControllerMessagesDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (MPVoicemailController)initWithVoicemailManager:(id)a3 accountManager:(id)a4 callProviderManager:(id)a5 contactStore:(id)a6 suggestedContactStore:(id)a7 metadataCache:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v37 = a5;
  id v36 = a6;
  id v35 = a7;
  id v34 = a8;
  v41.receiver = self;
  v41.super_class = (Class)MPVoicemailController;
  long long v17 = [(MPVoicemailController *)&v41 init];
  if (v17)
  {
    id v32 = v16;
    id v33 = v15;
    uint64_t v18 = +[MPVoicemailQueueManager serialQueue];
    serialDispatchQueue = v17->_serialDispatchQueue;
    v17->_serialDispatchQueue = (OS_dispatch_queue *)v18;

    id v20 = v17->_serialDispatchQueue;
    v21 = MPVoicemailControllerSerialQueueContextKey;
    specific = dispatch_queue_get_specific(v20, MPVoicemailControllerSerialQueueContextKey);
    if (specific)
    {
      uint64_t v23 = (uint64_t)specific;
      v24 = PHDefaultLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
        -[MPVoicemailController initWithVoicemailManager:accountManager:callProviderManager:contactStore:suggestedContactStore:metadataCache:](v23, (uint64_t)v17, v24);
      }

      id v20 = v17->_serialDispatchQueue;
      v21 = MPVoicemailControllerSerialQueueContextKey;
    }
    dispatch_queue_set_specific(v20, v21, v17, 0);
    objc_storeStrong((id *)&v17->_callProviderManager, a5);
    objc_storeStrong((id *)&v17->_contactStore, a6);
    objc_storeStrong((id *)&v17->_suggestedContactStore, a7);
    objc_storeStrong((id *)&v17->_metadataCache, a8);
    objc_storeStrong((id *)&v17->_voicemailManager, a3);
    objc_storeStrong((id *)&v17->_accountManager, a4);
    v25 = (TUFeatureFlags *)objc_alloc_init((Class)TUFeatureFlags);
    featureFlags = v17->_featureFlags;
    v17->_featureFlags = v25;

    id v27 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    contactCache = v17->_contactCache;
    v17->_contactCache = v27;

    v29 = PHDefaultLog();
    id v16 = v32;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "MPVoicemailController initWithVoicemailManager", buf, 2u);
    }

    uint64_t v30 = v17->_serialDispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __134__MPVoicemailController_initWithVoicemailManager_accountManager_callProviderManager_contactStore_suggestedContactStore_metadataCache___block_invoke;
    block[3] = &unk_10027C670;
    id v39 = v17;
    dispatch_async(v30, block);

    id v15 = v33;
  }

  return v17;
}

- (void)handleVoicemailsChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    id v7 = v6;
    id v8 = [v4 name];
    *(_DWORD *)buf = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    long long v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", buf, 0x16u);
  }
  id v9 = [(MPVoicemailController *)self serialDispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __61__MPVoicemailController_handleVoicemailsChangedNotification___block_invoke;
  block[3] = &unk_10027C670;
  void block[4] = self;
  dispatch_async(v9, block);
}

- (MPVoicemailController)init
{
  [(MPVoicemailController *)self doesNotRecognizeSelector:a2];
  id v2 = +[NSException exceptionWithName:@"doesNotRecognizeSelector" reason:@"init not implemented" userInfo:0];
  objc_exception_throw(v2);
}

- (void)dealloc
{
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MPVoicemailController;
  [(MPVoicemailController *)&v4 dealloc];
}

- (void)audioMessagesWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(MPVoicemailController *)self serialDispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __53__MPVoicemailController_audioMessagesWithCompletion___block_invoke;
  block[3] = &unk_10027CE60;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

uint64_t __53__MPVoicemailController_audioMessagesWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id WeakRetained = (id)(*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
    id v3 = v5;
  }

  return _objc_release_x1(WeakRetained, v3);
}

- (NSArray)messages
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__2;
  id v9 = __Block_byref_object_dispose__2;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __33__MPVoicemailController_messages__block_invoke;
  v4[3] = &unk_10027CE88;
  v4[4] = self;
  v4[5] = &v5;
  [(MPVoicemailController *)self performSynchronousBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

void __33__MPVoicemailController_messages__block_invoke(uint64_t a1)
{
}

- (unint64_t)unreadMessageCount
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __43__MPVoicemailController_unreadMessageCount__block_invoke;
  v4[3] = &unk_10027CE88;
  v4[4] = self;
  v4[5] = &v5;
  [(MPVoicemailController *)self performSynchronousBlock:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __43__MPVoicemailController_unreadMessageCount__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 40);
  return result;
}

- (void)loadLocalizedTitlesForMessages:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v10 = [(MPVoicemailController *)self localizedTitleForMessage:v9];
        id v11 = [(MPVoicemailController *)self localizedSubtitleForMessage:v9];
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (id)localizedSubtitleForMessage:(id)a3
{
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3032000000;
  long long v14 = __Block_byref_object_copy__2;
  long long v15 = __Block_byref_object_dispose__2;
  id v16 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __53__MPVoicemailController_localizedSubtitleForMessage___block_invoke;
  v7[3] = &unk_10027CEB0;
  id v4 = a3;
  uint64_t v9 = self;
  id v10 = &v11;
  id v8 = v4;
  [(MPVoicemailController *)self performSynchronousBlock:v7];
  id v5 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v5;
}

void __53__MPVoicemailController_localizedSubtitleForMessage___block_invoke(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) identifier];
  id v43 = +[NSString stringWithFormat:@"%@", v2];

  id v3 = [*(id *)(a1 + 40) localizedSubtitleCache];
  uint64_t v4 = [v3 objectForKey:v43];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (![*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) length])
  {
    uint64_t v7 = [*(id *)(a1 + 32) senderDestinationID];
    if ([v7 length])
    {
      id v8 = [*(id *)(a1 + 32) senderISOCountryCode];
      uint64_t v9 = [*(id *)(a1 + 40) senderContactForMessage:*(void *)(a1 + 32)];
      id v10 = +[TUHandle normalizedHandleWithDestinationID:v7];
      uint64_t v11 = v10;
      if (v9 && [v10 type] == (id)2)
      {
        long long v12 = +[CNPhoneNumber phoneNumberWithDigits:v7 countryCode:v8];
        if (v12)
        {
          uint64_t v13 = [v9 labeledValueForPhoneNumber:v12];
        }
        else
        {
          uint64_t v13 = 0;
        }
        long long v14 = [v13 label];
        uint64_t v15 = +[CNLabeledValue localizedDisplayStringForLabel:v14 propertyName:CNContactPhoneNumbersKey];
        uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
        long long v17 = *(void **)(v16 + 40);
        *(void *)(v16 + 40) = v15;
      }
      if (![*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) length])
      {
        id v18 = [objc_alloc((Class)TUMetadataDestinationID) initWithHandle:v11];
        if (v18)
        {
          id v19 = [*(id *)(a1 + 40) metadataCache];
          id v20 = [v19 metadataForDestinationID:v18];

          uint64_t v21 = [v20 metadataForProvider:objc_opt_class()];
          uint64_t v22 = *(void *)(*(void *)(a1 + 48) + 8);
          uint64_t v23 = *(void **)(v22 + 40);
          *(void *)(v22 + 40) = v21;

          if (![*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) length])
          {
            uint64_t v24 = [v20 metadataForProvider:objc_opt_class()];
            uint64_t v25 = *(void *)(*(void *)(a1 + 48) + 8);
            id v26 = *(void **)(v25 + 40);
            *(void *)(v25 + 40) = v24;
          }
          if (![*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) length])
          {
            uint64_t v27 = [v20 metadataForProvider:objc_opt_class()];
            uint64_t v28 = *(void *)(*(void *)(a1 + 48) + 8);
            v29 = *(void **)(v28 + 40);
            *(void *)(v28 + 40) = v27;
          }
        }
      }
    }
    uint64_t v30 = [*(id *)(a1 + 40) featureFlags];
    unsigned int v31 = [v30 callScreeningEnabledM3];

    if (v31)
    {
      id v32 = [*(id *)(a1 + 32) provider];
      unsigned int v33 = [v32 isEqual:@"com.apple.telephonyutilities.callservicesd.FaceTimeProvider"];

      if (v33)
      {
        id v34 = +[NSBundle mainBundle];
        uint64_t v35 = [v34 localizedStringForKey:@"MPVOICEMAIL_TABLE_VIEW_CELL_TITLE_FaceTime_Audio" value:&stru_100285990 table:@"MPVoicemail"];
        uint64_t v36 = *(void *)(*(void *)(a1 + 48) + 8);
        id v37 = *(void **)(v36 + 40);
        *(void *)(v36 + 40) = v35;
      }
    }
    if (![*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) length])
    {
      id v38 = +[NSBundle mainBundle];
      uint64_t v39 = [v38 localizedStringForKey:@"MPVOICEMAIL_TABLE_VIEW_CELL_SUBTITLE_UNKNOWN" value:&stru_100285990 table:@"MPVoicemail"];
      uint64_t v40 = *(void *)(*(void *)(a1 + 48) + 8);
      objc_super v41 = *(void **)(v40 + 40);
      *(void *)(v40 + 40) = v39;
    }
    long long v42 = [*(id *)(a1 + 40) localizedSubtitleCache];
    [v42 setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKey:v43];
  }
}

- (BOOL)isRestrictedMessage:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 senderDestinationID];
  if ([v4 length])
  {
    id v5 = [v3 senderDestinationID];
  }
  else
  {
    id v5 = TUCallFilterUnknownCallerAddress;
  }
  id v6 = v5;

  uint64_t v7 = +[TUHandle normalizedHandleWithDestinationID:v6];
  id v8 = +[TUCallCenter sharedInstance];
  uint64_t v9 = [v8 callFilterController];
  unsigned __int8 v10 = [v9 containsRestrictedHandle:v7 forBundleIdentifier:TUBundleIdentifierMobilePhoneApplication];

  return v10;
}

- (id)localizedAttributedDowntimeTitleForMessage:(id)a3
{
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3032000000;
  long long v14 = __Block_byref_object_copy__2;
  uint64_t v15 = __Block_byref_object_dispose__2;
  id v16 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __68__MPVoicemailController_localizedAttributedDowntimeTitleForMessage___block_invoke;
  v7[3] = &unk_10027CEB0;
  id v4 = a3;
  uint64_t v9 = self;
  unsigned __int8 v10 = &v11;
  id v8 = v4;
  [(MPVoicemailController *)self performSynchronousBlock:v7];
  id v5 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v5;
}

void __68__MPVoicemailController_localizedAttributedDowntimeTitleForMessage___block_invoke(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) identifier];
  id v21 = +[NSString stringWithFormat:@"%@", v2];

  id v3 = [*(id *)(a1 + 40) localizedDowntimeTitleCache];
  uint64_t v4 = [v3 objectForKey:v21];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v7 = [*(id *)(a1 + 40) senderContactForMessage:*(void *)(a1 + 32)];
    id v8 = [*(id *)(a1 + 40) contactFormatter];
    uint64_t v9 = [v8 stringFromContact:v7];

    if (![v9 length])
    {
      uint64_t v10 = [*(id *)(a1 + 40) localizedHandleTitleFromMessage:*(void *)(a1 + 32)];

      uint64_t v9 = (void *)v10;
    }
    if (![v9 length])
    {
      uint64_t v11 = +[NSBundle mainBundle];
      uint64_t v12 = [v11 localizedStringForKey:@"MPVOICEMAIL_TABLE_VIEW_CELL_TITLE_UNKNOWN" value:&stru_100285990 table:@"MPVoicemail"];

      uint64_t v9 = (void *)v12;
    }
    uint64_t v13 = *(void **)(a1 + 40);
    long long v14 = TUBundle();
    uint64_t v15 = [v14 localizedStringForKey:@"DOWNTIME_CALLER_%@" value:&stru_100285990 table:@"TelephonyUtilities"];
    id v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, v9);
    uint64_t v17 = [v13 attributedStringForDowntimeMessage:v16];
    uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
    id v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;

    id v20 = [*(id *)(a1 + 40) localizedDowntimeTitleCache];
    [v20 setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKey:v21];
  }
}

- (id)localizedTitleForMessage:(id)a3
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  long long v14 = __Block_byref_object_copy__2;
  uint64_t v15 = __Block_byref_object_dispose__2;
  id v16 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __50__MPVoicemailController_localizedTitleForMessage___block_invoke;
  v7[3] = &unk_10027CEB0;
  id v4 = a3;
  uint64_t v9 = self;
  uint64_t v10 = &v11;
  id v8 = v4;
  [(MPVoicemailController *)self performSynchronousBlock:v7];
  id v5 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v5;
}

void __50__MPVoicemailController_localizedTitleForMessage___block_invoke(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) identifier];
  id v20 = +[NSString stringWithFormat:@"%@", v2];

  id v3 = [*(id *)(a1 + 40) localizedTitleCache];
  uint64_t v4 = [v3 objectForKey:v20];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v7 = [*(id *)(a1 + 40) senderContactForMessage:*(void *)(a1 + 32)];
    id v8 = [*(id *)(a1 + 40) contactFormatter];
    uint64_t v9 = [v8 stringFromContact:v7];
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    if (![*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) length])
    {
      uint64_t v12 = [*(id *)(a1 + 40) localizedHandleTitleFromMessage:*(void *)(a1 + 32)];
      uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
      long long v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;
    }
    if (![*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) length])
    {
      uint64_t v15 = +[NSBundle mainBundle];
      uint64_t v16 = [v15 localizedStringForKey:@"MPVOICEMAIL_TABLE_VIEW_CELL_TITLE_UNKNOWN" value:&stru_100285990 table:@"MPVoicemail"];
      uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v16;
    }
    id v19 = [*(id *)(a1 + 40) localizedTitleCache];
    [v19 setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKey:v20];
  }
}

- (id)localizedHandleTitleFromMessage:(id)a3
{
  uint64_t v4 = [a3 senderHandle];
  id v5 = [v4 type];
  if (v5 == (id)2)
  {
LABEL_5:
    uint64_t v10 = [v4 normalizedValue];
    uint64_t v11 = [v4 isoCountryCode];
    uint64_t v12 = (void *)PNCreateFormattedStringWithCountry();

    goto LABEL_7;
  }
  if (v5 == (id)3)
  {
    id v6 = [(MPVoicemailController *)self featureFlags];
    unsigned int v7 = [v6 callScreeningEnabledM3];

    if (v7)
    {
      id v8 = [v4 normalizedValue];
      uint64_t v9 = +[CNLabeledValue localizedDisplayStringForLabel:v8 propertyName:CNContactEmailAddressesKey];
    }
    goto LABEL_5;
  }
  uint64_t v12 = 0;
LABEL_7:
  if (![v12 length])
  {
    uint64_t v13 = [v4 value];

    uint64_t v12 = (void *)v13;
  }

  return v12;
}

- (id)messagesPassingTest:(id)a3
{
  uint64_t v4 = (unsigned int (**)(id, void))a3;
  id v5 = +[NSMutableArray array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [(MPVoicemailController *)self messages];
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (v4[2](v4, v11)) {
          [v5 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  id v12 = [v5 copy];

  return v12;
}

- (void)messagesPassingTest:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(MPVoicemailController *)self serialDispatchQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __60__MPVoicemailController_messagesPassingTest_withCompletion___block_invoke;
  v11[3] = &unk_10027CED8;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __60__MPVoicemailController_messagesPassingTest_withCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = +[NSMutableArray array];
    id v4 = WeakRetained[4];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        id v8 = 0;
        do
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * (void)v8);
          if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))()) {
            [v3 addObject:v9];
          }
          id v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = [v3 copy];
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v11);
  }
}

- (void)audioMessagesPassingTest:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(MPVoicemailController *)self serialDispatchQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __65__MPVoicemailController_audioMessagesPassingTest_withCompletion___block_invoke;
  v11[3] = &unk_10027CED8;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __65__MPVoicemailController_audioMessagesPassingTest_withCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = +[NSMutableArray array];
    id v4 = WeakRetained[3];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        id v8 = 0;
        do
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * (void)v8);
          if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))()) {
            [v3 addObject:v9];
          }
          id v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = [v3 copy];
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v11);
  }
}

- (void)deleteMessages:(id)a3
{
  id v4 = a3;
  id v5 = [(MPVoicemailController *)self voicemailManager];
  id v6 = [(MPVoicemailController *)self serialDispatchQueue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __40__MPVoicemailController_deleteMessages___block_invoke;
  void v9[3] = &unk_10027C940;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, v9);
}

id __40__MPVoicemailController_deleteMessages___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deleteVoicemails:*(void *)(a1 + 40)];
}

- (void)markMessagesAsRead:(id)a3
{
  id v4 = a3;
  id v5 = [(MPVoicemailController *)self voicemailManager];
  id v6 = [(MPVoicemailController *)self serialDispatchQueue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __44__MPVoicemailController_markMessagesAsRead___block_invoke;
  void v9[3] = &unk_10027C940;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, v9);
}

id __44__MPVoicemailController_markMessagesAsRead___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) markVoicemailsAsRead:*(void *)(a1 + 40)];
}

- (void)trashMessages:(id)a3
{
  id v4 = a3;
  id v5 = [(MPVoicemailController *)self voicemailManager];
  id v6 = [(MPVoicemailController *)self serialDispatchQueue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __39__MPVoicemailController_trashMessages___block_invoke;
  void v9[3] = &unk_10027C940;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, v9);
}

id __39__MPVoicemailController_trashMessages___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) trashVoicemails:*(void *)(a1 + 40)];
}

- (void)moveMessagesToInbox:(id)a3
{
  id v4 = a3;
  id v5 = [(MPVoicemailController *)self voicemailManager];
  id v6 = [(MPVoicemailController *)self serialDispatchQueue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __45__MPVoicemailController_moveMessagesToInbox___block_invoke;
  void v9[3] = &unk_10027C940;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, v9);
}

id __45__MPVoicemailController_moveMessagesToInbox___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeVoicemailsFromTrash:*(void *)(a1 + 40)];
}

- (void)messageForIdentifier:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(MPVoicemailController *)self voicemailManager];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __62__MPVoicemailController_messageForIdentifier_completionBlock___block_invoke;
  v11[3] = &unk_10027CF50;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = v6;
  long long v14 = self;
  id v15 = v7;
  id v8 = v7;
  id v9 = v6;
  id v10 = v12;
  [(MPVoicemailController *)self performSynchronousBlock:v11];
}

void __62__MPVoicemailController_messageForIdentifier_completionBlock___block_invoke(void *a1)
{
  v1 = (void *)a1[4];
  uint64_t v2 = a1[5];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __62__MPVoicemailController_messageForIdentifier_completionBlock___block_invoke_2;
  v4[3] = &unk_10027CF28;
  id v3 = (void *)a1[7];
  v4[4] = a1[6];
  id v5 = v3;
  [v1 voicemailWithIdentifier:v2 completion:v4];
}

void __62__MPVoicemailController_messageForIdentifier_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) completionDispatchQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __62__MPVoicemailController_messageForIdentifier_completionBlock___block_invoke_3;
  v7[3] = &unk_10027CF00;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __62__MPVoicemailController_messageForIdentifier_completionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (BOOL)shouldShowVerifiedBadge
{
  uint64_t v2 = PHPreferencesGetValue(@"showVerifiedBadge");
  id v3 = v2;
  if (v2) {
    unsigned __int8 v4 = [v2 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (id)attributedStringForDowntimeMessage:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableAttributedString);
  id v5 = +[NSMutableDictionary dictionary];
  id v6 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCallout];
  if (v6) {
    [v5 setObject:v6 forKeyedSubscript:NSFontAttributeName];
  }
  id v7 = objc_alloc_init((Class)NSTextAttachment);
  id v8 = +[UIImage tpImageForSymbolType:41 textStyle:UIFontTextStyleCallout scale:3 isStaticSize:0];
  id v9 = [v8 imageWithRenderingMode:2];
  [v7 setImage:v9];

  if ([UIApp userInterfaceLayoutDirection] == (id)1)
  {
    id v10 = objc_alloc((Class)NSAttributedString);
    id v11 = [v3 stringByAppendingString:@" "];
    id v12 = [v10 initWithString:v11 attributes:v5];
    [v4 appendAttributedString:v12];

    id v13 = +[NSAttributedString attributedStringWithAttachment:v7];
    [v4 appendAttributedString:v13];
  }
  else
  {
    long long v14 = +[NSAttributedString attributedStringWithAttachment:v7];
    [v4 appendAttributedString:v14];

    id v15 = objc_alloc((Class)NSAttributedString);
    id v13 = [@" " stringByAppendingString:v3];
    id v16 = [v15 initWithString:v13 attributes:v5];
    [v4 appendAttributedString:v16];
  }
  long long v17 = +[UIColor secondaryLabelColor];
  [v4 addAttribute:NSForegroundColorAttributeName value:v17 range:0, [v4 length]];

  return v4;
}

- (CNContactFormatter)contactFormatter
{
  id v3 = [(MPVoicemailController *)self serialDispatchQueue];
  dispatch_assert_queue_V2(v3);

  contactFormatter = self->_contactFormatter;
  if (!contactFormatter)
  {
    id v5 = (CNContactFormatter *)objc_alloc_init((Class)CNContactFormatter);
    [(CNContactFormatter *)v5 setStyle:0];
    id v6 = self->_contactFormatter;
    self->_contactFormatter = v5;

    contactFormatter = self->_contactFormatter;
  }

  return contactFormatter;
}

- (void)setAudioMessages:(id)a3
{
  id v8 = (NSArray *)a3;
  id v4 = [(MPVoicemailController *)self serialDispatchQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = v8;
  if (self->_audioMessages != v8)
  {
    id v6 = (NSArray *)[(NSArray *)v8 copy];
    audioMessages = self->_audioMessages;
    self->_audioMessages = v6;

    [(MPVoicemailController *)self postMPVoicemailControllerMessagesDidChangeNotification];
    id v5 = v8;
  }
}

- (void)setUnreadMessageCount:(unint64_t)a3
{
  id v5 = [(MPVoicemailController *)self serialDispatchQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __47__MPVoicemailController_setUnreadMessageCount___block_invoke;
  v6[3] = &unk_10027CA40;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

id __47__MPVoicemailController_setUnreadMessageCount___block_invoke(id result)
{
  uint64_t v1 = *((void *)result + 4);
  uint64_t v2 = *((void *)result + 5);
  if (*(void *)(v1 + 40) != v2)
  {
    *(void *)(v1 + 40) = v2;
    return [*((id *)result + 4) postMPVoicemailControllerUnreadMessageCountDidChangeNotification];
  }
  return result;
}

- (id)mutableSenderContactForMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(MPVoicemailController *)self serialDispatchQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(MPVoicemailController *)self metadataCache];
  id v7 = [v4 senderDestinationID];
  if ([v7 length])
  {
    id v8 = +[TUHandle normalizedHandleWithDestinationID:v7];
    id v9 = [v4 senderISOCountryCode];
    id v10 = +[CNMutableContact contactForHandle:v8 isoCountryCode:v9 metadataCache:v6];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)senderContactForMessage:(id)a3
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  long long v14 = __Block_byref_object_copy__2;
  id v15 = __Block_byref_object_dispose__2;
  id v16 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __49__MPVoicemailController_senderContactForMessage___block_invoke;
  v7[3] = &unk_10027CEB0;
  id v4 = a3;
  id v9 = self;
  id v10 = &v11;
  id v8 = v4;
  [(MPVoicemailController *)self performSynchronousBlock:v7];
  id v5 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v5;
}

void __49__MPVoicemailController_senderContactForMessage___block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) senderDestinationID];
  if ([v7 length])
  {
    uint64_t v2 = [*(id *)(a1 + 40) contactCache];
    id v3 = [v2 objectForKeyedSubscript:v7];
    uint64_t v4 = [v3 value];
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

+ (id)_telephonyClient
{
  if (_telephonyClient_onceToken != -1) {
    dispatch_once(&_telephonyClient_onceToken, &__block_literal_global_149);
  }
  uint64_t v2 = (void *)_telephonyClient_staticTelephonyClient;

  return v2;
}

void __41__MPVoicemailController__telephonyClient__block_invoke(id a1)
{
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.mobilephone.voicemail", 0);
  id v1 = [objc_alloc((Class)CoreTelephonyClient) initWithQueue:v3];
  uint64_t v2 = (void *)_telephonyClient_staticTelephonyClient;
  _telephonyClient_staticTelephonyClient = (uint64_t)v1;
}

- (void)fetchLegacyVoicemailsCompletion:(id)a3
{
  id v4 = a3;
  [(id)objc_opt_class() _telephonyClient];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __57__MPVoicemailController_fetchLegacyVoicemailsCompletion___block_invoke;
  v7[3] = &unk_10027D078;
  void v7[4] = self;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v4;
  id v5 = v4;
  id v6 = v8;
  [v6 getActiveContextsWithCallback:v7];
}

void __57__MPVoicemailController_fetchLegacyVoicemailsCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    uint64_t v24 = 0;
    id v7 = dispatch_group_create();
    uint64_t v28 = +[NSMutableArray array];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v25 = v5;
    id v8 = [v5 subscriptions];
    id v31 = [v8 countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (!v31) {
      goto LABEL_20;
    }
    uint64_t v30 = *(void *)v42;
    id v26 = v8;
    uint64_t v27 = a1;
    while (1)
    {
      for (i = 0; i != v31; i = (char *)i + 1)
      {
        if (*(void *)v42 != v30) {
          objc_enumerationMutation(v8);
        }
        id v10 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        uint64_t v11 = [v10 context:v24];
        id v12 = [*(id *)(a1 + 32) accountManager];
        uint64_t v13 = [v12 accounts];
        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472;
        v40[2] = __57__MPVoicemailController_fetchLegacyVoicemailsCompletion___block_invoke_152;
        v40[3] = &unk_10027D028;
        v40[4] = v10;
        long long v14 = [v13 tu_firstObjectPassingTest:v40];

        if (v14)
        {
          id v15 = [*(id *)(a1 + 32) accountManager];
          id v16 = [v14 UUID];
          if ([v15 isAccountSubscribed:v16])
          {

            goto LABEL_17;
          }
          long long v17 = [*(id *)(a1 + 32) accountManager];
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {

LABEL_16:
            dispatch_group_enter(v7);
            id v21 = *(void **)(a1 + 40);
            v35[0] = _NSConcreteStackBlock;
            v35[1] = 3221225472;
            v35[2] = __57__MPVoicemailController_fetchLegacyVoicemailsCompletion___block_invoke_2;
            v35[3] = &unk_10027D050;
            uint64_t v36 = v7;
            id v37 = v28;
            id v38 = v14;
            uint64_t v39 = v10;
            [v21 getVoicemailInfo:v11 completion:v35];

            id v15 = v36;
LABEL_17:

            goto LABEL_18;
          }
          uint64_t v18 = [*(id *)(a1 + 32) accountManager];
          [v14 UUID];
          v20 = id v19 = v7;
          unsigned int v29 = [v18 isCallVoicemailSupportedForAccountUUID:v20];

          id v7 = v19;
          a1 = v27;

          id v8 = v26;
          if (v29) {
            goto LABEL_16;
          }
        }
LABEL_18:
      }
      id v31 = [v8 countByEnumeratingWithState:&v41 objects:v45 count:16];
      if (!v31)
      {
LABEL_20:

        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = __57__MPVoicemailController_fetchLegacyVoicemailsCompletion___block_invoke_164;
        block[3] = &unk_10027CF00;
        id v22 = *(id *)(a1 + 48);
        id v33 = v28;
        id v34 = v22;
        id v23 = v28;
        dispatch_group_notify(v7, (dispatch_queue_t)&_dispatch_main_q, block);

        id v6 = v24;
        id v5 = v25;
        goto LABEL_21;
      }
    }
  }
  id v7 = PHDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __57__MPVoicemailController_fetchLegacyVoicemailsCompletion___block_invoke_cold_1((uint64_t)v6, v7);
  }
LABEL_21:
}

id __57__MPVoicemailController_fetchLegacyVoicemailsCompletion___block_invoke_152(uint64_t a1, void *a2)
{
  dispatch_queue_t v3 = [a2 UUID];
  id v4 = [v3 UUIDString];
  id v5 = [*(id *)(a1 + 32) labelID];
  id v6 = [v4 isEqualToString:v5];

  return v6;
}

void __57__MPVoicemailController_fetchLegacyVoicemailsCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v8 = a3;
  id v9 = a5;
  id v10 = PHDefaultLog();
  uint64_t v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __57__MPVoicemailController_fetchLegacyVoicemailsCompletion___block_invoke_2_cold_1((uint64_t)v9, v11);
    }
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      if (a2) {
        CFStringRef v12 = @"YES";
      }
      else {
        CFStringRef v12 = @"NO";
      }
      int v17 = 138412546;
      CFStringRef v18 = v12;
      __int16 v19 = 1024;
      unsigned int v20 = [v8 intValue];
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Voicemail info returned available=%@, count=%d", (uint8_t *)&v17, 0x12u);
    }

    uint64_t v13 = *(void **)(a1 + 40);
    long long v14 = [MPLegacyVoicemail alloc];
    uint64_t v11 = [*(id *)(a1 + 48) UUID];
    id v15 = [*(id *)(a1 + 56) label];
    id v16 = [(MPLegacyVoicemail *)v14 initWithAccountID:v11 label:v15 hasUnreadMessages:a2];
    [v13 addObject:v16];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __57__MPVoicemailController_fetchLegacyVoicemailsCompletion___block_invoke_164(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)handleCNContactStoreDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    id v7 = v6;
    id v8 = [v4 name];
    *(_DWORD *)buf = 138412546;
    CFStringRef v12 = v6;
    __int16 v13 = 2112;
    long long v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", buf, 0x16u);
  }
  id v9 = [(MPVoicemailController *)self serialDispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __67__MPVoicemailController_handleCNContactStoreDidChangeNotification___block_invoke;
  block[3] = &unk_10027C670;
  void block[4] = self;
  dispatch_async(v9, block);
}

id __67__MPVoicemailController_handleCNContactStoreDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) contactCache];
  [v2 removeAllObjects];

  dispatch_queue_t v3 = [*(id *)(a1 + 32) localizedSubtitleCache];
  [v3 removeAllObjects];

  id v4 = [*(id *)(a1 + 32) localizedTitleCache];
  [v4 removeAllObjects];

  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = v5[4];
  id v7 = [v5 contactKeyDescriptors];
  [v5 fetchContactsForMessages:v6 keyDescriptors:v7];

  id v8 = *(void **)(a1 + 32);

  return [v8 postMPVoicemailControllerMessagesDidChangeNotification];
}

- (void)handleRecentsChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = v6;
    id v8 = [v4 name];
    *(_DWORD *)buf = 138412546;
    CFStringRef v12 = v6;
    __int16 v13 = 2112;
    long long v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", buf, 0x16u);
  }
  id v9 = [(MPVoicemailController *)self serialDispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __58__MPVoicemailController_handleRecentsChangedNotification___block_invoke;
  block[3] = &unk_10027C670;
  void block[4] = self;
  dispatch_async(v9, block);
}

id __58__MPVoicemailController_handleRecentsChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) localizedSubtitleCache];
  [v2 removeAllObjects];

  dispatch_queue_t v3 = [*(id *)(a1 + 32) localizedTitleCache];
  [v3 removeAllObjects];

  id v4 = *(void **)(a1 + 32);

  return [v4 postMPVoicemailControllerMessagesDidChangeNotification];
}

- (void)handleNSCurrentLocaleDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = v6;
    id v8 = [v4 name];
    *(_DWORD *)buf = 138412546;
    CFStringRef v12 = v6;
    __int16 v13 = 2112;
    long long v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", buf, 0x16u);
  }
  id v9 = [(MPVoicemailController *)self serialDispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __68__MPVoicemailController_handleNSCurrentLocaleDidChangeNotification___block_invoke;
  block[3] = &unk_10027C670;
  void block[4] = self;
  dispatch_async(v9, block);
}

id __68__MPVoicemailController_handleNSCurrentLocaleDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  dispatch_queue_t v3 = *(void **)(v2 + 144);
  *(void *)(v2 + 144) = 0;

  id v4 = [*(id *)(a1 + 32) localizedSubtitleCache];
  [v4 removeAllObjects];

  id v5 = [*(id *)(a1 + 32) localizedTitleCache];
  [v5 removeAllObjects];

  uint64_t v6 = *(void **)(a1 + 32);

  return [v6 postMPVoicemailControllerMessagesDidChangeNotification];
}

- (void)handleTUMetadataCacheDidFinishUpdatingNotification:(id)a3
{
  id v4 = a3;
  id v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = v6;
    id v8 = [v4 name];
    *(_DWORD *)buf = 138412546;
    CFStringRef v12 = v6;
    __int16 v13 = 2112;
    long long v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", buf, 0x16u);
  }
  id v9 = [(MPVoicemailController *)self serialDispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __76__MPVoicemailController_handleTUMetadataCacheDidFinishUpdatingNotification___block_invoke;
  block[3] = &unk_10027C670;
  void block[4] = self;
  dispatch_async(v9, block);
}

id __76__MPVoicemailController_handleTUMetadataCacheDidFinishUpdatingNotification___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) localizedSubtitleCache];
  [v2 removeAllObjects];

  dispatch_queue_t v3 = [*(id *)(a1 + 32) localizedTitleCache];
  [v3 removeAllObjects];

  id v4 = [*(id *)(a1 + 32) localizedDowntimeTitleCache];
  [v4 removeAllObjects];

  id v5 = *(void **)(a1 + 32);

  return [v5 postMPVoicemailControllerMessagesDidChangeNotification];
}

- (void)handleUIApplicationSignificantTimeChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = v6;
    id v8 = [v4 name];
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    CFStringRef v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", (uint8_t *)&v9, 0x16u);
  }
  [(MPVoicemailController *)self postMPVoicemailControllerMessagesDidChangeNotification];
}

- (void)postMPVoicemailControllerUnreadMessageCountDidChangeNotification
{
  dispatch_queue_t v3 = [(MPVoicemailController *)self completionDispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __89__MPVoicemailController_postMPVoicemailControllerUnreadMessageCountDidChangeNotification__block_invoke;
  block[3] = &unk_10027C670;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __89__MPVoicemailController_postMPVoicemailControllerUnreadMessageCountDidChangeNotification__block_invoke(uint64_t a1)
{
  id v2 = +[NSNotificationCenter defaultCenter];
  [v2 postNotificationName:@"MPVoicemailControllerUnreadMessageCountDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (void)providersChangedForProviderManager:(id)a3
{
  id v4 = a3;
  id v5 = [(MPVoicemailController *)self serialDispatchQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = PHDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = self;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling providersChangedForProviderManager %@", (uint8_t *)&v9, 0x16u);
  }

  id v7 = [(MPVoicemailController *)self localizedSubtitleCache];
  [v7 removeAllObjects];

  id v8 = [(MPVoicemailController *)self localizedTitleCache];
  [v8 removeAllObjects];

  [(MPVoicemailController *)self postMPVoicemailControllerMessagesDidChangeNotification];
}

- (TUCallProviderManager)callProviderManager
{
  return self->_callProviderManager;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (CNContactStore)suggestedContactStore
{
  return self->_suggestedContactStore;
}

- (VMVoicemailManager)accountManager
{
  return self->_accountManager;
}

- (BOOL)isSetupRequired
{
  return self->_setupRequired;
}

- (void)setCompletionDispatchQueue:(id)a3
{
}

- (NSMutableDictionary)contactCache
{
  return self->_contactCache;
}

- (NSCache)localizedSubtitleCache
{
  return self->_localizedSubtitleCache;
}

- (NSCache)localizedTitleCache
{
  return self->_localizedTitleCache;
}

- (NSCache)localizedDowntimeTitleCache
{
  return self->_localizedDowntimeTitleCache;
}

- (void)setContactFormatter:(id)a3
{
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_contactFormatter, 0);
  objc_storeStrong((id *)&self->_localizedDowntimeTitleCache, 0);
  objc_storeStrong((id *)&self->_localizedTitleCache, 0);
  objc_storeStrong((id *)&self->_localizedSubtitleCache, 0);
  objc_storeStrong((id *)&self->_contactCache, 0);
  objc_storeStrong((id *)&self->_serialDispatchQueue, 0);
  objc_storeStrong((id *)&self->_completionDispatchQueue, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_voicemailManager, 0);
  objc_storeStrong((id *)&self->_metadataCache, 0);
  objc_storeStrong((id *)&self->_suggestedContactStore, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_callProviderManager, 0);
  objc_storeStrong((id *)&self->_messages, 0);
  objc_storeStrong((id *)&self->_audioMessages, 0);

  objc_storeStrong((id *)&self->_contactKeyDescriptors, 0);
}

- (void)initWithVoicemailManager:(os_log_t)log accountManager:callProviderManager:contactStore:suggestedContactStore:metadataCache:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Multiple instances of MPVoicemailController detected in same process which is not yet supported. (existing: %@, self: %@)", (uint8_t *)&v3, 0x16u);
}

void __57__MPVoicemailController_fetchLegacyVoicemailsCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unable to get subscription information: %@", (uint8_t *)&v2, 0xCu);
}

void __57__MPVoicemailController_fetchLegacyVoicemailsCompletion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unable to get voicemail information: %@", (uint8_t *)&v2, 0xCu);
}

@end