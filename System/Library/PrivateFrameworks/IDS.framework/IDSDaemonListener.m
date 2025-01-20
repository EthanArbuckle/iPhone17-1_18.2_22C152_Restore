@interface IDSDaemonListener
- (BOOL)_hidingDisconnect;
- (BOOL)hasPostedSetupComplete;
- (BOOL)isSetupComplete;
- (IDSDaemonListener)init;
- (IDSDaemonListener)initWithQueueController:(id)a3 ivarQueue:(id)a4;
- (NSString)deviceIdentifier;
- (_IDSRegistrationAccountManager)registrationAccountManager;
- (id)_uniqueIDForDevice:(id)a3;
- (id)_updateService:(id)a3 withTinkerDevice:(id)a4 shouldAdd:(BOOL)a5 shouldSwitch:(BOOL)a6;
- (id)accountDictionariesForService:(id)a3;
- (id)dependentDevicesForAccount:(id)a3;
- (id)enabledAccountsForService:(id)a3;
- (id)familyInfoForService:(id)a3;
- (id)getDirectMessagingMetadataDictionary;
- (id)latestPrivateLoggingSalt;
- (id)linkedDevicesForService:(id)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)pendingInvitationsForService:(id)a3;
- (id)receivedInvitationsForService:(id)a3;
- (int64_t)maxEffectivePayloadSizeForService:(id)a3;
- (int64_t)maxIMLPayloadSize;
- (unint64_t)restrictionReasonForService:(id)a3;
- (void)__postSetupComplete;
- (void)_callHandlersAsyncWithBlock:(id)a3;
- (void)_callHandlersWithBlock:(id)a3;
- (void)_callHandlersWithBlockOnIvarQueue:(id)a3;
- (void)_callHandlersWithBlockOnIvarQueue:(id)a3 cleanup:(id)a4;
- (void)_internalDidSwitchActivePairedDevice:(id)a3 forService:(id)a4;
- (void)_internalSwitchActivePairedDevice:(id)a3 forAccount:(id)a4;
- (void)_internalSwitchActivePairedDevice:(id)a3 forService:(id)a4;
- (void)_noteDisconnected;
- (void)_performSyncBlock:(id)a3;
- (void)_removeAccountOnIvarQueue:(id)a3;
- (void)_setHidingDisconnect:(BOOL)a3;
- (void)account:(id)a3 accountInfoChanged:(id)a4;
- (void)account:(id)a3 aliasesChanged:(id)a4;
- (void)account:(id)a3 dependentDevicesUpdated:(id)a4;
- (void)account:(id)a3 displayNameChanged:(id)a4;
- (void)account:(id)a3 localDeviceAdded:(id)a4;
- (void)account:(id)a3 localDeviceRemoved:(id)a4;
- (void)account:(id)a3 loginChanged:(id)a4;
- (void)account:(id)a3 profileChanged:(id)a4;
- (void)account:(id)a3 registrationStatusInfoChanged:(id)a4;
- (void)account:(id)a3 vettedAliasesChanged:(id)a4;
- (void)accountAdded:(id)a3;
- (void)accountDisabled:(id)a3 onService:(id)a4;
- (void)accountEnabled:(id)a3 onService:(id)a4;
- (void)accountRemoved:(id)a3;
- (void)addHandler:(id)a3;
- (void)connectionComplete:(BOOL)a3 withResponse:(id)a4;
- (void)continuityDidConnectToPeer:(id)a3 withError:(id)a4;
- (void)continuityDidDisconnectFromPeer:(id)a3 withError:(id)a4;
- (void)continuityDidDiscoverPeerWithData:(id)a3 fromPeer:(id)a4;
- (void)continuityDidDiscoverType:(int64_t)a3 withData:(id)a4 fromPeer:(id)a5;
- (void)continuityDidFailToStartAdvertisingOfType:(int64_t)a3 withError:(id)a4;
- (void)continuityDidFailToStartScanningForType:(int64_t)a3 withError:(id)a4;
- (void)continuityDidLosePeer:(id)a3;
- (void)continuityDidStartAdvertisingOfType:(int64_t)a3;
- (void)continuityDidStartScanningForType:(int64_t)a3;
- (void)continuityDidStopAdvertisingOfType:(int64_t)a3;
- (void)continuityDidStopAdvertisingOfType:(int64_t)a3 withError:(id)a4;
- (void)continuityDidStopScanningForType:(int64_t)a3;
- (void)continuityDidUpdateStateToState:(int64_t)a3;
- (void)deactivatePairedDevices;
- (void)device:(id)a3 nsuuidChanged:(id)a4;
- (void)deviceIdentifierDidChange:(id)a3;
- (void)didGetIdentities:(id)a3 error:(id)a4;
- (void)didSwitchActivePairedDevice:(id)a3;
- (void)familyDevicesForService:(id)a3 listenerID:(id)a4 withCompletion:(id)a5;
- (void)forwardInvocation:(id)a3;
- (void)refreshRegistrationForAccount:(id)a3;
- (void)registrationFailedForAccount:(id)a3 needsDeletion:(id)a4;
- (void)removeHandler:(id)a3;
- (void)service:(id)a3 familyInfoUpdated:(id)a4;
- (void)service:(id)a3 restrictionReasonChanged:(unint64_t)a4;
- (void)service:(id)a3 tinkerDeviceAdded:(id)a4;
- (void)service:(id)a3 tinkerDeviceRemoved:(id)a4;
- (void)service:(id)a3 tinkerDeviceUpdated:(id)a4;
- (void)setRegistrationAccountManager:(id)a3;
- (void)setupCompleteWithInfo:(id)a3;
- (void)switchActivePairedDevice:(id)a3 forAccount:(id)a4;
- (void)switchActivePairedDevice:(id)a3 forService:(id)a4;
- (void)updateAccount:(id)a3 withAccountInfo:(id)a4;
- (void)xpcObject:(id)a3 objectContext:(id)a4;
@end

@implementation IDSDaemonListener

