@interface FigCameraViewfinderRemote
+ (id)cameraViewfinder;
+ (id)remoteObjectCallbacksInterface;
+ (void)initialize;
- (FigCameraViewfinderRemote)init;
- (uint64_t)_bringupXPCConnectionAndStartRemoteViewfinderWithOptions:(uint64_t)result;
- (uint64_t)_setupStateMachine;
- (uint64_t)_teardownRemoteViewfinderAndInvalidateXPCConnection;
- (void)_handleServerDeathWithOptions:(int)a3 reconnect:;
- (void)dealloc;
- (void)startWithOptions:(id)a3;
- (void)stop;
- (void)viewfinderSession:(int64_t)a3 didCapturePhotoWithStatus:(int)a4 thumbnailData:(id)a5 timestamp:(id *)a6;
- (void)viewfinderSession:(int64_t)a3 previewStreamDidCloseWithStatus:(int)a4;
- (void)viewfinderSessionDidBegin:(id)a3 withIdentifier:(int64_t)a4 clientAuditTokenData:(id)a5 usesPhotoOutput:(BOOL)a6 usesMovieFileOutput:(BOOL)a7;
- (void)viewfinderSessionDidEnd;
- (void)viewfinderSessionDidFinishMovieRecording:(int64_t)a3;
- (void)viewfinderSessionDidStartMovieRecording:(int64_t)a3;
- (void)viewfinderSessionPreviewStreamDidOpen:(int64_t)a3;
- (void)viewfinderSessionWillBegin:(id)a3 withIdentifier:(int64_t)a4 clientAuditTokenData:(id)a5 usesPhotoOutput:(BOOL)a6 usesMovieFileOutput:(BOOL)a7;
@end

@implementation FigCameraViewfinderRemote

+ (id)cameraViewfinder
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

- (FigCameraViewfinderRemote)init
{
  v4.receiver = self;
  v4.super_class = (Class)FigCameraViewfinderRemote;
  id v2 = [(FigCameraViewfinder *)&v4 init];
  if (v2)
  {
    v2->_weakSessionTable = (NSMapTable *)(id)[MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    v2->_connectionManagementQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.coremedia.cameraviewfinderremote.connectionmanagement", 0);
    -[FigCameraViewfinderRemote _setupStateMachine]((uint64_t)v2);
  }
  return v2;
}

- (uint64_t)_setupStateMachine
{
  if (result)
  {
    uint64_t v1 = result;
    id v2 = [[FigStateMachine alloc] initWithLabel:@"FigCameraViewfinderRemoteStateMachine" stateCount:2 initialState:1 owner:result];
    *(void *)(v1 + 32) = v2;
    [(FigStateMachine *)v2 setLabel:@"Idle" forState:1];
    [*(id *)(v1 + 32) setLabel:@"Running" forState:2];
    v3 = *(void **)(v1 + 32);
    return [v3 setPerformsAtomicStateTransitions:0];
  }
  return result;
}

- (void)startWithOptions:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (+[FigCameraViewfinder clientIsAllowedToUseCameraViewfinder:](FigCameraViewfinder, "clientIsAllowedToUseCameraViewfinder:", v8, FigCaptureGetCurrentProcessAuditToken(v8)))
  {
    connectionManagementQueue = self->_connectionManagementQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __46__FigCameraViewfinderRemote_startWithOptions___block_invoke;
    v7[3] = &unk_1E5C24458;
    v7[4] = self;
    v7[5] = a3;
    fig_dispatch_async_autoreleasepool(connectionManagementQueue, v7);
  }
  else
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (uint64_t)_bringupXPCConnectionAndStartRemoteViewfinderWithOptions:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    objc_super v4 = [[FigNSXPCConnection alloc] initWithMachServiceName:@"com.apple.coremedia.cameraviewfinder" options:4096];
    -[FigNSXPCConnection setRemoteObjectInterface:](v4, "setRemoteObjectInterface:", [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFB6FDE8]);
    -[FigNSXPCConnection setExportedInterface:](v4, "setExportedInterface:", [(id)objc_opt_class() remoteObjectCallbacksInterface]);
    [(FigNSXPCConnection *)v4 setExportedObject:v3];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __86__FigCameraViewfinderRemote__bringupXPCConnectionAndStartRemoteViewfinderWithOptions___block_invoke;
    v7[3] = &unk_1E5C248A0;
    v7[4] = v3;
    v7[5] = v4;
    void v7[6] = a2;
    [(FigNSXPCConnection *)v4 setInvalidationHandler:v7];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __86__FigCameraViewfinderRemote__bringupXPCConnectionAndStartRemoteViewfinderWithOptions___block_invoke_3;
    v6[3] = &unk_1E5C24458;
    v6[4] = v3;
    v6[5] = a2;
    [(FigNSXPCConnection *)v4 setInterruptionHandler:v6];
    *(void *)(v3 + 40) = v4;
    [(FigNSXPCConnection *)v4 resume];
    id v5 = (id)[(FigNSXPCConnection *)v4 remoteObjectProxyWithErrorHandler:&__block_literal_global_22];
    *(void *)(v3 + 56) = v5;
    return [v5 startWithOptions:a2];
  }
  return result;
}

