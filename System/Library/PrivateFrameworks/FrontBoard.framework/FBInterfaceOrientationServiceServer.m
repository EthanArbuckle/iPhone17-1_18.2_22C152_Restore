@interface FBInterfaceOrientationServiceServer
- (FBInterfaceOrientationServiceServer)init;
- (id)_prerequisiteMilestones;
- (void)_queue_handleRegisterOrientationInterest:(id)a3 fromClient:(id)a4;
- (void)_queue_handleRequestActiveOrientation:(id)a3 fromClient:(id)a4;
- (void)_queue_updateInterest:(unsigned int)a3 forClient:(id)a4 withMessage:(id)a5;
- (void)noteClientDidConnect:(id)a3 withMessage:(id)a4;
- (void)noteClientDidDisconnect:(id)a3;
- (void)noteDidReceiveMessage:(id)a3 withType:(int64_t)a4 fromClient:(id)a5;
- (void)noteInterfaceOrientationChanged:(int64_t)a3 animationSettings:(id)a4 direction:(int64_t)a5;
@end

@implementation FBInterfaceOrientationServiceServer

- (void)noteDidReceiveMessage:(id)a3 withType:(int64_t)a4 fromClient:(id)a5
{
  id v9 = a3;
  id v8 = a5;
  if (a4 == 1)
  {
    [(FBInterfaceOrientationServiceServer *)self _queue_handleRequestActiveOrientation:v9 fromClient:v8];
  }
  else if (!a4)
  {
    [(FBInterfaceOrientationServiceServer *)self _queue_handleRegisterOrientationInterest:v9 fromClient:v8];
  }
}

- (void)_queue_handleRequestActiveOrientation:(id)a3 fromClient:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __88__FBInterfaceOrientationServiceServer__queue_handleRequestActiveOrientation_fromClient___block_invoke;
  v4[3] = &unk_1E5C497C8;
  v4[4] = self;
  objc_msgSend(a3, "sendReplyMessageWithPacker:", v4, a4);
}

- (void)_queue_handleRegisterOrientationInterest:(id)a3 fromClient:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 payload];
  [(FBInterfaceOrientationServiceServer *)self _queue_updateInterest:xpc_dictionary_get_uint64(v8, (const char *)*MEMORY[0x1E4F626D0]) forClient:v6 withMessage:v7];
}

- (void)noteClientDidConnect:(id)a3 withMessage:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 payload];
  [(FBInterfaceOrientationServiceServer *)self _queue_updateInterest:xpc_dictionary_get_uint64(v8, (const char *)*MEMORY[0x1E4F626D0]) forClient:v7 withMessage:v6];
}

- (void)_queue_updateInterest:(unsigned int)a3 forClient:(id)a4 withMessage:(id)a5
{
  id v10 = a4;
  id v8 = a5;
  interestedClients = self->_interestedClients;
  if (a3)
  {
    [(NSMutableSet *)interestedClients addObject:v10];
    if (a3 == 1) { {
      [(FBInterfaceOrientationServiceServer *)self _queue_handleRequestActiveOrientation:v8 fromClient:v10];
    }
    }
  }
  else
  {
    [(NSMutableSet *)interestedClients removeObject:v10];
  }
}

- (id)_prerequisiteMilestones
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F62748]];
}

void __88__FBInterfaceOrientationServiceServer__queue_handleRequestActiveOrientation_fromClient___block_invoke(uint64_t a1, void *a2)
{
  v3 = (const char *)*MEMORY[0x1E4F626E8];
  int64_t v4 = *(void *)(*(void *)(a1 + 32) + 72);
  xpc_object_t xdict = a2;
  xpc_dictionary_set_int64(xdict, v3, v4);
  xpc_dictionary_set_uint64(xdict, (const char *)*MEMORY[0x1E4F626E0], *(void *)(*(void *)(a1 + 32) + 80));
}