- (BOOL)_hidingDisconnect
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = -86;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_191918C28;
  v4[3] = &unk_1E5728DF8;
  v4[4] = self;
  v4[5] = &v5;
  [(IDSDaemonListener *)self _performSyncBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)__postSetupComplete
{
  if (!self->_setupInfoComplete)
  {
    uint64_t v2 = [MEMORY[0x1E4F6C3B8] registration];
    if (!os_log_type_enabled((os_log_t)v2, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    v3 = "Setup info is not complete, waiting...";
LABEL_8:
    _os_log_impl(&dword_19190B000, (os_log_t)v2, OS_LOG_TYPE_DEFAULT, v3, buf, 2u);
    goto LABEL_9;
  }
  if (!self->_connectionComplete)
  {
    uint64_t v2 = [MEMORY[0x1E4F6C3B8] registration];
    if (!os_log_type_enabled((os_log_t)v2, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    v3 = "Connection is not complete, waiting...";
    goto LABEL_8;
  }
  self->_setupComplete = 1;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_19190DAAC;
  v4[3] = &unk_1E5729000;
  v4[4] = self;
  uint64_t v2 = MEMORY[0x192FE03B0](v4, a2);
  (*(void (**)(void))(v2 + 16))();
LABEL_9:
}

- (void)connectionComplete:(BOOL)a3 withResponse:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_19190D188;
  v7[3] = &unk_1E57291B8;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [(IDSDaemonListener *)self _performSyncBlock:v7];
}

- (void)setupCompleteWithInfo:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19190B000, v5, OS_LOG_TYPE_DEFAULT, "Setup complete with info", buf, 2u);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_191915790;
  v7[3] = &unk_1E57291B8;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  [(IDSDaemonListener *)self _performSyncBlock:v7];
}

- (IDSDaemonListener)initWithQueueController:(id)a3 ivarQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (_IDSRunningInDaemon())
  {
    v9 = +[IDSLogging DaemonListener];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_191A2C4C8();
    }

    v10 = 0;
LABEL_9:

    goto LABEL_10;
  }
  v17.receiver = self;
  v17.super_class = (Class)IDSDaemonListener;
  v11 = [(IDSDaemonListener *)&v17 init];
  v10 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_internalQueueController, a3);
    objc_storeStrong((id *)&v10->_ivarQueue, a4);
    ivarQueue = v10->_ivarQueue;
    if (ivarQueue) {
      dispatch_queue_set_specific(ivarQueue, "IDSDaemonListenerContext", (void *)1, 0);
    }
    v10->_setupComplete = 0;
    *(_WORD *)&v10->_setupInfoComplete = 0;
    v13 = objc_alloc_init(_IDSRegistrationAccountManager);
    registrationAccountManager = v10->_registrationAccountManager;
    v10->_registrationAccountManager = v13;

    uint64_t v15 = [objc_alloc(MEMORY[0x1E4F28FA8]) initWithProtocol:&unk_1EE294310];
    self = (IDSDaemonListener *)v10->_protocol;
    v10->_protocol = (NSProtocolChecker *)v15;
    goto LABEL_9;
  }
LABEL_10:

  return v10;
}

- (id)accountDictionariesForService:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F6C360] sharedInstance];
  char v6 = [v5 isNonUIInstall];

  if (v6) {
    goto LABEL_6;
  }
  id v7 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_191A2C550();
  }

  if (!v4)
  {
LABEL_6:
    id v8 = 0;
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x3032000000;
    objc_super v17 = sub_191918660;
    v18 = sub_191918550;
    id v19 = 0;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_19190D218;
    v10[3] = &unk_1E57290F0;
    id v11 = v4;
    v12 = self;
    v13 = &v14;
    [(IDSDaemonListener *)self _performSyncBlock:v10];
    id v8 = (id)v15[5];

    _Block_object_dispose(&v14, 8);
  }

  return v8;
}

- (id)enabledAccountsForService:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F6C360] sharedInstance];
  char v6 = [v5 isNonUIInstall];

  if (v6) {
    goto LABEL_6;
  }
  id v7 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v4;
    _os_log_impl(&dword_19190B000, v7, OS_LOG_TYPE_DEFAULT, "%@ enabledAccountsForService %@", buf, 0x16u);
  }

  if (!v4)
  {
LABEL_6:
    id v8 = 0;
  }
  else
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    uint64_t v14 = sub_191918660;
    uint64_t v15 = sub_191918550;
    id v16 = 0;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_19190D414;
    v10[3] = &unk_1E57290F0;
    void v10[4] = self;
    id v11 = v4;
    v12 = buf;
    [(IDSDaemonListener *)self _performSyncBlock:v10];
    id v8 = *(id *)(*(void *)&buf[8] + 40);

    _Block_object_dispose(buf, 8);
  }

  return v8;
}

- (IDSDaemonListener)init
{
  if (_IDSRunningInDaemon())
  {
    v3 = +[IDSLogging DaemonListener];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_191A2C4C8();
    }

    id v4 = 0;
  }
  else
  {
    id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v6 = [NSString stringWithFormat:@"IDSDaemonListener-ivarQueue: %@", self];
    dispatch_queue_t v7 = dispatch_queue_create((const char *)[v6 UTF8String], v5);

    id v8 = +[IDSInternalQueueController sharedInstance];
    self = [(IDSDaemonListener *)self initWithQueueController:v8 ivarQueue:v7];

    id v4 = self;
  }

  return v4;
}

- (void)addHandler:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = sub_19190DB58;
    v6[3] = &unk_1E57291B8;
    v6[4] = self;
    id v7 = v4;
    [(IDSDaemonListener *)self _performSyncBlock:v6];
  }
}

- (BOOL)isSetupComplete
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = -86;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_191918810;
  v4[3] = &unk_1E5728DF8;
  v4[4] = self;
  void v4[5] = &v5;
  [(IDSDaemonListener *)self _performSyncBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)_callHandlersWithBlockOnIvarQueue:(id)a3 cleanup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x3032000000;
    v14[3] = sub_191918660;
    v14[4] = sub_191918550;
    id v15 = 0;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_1919176E8;
    v13[3] = &unk_1E5728DF8;
    v13[4] = self;
    v13[5] = v14;
    [(IDSDaemonListener *)self _performSyncBlock:v13];
    internalQueueController = self->_internalQueueController;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_191912FB4;
    v9[3] = &unk_1E5729BD8;
    v12 = v14;
    id v10 = v6;
    id v11 = v7;
    [(IDSInternalQueueController *)internalQueueController performBlock:v9];

    _Block_object_dispose(v14, 8);
  }
}

