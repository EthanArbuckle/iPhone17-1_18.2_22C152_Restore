@interface IDSPairedDeviceManager
+ (id)sharedInstance;
- (IDSPairedDeviceManager)init;
- (IDSXPCDaemonController)xpcDaemonController;
- (NSSet)allowedTrafficClassifiers;
- (void)constructRAResponseDictionary:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)deletePairedDevice:(id)a3 withCompletionBlock:(id)a4 queue:(id)a5;
- (void)deliveryStats:(id)a3;
- (void)device:(id)a3 pairingDeleted:(BOOL)a4;
- (void)dropAllMessagesWithoutAnyAllowedClassifier;
- (void)getDeliveryStatsWithCompletionBlock:(id)a3 queue:(id)a4;
- (void)getLocalDeviceInfoWithCompletionBlock:(id)a3 queue:(id)a4;
- (void)getPairedDeviceInfoWithCompletionBlock:(id)a3 queue:(id)a4;
- (void)setAllowedTrafficClassifiers:(id)a3;
- (void)setPairedDeviceInfo:(id)a3;
- (void)setXpcDaemonController:(id)a3;
@end

@implementation IDSPairedDeviceManager

+ (id)sharedInstance
{
  if (qword_1EB2BD848 != -1) {
    dispatch_once(&qword_1EB2BD848, &unk_1EE246488);
  }
  v2 = (void *)qword_1EB2BD808;

  return v2;
}

- (IDSPairedDeviceManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)IDSPairedDeviceManager;
  v2 = [(IDSPairedDeviceManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[IDSXPCDaemonController weakSharedInstance];
    xpcDaemonController = v2->_xpcDaemonController;
    v2->_xpcDaemonController = (IDSXPCDaemonController *)v3;

    v5 = +[IDSDaemonController sharedInstance];
    v6 = [v5 listener];
    [v6 addHandler:v2];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = +[IDSDaemonController sharedInstance];
  v4 = [v3 listener];
  [v4 removeHandler:self];

  v5.receiver = self;
  v5.super_class = (Class)IDSPairedDeviceManager;
  [(IDSPairedDeviceManager *)&v5 dealloc];
}

- (NSSet)allowedTrafficClassifiers
{
  uint64_t v7 = 0;
  objc_super v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_1919186D0;
  v11 = sub_191918588;
  id v12 = 0;
  uint64_t v3 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_19195AF80;
  v6[3] = &unk_1E5728DF8;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performBlock:v6 waitUntilDone:1];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSSet *)v4;
}

- (void)setAllowedTrafficClassifiers:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithSet:v5 copyItems:1];

  uint64_t v7 = +[IDSInternalQueueController sharedInstance];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_19195B070;
  v9[3] = &unk_1E57291B8;
  id v10 = v6;
  v11 = self;
  id v8 = v6;
  [v7 performBlock:v9];
}

- (void)dropAllMessagesWithoutAnyAllowedClassifier
{
  id v2 = +[IDSInternalQueueController sharedInstance];
  [v2 performBlock:&unk_1EE246BE8];
}

- (void)setPairedDeviceInfo:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = +[IDSInternalQueueController sharedInstance];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = sub_19195B2BC;
    v6[3] = &unk_1E5729000;
    uint64_t v7 = v3;
    [v4 performBlock:v6];

    id v5 = v7;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F6C3B8] warning];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_191A2E540();
    }
  }
}

- (void)deletePairedDevice:(id)a3 withCompletionBlock:(id)a4 queue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v8];
  if ([v8 length] || !v11)
  {
    if (!v10)
    {
      id v10 = MEMORY[0x1E4F14428];
      id v13 = MEMORY[0x1E4F14428];
    }
    if (!v9) {
      id v9 = &unk_1EE245DE8;
    }
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = sub_19195B548;
    v21[3] = &unk_1E572A8C8;
    id v10 = v10;
    v22 = v10;
    id v9 = v9;
    id v23 = v9;
    v14 = (void *)MEMORY[0x192FE03B0](v21);
    v15 = [(IDSPairedDeviceManager *)self xpcDaemonController];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = sub_19195B60C;
    v17[3] = &unk_1E572A8F0;
    id v18 = v8;
    id v20 = v14;
    id v19 = v11;
    id v16 = v14;
    [v15 performTask:v17];

    id v12 = v22;
  }
  else
  {
    id v12 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_191A2E5B4();
    }
  }
}

