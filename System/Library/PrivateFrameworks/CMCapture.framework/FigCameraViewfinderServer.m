@interface FigCameraViewfinderServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (FigCameraViewfinderServer)init;
- (id)osStatePropertyList;
- (uint64_t)_remoteViewfinderForLocalViewfinder:(uint64_t)a1;
- (void)cameraViewfinder:(id)a3 viewfinderSessionDidBegin:(id)a4;
- (void)cameraViewfinder:(id)a3 viewfinderSessionDidEnd:(id)a4;
- (void)cameraViewfinder:(id)a3 viewfinderSessionWillBegin:(id)a4;
- (void)cameraViewfinderSession:(id)a3 didCapturePhotoWithStatus:(int)a4 thumbnailData:(id)a5 timestamp:(id *)a6;
- (void)cameraViewfinderSession:(id)a3 previewStreamDidCloseWithStatus:(int)a4;
- (void)cameraViewfinderSessionDidFinishMovieRecording:(id)a3;
- (void)cameraViewfinderSessionDidStartMovieRecording:(id)a3;
- (void)cameraViewfinderSessionPreviewStreamDidOpen:(id)a3;
- (void)dealloc;
@end

@implementation FigCameraViewfinderServer

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a4) {
    [a4 auditToken];
  }
  else {
    memset(v18, 0, sizeof(v18));
  }
  BOOL v6 = +[FigCameraViewfinder clientIsAllowedToUseCameraViewfinder:v18];
  if (v6)
  {
    if (dword_1EB4C5170)
    {
      int v17 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(a4, "setExportedInterface:", objc_msgSend(MEMORY[0x1E4F29280], "interfaceWithProtocol:", &unk_1EFB6FDE8, v12, v13));
    id v8 = +[FigCameraViewfinderLocal cameraViewfinder];
    callbackQueue = self->_callbackQueue;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __64__FigCameraViewfinderServer_listener_shouldAcceptNewConnection___block_invoke;
    v15[3] = &unk_1E5C24458;
    v15[4] = self;
    v15[5] = a4;
    fig_dispatch_async_autoreleasepool(callbackQueue, v15);
    [v8 setDelegate:self queue:self->_callbackQueue];
    [a4 setExportedObject:v8];
    objc_msgSend(a4, "setRemoteObjectInterface:", +[FigCameraViewfinderRemote remoteObjectCallbacksInterface](FigCameraViewfinderRemote, "remoteObjectCallbacksInterface"));
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __64__FigCameraViewfinderServer_listener_shouldAcceptNewConnection___block_invoke_2;
    v14[3] = &unk_1E5C248A0;
    v14[4] = v8;
    v14[5] = self;
    v14[6] = a4;
    [a4 setInvalidationHandler:v14];
    [a4 setInterruptionHandler:&__block_literal_global_70];
    [a4 resume];
  }
  else
  {
    v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v6;
}

- (void)cameraViewfinder:(id)a3 viewfinderSessionWillBegin:(id)a4
{
  long long v7 = 0u;
  long long v8 = 0u;
  if (a4) {
    objc_msgSend(a4, "clientAuditToken", v7, v8);
  }
  objc_msgSend((id)-[FigCameraViewfinderServer _remoteViewfinderForLocalViewfinder:]((uint64_t)self, (uint64_t)a3), "viewfinderSessionWillBegin:withIdentifier:clientAuditTokenData:usesPhotoOutput:usesMovieFileOutput:", a4, objc_msgSend(a4, "identifier"), objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", &v7, 32), objc_msgSend(a4, "usesPhotoOutput"), objc_msgSend(a4, "usesMovieFileOutput"));
}

- (void)cameraViewfinder:(id)a3 viewfinderSessionDidBegin:(id)a4
{
  long long v7 = 0u;
  long long v8 = 0u;
  if (a4) {
    objc_msgSend(a4, "clientAuditToken", v7, v8);
  }
  objc_msgSend((id)-[FigCameraViewfinderServer _remoteViewfinderForLocalViewfinder:]((uint64_t)self, (uint64_t)a3), "viewfinderSessionDidBegin:withIdentifier:clientAuditTokenData:usesPhotoOutput:usesMovieFileOutput:", a4, objc_msgSend(a4, "identifier"), objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", &v7, 32), objc_msgSend(a4, "usesPhotoOutput"), objc_msgSend(a4, "usesMovieFileOutput"));
}

- (uint64_t)_remoteViewfinderForLocalViewfinder:(uint64_t)a1
{
  uint64_t result = 0;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a1 && a2)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v5 = *(void **)(a1 + 16);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v10, "exportedObject"), "isEqual:", a2)) {
            return [v10 remoteObjectProxy];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v11 = *(void **)(a1 + 16);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v15 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v16;
      while (1)
      {
        if (*(void *)v16 != v14) {
          objc_enumerationMutation(v11);
        }
        if (!--v13)
        {
          uint64_t v13 = [v11 countByEnumeratingWithState:&v15 objects:v23 count:16];
          if (!v13) {
            break;
          }
        }
      }
    }
    FigLogBacktrace();
    return 0;
  }
  return result;
}

