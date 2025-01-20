@interface IDSGroupContextController
- (CUTPromiseSeal)seal;
- (IDSGroupContextController)initWithServiceName:(id)a3 queue:(id)a4 delegate:(id)a5;
- (IDSGroupContextControllerDelegate)delegate;
- (NSString)serviceName;
- (OS_dispatch_queue)queue;
- (void)_contentWithCompletion:(id)a3;
- (void)dealloc;
- (void)didCacheGroup:(id)a3 completion:(id)a4;
- (void)didCreateGroup:(id)a3 completion:(id)a4;
- (void)didReceiveDecryptionFailureForGroup:(id)a3 completion:(id)a4;
- (void)didReceiveRegistrationIdentityUpdateWithCompletion:(id)a3;
- (void)didUpdateGroup:(id)a3 withNewGroup:(id)a4 completion:(id)a5;
- (void)groupContextWithCompletion:(id)a3;
- (void)persistedTokenForTaskHandler:(id)a3 completion:(id)a4;
- (void)qGroupContextWithDeviceIdentity:(id)a3 completion:(id)a4;
- (void)qSetupSeal;
- (void)scheduleTransactionLogTask:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSeal:(id)a3;
- (void)setServiceName:(id)a3;
- (void)taskHandler:(id)a3 accountInfoForAliases:(id)a4 completion:(id)a5;
- (void)taskHandler:(id)a3 groupsWithGroupIDs:(id)a4 completion:(id)a5;
- (void)taskHandler:(id)a3 messagesFromToken:(id)a4 completion:(id)a5;
- (void)taskHandler:(id)a3 participantsWithDestinations:(id)a4 completion:(id)a5;
- (void)taskHandler:(id)a3 persistToken:(id)a4 completion:(id)a5;
@end

@implementation IDSGroupContextController

- (IDSGroupContextController)initWithServiceName:(id)a3 queue:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = (IDSGroupContextControllerDelegate *)a5;
  if (_IDSRunningInDaemon())
  {
    v12 = [MEMORY[0x1E4F61160] groupContext];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_191A2A590((uint64_t)self, v12);
    }

    v13 = 0;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)IDSGroupContextController;
    v14 = [(IDSGroupContextController *)&v17 init];
    v15 = v14;
    if (v14)
    {
      objc_storeStrong((id *)&v14->_queue, a4);
      v15->_delegate = v11;
      objc_storeStrong((id *)&v15->_serviceName, a3);
    }
    self = v15;
    v13 = self;
  }

  return v13;
}

- (void)dealloc
{
  self->_delegate = 0;
  v3 = +[IDSDaemonProtocolController sharedInstance];
  v4 = [v3 observer];
  [v4 removeDelegate:self];

  v5.receiver = self;
  v5.super_class = (Class)IDSGroupContextController;
  [(IDSGroupContextController *)&v5 dealloc];
}

- (void)groupContextWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_191971A84;
  v6[3] = &unk_1E572B128;
  id v7 = v4;
  id v5 = v4;
  [(IDSGroupContextController *)self _contentWithCompletion:v6];
}

- (void)scheduleTransactionLogTask:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSGroupContextController *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = [(IDSGroupContextController *)self queue];
  id v7 = +[IDSTransactionLogTaskHandler handlerWithTask:v4 delegate:self queue:v6];

  [v7 perform];
}

- (void)taskHandler:(id)a3 groupsWithGroupIDs:(id)a4 completion:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v9 = [(IDSGroupContextController *)self queue];
  dispatch_assert_queue_V2(v9);

  id v10 = [MEMORY[0x1E4F61160] groupContext];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v18 = [v7 count];
    _os_log_impl(&dword_19190B000, v10, OS_LOG_TYPE_INFO, "Fetching groups from groupIDs {groupIDs.count: %ld}", buf, 0xCu);
  }

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_191971D10;
  v13[3] = &unk_1E572B1C8;
  id v14 = v7;
  v15 = self;
  id v16 = v8;
  id v11 = v8;
  id v12 = v7;
  [(IDSGroupContextController *)self groupContextWithCompletion:v13];
}

- (void)taskHandler:(id)a3 participantsWithDestinations:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(IDSGroupContextController *)self queue];
  dispatch_assert_queue_V2(v9);

  id v10 = +[IDSIDQueryController sharedInstance];
  id v11 = [(IDSGroupContextController *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_191972328;
  v13[3] = &unk_1E572B1F0;
  void v13[4] = self;
  id v14 = v7;
  id v12 = v7;
  [v10 participantsForDestinations:v8 service:@"com.apple.madrid" listenerID:@"kIDSGroupContextControllerListenerID" queue:v11 completionBlock:v13];
}

- (void)taskHandler:(id)a3 messagesFromToken:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(IDSGroupContextController *)self queue];
  dispatch_assert_queue_V2(v9);

  id v10 = [MEMORY[0x1E4F61160] groupContext];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19190B000, v10, OS_LOG_TYPE_INFO, "Fetching transport log messages", buf, 2u);
  }

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1919724C4;
  v13[3] = &unk_1E572B240;
  id v14 = v7;
  id v15 = v8;
  id v11 = v8;
  id v12 = v7;
  [(IDSGroupContextController *)self _contentWithCompletion:v13];
}

