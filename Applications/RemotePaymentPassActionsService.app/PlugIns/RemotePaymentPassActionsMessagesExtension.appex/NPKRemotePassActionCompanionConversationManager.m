@interface NPKRemotePassActionCompanionConversationManager
+ (id)sharedInstance;
- (NPKRemotePassActionCompanionConversationManager)init;
- (PKContactResolver)contactResolver;
- (id)_objectForIdentifier:(id)a3 inCache:(id)a4 withQueue:(id)a5;
- (id)cachedContactForConversation:(id)a3;
- (id)requestForIdentifier:(id)a3;
- (void)_setObject:(id)a3 forIdentifier:(id)a4 inCache:(id)a5 withQueue:(id)a6;
- (void)contactsDidChangeForContactResolver:(id)a3;
- (void)dealloc;
- (void)fetchContactForConversation:(id)a3 completion:(id)a4;
- (void)setContactResolver:(id)a3;
- (void)setRequest:(id)a3 forIdentifier:(id)a4;
@end

@implementation NPKRemotePassActionCompanionConversationManager

- (NPKRemotePassActionCompanionConversationManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)NPKRemotePassActionCompanionConversationManager;
  v2 = [(NPKRemotePassActionCompanionConversationManager *)&v8 init];
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init((Class)NSCache);
    requestCache = v2->_requestCache;
    v2->_requestCache = v3;

    dispatch_queue_t v5 = dispatch_queue_create("NPKRemotePassActionCompanionConversationManagerPassRequestQueue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    requestQueue = v2->_requestQueue;
    v2->_requestQueue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (void)dealloc
{
  contactResolver = self->_contactResolver;
  if (contactResolver) {
    [(PKContactResolver *)contactResolver removeDelegate:self];
  }
  v4.receiver = self;
  v4.super_class = (Class)NPKRemotePassActionCompanionConversationManager;
  [(NPKRemotePassActionCompanionConversationManager *)&v4 dealloc];
}

- (PKContactResolver)contactResolver
{
  contactResolver = self->_contactResolver;
  if (!contactResolver)
  {
    id v4 = objc_alloc_init((Class)CNContactStore);
    dispatch_queue_t v5 = +[CNContactFormatter descriptorForRequiredKeysForStyle:0];
    v12[0] = v5;
    v12[1] = CNContactEmailAddressesKey;
    v12[2] = CNContactPhoneNumbersKey;
    v12[3] = CNContactGivenNameKey;
    v12[4] = CNContactFamilyNameKey;
    v6 = +[NSArray arrayWithObjects:v12 count:5];

    v7 = +[CNMonogrammer descriptorForRequiredKeysIncludingImage:1];
    objc_super v8 = [v6 arrayByAddingObject:v7];
    v9 = (PKContactResolver *)[objc_alloc((Class)PKContactResolver) initWithContactStore:v4 keysToFetch:v8];
    v10 = self->_contactResolver;
    self->_contactResolver = v9;

    [(PKContactResolver *)self->_contactResolver addDelegate:self];
    contactResolver = self->_contactResolver;
  }

  return contactResolver;
}

+ (id)sharedInstance
{
  if (qword_10001A3C0 != -1) {
    dispatch_once(&qword_10001A3C0, &stru_100014460);
  }
  v2 = (void *)qword_10001A3B8;

  return v2;
}

- (id)requestForIdentifier:(id)a3
{
  return [(NPKRemotePassActionCompanionConversationManager *)self _objectForIdentifier:a3 inCache:self->_requestCache withQueue:self->_requestQueue];
}

- (void)setRequest:(id)a3 forIdentifier:(id)a4
{
}

- (id)cachedContactForConversation:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = [v4 recipientAddresses];
  v6 = [v5 firstObject];
  v7 = [v6 npkBaseAddress];
  objc_super v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [v4 senderAddress];
  }
  v10 = v9;

  v11 = [(NPKRemotePassActionCompanionConversationManager *)self contactResolver];
  unsigned int v12 = [v11 hasCachedResultForHandle:v10];

  if (v12)
  {
    v13 = [(PKContactResolver *)self->_contactResolver contactForHandle:v10];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)fetchContactForConversation:(id)a3 completion:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  v7 = [v14 recipientAddresses];
  objc_super v8 = [v7 firstObject];
  id v9 = [v8 npkBaseAddress];
  v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [v14 senderAddress];
  }
  unsigned int v12 = v11;

  v13 = [(NPKRemotePassActionCompanionConversationManager *)self contactResolver];
  [v13 contactForHandle:v12 withCompletion:v6];
}

- (void)contactsDidChangeForContactResolver:(id)a3
{
  id v3 = a3;
  id v4 = pk_RemotePassAction_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_RemotePassAction_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Notice: Note that contacts did change for contact resolver %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (id)_objectForIdentifier:(id)a3 inCache:(id)a4 withQueue:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = sub_10000467C;
  v24 = sub_10000468C;
  id v25 = 0;
  if (v7)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100004694;
    block[3] = &unk_100014488;
    v19 = &v20;
    id v17 = v8;
    id v18 = v7;
    dispatch_sync(v9, block);
  }
  v10 = pk_RemotePassAction_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    unsigned int v12 = pk_RemotePassAction_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = v21[5];
      *(_DWORD *)buf = 138412546;
      uint64_t v27 = v13;
      __int16 v28 = 2112;
      id v29 = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Notice: Returning object %@ for identifier %@", buf, 0x16u);
    }
  }
  id v14 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v14;
}

- (void)_setObject:(id)a3 forIdentifier:(id)a4 inCache:(id)a5 withQueue:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v10)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000047C4;
    block[3] = &unk_1000144B0;
    id v13 = v9;
    id v14 = v11;
    id v15 = v10;
    dispatch_barrier_async((dispatch_queue_t)a6, block);
  }
}

- (void)setContactResolver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactResolver, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);

  objc_storeStrong((id *)&self->_requestCache, 0);
}

@end