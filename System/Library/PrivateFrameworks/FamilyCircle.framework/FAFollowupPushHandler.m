@interface FAFollowupPushHandler
- (BOOL)shouldProcess:(id)a3;
- (FAFollowupPushHandler)init;
- (id)removeFamilyInvites:(id)a3;
- (void)process:(id)a3;
@end

@implementation FAFollowupPushHandler

- (FAFollowupPushHandler)init
{
  v7.receiver = self;
  v7.super_class = (Class)FAFollowupPushHandler;
  v2 = [(FAFollowupPushHandler *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("family_followup_request", v3);
    networkingQueue = v2->_networkingQueue;
    v2->_networkingQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (BOOL)shouldProcess:(id)a3
{
  v3 = [a3 event];
  unsigned __int8 v4 = [v3 isEqualToString:@"family_followups"];

  return v4;
}

- (void)process:(id)a3
{
  id v4 = a3;
  v5 = _FALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [v4 payload];
    *(_DWORD *)buf = 138412290;
    v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Processing family followup push with user info: %@.", buf, 0xCu);
  }
  objc_super v7 = [v4 payload];
  v8 = [v7 objectForKeyedSubscript:AKFollowUpPushPayloadKey];

  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v9 = [v8 mutableCopy];
    v10 = [(FAFollowupPushHandler *)self removeFamilyInvites:v9];

    v11 = [v4 altDSID];
    +[FAFollowupManager synchronizeFollowupWithPayload:v10 altDSID:v11];
  }
  else
  {
    v12 = _FALogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No cfudata found. Fetching it directly.", buf, 2u);
    }

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10000CD24;
    v19[3] = &unk_10004D850;
    v19[4] = self;
    v13 = objc_retainBlock(v19);
    networkingQueue = self->_networkingQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000CE98;
    block[3] = &unk_10004D878;
    id v17 = v4;
    id v18 = v13;
    v15 = v13;
    dispatch_async(networkingQueue, block);
  }
}

- (id)removeFamilyInvites:(id)a3
{
  v3 = a3;
  if (_os_feature_enabled_impl())
  {
    uint64_t v20 = cfuItemsField;
    v21 = v3;
    id v4 = -[NSObject objectForKeyedSubscript:](v3, "objectForKeyedSubscript:");
    v5 = [v4 mutableCopy];

    v6 = _FALogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CFUItems before removing familyInvite %@", buf, 0xCu);
    }

    int v7 = [v5 count];
    int v8 = v7 - 1;
    if (v7 >= 1)
    {
      uint64_t v9 = cfuType;
      uint64_t v10 = familyInvite;
      unint64_t v11 = v7 + 1;
      do
      {
        v12 = _FALogSystem();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v23) = v8;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Checking CFU Item %d", buf, 8u);
        }

        uint64_t v13 = (v11 - 2);
        v14 = [v5 objectAtIndexedSubscript:v13];
        v15 = [v14 objectForKeyedSubscript:v9];
        unsigned int v16 = [v15 isEqualToString:v10];

        if (v16)
        {
          id v17 = _FALogSystem();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "CFU Item cfuType matches familyInvite so removing it from the set", buf, 2u);
          }

          [v5 removeObjectAtIndex:v13];
        }
        --v11;
        --v8;
      }
      while (v11 > 1);
    }
    v3 = v21;
    [v21 setObject:v5 forKeyedSubscript:v20];
    id v18 = _FALogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v21;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "CFUItems after removing family invites %@", buf, 0xCu);
    }
  }
  else
  {
    v5 = _FALogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "BPI feature flag not enabled in removeFamilyInvites", buf, 2u);
    }
  }

  return v3;
}

- (void).cxx_destruct
{
}

@end