@interface IDSOffGridStateManager
- (IDSOffGridStateManager)initWithQueue:(id)a3 error:(id *)a4;
- (IDSOffGridStateManagerDelegate)delegate;
- (IDSXPCDaemonController)daemonController;
- (IDSXPCDaemonController)daemonController_sync;
- (NSMutableSet)invitedHandles;
- (NSString)uuid;
- (OS_dispatch_queue)queue;
- (int64_t)offGridMode;
- (int64_t)offGridState;
- (int64_t)offGridStatus;
- (int64_t)publishStatus;
- (void)_daemonControllerSetup;
- (void)_setupInterruptionHandler;
- (void)_setupXPC;
- (void)connectStewieWithCompletion:(id)a3;
- (void)contactInfoUpdated:(id)a3;
- (void)disconnectStewieWithCompletion:(id)a3;
- (void)fetchContactsOfType:(int64_t)a3 completion:(id)a4;
- (void)fetchStewieAvailabilityWithCompletion:(id)a3;
- (void)inviteHandles:(id)a3 fromSenderHandle:(id)a4 withDictionaryPayload:(id)a5 completion:(id)a6;
- (void)invitedHandlesWithCompletion:(id)a3;
- (void)offGridModeUpdated:(int64_t)a3 publishStatus:(int64_t)a4 error:(id)a5;
- (void)removeAllInvitedHandlesWithCompletion:(id)a3;
- (void)removeInvitedHandles:(id)a3 completion:(id)a4;
- (void)setDaemonController:(id)a3;
- (void)setDaemonController_sync:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInvitedHandles:(id)a3;
- (void)setOffGridMode:(int64_t)a3 options:(id)a4 completion:(id)a5;
- (void)setOffGridStatus:(int64_t)a3 options:(id)a4 completion:(id)a5;
- (void)setQueue:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation IDSOffGridStateManager

- (IDSOffGridStateManager)initWithQueue:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (v7)
  {
    v18.receiver = self;
    v18.super_class = (Class)IDSOffGridStateManager;
    v8 = [(IDSOffGridStateManager *)&v18 init];
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_queue, a3);
      uint64_t v10 = [NSString stringGUID];
      uuid = v9->_uuid;
      v9->_uuid = (NSString *)v10;

      v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      invitedHandles = v9->_invitedHandles;
      v9->_invitedHandles = v12;

      [(IDSOffGridStateManager *)v9 _daemonControllerSetup];
    }
    self = v9;
    v14 = self;
  }
  else
  {
    id v15 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    v16 = objc_msgSend(v15, "initWithObjectsAndKeys:", @"The queue specified is nil.", *MEMORY[0x1E4F28568], 0);
    *a4 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"IDSOffGridStatusErrorDomain" code:3 userInfo:v16];

    v14 = 0;
  }

  return v14;
}

- (void)_daemonControllerSetup
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v2 = +[IDSInternalQueueController sharedInstance];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_19195CBA4;
  v3[3] = &unk_1E57295B8;
  objc_copyWeak(&v4, &location);
  [v2 performBlock:v3];

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)_setupInterruptionHandler
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  daemonController = self->_daemonController;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_19195CCF4;
  v4[3] = &unk_1E57295B8;
  objc_copyWeak(&v5, &location);
  [(IDSXPCDaemonController *)daemonController addInterruptionHandler:v4 forTarget:self];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_setupXPC
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F6B460] IDSOffGridStateManager];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(IDSOffGridStateManager *)self uuid];
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v4;
    _os_log_impl(&dword_19190B000, v3, OS_LOG_TYPE_DEFAULT, "Setting up xpc for client %@", buf, 0xCu);
  }
  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  daemonController = self->_daemonController;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_19195CF44;
  v6[3] = &unk_1E5729858;
  objc_copyWeak(&v7, (id *)buf);
  [(IDSXPCDaemonController *)daemonController performTask:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)offGridStatus
{
  return MEMORY[0x1F4181798](self, sel_offGridMode);
}

- (int64_t)offGridState
{
  return MEMORY[0x1F4181798](self, sel_publishStatus);
}

