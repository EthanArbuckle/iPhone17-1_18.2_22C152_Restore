@interface _IDSRealTimeEncryptionProxy
- (_IDSRealTimeEncryptionProxy)initWithAccount:(id)a3;
- (void)dealloc;
- (void)requestMasterKeyMaterialForGroup:(id)a3;
- (void)requestPublicKeys;
- (void)resetKeysForGroup:(id)a3;
- (void)sendMKMRecoveryRequestToGroup:(id)a3;
- (void)sendMasterKeyMaterialToGroup:(id)a3;
- (void)sendPrekeyToGroup:(id)a3;
- (void)setDelegate:(id)a3 queue:(id)a4;
- (void)xpcObject:(id)a3 objectContext:(id)a4;
@end

@implementation _IDSRealTimeEncryptionProxy

- (_IDSRealTimeEncryptionProxy)initWithAccount:(id)a3
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
        sub_191A2CC4C();
      }
    }
    v20.receiver = self;
    v20.super_class = (Class)_IDSRealTimeEncryptionProxy;
    v10 = [(_IDSRealTimeEncryptionProxy *)&v20 init];
    if (v10)
    {
      uint64_t v11 = [NSString stringGUID];
      uniqueID = v10->_uniqueID;
      v10->_uniqueID = (NSString *)v11;

      v13 = [v4 _internal];
      uint64_t v14 = [v13 uniqueID];
      accountID = v10->_accountID;
      v10->_accountID = (NSString *)v14;

      v16 = +[IDSDaemonController sharedInstance];
      v17 = [v16 listener];
      [v17 addHandler:v10];

      v18 = +[IDSDaemonController sharedInstance];
      [v18 setupRealtimeEncryptionController:v10->_uniqueID forAccountWithID:v10->_accountID];
    }
    self = v10;
    v6 = self;
  }

  return v6;
}

- (void)dealloc
{
  v3 = +[IDSDaemonController sharedInstance];
  id v4 = [v3 listener];
  [v4 removeHandler:self];

  v5.receiver = self;
  v5.super_class = (Class)_IDSRealTimeEncryptionProxy;
  [(_IDSRealTimeEncryptionProxy *)&v5 dealloc];
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v6 = (CUTWeakReference *)a3;
  v7 = (OS_dispatch_queue *)a4;
  int v8 = +[IDSInternalQueueController sharedInstance];
  int v9 = [v8 assertQueueIsCurrent];

  if (v9)
  {
    v10 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_191A2CCE4();
    }
  }
  uint64_t v11 = +[IDSLogging IDSRealTimeEncryptionProxy];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 134217984;
    v16 = v6;
    _os_log_impl(&dword_19190B000, v11, OS_LOG_TYPE_DEFAULT, "Setting up delegate %p", (uint8_t *)&v15, 0xCu);
  }

  if (self->_delegate != v6)
  {
    v12 = [MEMORY[0x1E4F59E30] weakRefWithObject:v6];
    delegate = self->_delegate;
    self->_delegate = v12;
  }
  queue = self->_queue;
  self->_queue = v7;
}

- (void)sendPrekeyToGroup:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A2CD7C();
    }
  }
  int v8 = +[IDSLogging IDSRealTimeEncryptionProxy];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "Sending the real-time media prekey of this device to the group %@", (uint8_t *)&v10, 0xCu);
  }

  int v9 = +[IDSDaemonController sharedInstance];
  [v9 sendRealTimeMediaPrekey:self->_uniqueID toGroup:v4];
}

- (void)requestPublicKeys
{
  v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    objc_super v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A2CE14();
    }
  }
  int v6 = +[IDSDaemonController sharedInstance];
  [v6 requestPublicKeysForRealTimeEncryption:self->_uniqueID forAccountWithID:self->_accountID];
}

- (void)sendMasterKeyMaterialToGroup:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A2CEAC();
    }
  }
  int v8 = +[IDSDaemonController sharedInstance];
  [v8 sendRealTimeEncryptionMasterKeyMaterial:self->_uniqueID toGroup:v4];
}

- (void)requestMasterKeyMaterialForGroup:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A2CF44();
    }
  }
  int v8 = +[IDSDaemonController sharedInstance];
  [v8 requestRealTimeEncryptionMasterKeyMaterial:self->_uniqueID forGroup:v4];
}

- (void)sendMKMRecoveryRequestToGroup:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A2CFDC();
    }
  }
  int v8 = +[IDSDaemonController sharedInstance];
  [v8 sendRealTimeEncryptionMKMRecoveryRequest:self->_uniqueID toGroup:v4];
}

- (void)resetKeysForGroup:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A2D074();
    }
  }
  int v8 = +[IDSDaemonController sharedInstance];
  [v8 resetRealTimeEncryptionKeys:self->_uniqueID forGroup:v4];
}

- (void)xpcObject:(id)a3 objectContext:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v5 = (const __CFDictionary *)a4;
  int v6 = [(CUTWeakReference *)self->_delegate object];
  if (v5)
  {
    v7 = (id)CFDictionaryGetValue(v5, @"object-type");
    if ([v7 isEqualToIgnoringCase:@"public-keys"])
    {
      Value = (void *)CFDictionaryGetValue(v5, @"public-keys");
LABEL_5:
      int v10 = Value;
      if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        [v6 didReceivePublickeys:v10];
        goto LABEL_22;
      }
      id v11 = +[IDSLogging IDSRealTimeEncryptionProxy];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        delegate = self->_delegate;
        int v17 = 138412290;
        v18 = delegate;
        v13 = "the delegate object %@ doesn't respond to the selector didReceivePublickeys:";
LABEL_20:
        _os_log_impl(&dword_19190B000, v11, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v17, 0xCu);
        goto LABEL_21;
      }
      goto LABEL_21;
    }
    if ([v7 isEqualToIgnoringCase:@"master-key-materials"])
    {
      uint64_t v14 = (void *)CFDictionaryGetValue(v5, @"master-key-materials");
      goto LABEL_13;
    }
  }
  else
  {
    char v9 = [0 isEqualToIgnoringCase:@"public-keys"];
    v7 = 0;
    Value = 0;
    if (v9) {
      goto LABEL_5;
    }
    char v15 = [0 isEqualToIgnoringCase:@"master-key-materials"];
    v7 = 0;
    uint64_t v14 = 0;
    if (v15)
    {
LABEL_13:
      int v10 = v14;
      if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        [v6 didReceiveMasterKeyMaterials:v10];
        goto LABEL_22;
      }
      id v11 = +[IDSLogging IDSRealTimeEncryptionProxy];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v16 = self->_delegate;
        int v17 = 138412290;
        v18 = v16;
        v13 = "the delegate object %@ doesn't respond to the selector didReceiveMasterKeyMaterials:";
        goto LABEL_20;
      }
LABEL_21:

      goto LABEL_22;
    }
  }
  int v10 = +[IDSLogging IDSRealTimeEncryptionProxy];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    v18 = (CUTWeakReference *)v7;
    _os_log_impl(&dword_19190B000, v10, OS_LOG_TYPE_DEFAULT, "unknown object type %@", (uint8_t *)&v17, 0xCu);
  }
LABEL_22:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_accountID, 0);

  objc_storeStrong((id *)&self->_uniqueID, 0);
}

@end