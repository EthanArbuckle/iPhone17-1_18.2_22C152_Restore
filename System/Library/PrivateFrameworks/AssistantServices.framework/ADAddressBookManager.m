@interface ADAddressBookManager
- (ADAddressBookManager)initWithDelegate:(id)a3;
- (CNContactStore)contactStore;
- (id)_fetchMappedMeCard;
- (id)contactHandlesForPerson:(id)a3;
- (void)_firstUnlockStateDidChange:(id)a3;
- (void)_meContactDidChange:(id)a3;
- (void)getMeCard:(id)a3;
- (void)setContactStore:(id)a3;
- (void)unregisterChangeHistory;
@end

@implementation ADAddressBookManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_meCard, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setContactStore:(id)a3
{
}

- (void)_firstUnlockStateDidChange:(id)a3
{
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "-[ADAddressBookManager _firstUnlockStateDidChange:]";
    __int16 v9 = 2112;
    CFStringRef v10 = @"ADFirstUnlockNotification";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Received %@ Changed!", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002A8670;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_meContactDidChange:(id)a3
{
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "-[ADAddressBookManager _meContactDidChange:]";
    __int16 v9 = 2112;
    uint64_t v10 = CNContactStoreMeContactDidChangeNotification;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Received %@ Changed!", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002A881C;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)_fetchMappedMeCard
{
  id v2 = objc_alloc_init((Class)CNContactStore);
  v3 = +[CNAssistantConversion descriptorsForRequiredKeysForConversionType:1];
  id v9 = 0;
  v4 = [v2 _crossPlatformUnifiedMeContactWithKeysToFetch:v3 error:&v9];
  id v5 = v9;
  if (v5)
  {
    v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[ADAddressBookManager _fetchMappedMeCard]";
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Error retrieving me card: %@", buf, 0x16u);
    }
  }
  if (v4)
  {
    v7 = +[CNAssistantConversion personFromMeContact:v4];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (CNContactStore)contactStore
{
  contactStore = self->_contactStore;
  if (!contactStore)
  {
    v4 = (CNContactStore *)objc_alloc_init((Class)CNContactStore);
    id v5 = self->_contactStore;
    self->_contactStore = v4;

    contactStore = self->_contactStore;
  }
  return contactStore;
}

- (void)unregisterChangeHistory
{
  if ((AFIsHorseman() & 1) == 0)
  {
    v3 = [(ADAddressBookManager *)self contactStore];
    uint64_t v4 = 0;
    [v3 unregisterChangeHistoryClientIdentifier:@"com.apple.contact.people" error:&v4];
  }
}

- (id)contactHandlesForPerson:(id)a3
{
  id v4 = a3;
  if (AFIsHorseman())
  {
    id v5 = 0;
  }
  else
  {
    id v5 = +[NSMutableSet set];
    v6 = [v4 internalGUID];
    if (v6)
    {
      v7 = [v4 internalGUID];
    }
    else
    {
      v8 = [v4 identifier];
      v7 = [v8 absoluteString];
    }
    if (v7)
    {
      v46[0] = CNContactPhoneNumbersKey;
      v46[1] = CNContactEmailAddressesKey;
      id v9 = +[NSArray arrayWithObjects:v46 count:2];
      uint64_t v10 = [(ADAddressBookManager *)self contactStore];
      id v43 = 0;
      v33 = v7;
      v11 = [v10 unifiedContactWithIdentifier:v7 keysToFetch:v9 error:&v43];
      id v32 = v43;

      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      v34 = v11;
      __int16 v12 = [v11 phoneNumbers];
      id v13 = [v12 countByEnumeratingWithState:&v39 objects:v45 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v40;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v40 != v15) {
              objc_enumerationMutation(v12);
            }
            v17 = *(void **)(*((void *)&v39 + 1) + 8 * i);
            id v18 = objc_alloc_init((Class)STPersonContactHandle);
            objc_msgSend(v18, "setType:", 1, v32);
            v19 = [v17 label];
            [v18 setLabel:v19];

            v20 = [v17 value];
            v21 = [v20 stringValue];
            [v18 setHandle:v21];

            [v5 addObject:v18];
          }
          id v14 = [v12 countByEnumeratingWithState:&v39 objects:v45 count:16];
        }
        while (v14);
      }

      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      v22 = [v34 emailAddresses];
      id v23 = [v22 countByEnumeratingWithState:&v35 objects:v44 count:16];
      if (v23)
      {
        id v24 = v23;
        uint64_t v25 = *(void *)v36;
        do
        {
          for (j = 0; j != v24; j = (char *)j + 1)
          {
            if (*(void *)v36 != v25) {
              objc_enumerationMutation(v22);
            }
            v27 = *(void **)(*((void *)&v35 + 1) + 8 * (void)j);
            id v28 = objc_alloc_init((Class)STPersonContactHandle);
            [v28 setType:0];
            v29 = [v27 label];
            [v28 setLabel:v29];

            v30 = [v27 value];
            [v28 setHandle:v30];

            [v5 addObject:v28];
          }
          id v24 = [v22 countByEnumeratingWithState:&v35 objects:v44 count:16];
        }
        while (v24);
      }

      v7 = v33;
    }
  }
  return v5;
}

- (void)getMeCard:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  if (v4)
  {
    if (AFIsHorseman())
    {
      v4[2](v4, 0);
    }
    else
    {
      queue = self->_queue;
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_1002A8EF8;
      v6[3] = &unk_10050E188;
      v6[4] = self;
      v7 = v4;
      dispatch_async(queue, v6);
    }
  }
}

- (ADAddressBookManager)initWithDelegate:(id)a3
{
  id v4 = a3;
  if (AFIsHorseman())
  {
    id v5 = 0;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)ADAddressBookManager;
    v6 = [(ADAddressBookManager *)&v13 init];
    if (v6)
    {
      v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v8 = dispatch_queue_create("ADAddressBookManager", v7);

      queue = v6->_queue;
      v6->_queue = (OS_dispatch_queue *)v8;

      id v10 = objc_storeWeak((id *)&v6->_delegate, v4);
      if (v4)
      {
        v11 = +[NSNotificationCenter defaultCenter];
        [v11 addObserver:v6 selector:"_meContactDidChange:" name:CNContactStoreMeContactDidChangeNotification object:0];
        [v11 addObserver:v6 selector:"_firstUnlockStateDidChange:" name:@"ADFirstUnlockNotification" object:0];
      }
    }
    self = v6;
    id v5 = self;
  }

  return v5;
}

@end