- (FBInterfaceOrientationServiceServer)init
{
  v3 = [MEMORY[0x1E4F62820] serial];
  int64_t v4 = [v3 serviceClass:25];
  v5 = (void *)BSDispatchQueueCreate();

  id v6 = [MEMORY[0x1E4F62AC8] _queueWithSerialDispatchQueue:v5];
  uint64_t v7 = *MEMORY[0x1E4F626F0];
  v13.receiver = self;
  v13.super_class = (Class)FBInterfaceOrientationServiceServer;
  id v8 = [(FBSServiceFacility *)&v13 initWithIdentifier:v7 queue:v6];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_queue, v5);
    id v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    interestedClients = v9->_interestedClients;
    v9->_interestedClients = v10;

    v9->_interfaceOrientation = 0;
    v9->_sequenceNumber = 0;
  }

  return v9;
}

- (void)noteInterfaceOrientationChanged:(int64_t)a3 animationSettings:(id)a4 direction:(int64_t)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  [v8 duration];
  id v10 = v9;
  v11 = FBLogInterfaceOrientationObserver();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = BSInterfaceOrientationDescription();
    objc_super v13 = BSInterfaceOrientationDescription();
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2048;
    v30 = v10;
    _os_log_impl(&dword_1A62FC000, v11, OS_LOG_TYPE_DEFAULT, "Received active interface orientation did change from %{public}@ to %{public}@ with duration %.1f", buf, 0x20u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v30 = __Block_byref_object_copy__0;
  v31 = __Block_byref_object_dispose__0;
  id v32 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __99__FBInterfaceOrientationServiceServer_noteInterfaceOrientationChanged_animationSettings_direction___block_invoke;
  block[3] = &unk_1E5C499C8;
  block[4] = self;
  block[5] = buf;
  block[6] = &v21;
  block[7] = a3;
  dispatch_sync(queue, block);
  if ([*(id *)(*(void *)&buf[8] + 40) count])
  {
    v15 = FBLogInterfaceOrientationObserver();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = BSInterfaceOrientationDescription();
      uint64_t v17 = v22[3];
      *(_DWORD *)v25 = 138543618;
      v26 = v16;
      __int16 v27 = 2048;
      uint64_t v28 = v17;
      _os_log_impl(&dword_1A62FC000, v15, OS_LOG_TYPE_DEFAULT, "Broadcasting active interface orientation (%{public}@) change to registered clients with sequence #: %lu.", v25, 0x16u);
    }
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __99__FBInterfaceOrientationServiceServer_noteInterfaceOrientationChanged_animationSettings_direction___block_invoke_5;
    v19[3] = &unk_1E5C499F0;
    v19[6] = v10;
    v19[7] = a5;
    v19[4] = &v21;
    v19[5] = a3;
    v18 = [MEMORY[0x1E4F62B40] messageWithPacker:v19];
    [(FBSServiceFacility *)self sendMessage:v18 withType:0 toClients:*(void *)(*(void *)&buf[8] + 40)];
  }
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(buf, 8);
}

void __99__FBInterfaceOrientationServiceServer_noteInterfaceOrientationChanged_animationSettings_direction___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  if (*(void *)(v2 + 72) != a1[7])
  {
    ++*(void *)(v2 + 80);
    *(void *)(a1[4] + 72) = a1[7];
    uint64_t v3 = [*(id *)(a1[4] + 64) copy];
    uint64_t v4 = *(void *)(a1[5] + 8);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    uint64_t v2 = a1[4];
  }
  *(void *)(*(void *)(a1[6] + 8) + 24) = *(void *)(v2 + 80);
}

void __99__FBInterfaceOrientationServiceServer_noteInterfaceOrientationChanged_animationSettings_direction___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v3 = (const char *)*MEMORY[0x1E4F626E8];
  int64_t v4 = *(void *)(a1 + 40);
  xpc_object_t xdict = a2;
  xpc_dictionary_set_int64(xdict, v3, v4);
  xpc_dictionary_set_double(xdict, (const char *)*MEMORY[0x1E4F626C8], *(double *)(a1 + 48));
  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E4F626D8], *(void *)(a1 + 56));
  xpc_dictionary_set_uint64(xdict, (const char *)*MEMORY[0x1E4F626E0], *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
}

- (void)noteClientDidDisconnect:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end