+ (id)remoteObjectCallbacksInterface
{
  id v2 = (void *)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFB16878];
  uint64_t v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFB6FD88];
  [v2 setInterface:v3 forSelector:sel_viewfinderSessionWillBegin_withIdentifier_clientAuditTokenData_usesPhotoOutput_usesMovieFileOutput_ argumentIndex:0 ofReply:0];
  [v2 setInterface:v3 forSelector:sel_viewfinderSessionDidBegin_withIdentifier_clientAuditTokenData_usesPhotoOutput_usesMovieFileOutput_ argumentIndex:0 ofReply:0];
  return v2;
}

uint64_t __46__FigCameraViewfinderRemote_startWithOptions___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 32) transitionToState:2 fromState:1];
  if (result)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return -[FigCameraViewfinderRemote _bringupXPCConnectionAndStartRemoteViewfinderWithOptions:](v3, v4);
  }
  return result;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (void)dealloc
{
  [(FigNSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)FigCameraViewfinderRemote;
  [(FigCameraViewfinder *)&v3 dealloc];
}

- (void)stop
{
  connectionManagementQueue = self->_connectionManagementQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __33__FigCameraViewfinderRemote_stop__block_invoke;
  v3[3] = &unk_1E5C24430;
  v3[4] = self;
  fig_dispatch_async_autoreleasepool(connectionManagementQueue, v3);
}

uint64_t __33__FigCameraViewfinderRemote_stop__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 32) transitionToState:1 fromState:2];
  if (result)
  {
    -[FigCameraViewfinderRemote _teardownRemoteViewfinderAndInvalidateXPCConnection](*(void *)(a1 + 32));
    [*(id *)(*(void *)(a1 + 32) + 40) blockUntilInvalidateHandlerHasBeenCalled];
    uint64_t v3 = *(void *)(a1 + 32);

    *(void *)(v3 + 40) = 0;
    uint64_t v4 = *(void *)(a1 + 32);
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = objc_msgSend(*(id *)(v4 + 24), "objectEnumerator", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * v9++) _clientDisconnectedFromServer];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
    return [*(id *)(a1 + 32) viewfinderSessionDidEnd];
  }
  return result;
}

- (uint64_t)_teardownRemoteViewfinderAndInvalidateXPCConnection
{
  if (result)
  {
    uint64_t v1 = result;
    [*(id *)(result + 56) stop];

    *(void *)(v1 + 56) = 0;
    id v2 = *(void **)(v1 + 40);
    return [v2 invalidate];
  }
  return result;
}

- (void)viewfinderSessionWillBegin:(id)a3 withIdentifier:(int64_t)a4 clientAuditTokenData:(id)a5 usesPhotoOutput:(BOOL)a6 usesMovieFileOutput:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  long long v18 = 0u;
  long long v19 = 0u;
  [a5 getBytes:&v18 length:32];
  long long v12 = [FigCameraViewfinderSessionRemote alloc];
  delegateStorage = self->super._delegateStorage;
  v17[0] = v18;
  v17[1] = v19;
  id v14 = [(FigCameraViewfinderSessionRemote *)v12 _initWithRemoteViewfinderSession:a3 clientAuditToken:v17 usesPhotoOutput:v8 usesMovieFileOutput:v7 delegateStorage:delegateStorage];
  -[NSMapTable setObject:forKey:](self->_weakSessionTable, "setObject:forKey:", v14, [NSNumber numberWithLongLong:a4]);
  uint64_t v15 = self->super._delegateStorage;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __128__FigCameraViewfinderRemote_viewfinderSessionWillBegin_withIdentifier_clientAuditTokenData_usesPhotoOutput_usesMovieFileOutput___block_invoke;
  v16[3] = &unk_1E5C25260;
  v16[4] = self;
  v16[5] = v14;
  [(FigDelegateStorage *)v15 invokeDelegateCallbackWithBlock:v16];
}