uint64_t __64__FigCameraViewfinderServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
}

- (FigCameraViewfinderServer)init
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)FigCameraViewfinderServer;
  v2 = [(FigCameraViewfinderServer *)&v6 init];
  if (v2)
  {
    v3 = (NSXPCListener *)[objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.coremedia.cameraviewfinder"];
    [(NSXPCListener *)v3 setDelegate:v2];
    v2->_serviceListener = v3;
    v2->_connections = (NSMutableArray *)objc_opt_new();
    v2->_callbackQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.coremedia.cameraviewfinder.server.callbacks", 0);
    v2->_osStateHandle = [[FigCaptureOSStateHandle alloc] initWithTitle:@"FigCameraViewfinderServer" queue:v2->_callbackQueue dataProvider:v2];
    [(NSXPCListener *)v2->_serviceListener resume];
    if (dword_1EB4C5170)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCameraViewfinderServer;
  [(FigCameraViewfinderServer *)&v3 dealloc];
}

void __64__FigCameraViewfinderServer_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setDelegate:0 queue:0];
  [*(id *)(a1 + 32) stop];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  long long v2 = *(_OWORD *)(a1 + 40);
  objc_super v3 = *(NSObject **)(*(void *)(a1 + 40) + 24);
  v4[2] = __64__FigCameraViewfinderServer_listener_shouldAcceptNewConnection___block_invoke_3;
  v4[3] = &unk_1E5C24458;
  long long v5 = v2;
  fig_dispatch_async_autoreleasepool(v3, v4);
}

uint64_t __64__FigCameraViewfinderServer_listener_shouldAcceptNewConnection___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
}

- (void)cameraViewfinder:(id)a3 viewfinderSessionDidEnd:(id)a4
{
  v4 = (void *)-[FigCameraViewfinderServer _remoteViewfinderForLocalViewfinder:]((uint64_t)self, (uint64_t)a3);
  [v4 viewfinderSessionDidEnd];
}

- (void)cameraViewfinderSession:(id)a3 didCapturePhotoWithStatus:(int)a4 thumbnailData:(id)a5 timestamp:(id *)a6
{
  uint64_t v8 = *(void *)&a4;
  v10 = (void *)-[FigCameraViewfinderServer _remoteViewfinderForLocalViewfinder:]((uint64_t)self, [a3 viewfinder]);
  uint64_t v11 = [a3 identifier];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = *a6;
  [v10 viewfinderSession:v11 didCapturePhotoWithStatus:v8 thumbnailData:a5 timestamp:&v12];
}

- (void)cameraViewfinderSessionPreviewStreamDidOpen:(id)a3
{
  v4 = (void *)-[FigCameraViewfinderServer _remoteViewfinderForLocalViewfinder:]((uint64_t)self, [a3 viewfinder]);
  uint64_t v5 = [a3 identifier];
  [v4 viewfinderSessionPreviewStreamDidOpen:v5];
}

- (void)cameraViewfinderSession:(id)a3 previewStreamDidCloseWithStatus:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  objc_super v6 = (void *)-[FigCameraViewfinderServer _remoteViewfinderForLocalViewfinder:]((uint64_t)self, [a3 viewfinder]);
  uint64_t v7 = [a3 identifier];
  [v6 viewfinderSession:v7 previewStreamDidCloseWithStatus:v4];
}

- (void)cameraViewfinderSessionDidStartMovieRecording:(id)a3
{
  uint64_t v4 = (void *)-[FigCameraViewfinderServer _remoteViewfinderForLocalViewfinder:]((uint64_t)self, [a3 viewfinder]);
  uint64_t v5 = [a3 identifier];
  [v4 viewfinderSessionDidStartMovieRecording:v5];
}

- (void)cameraViewfinderSessionDidFinishMovieRecording:(id)a3
{
  uint64_t v4 = (void *)-[FigCameraViewfinderServer _remoteViewfinderForLocalViewfinder:]((uint64_t)self, [a3 viewfinder]);
  uint64_t v5 = [a3 identifier];
  [v4 viewfinderSessionDidFinishMovieRecording:v5];
}

- (id)osStatePropertyList
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  objc_super v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSMutableArray count](self->_connections, "count"));
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  connections = self->_connections;
  uint64_t v5 = [(NSMutableArray *)connections countByEnumeratingWithState:&v10 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(connections);
        }
        objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8++), "description"));
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)connections countByEnumeratingWithState:&v10 objects:v16 count:16];
    }
    while (v6);
  }
  uint64_t v14 = @"connections";
  long long v15 = v3;
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
}

@end