- (int64_t)offGridMode
{
  daemonController_sync = self->_daemonController_sync;
  if (!daemonController_sync)
  {
    id v4 = [IDSXPCDaemonController alloc];
    id v5 = +[IDSInternalQueueController sharedInstance];
    v6 = [v5 queue];
    id v7 = [(IDSXPCDaemonController *)v4 initSyncControllerWithQueue:v6];
    v8 = self->_daemonController_sync;
    self->_daemonController_sync = v7;

    daemonController_sync = self->_daemonController_sync;
  }
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  objc_super v18 = sub_1919186E0;
  v19 = sub_191918590;
  id v20 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_19195D250;
  v14[3] = &unk_1E572A9D8;
  v14[4] = &v15;
  uint64_t v9 = [(IDSXPCDaemonController *)daemonController_sync offGridStateManagerCollaboratorWithErrorHandler:v14];
  uint64_t v10 = v9;
  if (!v16[5])
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_19195D2C8;
    v13[3] = &unk_1E572AA00;
    v13[4] = &v21;
    [v9 fetchCurrentOffGridMode:v13];
  }
  int64_t v11 = v22[3];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
  return v11;
}

- (int64_t)publishStatus
{
  daemonController_sync = self->_daemonController_sync;
  if (!daemonController_sync)
  {
    id v4 = [IDSXPCDaemonController alloc];
    id v5 = +[IDSInternalQueueController sharedInstance];
    v6 = [v5 queue];
    id v7 = [(IDSXPCDaemonController *)v4 initSyncControllerWithQueue:v6];
    v8 = self->_daemonController_sync;
    self->_daemonController_sync = v7;

    daemonController_sync = self->_daemonController_sync;
  }
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 2;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  objc_super v18 = sub_1919186E0;
  v19 = sub_191918590;
  id v20 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_19195D53C;
  v14[3] = &unk_1E572A9D8;
  v14[4] = &v15;
  uint64_t v9 = [(IDSXPCDaemonController *)daemonController_sync offGridStateManagerCollaboratorWithErrorHandler:v14];
  uint64_t v10 = v9;
  if (!v16[5])
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_19195D5B4;
    v13[3] = &unk_1E572AA00;
    v13[4] = &v21;
    [v9 fetchCurrentPublishStatus:v13];
  }
  int64_t v11 = v22[3];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
  return v11;
}

- (void)setOffGridStatus:(int64_t)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_19195D6E0;
  v10[3] = &unk_1E572AA28;
  id v11 = v8;
  id v9 = v8;
  [(IDSOffGridStateManager *)self setOffGridMode:a3 options:a4 completion:v10];
}

- (void)setOffGridMode:(int64_t)a3 options:(id)a4 completion:(id)a5
{
  id v8 = (IDSOffGridModeOptions *)a4;
  id v9 = a5;
  if (!v8) {
    id v8 = objc_alloc_init(IDSOffGridModeOptions);
  }
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  uint64_t v10 = +[IDSInternalQueueController sharedInstance];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_19195D84C;
  v13[3] = &unk_1E572AAC8;
  objc_copyWeak(v16, &location);
  id v11 = v9;
  id v15 = v11;
  v13[4] = self;
  v16[1] = (id)a3;
  v12 = v8;
  v14 = v12;
  [v10 performBlock:v13];

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

- (NSMutableSet)invitedHandles
{
  if (!self->_daemonController_sync)
  {
    v3 = [IDSXPCDaemonController alloc];
    id v4 = +[IDSInternalQueueController sharedInstance];
    id v5 = [v4 queue];
    v6 = [(IDSXPCDaemonController *)v3 initSyncControllerWithQueue:v5];
    daemonController_sync = self->_daemonController_sync;
    self->_daemonController_sync = v6;
  }
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = sub_1919186E0;
  v25 = sub_191918590;
  id v26 = (id)0xAAAAAAAAAAAAAAAALL;
  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  objc_super v18 = sub_1919186E0;
  v19 = sub_191918590;
  id v20 = 0;
  id v8 = self->_daemonController_sync;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_19195DF08;
  v14[3] = &unk_1E572A9D8;
  v14[4] = &v15;
  id v9 = [(IDSXPCDaemonController *)v8 offGridStateManagerCollaboratorWithErrorHandler:v14];
  uint64_t v10 = v9;
  if (!v16[5])
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_19195DF80;
    v13[3] = &unk_1E572AAF0;
    v13[4] = &v21;
    [v9 invitedHandlesWithCompletion:v13];
  }
  id v11 = (id)v22[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return (NSMutableSet *)v11;
}

- (void)invitedHandlesWithCompletion:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = sub_1919186E0;
  v11[4] = sub_191918590;
  id v12 = (id)0xAAAAAAAAAAAAAAAALL;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v5 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_19195E16C;
  v7[3] = &unk_1E572ABB8;
  objc_copyWeak(&v10, &location);
  id v6 = v4;
  v7[4] = self;
  id v8 = v6;
  id v9 = v11;
  [v5 performBlock:v7];

  objc_destroyWeak(&v10);
  _Block_object_dispose(v11, 8);

  objc_destroyWeak(&location);
}