uint64_t __128__FigCameraViewfinderRemote_viewfinderSessionWillBegin_withIdentifier_clientAuditTokenData_usesPhotoOutput_usesMovieFileOutput___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setDelegateActiveViewfinderSession:*(void *)(a1 + 40)];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    if (dword_1EB4C5790)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return objc_msgSend(a2, "cameraViewfinder:viewfinderSessionWillBegin:", *(void *)(a1 + 32), *(void *)(a1 + 40), v6, v7);
  }
  return result;
}

- (void)viewfinderSessionDidBegin:(id)a3 withIdentifier:(int64_t)a4 clientAuditTokenData:(id)a5 usesPhotoOutput:(BOOL)a6 usesMovieFileOutput:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v13 = -[NSMapTable objectForKey:](self->_weakSessionTable, "objectForKey:", [NSNumber numberWithLongLong:a4]);
  if (v13)
  {
    id v14 = v13;
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    [a5 getBytes:&v20 length:32];
    uint64_t v15 = [FigCameraViewfinderSessionRemote alloc];
    delegateStorage = self->super._delegateStorage;
    v19[0] = v20;
    v19[1] = v21;
    id v14 = [(FigCameraViewfinderSessionRemote *)v15 _initWithRemoteViewfinderSession:a3 clientAuditToken:v19 usesPhotoOutput:v8 usesMovieFileOutput:v7 delegateStorage:delegateStorage];
    -[NSMapTable setObject:forKey:](self->_weakSessionTable, "setObject:forKey:", v14, [NSNumber numberWithLongLong:a4]);
  }
  v17 = self->super._delegateStorage;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __127__FigCameraViewfinderRemote_viewfinderSessionDidBegin_withIdentifier_clientAuditTokenData_usesPhotoOutput_usesMovieFileOutput___block_invoke;
  v18[3] = &unk_1E5C25260;
  v18[4] = self;
  v18[5] = v14;
  [(FigDelegateStorage *)v17 invokeDelegateCallbackWithBlock:v18];
}

uint64_t __127__FigCameraViewfinderRemote_viewfinderSessionDidBegin_withIdentifier_clientAuditTokenData_usesPhotoOutput_usesMovieFileOutput___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setDelegateActiveViewfinderSession:*(void *)(a1 + 40)];
  if (dword_1EB4C5790)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return objc_msgSend(a2, "cameraViewfinder:viewfinderSessionDidBegin:", *(void *)(a1 + 32), *(void *)(a1 + 40), v6, v7);
}

- (void)viewfinderSessionDidEnd
{
  delegateStorage = self->super._delegateStorage;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__FigCameraViewfinderRemote_viewfinderSessionDidEnd__block_invoke;
  v3[3] = &unk_1E5C25288;
  v3[4] = self;
  [(FigDelegateStorage *)delegateStorage invokeDelegateCallbackWithBlock:v3];
}

void __52__FigCameraViewfinderRemote_viewfinderSessionDidEnd__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = (id)[*(id *)(a1 + 32) delegateActiveViewfinderSession];
  if (v4)
  {
    id v5 = v4;
    [*(id *)(a1 + 32) setDelegateActiveViewfinderSession:0];
    if (dword_1EB4C5790)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(a2, "cameraViewfinder:viewfinderSessionDidEnd:", *(void *)(a1 + 32), v5, v7, v8);
  }
}

- (void)viewfinderSession:(int64_t)a3 didCapturePhotoWithStatus:(int)a4 thumbnailData:(id)a5 timestamp:(id *)a6
{
  id v10 = -[NSMapTable objectForKey:](self->_weakSessionTable, "objectForKey:", [NSNumber numberWithLongLong:a3]);
  if (v10)
  {
    delegateStorage = self->super._delegateStorage;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __97__FigCameraViewfinderRemote_viewfinderSession_didCapturePhotoWithStatus_thumbnailData_timestamp___block_invoke;
    v12[3] = &unk_1E5C252B0;
    int v13 = a4;
    v12[4] = self;
    v12[5] = v10;
    v12[6] = a5;
    long long v14 = *(_OWORD *)&a6->var0;
    int64_t var3 = a6->var3;
    [(FigDelegateStorage *)delegateStorage invokeDelegateCallbackWithBlock:v12];
  }
}

uint64_t __97__FigCameraViewfinderRemote_viewfinderSession_didCapturePhotoWithStatus_thumbnailData_timestamp___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C5790)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v5 = *(unsigned int *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  long long v11 = *(_OWORD *)(a1 + 60);
  uint64_t v12 = *(void *)(a1 + 76);
  return objc_msgSend(a2, "cameraViewfinderSession:didCapturePhotoWithStatus:thumbnailData:timestamp:", v6, v5, v7, &v11, v9, v10);
}