- (void)taskHandler:(id)a3 persistToken:(id)a4 completion:(id)a5
{
  v6 = (void *)MEMORY[0x1E4F28DB0];
  id v7 = (void (**)(id, void))a5;
  id v9 = [v6 archivedDataWithRootObject:a4 requiringSecureCoding:0 error:0];
  id v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v8 setObject:v9 forKey:@"kIDSGroupContextControllerPersistedToken"];

  v7[2](v7, 0);
}

- (void)persistedTokenForTaskHandler:(id)a3 completion:(id)a4
{
}

- (void)taskHandler:(id)a3 accountInfoForAliases:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1919727DC;
  v11[3] = &unk_1E572B268;
  v11[4] = self;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  [(IDSGroupContextController *)self _contentWithCompletion:v11];
}

- (void)didCreateGroup:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IDSGroupContextController *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_191972A48;
  block[3] = &unk_1E5729140;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)didCacheGroup:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IDSGroupContextController *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_191972BCC;
  block[3] = &unk_1E5729140;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)didUpdateGroup:(id)a3 withNewGroup:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(IDSGroupContextController *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_191972D78;
  v15[3] = &unk_1E5729A88;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)didReceiveDecryptionFailureForGroup:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IDSGroupContextController *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_191972F14;
  block[3] = &unk_1E5729140;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)didReceiveRegistrationIdentityUpdateWithCompletion:(id)a3
{
  id v4 = [(IDSGroupContextController *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_191973048;
  block[3] = &unk_1E5729000;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)qSetupSeal
{
  id v3 = objc_alloc(MEMORY[0x1E4F59E08]);
  id v5 = [(IDSGroupContextController *)self queue];
  id v4 = (void *)[v3 initWithQueue:v5];
  [(IDSGroupContextController *)self setSeal:v4];
}

- (void)qGroupContextWithDeviceIdentity:(id)a3 completion:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = (objc_class *)MEMORY[0x1E4F61138];
  id v6 = a3;
  id v7 = [v5 alloc];
  id v8 = [v6 accountIdentity];
  id v9 = (void *)[v7 initWithAccountKey:v8 deviceKey:v6];

  id v10 = [IDSGroupContextDataSource alloc];
  id v11 = [(IDSGroupContextController *)self queue];
  id v12 = [(IDSGroupContextDataSource *)v10 initWithQueue:v11];

  id v13 = objc_alloc(MEMORY[0x1E4F61148]);
  id v14 = [(IDSGroupContextController *)self queue];
  id v15 = (void *)[v13 initWithAccountIdentity:v9 dataSource:v12 queue:v14];

  id v16 = [MEMORY[0x1E4F59E30] weakRefWithObject:self];
  id v17 = objc_alloc(MEMORY[0x1E4F61150]);
  id v18 = [(IDSGroupContextController *)self queue];
  uint64_t v19 = (void *)[v17 initWithQueue:v18];

  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  v28 = sub_191973418;
  v29 = &unk_1E572B2B8;
  id v20 = v16;
  id v30 = v20;
  v31 = self;
  [v19 setOnGroupCreate:&v26];
  objc_msgSend(v15, "appendMiddleware:", v19, v26, v27, v28, v29);
  [v15 appendMiddleware:v12];
  v21 = objc_alloc_init(IDSGroupContextControllerContent);
  [(IDSGroupContextControllerContent *)v21 setGroupContext:v15];
  [(IDSGroupContextControllerContent *)v21 setAccountIdentity:v9];
  v22 = [(IDSGroupContextController *)self seal];
  [v22 fulfillWithValue:v21];

  v23 = +[IDSDaemonProtocolController sharedInstance];
  v24 = [v23 observer];
  [v24 addDelegate:self];

  v25 = [MEMORY[0x1E4F61160] groupContext];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v15;
    _os_log_impl(&dword_19190B000, v25, OS_LOG_TYPE_INFO, "Group Context Created %@", buf, 0xCu);
  }
}

- (void)_contentWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSGroupContextController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(IDSGroupContextController *)self seal];

  if (!v6) {
    [(IDSGroupContextController *)self qSetupSeal];
  }
  id v7 = [(IDSGroupContextController *)self seal];
  id v8 = [v7 promise];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_191973598;
  v10[3] = &unk_1E572B2E0;
  id v11 = v4;
  id v9 = v4;
  [v8 registerResultBlock:v10];
}

- (IDSGroupContextControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (IDSGroupContextControllerDelegate *)a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (CUTPromiseSeal)seal
{
  return self->_seal;
}

- (void)setSeal:(id)a3
{
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_seal, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end