- (void)_performSyncBlock:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (v4)
  {
    block = v4;
    if (dispatch_get_specific("IDSDaemonListenerContext")) {
      block[2]();
    }
    else {
      dispatch_sync((dispatch_queue_t)self->_ivarQueue, block);
    }
    id v4 = block;
  }
}

- (void)_callHandlersWithBlockOnIvarQueue:(id)a3
{
}

- (void)_noteDisconnected
{
  ivarQueue = self->_ivarQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_191918BF8;
  block[3] = &unk_1E5729000;
  block[4] = self;
  dispatch_async(ivarQueue, block);
}

- (BOOL)hasPostedSetupComplete
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = -86;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_191932AEC;
  v4[3] = &unk_1E5728DF8;
  v4[4] = self;
  void v4[5] = &v5;
  [(IDSDaemonListener *)self _performSyncBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (NSString)deviceIdentifier
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  char v8 = sub_191918660;
  v9 = sub_191918550;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_191932C00;
  v4[3] = &unk_1E5728DF8;
  v4[4] = self;
  void v4[5] = &v5;
  [(IDSDaemonListener *)self _performSyncBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

- (void)_setHidingDisconnect:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_191932CBC;
  v3[3] = &unk_1E5729050;
  v3[4] = self;
  BOOL v4 = a3;
  [(IDSDaemonListener *)self _performSyncBlock:v3];
}

- (void)removeHandler:(id)a3
{
  if (a3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = sub_191932D5C;
    v5[3] = &unk_1E5729BB0;
    v5[4] = self;
    v5[5] = a3;
    id v4 = a3;
    [(IDSDaemonListener *)self _performSyncBlock:v5];
  }
}

- (void)_callHandlersWithBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = sub_191932E60;
    v6[3] = &unk_1E5729230;
    v6[4] = self;
    id v7 = v4;
    [(IDSDaemonListener *)self _performSyncBlock:v6];
  }
}

- (void)_callHandlersAsyncWithBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    ivarQueue = self->_ivarQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = sub_191932F14;
    v7[3] = &unk_1E5729230;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(ivarQueue, v7);
  }
}

- (void)_removeAccountOnIvarQueue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKey:*MEMORY[0x1E4F6B7F0]];
  uint64_t v6 = [v4 objectForKey:*MEMORY[0x1E4F6B7E0]];
  id v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    id v10 = +[IDSLogging DaemonListener];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_191A2C69C();
    }
  }
  else
  {
    v9 = [(NSMutableDictionary *)self->_topicToAccountDictionaries objectForKey:v6];
    id v10 = [v9 mutableCopy];

    if (v10)
    {
      uint64_t v19 = 0;
      v20 = &v19;
      uint64_t v21 = 0x2020000000;
      uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v13 = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      id v15 = sub_1919330F4;
      id v16 = &unk_1E5729C00;
      id v17 = v5;
      v18 = &v19;
      [v10 enumerateObjectsUsingBlock:&v13];
      if (v20[3] != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[NSObject removeObjectAtIndex:](v10, "removeObjectAtIndex:", v13, v14, v15, v16);
        uint64_t v11 = [v10 count];
        topicToAccountDictionaries = self->_topicToAccountDictionaries;
        if (v11) {
          [(NSMutableDictionary *)topicToAccountDictionaries setObject:v10 forKey:v7];
        }
        else {
          [(NSMutableDictionary *)topicToAccountDictionaries removeObjectForKey:v7];
        }
      }

      _Block_object_dispose(&v19, 8);
    }
  }
}

- (void)accountAdded:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 objectForKey:*MEMORY[0x1E4F6B7F0]];
  uint64_t v6 = [v4 objectForKey:*MEMORY[0x1E4F6B7E0]];
  id v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    v9 = +[IDSLogging DaemonListener];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_191A2C704();
    }
  }
  else
  {
    id v10 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v19 = "-[IDSDaemonListener accountAdded:]";
      __int16 v20 = 2112;
      uint64_t v21 = v5;
      _os_log_impl(&dword_19190B000, v10, OS_LOG_TYPE_DEFAULT, "%s: %@", buf, 0x16u);
    }

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_1919333A8;
    v15[3] = &unk_1E5728DA8;
    v15[4] = self;
    id v12 = v4;
    id v16 = v12;
    id v17 = v7;
    [(IDSDaemonListener *)self _performSyncBlock:v15];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_19193343C;
    v13[3] = &unk_1E5729C28;
    id v14 = v12;
    [(IDSDaemonListener *)self _callHandlersWithBlock:v13];
  }
}

- (void)accountRemoved:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 objectForKey:*MEMORY[0x1E4F6B7F0]];
  uint64_t v6 = [v4 objectForKey:*MEMORY[0x1E4F6B7E0]];
  id v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    v9 = +[IDSLogging DaemonListener];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_191A2C76C();
    }
  }
  else
  {
    id v10 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[IDSDaemonListener accountRemoved:]";
      __int16 v19 = 2112;
      __int16 v20 = v5;
      _os_log_impl(&dword_19190B000, v10, OS_LOG_TYPE_DEFAULT, "%s: %@", buf, 0x16u);
    }

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_1919336C4;
    v15[3] = &unk_1E57291B8;
    v15[4] = self;
    id v12 = v4;
    id v16 = v12;
    [(IDSDaemonListener *)self _performSyncBlock:v15];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_1919336D0;
    v13[3] = &unk_1E5729C28;
    id v14 = v12;
    [(IDSDaemonListener *)self _callHandlersWithBlock:v13];
  }
}

- (void)accountEnabled:(id)a3 onService:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = v7;
  if (v6 && v7)
  {
    v9 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v6;
      _os_log_impl(&dword_19190B000, v9, OS_LOG_TYPE_DEFAULT, "Incoming account enabled: %@", buf, 0xCu);
    }

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = sub_191933938;
    v16[3] = &unk_1E5728DA8;
    v16[4] = self;
    id v10 = v8;
    id v17 = v10;
    id v11 = v6;
    id v18 = v11;
    [(IDSDaemonListener *)self _performSyncBlock:v16];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_1919339D8;
    v13[3] = &unk_1E5729C50;
    id v14 = v11;
    id v15 = v10;
    [(IDSDaemonListener *)self _callHandlersWithBlock:v13];
  }
  else
  {
    id v12 = +[IDSLogging DaemonListener];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_191A2C7D4();
    }
  }
}