- (void)viewfinderSessionPreviewStreamDidOpen:(int64_t)a3
{
  id v3 = -[NSMapTable objectForKey:](self->_weakSessionTable, "objectForKey:", [NSNumber numberWithLongLong:a3]);
  [v3 _previewStreamDidOpen];
}

- (void)viewfinderSession:(int64_t)a3 previewStreamDidCloseWithStatus:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = -[NSMapTable objectForKey:](self->_weakSessionTable, "objectForKey:", [NSNumber numberWithLongLong:a3]);
  [v5 _previewStreamDidCloseWithStatus:v4];
}

- (void)viewfinderSessionDidStartMovieRecording:(int64_t)a3
{
  id v3 = -[NSMapTable objectForKey:](self->_weakSessionTable, "objectForKey:", [NSNumber numberWithLongLong:a3]);
  [v3 _movieRecordingDidStart];
}

- (void)viewfinderSessionDidFinishMovieRecording:(int64_t)a3
{
  id v3 = -[NSMapTable objectForKey:](self->_weakSessionTable, "objectForKey:", [NSNumber numberWithLongLong:a3]);
  [v3 _movieRecordingDidFinish];
}

void __86__FigCameraViewfinderRemote__bringupXPCConnectionAndStartRemoteViewfinderWithOptions___block_invoke(int8x16_t *a1)
{
  int8x16_t v1 = vextq_s8(a1[2], a1[2], 8uLL);
  id v2 = *(NSObject **)(a1[2].i64[0] + 48);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __86__FigCameraViewfinderRemote__bringupXPCConnectionAndStartRemoteViewfinderWithOptions___block_invoke_2;
  v3[3] = &unk_1E5C248A0;
  int8x16_t v4 = v1;
  uint64_t v5 = a1[3].i64[0];
  fig_dispatch_async_autoreleasepool(v2, v3);
}

void __86__FigCameraViewfinderRemote__bringupXPCConnectionAndStartRemoteViewfinderWithOptions___block_invoke_2(uint64_t a1)
{
  if (([*(id *)(a1 + 32) explicitlyInvalidated] & 1) == 0)
  {
    id v2 = *(id **)(a1 + 40);
    uint64_t v3 = *(void *)(a1 + 48);
    -[FigCameraViewfinderRemote _handleServerDeathWithOptions:reconnect:](v2, v3, 0);
  }
}

- (void)_handleServerDeathWithOptions:(int)a3 reconnect:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v14 = v3;
      LODWORD(v13) = 0;
      FigDebugAssert3();
    }
    if (objc_msgSend(a1[4], "currentState", v13, v14) == 2)
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      uint64_t v7 = (void *)[a1[3] objectEnumerator];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v16;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v16 != v10) {
              objc_enumerationMutation(v7);
            }
            [*(id *)(*((void *)&v15 + 1) + 8 * v11++) _serverDied];
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v9);
      }
      [a1 viewfinderSessionDidEnd];
      if (a3)
      {

        id v12 = (id)[a1[5] remoteObjectProxyWithErrorHandler:&__block_literal_global_121];
        a1[7] = v12;
        [v12 startWithOptions:a2];
      }
      else if ([a1[4] transitionToState:1 fromState:2])
      {
        [a1[7] stop];

        a1[7] = 0;
        [a1[5] invalidate];

        a1[5] = 0;
      }
    }
  }
}

void __86__FigCameraViewfinderRemote__bringupXPCConnectionAndStartRemoteViewfinderWithOptions___block_invoke_3(uint64_t a1)
{
  long long v1 = *(_OWORD *)(a1 + 32);
  id v2 = *(NSObject **)(*(void *)(a1 + 32) + 48);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __86__FigCameraViewfinderRemote__bringupXPCConnectionAndStartRemoteViewfinderWithOptions___block_invoke_4;
  v3[3] = &unk_1E5C24458;
  long long v4 = v1;
  fig_dispatch_async_autoreleasepool(v2, v3);
}

void __86__FigCameraViewfinderRemote__bringupXPCConnectionAndStartRemoteViewfinderWithOptions___block_invoke_4(uint64_t a1)
{
  int v2 = +[FigCameraViewfinder clientIsAllowedToUseCameraViewfinder:](FigCameraViewfinder, "clientIsAllowedToUseCameraViewfinder:", v3, FigCaptureGetCurrentProcessAuditToken(v3));
  -[FigCameraViewfinderRemote _handleServerDeathWithOptions:reconnect:](*(id **)(a1 + 32), *(void *)(a1 + 40), v2);
}

@end