- (void)getLocalDeviceInfoWithCompletionBlock:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = sub_19195B9A4;
    v24[3] = &unk_1E572A8C8;
    v25 = v7;
    id v26 = v6;
    id v9 = (void *)MEMORY[0x192FE03B0](v24);
    id v10 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19190B000, v10, OS_LOG_TYPE_DEFAULT, "Querying local device info from IDSD asynchronously", buf, 2u);
    }

    v11 = [(IDSPairedDeviceManager *)self xpcDaemonController];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = sub_19195BA68;
    v21[3] = &unk_1E572A940;
    id v22 = v9;
    id v12 = v9;
    [v11 performTask:v21];

    id v13 = v25;
  }
  else
  {
    id v13 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_191A2E61C(v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }
}

- (void)getPairedDeviceInfoWithCompletionBlock:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = sub_19195BEC8;
    v24[3] = &unk_1E572A8C8;
    v25 = v7;
    id v26 = v6;
    id v9 = (void *)MEMORY[0x192FE03B0](v24);
    id v10 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19190B000, v10, OS_LOG_TYPE_DEFAULT, "Querying paired device info from IDSD asynchronously", buf, 2u);
    }

    v11 = [(IDSPairedDeviceManager *)self xpcDaemonController];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = sub_19195BF8C;
    v21[3] = &unk_1E572A940;
    id v22 = v9;
    id v12 = v9;
    [v11 performTask:v21];

    id v13 = v25;
  }
  else
  {
    id v13 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_191A2E764(v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }
}

- (void)getDeliveryStatsWithCompletionBlock:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    id v9 = +[IDSInternalQueueController sharedInstance];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_19195C340;
    v11[3] = &unk_1E572A968;
    v11[4] = self;
    id v13 = v6;
    id v12 = v8;
    [v9 performBlock:v11];
  }
  else
  {
    id v10 = [MEMORY[0x1E4F6C3B8] warning];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_191A2E8AC(v10);
    }
  }
}

- (void)device:(id)a3 pairingDeleted:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = @"NO";
    if (v4) {
      id v8 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    id v17 = v6;
    __int16 v18 = 2112;
    uint64_t v19 = v8;
    _os_log_impl(&dword_19190B000, v7, OS_LOG_TYPE_DEFAULT, "Received pairing removed notification from daemon, device: %@, deleted: %@", buf, 0x16u);
  }

  if (self->_deleteCompletion)
  {
    id v9 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19190B000, v9, OS_LOG_TYPE_DEFAULT, "Invoking pairingDelete completion block", buf, 2u);
    }

    id v10 = self->_deleteCompletion;
    v11 = [(IDSDelegateInfo *)v10 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_19195C588;
    block[3] = &unk_1E5729000;
    uint64_t v15 = v10;
    id v12 = v10;
    dispatch_async(v11, block);

    deleteCompletion = self->_deleteCompletion;
    self->_deleteCompletion = 0;
  }
}

- (void)deliveryStats:(id)a3
{
  id v4 = a3;
  deliveryStatsCompletion = self->_deliveryStatsCompletion;
  if (deliveryStatsCompletion)
  {
    id v6 = deliveryStatsCompletion;
    id v7 = [(IDSDelegateInfo *)v6 queue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_19195C6B8;
    v10[3] = &unk_1E57291B8;
    v11 = v6;
    id v12 = v4;
    id v8 = v6;
    dispatch_async(v7, v10);

    id v9 = self->_deliveryStatsCompletion;
    self->_deliveryStatsCompletion = 0;
  }
}

- (void)constructRAResponseDictionary:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IDSPairedDeviceManager *)self xpcDaemonController];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_19195C7E8;
  v11[3] = &unk_1E572A990;
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  [v8 performTask:v11];
}

- (IDSXPCDaemonController)xpcDaemonController
{
  return self->_xpcDaemonController;
}

- (void)setXpcDaemonController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedTrafficClassifiers, 0);
  objc_storeStrong((id *)&self->_xpcDaemonController, 0);
  objc_storeStrong((id *)&self->_deliveryStatsCompletion, 0);
  objc_storeStrong((id *)&self->_pairedCompletion, 0);
  objc_storeStrong((id *)&self->_localCompletion, 0);

  objc_storeStrong((id *)&self->_deleteCompletion, 0);
}

@end