- (void)accountDisabled:(id)a3 onService:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = v7;
  if (v6 && v7)
  {
    v9 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v6;
      _os_log_impl(&dword_19190B000, v9, OS_LOG_TYPE_DEFAULT, "Incoming account disabled: %@", buf, 0xCu);
    }

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = sub_191933C40;
    v16[3] = &unk_1E5728DA8;
    v16[4] = self;
    id v10 = v8;
    id v17 = v10;
    id v11 = v6;
    id v18 = v11;
    [(IDSDaemonListener *)self _performSyncBlock:v16];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_191933CE0;
    v13[3] = &unk_1E5729C50;
    id v14 = v11;
    id v15 = v10;
    [(IDSDaemonListener *)self _callHandlersWithBlock:v13];
  }
  else
  {
    id v12 = +[IDSLogging DaemonListener];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_191A2C83C();
    }
  }
}

- (unint64_t)restrictionReasonForService:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(NSMutableDictionary *)self->_serviceToRestrictionReason objectForKeyedSubscript:v4];
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_19190B000, v5, OS_LOG_TYPE_DEFAULT, "Restriction reason %@ for service %@", (uint8_t *)&v11, 0x16u);
  }
  id v7 = [(NSMutableDictionary *)self->_serviceToRestrictionReason objectForKeyedSubscript:v4];

  if (v7)
  {
    BOOL v8 = [(NSMutableDictionary *)self->_serviceToRestrictionReason objectForKeyedSubscript:v4];
    unint64_t v9 = [v8 unsignedIntValue];
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

- (void)service:(id)a3 restrictionReasonChanged:(unint64_t)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v16 = v6;
    __int16 v17 = 2048;
    unint64_t v18 = a4;
    _os_log_impl(&dword_19190B000, v7, OS_LOG_TYPE_DEFAULT, "Service %@ received restriction reason %lu", buf, 0x16u);
  }

  if (!self->_serviceToRestrictionReason)
  {
    BOOL v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    serviceToRestrictionReason = self->_serviceToRestrictionReason;
    self->_serviceToRestrictionReason = v8;
  }
  id v10 = [NSNumber numberWithUnsignedInteger:a4];
  [(NSMutableDictionary *)self->_serviceToRestrictionReason setObject:v10 forKeyedSubscript:v6];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_191933FEC;
  v12[3] = &unk_1E5729C78;
  id v13 = v6;
  unint64_t v14 = a4;
  id v11 = v6;
  [(IDSDaemonListener *)self _callHandlersWithBlock:v12];
}

- (void)updateAccount:(id)a3 withAccountInfo:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [v7 objectForKey:*MEMORY[0x1E4F6B7F0]];
  unint64_t v9 = [v7 objectForKey:*MEMORY[0x1E4F6B7E0]];
  if ([v9 isEqualToIgnoringCase:@"com.apple.private.alloy.voicemailsync"])
  {
    id v10 = [MEMORY[0x1E4F6C3B8] voicemailSync];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v7;
      _os_log_impl(&dword_19190B000, v10, OS_LOG_TYPE_DEFAULT, "Account info changed %@", buf, 0xCu);
    }
  }
  if (v8) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    id v12 = +[IDSLogging DaemonListener];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_191A2C8A4();
    }
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_19193422C;
    v13[3] = &unk_1E5728DA8;
    void v13[4] = self;
    id v14 = v7;
    id v15 = v9;
    [(IDSDaemonListener *)self _performSyncBlock:v13];
  }
}

- (void)account:(id)a3 accountInfoChanged:(id)a4
{
  id v6 = a4;
  [(IDSDaemonListener *)self updateAccount:a3 withAccountInfo:v6];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_191934374;
  v8[3] = &unk_1E5729C28;
  id v9 = v6;
  id v7 = v6;
  [(IDSDaemonListener *)self _callHandlersWithBlock:v8];
}

- (void)account:(id)a3 registrationStatusInfoChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_191934490;
  v10[3] = &unk_1E5729C50;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(IDSDaemonListener *)self _callHandlersWithBlock:v10];
}

- (void)account:(id)a3 aliasesChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1919345AC;
  v10[3] = &unk_1E5729C50;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(IDSDaemonListener *)self _callHandlersWithBlock:v10];
}

- (void)account:(id)a3 vettedAliasesChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1919346C8;
  v10[3] = &unk_1E5729C50;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(IDSDaemonListener *)self _callHandlersWithBlock:v10];
}

- (void)account:(id)a3 profileChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1919347E4;
  v10[3] = &unk_1E5729C50;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(IDSDaemonListener *)self _callHandlersWithBlock:v10];
}

- (void)account:(id)a3 loginChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_191934900;
  v10[3] = &unk_1E5729C50;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(IDSDaemonListener *)self _callHandlersWithBlock:v10];
}

- (void)account:(id)a3 displayNameChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_191934A1C;
  v10[3] = &unk_1E5729C50;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(IDSDaemonListener *)self _callHandlersWithBlock:v10];
}

- (id)_uniqueIDForDevice:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKey:*MEMORY[0x1E4F6AE38]];
  if (![v4 length])
  {
    uint64_t v5 = [v3 objectForKey:*MEMORY[0x1E4F6AEA0]];
    uint64_t v6 = [v5 _stringForKey:*MEMORY[0x1E4F6B220]];

    id v4 = (void *)v6;
  }

  return v4;
}

- (void)account:(id)a3 dependentDevicesUpdated:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_191934C88;
  v17[3] = &unk_1E5729680;
  v17[4] = self;
  id v9 = v6;
  id v18 = v9;
  id v19 = v7;
  id v10 = v8;
  id v20 = v10;
  id v11 = v7;
  [(IDSDaemonListener *)self _performSyncBlock:v17];
  id v12 = v10;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_191935004;
  v14[3] = &unk_1E5729C50;
  id v15 = v9;
  id v16 = v12;
  id v13 = v9;
  [(IDSDaemonListener *)self _callHandlersWithBlock:v14];
}