- (void)inviteHandles:(id)a3 fromSenderHandle:(id)a4 withDictionaryPayload:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v14 = +[IDSInternalQueueController sharedInstance];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_19195E7A8;
  v19[3] = &unk_1E572AC58;
  objc_copyWeak(&v24, &location);
  id v15 = v13;
  id v23 = v15;
  v19[4] = self;
  id v16 = v11;
  id v20 = v16;
  id v17 = v12;
  id v21 = v17;
  id v18 = v10;
  id v22 = v18;
  [v14 performBlock:v19];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

- (void)removeInvitedHandles:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v8 = +[IDSInternalQueueController sharedInstance];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_19195EEBC;
  v11[3] = &unk_1E572AC80;
  objc_copyWeak(&v14, &location);
  id v9 = v7;
  id v13 = v9;
  v11[4] = self;
  id v10 = v6;
  id v12 = v10;
  [v8 performBlock:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)removeAllInvitedHandlesWithCompletion:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v5 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_19195F4A8;
  v7[3] = &unk_1E572ACA8;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  v7[4] = self;
  id v8 = v6;
  [v5 performBlock:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)fetchContactsOfType:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v7 = +[IDSInternalQueueController sharedInstance];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_19195FA78;
  v9[3] = &unk_1E572ACF8;
  objc_copyWeak(v11, &location);
  id v8 = v6;
  v9[4] = self;
  id v10 = v8;
  v11[1] = (id)a3;
  [v7 performBlock:v9];

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

- (void)fetchStewieAvailabilityWithCompletion:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v5 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_19195FFF8;
  v7[3] = &unk_1E572ACA8;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  v7[4] = self;
  id v8 = v6;
  [v5 performBlock:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)connectStewieWithCompletion:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v5 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1919604B8;
  v7[3] = &unk_1E572ACA8;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  v7[4] = self;
  id v8 = v6;
  [v5 performBlock:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)disconnectStewieWithCompletion:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v5 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_191960954;
  v7[3] = &unk_1E572ACA8;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  v7[4] = self;
  id v8 = v6;
  [v5 performBlock:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)offGridModeUpdated:(int64_t)a3 publishStatus:(int64_t)a4 error:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = objc_alloc_init(IDSOffGridModeContext);
  [(IDSOffGridModeContext *)v9 setError:v8];

  id v10 = [MEMORY[0x1E4F6B460] IDSOffGridStateManager];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    int64_t v30 = a3;
    __int16 v31 = 2048;
    int64_t v32 = a4;
    __int16 v33 = 2112;
    v34 = v9;
    _os_log_impl(&dword_19190B000, v10, OS_LOG_TYPE_DEFAULT, "offGridModeStatusUpdated to: %ld PublishStatus: %ld context: %@", buf, 0x20u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v12 = WeakRetained;
    id v13 = objc_loadWeakRetained((id *)&self->_delegate);
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      queue = self->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_191960F48;
      block[3] = &unk_1E572AD70;
      block[4] = self;
      int64_t v27 = a3;
      int64_t v28 = a4;
      id v26 = v9;
      dispatch_async(queue, block);
    }
  }
  id v16 = objc_loadWeakRetained((id *)&self->_delegate);
  if (v16)
  {
    id v17 = v16;
    id v18 = objc_loadWeakRetained((id *)&self->_delegate);
    char v19 = objc_opt_respondsToSelector();

    if (v19)
    {
      id v20 = self->_queue;
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = sub_191960FA0;
      v21[3] = &unk_1E572AD70;
      v21[4] = self;
      int64_t v23 = a3;
      int64_t v24 = a4;
      id v22 = v9;
      dispatch_async(v20, v21);
    }
  }
}

- (void)contactInfoUpdated:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      queue = self->_queue;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = sub_1919610DC;
      v10[3] = &unk_1E57291B8;
      id v11 = v4;
      id v12 = self;
      dispatch_async(queue, v10);
    }
  }
}

- (void)setInvitedHandles:(id)a3
{
}

- (IDSXPCDaemonController)daemonController
{
  return self->_daemonController;
}

- (void)setDaemonController:(id)a3
{
}

- (IDSXPCDaemonController)daemonController_sync
{
  return self->_daemonController_sync;
}

- (void)setDaemonController_sync:(id)a3
{
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (IDSOffGridStateManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IDSOffGridStateManagerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_daemonController_sync, 0);
  objc_storeStrong((id *)&self->_daemonController, 0);

  objc_storeStrong((id *)&self->_invitedHandles, 0);
}

@end