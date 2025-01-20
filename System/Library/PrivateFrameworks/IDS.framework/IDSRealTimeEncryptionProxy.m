@interface IDSRealTimeEncryptionProxy
- (IDSRealTimeEncryptionProxy)initWithAccount:(id)a3;
- (void)dealloc;
- (void)requestMasterKeyMaterialForGroup:(id)a3;
- (void)requestPublicKeys;
- (void)resetKeysForGroup:(id)a3;
- (void)sendMKMRecoveryRequestToGroup:(id)a3;
- (void)sendMasterKeyMaterialToGroup:(id)a3;
- (void)sendPrekeyToGroup:(id)a3;
- (void)setDelegate:(id)a3 queue:(id)a4;
@end

@implementation IDSRealTimeEncryptionProxy

- (IDSRealTimeEncryptionProxy)initWithAccount:(id)a3
{
  id v4 = a3;
  if (_IDSRunningInDaemon())
  {
    v5 = +[IDSLogging IDSRealTimeEncryptionProxy];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A2A590((uint64_t)self, v5);
    }

    v6 = 0;
  }
  else
  {
    v7 = +[IDSInternalQueueController sharedInstance];
    int v8 = [v7 assertQueueIsCurrent];

    if (v8)
    {
      v9 = [MEMORY[0x1E4F6B460] utilities];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_191A45B04(v9);
      }
    }
    v14.receiver = self;
    v14.super_class = (Class)IDSRealTimeEncryptionProxy;
    v10 = [(IDSRealTimeEncryptionProxy *)&v14 init];
    if (v10)
    {
      v11 = [[_IDSRealTimeEncryptionProxy alloc] initWithAccount:v4];
      internal = v10->_internal;
      v10->_internal = v11;
    }
    self = v10;
    v6 = self;
  }

  return v6;
}

- (void)dealloc
{
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = sub_1919187E0;
  v6[4] = sub_191918610;
  v7 = (_IDSRealTimeEncryptionProxy *)0xAAAAAAAAAAAAAAAALL;
  v7 = self->_internal;
  v3 = +[IDSInternalQueueController sharedInstance];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_191A26BAC;
  v5[3] = &unk_1E5728DD0;
  v5[4] = v6;
  [v3 performBlock:v5 waitUntilDone:0];

  _Block_object_dispose(v6, 8);
  v4.receiver = self;
  v4.super_class = (Class)IDSRealTimeEncryptionProxy;
  [(IDSRealTimeEncryptionProxy *)&v4 dealloc];
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = +[IDSInternalQueueController sharedInstance];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_191A26CB4;
  v11[3] = &unk_1E5728DA8;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performBlock:v11];
}

- (void)sendPrekeyToGroup:(id)a3
{
}

- (void)requestPublicKeys
{
}

- (void)sendMasterKeyMaterialToGroup:(id)a3
{
}

- (void)sendMKMRecoveryRequestToGroup:(id)a3
{
  id v4 = a3;
  v5 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_191A26D98;
  v7[3] = &unk_1E57291B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

- (void)requestMasterKeyMaterialForGroup:(id)a3
{
}

- (void)resetKeysForGroup:(id)a3
{
}

- (void).cxx_destruct
{
}

@end