- (void)account:(id)a3 localDeviceAdded:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = sub_191918660;
  v44 = sub_191918550;
  id v45 = 0;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = sub_191918660;
  v38 = sub_191918550;
  id v39 = 0;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = sub_191918660;
  v32 = sub_191918550;
  id v33 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_191935384;
  v21[3] = &unk_1E5729CA0;
  id v8 = v7;
  id v22 = v8;
  id v9 = v6;
  id v23 = v9;
  v24 = self;
  v25 = &v40;
  v26 = &v28;
  v27 = &v34;
  [(IDSDaemonListener *)self _performSyncBlock:v21];
  id v10 = (id)v41[5];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_191935AD0;
  v18[3] = &unk_1E5729C50;
  id v11 = v9;
  id v19 = v11;
  id v12 = v10;
  id v20 = v12;
  [(IDSDaemonListener *)self _callHandlersWithBlock:v18];
  id v13 = (id)v35[5];
  id v14 = (id)v29[5];
  if ([(id)v35[5] length])
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_191935B30;
    v15[3] = &unk_1E5728DA8;
    v15[4] = self;
    id v16 = v13;
    id v17 = v14;
    [(IDSDaemonListener *)self _performSyncBlock:v15];
  }
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v40, 8);
}

- (void)account:(id)a3 localDeviceRemoved:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_191935C78;
  v15[3] = &unk_1E5728DA8;
  id v8 = v6;
  id v16 = v8;
  id v9 = v7;
  id v17 = v9;
  id v18 = self;
  [(IDSDaemonListener *)self _performSyncBlock:v15];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_191935F10;
  v12[3] = &unk_1E5729C50;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(IDSDaemonListener *)self _callHandlersWithBlock:v12];
}

- (id)_updateService:(id)a3 withTinkerDevice:(id)a4 shouldAdd:(BOOL)a5 shouldSwitch:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = sub_191918660;
  v30[4] = sub_191918550;
  id v31 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = sub_191918660;
  uint64_t v28 = sub_191918550;
  id v29 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_191936134;
  v16[3] = &unk_1E5729CF0;
  id v12 = v11;
  id v17 = v12;
  id v13 = v10;
  id v18 = v13;
  id v19 = self;
  BOOL v22 = a5;
  BOOL v23 = a6;
  id v20 = v30;
  uint64_t v21 = &v24;
  [(IDSDaemonListener *)self _performSyncBlock:v16];
  id v14 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(v30, 8);

  return v14;
}

- (void)service:(id)a3 tinkerDeviceAdded:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v6;
    _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "tinkerDeviceAdded %@", buf, 0xCu);
  }

  id v9 = [(IDSDaemonListener *)self _updateService:v6 withTinkerDevice:v7 shouldAdd:1 shouldSwitch:1];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_191936D0C;
  v15[3] = &unk_1E5729C50;
  id v10 = v6;
  id v16 = v10;
  id v11 = v7;
  id v17 = v11;
  [(IDSDaemonListener *)self _callHandlersWithBlock:v15];
  if ([v9 length])
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = sub_191936D6C;
    v12[3] = &unk_1E5728DA8;
    void v12[4] = self;
    id v13 = v9;
    id v14 = v10;
    [(IDSDaemonListener *)self _performSyncBlock:v12];
  }
}

- (void)service:(id)a3 tinkerDeviceRemoved:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v6;
    _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "tinkerDeviceRemoved %@", buf, 0xCu);
  }

  id v9 = [(IDSDaemonListener *)self _updateService:v6 withTinkerDevice:v7 shouldAdd:0 shouldSwitch:0];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_191936EE0;
  v12[3] = &unk_1E5729C50;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(IDSDaemonListener *)self _callHandlersWithBlock:v12];
}

- (void)service:(id)a3 tinkerDeviceUpdated:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v6;
    _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "tinkerDeviceUpdated %@", buf, 0xCu);
  }

  id v9 = [(IDSDaemonListener *)self _updateService:v6 withTinkerDevice:v7 shouldAdd:1 shouldSwitch:0];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1919370A4;
  v12[3] = &unk_1E5729C50;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(IDSDaemonListener *)self _callHandlersWithBlock:v12];
}

- (void)service:(id)a3 familyInfoUpdated:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v6;
    _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "familyInfoUpdated %@", buf, 0xCu);
  }

  if (v7)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = *MEMORY[0x1E4F6AF10];
    id v12 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F6AF10]];
    id v13 = [v10 setWithArray:v12];
    [v9 setObject:v13 forKeyedSubscript:v11];

    id v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = *MEMORY[0x1E4F6AEF0];
    id v16 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F6AEF0]];
    uint64_t v17 = [v14 setWithArray:v16];
    [v9 setObject:v17 forKeyedSubscript:v15];

    [(NSMutableDictionary *)self->_serviceToFamilyInfo setObject:v9 forKey:v6];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = sub_191937374;
    v19[3] = &unk_1E5729C50;
    id v20 = v6;
    id v21 = v9;
    id v18 = v9;
    [(IDSDaemonListener *)self _callHandlersWithBlock:v19];
  }
  else
  {
    id v18 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v6;
      _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "Family Info was nil %@", buf, 0xCu);
    }
  }
}

- (id)familyInfoForService:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = sub_191918660;
  uint64_t v15 = sub_191918550;
  id v16 = (id)0xAAAAAAAAAAAAAAAALL;
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_19193751C;
  v8[3] = &unk_1E5729190;
  id v10 = &v11;
  void v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  [(IDSDaemonListener *)self _performSyncBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

- (void)familyDevicesForService:(id)a3 listenerID:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && v9)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_191937654;
    v11[3] = &unk_1E5729A88;
    v11[4] = self;
    id v12 = v8;
    id v13 = v9;
    id v14 = v10;
    [(IDSDaemonListener *)self _performSyncBlock:v11];
  }
}

- (id)pendingInvitationsForService:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = sub_191918660;
  uint64_t v15 = sub_191918550;
  id v16 = (id)0xAAAAAAAAAAAAAAAALL;
  id v16 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_191938170;
  v8[3] = &unk_1E5729190;
  id v10 = &v11;
  void v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  [(IDSDaemonListener *)self _performSyncBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

- (id)receivedInvitationsForService:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = sub_191918660;
  uint64_t v15 = sub_191918550;
  id v16 = (id)0xAAAAAAAAAAAAAAAALL;
  id v16 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_191938308;
  v8[3] = &unk_1E5729190;
  id v10 = &v11;
  void v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  [(IDSDaemonListener *)self _performSyncBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

- (int64_t)maxEffectivePayloadSizeForService:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_19193843C;
  v8[3] = &unk_1E5729190;
  id v10 = &v11;
  void v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  [(IDSDaemonListener *)self _performSyncBlock:v8];
  int64_t v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (int64_t)maxIMLPayloadSize
{
  uint64_t v5 = 0;
  int64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_191938558;
  v4[3] = &unk_1E5728DF8;
  v4[4] = self;
  void v4[5] = &v5;
  [(IDSDaemonListener *)self _performSyncBlock:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (id)latestPrivateLoggingSalt
{
  uint64_t v5 = 0;
  int64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = sub_191918660;
  id v9 = sub_191918550;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_19193866C;
  v4[3] = &unk_1E5728DF8;
  v4[4] = self;
  void v4[5] = &v5;
  [(IDSDaemonListener *)self _performSyncBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)registrationFailedForAccount:(id)a3 needsDeletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_19193873C;
  v10[3] = &unk_1E5729C50;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(IDSDaemonListener *)self _callHandlersWithBlock:v10];
}

- (void)refreshRegistrationForAccount:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_191A2C980();
  }

  id v6 = [MEMORY[0x1E4F6B568] sharedInstance];
  [v6 flushCache];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_19193888C;
  v8[3] = &unk_1E5729C28;
  id v9 = v4;
  id v7 = v4;
  [(IDSDaemonListener *)self _callHandlersWithBlock:v8];
}

- (id)dependentDevicesForAccount:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F6C360] sharedInstance];
  char v6 = [v5 isNonUIInstall];

  id v7 = 0;
  if (v4 && (v6 & 1) == 0)
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3032000000;
    uint64_t v15 = sub_191918660;
    id v16 = sub_191918550;
    id v17 = 0;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_191938A48;
    v9[3] = &unk_1E5729190;
    id v11 = &v12;
    void v9[4] = self;
    id v10 = v4;
    [(IDSDaemonListener *)self _performSyncBlock:v9];
    id v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }

  return v7;
}

- (id)linkedDevicesForService:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F6C360] sharedInstance];
  char v6 = [v5 isNonUIInstall];

  id v7 = 0;
  if (v4 && (v6 & 1) == 0)
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3032000000;
    uint64_t v15 = sub_191918660;
    id v16 = sub_191918550;
    id v17 = 0;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_191938BF4;
    v9[3] = &unk_1E5729190;
    id v11 = &v12;
    void v9[4] = self;
    id v10 = v4;
    [(IDSDaemonListener *)self _performSyncBlock:v9];
    id v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }

  return v7;
}

- (void)device:(id)a3 nsuuidChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_191938D58;
    v9[3] = &unk_1E5728DA8;
    id v10 = v7;
    id v11 = v6;
    uint64_t v12 = self;
    [(IDSDaemonListener *)self _performSyncBlock:v9];

    id v8 = v10;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F6C3B8] NSUUID];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "No device ID: can't update nsuuid. Bailing...", buf, 2u);
    }
  }
}

- (void)didGetIdentities:(id)a3 error:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_19190B000, v7, OS_LOG_TYPE_DEFAULT, "Did get identities {identities: %@, error: %@}", (uint8_t *)&v8, 0x16u);
  }
}

- (void)didSwitchActivePairedDevice:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1919393C8;
  v6[3] = &unk_1E57291B8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(IDSDaemonListener *)self _performSyncBlock:v6];
}

- (void)_internalDidSwitchActivePairedDevice:(id)a3 forService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  char v19 = 1;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1919396B8;
  v14[3] = &unk_1E5729D68;
  id v15 = v6;
  id v16 = v7;
  id v17 = v18;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1919397E8;
  v10[3] = &unk_1E5729D90;
  uint64_t v13 = v18;
  void v10[4] = self;
  id v8 = v16;
  id v11 = v8;
  id v9 = v15;
  id v12 = v9;
  [(IDSDaemonListener *)self _callHandlersWithBlockOnIvarQueue:v14 cleanup:v10];

  _Block_object_dispose(v18, 8);
}

- (void)switchActivePairedDevice:(id)a3 forService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v6 length])
  {
    id v8 = [MEMORY[0x1E4F6C3B8] isActive];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v9 = "New active unique ID is nil";
LABEL_8:
      _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 2u);
    }
LABEL_9:

    goto LABEL_10;
  }
  if (![v7 length])
  {
    id v8 = [MEMORY[0x1E4F6C3B8] isActive];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v9 = "Account unique ID is nil, can't switch active device ID";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_191939BEC;
  v10[3] = &unk_1E5728DA8;
  void v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  [(IDSDaemonListener *)self _performSyncBlock:v10];

LABEL_10:
}

- (void)_internalSwitchActivePairedDevice:(id)a3 forService:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F6C3B8] isActive];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v34 = v27;
    __int16 v35 = 2112;
    id v36 = v6;
    _os_log_impl(&dword_19190B000, v7, OS_LOG_TYPE_DEFAULT, "Switching active device to %@ for service %@", buf, 0x16u);
  }

  id v8 = [(NSMutableDictionary *)self->_serviceToLinkedDevices objectForKey:v6];
  id v9 = (void *)[v8 mutableCopy];

  __int16 v10 = [MEMORY[0x1E4F6C3B8] isActive];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v34 = v6;
    __int16 v35 = 2112;
    id v36 = v9;
    _os_log_impl(&dword_19190B000, v10, OS_LOG_TYPE_DEFAULT, "Current linked devices for service %@: %@", buf, 0x16u);
  }
  v25 = v6;

  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = (id)[v9 mutableCopy];
  uint64_t v11 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v29;
    uint64_t v14 = *MEMORY[0x1E4F6AE50];
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        id v17 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v16];
        [(IDSDaemonListener *)self _uniqueIDForDevice:v17];
        char v19 = v18 = self;
        uint64_t v20 = [v19 isEqualToIgnoringCase:v27];
        id v21 = [NSNumber numberWithBool:v20];
        [v17 setObject:v21 forKey:v14];

        [v9 removeObject:v16];
        [v9 addObject:v17];

        self = v18;
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v12);
  }

  if (v25 && v9)
  {
    [(NSMutableDictionary *)self->_serviceToLinkedDevices setObject:v9 forKey:v25];
    BOOL v22 = [MEMORY[0x1E4F6C3B8] isActive];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v34 = v25;
      __int16 v35 = 2112;
      id v36 = v9;
      _os_log_impl(&dword_19190B000, v22, OS_LOG_TYPE_DEFAULT, "New linked devices for service %@: %@", buf, 0x16u);
    }
  }
  if (v27 && v25)
  {
    [(NSMutableDictionary *)self->_serviceToActiveDeviceUniqueID setObject:v27 forKey:v25];
    id v23 = [MEMORY[0x1E4F6C3B8] activeID];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = [(NSMutableDictionary *)self->_serviceToActiveDeviceUniqueID objectForKey:v25];
      *(_DWORD *)buf = 138412290;
      id v34 = v24;
      _os_log_impl(&dword_19190B000, v23, OS_LOG_TYPE_DEFAULT, "Active paired device switched, updating activeDevice ID to %@", buf, 0xCu);
    }
  }
}

- (void)switchActivePairedDevice:(id)a3 forAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v6 length])
  {
    id v8 = [MEMORY[0x1E4F6C3B8] isActive];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v9 = "New active unique ID is nil";
LABEL_8:
      _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 2u);
    }
LABEL_9:

    goto LABEL_10;
  }
  if (![v7 length])
  {
    id v8 = [MEMORY[0x1E4F6C3B8] isActive];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v9 = "Account unique ID is nil, can't switch active device ID";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_19193A120;
  v10[3] = &unk_1E5728DA8;
  void v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  [(IDSDaemonListener *)self _performSyncBlock:v10];

LABEL_10:
}

- (void)_internalSwitchActivePairedDevice:(id)a3 forAccount:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F6C3B8] isActive];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v36 = v29;
    __int16 v37 = 2112;
    id v38 = v6;
    _os_log_impl(&dword_19190B000, v7, OS_LOG_TYPE_DEFAULT, "Switching active device to %@ for account %@", buf, 0x16u);
  }

  id v8 = [(IDSDaemonListener *)self registrationAccountManager];
  id v9 = [v8 registeredDeviceInfoForAccountID:v6];
  __int16 v10 = (void *)[v9 mutableCopy];

  id v11 = [MEMORY[0x1E4F6C3B8] isActive];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v36 = v6;
    __int16 v37 = 2112;
    id v38 = v10;
    _os_log_impl(&dword_19190B000, v11, OS_LOG_TYPE_DEFAULT, "Current devices for account %@: %@", buf, 0x16u);
  }
  id v27 = v6;

  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = (id)[v10 mutableCopy];
  uint64_t v12 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v31;
    uint64_t v15 = *MEMORY[0x1E4F6AE50];
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        id v18 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v17];
        [(IDSDaemonListener *)self _uniqueIDForDevice:v18];
        v20 = char v19 = self;
        uint64_t v21 = [v20 isEqualToIgnoringCase:v29];
        BOOL v22 = [NSNumber numberWithBool:v21];
        [v18 setObject:v22 forKey:v15];

        [v10 removeObject:v17];
        [v10 addObject:v18];

        self = v19;
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v13);
  }

  if (v27 && v10)
  {
    id v23 = [(IDSDaemonListener *)self registrationAccountManager];
    [v23 updateAccount:v27 withRegistration:v10];

    uint64_t v24 = [MEMORY[0x1E4F6C3B8] isActive];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v36 = v27;
      __int16 v37 = 2112;
      id v38 = v10;
      _os_log_impl(&dword_19190B000, v24, OS_LOG_TYPE_DEFAULT, "New devices for account %@: %@", buf, 0x16u);
    }
  }
  if (v29 && v27)
  {
    [(NSMutableDictionary *)self->_accountToActiveDeviceUniqueID setObject:v29 forKey:v27];
    v25 = [MEMORY[0x1E4F6C3B8] activeID];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = [(NSMutableDictionary *)self->_accountToActiveDeviceUniqueID objectForKey:v27];
      *(_DWORD *)buf = 138412290;
      id v36 = v26;
      _os_log_impl(&dword_19190B000, v25, OS_LOG_TYPE_DEFAULT, "Active paired device switched, updating activeDevice ID to %@", buf, 0xCu);
    }
  }
}

- (void)deactivatePairedDevices
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = sub_19193A57C;
  v2[3] = &unk_1E5729000;
  v2[4] = self;
  [(IDSDaemonListener *)self _performSyncBlock:v2];
}

- (id)getDirectMessagingMetadataDictionary
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_191918660;
  id v9 = sub_191918550;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_19193B180;
  v4[3] = &unk_1E5728DF8;
  v4[4] = self;
  void v4[5] = &v5;
  [(IDSDaemonListener *)self _performSyncBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)xpcObject:(id)a3 objectContext:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[IDSLogging DaemonListener];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "XPC object received %@:%@", buf, 0x16u);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_19193B33C;
  v11[3] = &unk_1E5729C50;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(IDSDaemonListener *)self _callHandlersWithBlockOnIvarQueue:v11 cleanup:&unk_1EE246F48];
}

- (id)methodSignatureForSelector:(SEL)a3
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_191918660;
  id v10 = sub_191918550;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_19193B4A4;
  v5[3] = &unk_1E5729DB8;
  v5[4] = self;
  v5[5] = &v6;
  void v5[6] = a3;
  [(IDSDaemonListener *)self _performSyncBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  [v4 retainArguments];
  uint64_t v5 = +[IDSDaemonController sharedInstance];
  uint64_t v6 = [v5 localObject];
  id v7 = [v6 _currentMessageContext];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_19193B698;
  v14[3] = &unk_1E5729DE0;
  void v14[4] = self;
  id v8 = v4;
  id v15 = v8;
  id v9 = v7;
  id v16 = v9;
  id v10 = (void (**)(void, void))MEMORY[0x192FE03B0](v14);
  if ([v9 isReply] && _os_feature_enabled_impl())
  {
    v10[2](v10, 1);
  }
  else
  {
    internalQueueController = self->_internalQueueController;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = sub_19193BB74;
    v12[3] = &unk_1E5728FD8;
    id v13 = v10;
    [(IDSInternalQueueController *)internalQueueController performBlock:v12];
  }
}

- (void)continuityDidUpdateStateToState:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_19193BBF4;
  v3[3] = &unk_1E5729E00;
  v3[4] = a3;
  [(IDSDaemonListener *)self _callHandlersAsyncWithBlock:v3];
}

- (void)continuityDidLosePeer:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_19193BCE8;
  v6[3] = &unk_1E5729C28;
  id v7 = v4;
  id v5 = v4;
  [(IDSDaemonListener *)self _callHandlersAsyncWithBlock:v6];
}

- (void)continuityDidStartAdvertisingOfType:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_19193BDB4;
  v3[3] = &unk_1E5729E00;
  v3[4] = a3;
  [(IDSDaemonListener *)self _callHandlersAsyncWithBlock:v3];
}

- (void)continuityDidStopAdvertisingOfType:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_19193BE80;
  v3[3] = &unk_1E5729E00;
  v3[4] = a3;
  [(IDSDaemonListener *)self _callHandlersAsyncWithBlock:v3];
}

- (void)continuityDidStopAdvertisingOfType:(int64_t)a3 withError:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_19193BF78;
  v8[3] = &unk_1E5729C78;
  id v9 = v6;
  int64_t v10 = a3;
  id v7 = v6;
  [(IDSDaemonListener *)self _callHandlersAsyncWithBlock:v8];
}

- (void)continuityDidFailToStartAdvertisingOfType:(int64_t)a3 withError:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_19193C070;
  v8[3] = &unk_1E5729C78;
  id v9 = v6;
  int64_t v10 = a3;
  id v7 = v6;
  [(IDSDaemonListener *)self _callHandlersAsyncWithBlock:v8];
}

- (void)continuityDidStartScanningForType:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_19193C13C;
  v3[3] = &unk_1E5729E00;
  v3[4] = a3;
  [(IDSDaemonListener *)self _callHandlersAsyncWithBlock:v3];
}

- (void)continuityDidStopScanningForType:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_19193C208;
  v3[3] = &unk_1E5729E00;
  v3[4] = a3;
  [(IDSDaemonListener *)self _callHandlersAsyncWithBlock:v3];
}

- (void)continuityDidFailToStartScanningForType:(int64_t)a3 withError:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_19193C300;
  v8[3] = &unk_1E5729C78;
  id v9 = v6;
  int64_t v10 = a3;
  id v7 = v6;
  [(IDSDaemonListener *)self _callHandlersAsyncWithBlock:v8];
}

- (void)continuityDidDiscoverType:(int64_t)a3 withData:(id)a4 fromPeer:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_19193C424;
  v12[3] = &unk_1E5729E28;
  id v14 = v9;
  int64_t v15 = a3;
  id v13 = v8;
  id v10 = v9;
  id v11 = v8;
  [(IDSDaemonListener *)self _callHandlersAsyncWithBlock:v12];
}

- (void)continuityDidDiscoverPeerWithData:(id)a3 fromPeer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_19193C544;
  v10[3] = &unk_1E5729C50;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(IDSDaemonListener *)self _callHandlersAsyncWithBlock:v10];
}

- (void)continuityDidConnectToPeer:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_19193C660;
  v10[3] = &unk_1E5729C50;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(IDSDaemonListener *)self _callHandlersAsyncWithBlock:v10];
}

- (void)continuityDidDisconnectFromPeer:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_19193C77C;
  v10[3] = &unk_1E5729C50;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(IDSDaemonListener *)self _callHandlersAsyncWithBlock:v10];
}

- (void)deviceIdentifierDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_191A2CBD4();
  }

  if ([v4 isEqualToIgnoringCase:self->_deviceIdentifier])
  {
    id v6 = [MEMORY[0x1E4F6C3B8] warning];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_191A2CB90(v6);
    }
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_19193C958;
    v10[3] = &unk_1E57291B8;
    void v10[4] = self;
    id v7 = v4;
    id v11 = v7;
    [(IDSDaemonListener *)self _performSyncBlock:v10];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_19193C964;
    v8[3] = &unk_1E5729C28;
    id v9 = v7;
    [(IDSDaemonListener *)self _callHandlersAsyncWithBlock:v8];
  }
}

- (_IDSRegistrationAccountManager)registrationAccountManager
{
  return self->_registrationAccountManager;
}

- (void)setRegistrationAccountManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrationAccountManager, 0);
  objc_storeStrong((id *)&self->_latestPrivateLoggingSalt, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_directMessagingMetadata, 0);
  objc_storeStrong((id *)&self->_serviceToActiveDeviceUniqueID, 0);
  objc_storeStrong((id *)&self->_accountToActiveDeviceUniqueID, 0);
  objc_storeStrong((id *)&self->_serviceToRestrictionReason, 0);
  objc_storeStrong((id *)&self->_serviceToMaxMessageSize, 0);
  objc_storeStrong((id *)&self->_serviceToReceivedInvitations, 0);
  objc_storeStrong((id *)&self->_serviceToPendingInvitations, 0);
  objc_storeStrong((id *)&self->_serviceToFamilyDevices, 0);
  objc_storeStrong((id *)&self->_serviceToFamilyInfo, 0);
  objc_storeStrong((id *)&self->_serviceToLinkedDevices, 0);
  objc_storeStrong((id *)&self->_topicToEnabledAccounts, 0);
  objc_storeStrong((id *)&self->_topicToAccountDictionaries, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_ivarQueue, 0);

  objc_storeStrong((id *)&self->_internalQueueController, 0);
}

@end