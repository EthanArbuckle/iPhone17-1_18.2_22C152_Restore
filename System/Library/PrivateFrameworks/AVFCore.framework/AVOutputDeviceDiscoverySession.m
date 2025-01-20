@interface AVOutputDeviceDiscoverySession
+ (id)outputDeviceDiscoverySessionFactory;
+ (void)initialize;
- (AVAudioSession)targetAudioSession;
- (AVOutputDeviceDiscoverySession)init;
- (AVOutputDeviceDiscoverySession)initWithDeviceFeatures:(unint64_t)a3;
- (AVOutputDeviceDiscoverySession)initWithOutputDeviceDiscoverySessionImpl:(id)a3;
- (AVOutputDeviceDiscoverySessionAvailableOutputDevices)availableOutputDevicesObject;
- (BOOL)devicePresenceDetected;
- (BOOL)onlyDiscoversBluetoothDevices;
- (NSArray)availableOutputDevices;
- (OpaqueFigRouteDiscoverer)routeDiscoverer;
- (id)impl;
- (int64_t)discoveryMode;
- (void)dealloc;
- (void)outputDeviceDiscoverySessionImpl:(id)a3 didExpireWithReplacement:(id)a4;
- (void)outputDeviceDiscoverySessionImplDidChangeAvailableOutputDeviceGroups:(id)a3;
- (void)outputDeviceDiscoverySessionImplDidChangeAvailableOutputDevices:(id)a3;
- (void)setDiscoveryMode:(int64_t)a3;
- (void)setDiscoveryMode:(int64_t)a3 forClientIdentifiers:(id)a4;
- (void)setOnlyDiscoversBluetoothDevices:(BOOL)a3;
- (void)setTargetAudioSession:(id)a3;
@end

@implementation AVOutputDeviceDiscoverySession

uint64_t __56__AVOutputDeviceDiscoverySession_availableOutputDevices__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = (void *)[a2 name];
  uint64_t v5 = [a3 name];
  return [v4 localizedStandardCompare:v5];
}

- (AVAudioSession)targetAudioSession
{
  id v2 = [(AVOutputDeviceDiscoverySession *)self impl];
  return (AVAudioSession *)[v2 targetAudioSession];
}

- (void)setDiscoveryMode:(int64_t)a3 forClientIdentifiers:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (dword_1EB2D39E0)
  {
    int v11 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  ivarAccessQueue = self->_outputDeviceDiscoverySession->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__AVOutputDeviceDiscoverySession_setDiscoveryMode_forClientIdentifiers___block_invoke;
  block[3] = &unk_1E57B2228;
  block[4] = self;
  block[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  objc_msgSend(-[AVOutputDeviceDiscoverySession impl](self, "impl"), "outputDeviceDiscoverySessionDidChangeDiscoveryMode:forClientIdentifiers:", self, a4);
}

- (int64_t)discoveryMode
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  ivarAccessQueue = self->_outputDeviceDiscoverySession->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__AVOutputDeviceDiscoverySession_discoveryMode__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSArray)availableOutputDevices
{
  int64_t v3 = (NSArray *)[MEMORY[0x1E4F1CA48] array];
  v4 = [(AVOutputDeviceDiscoverySession *)self availableOutputDevicesObject];
  if (v4)
  {
    uint64_t v5 = v4;
    [(NSArray *)v3 addObjectsFromArray:[(AVOutputDeviceDiscoverySessionAvailableOutputDevices *)v4 recentlyUsedDevices]];
    [(NSArray *)v3 addObjectsFromArray:[(AVOutputDeviceDiscoverySessionAvailableOutputDevices *)v5 otherDevices]];
    [(NSArray *)v3 sortUsingComparator:&__block_literal_global_7];
  }
  return v3;
}

- (AVOutputDeviceDiscoverySessionAvailableOutputDevices)availableOutputDevicesObject
{
  id v2 = [(AVOutputDeviceDiscoverySession *)self impl];
  return (AVOutputDeviceDiscoverySessionAvailableOutputDevices *)[v2 availableOutputDevicesObject];
}

- (id)impl
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  int v11 = __Block_byref_object_copy__8;
  uint64_t v12 = __Block_byref_object_dispose__8;
  uint64_t v13 = 0;
  ivarAccessQueue = self->_outputDeviceDiscoverySession->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__AVOutputDeviceDiscoverySession_impl__block_invoke;
  block[3] = &unk_1E57B2110;
  block[4] = self;
  block[5] = &v8;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  int64_t v3 = (void *)v9[5];
  if (!v3)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    int64_t v3 = (void *)v9[5];
  }
  id v5 = v3;
  _Block_object_dispose(&v8, 8);
  return v5;
}

id __38__AVOutputDeviceDiscoverySession_impl__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 16);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __72__AVOutputDeviceDiscoverySession_setDiscoveryMode_forClientIdentifiers___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(void *)(result + 40);
  return result;
}

uint64_t __47__AVOutputDeviceDiscoverySession_discoveryMode__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(*(void *)(result + 32)
                                                                                          + 8)
                                                                              + 24);
  return result;
}

- (AVOutputDeviceDiscoverySession)initWithDeviceFeatures:(unint64_t)a3
{
  id v5 = (void *)[(id)objc_opt_class() outputDeviceDiscoverySessionFactory];
  uint64_t v6 = objc_opt_class();

  v7 = (void *)[v5 outputDeviceDiscoverySessionOfClass:v6 withDeviceFeatures:a3];
  return (AVOutputDeviceDiscoverySession *)v7;
}

- (void)dealloc
{
  outputDeviceDiscoverySession = self->_outputDeviceDiscoverySession;
  if (outputDeviceDiscoverySession)
  {

    outputDeviceDiscoverySession = self->_outputDeviceDiscoverySession;
    ivarAccessQueue = outputDeviceDiscoverySession->ivarAccessQueue;
    if (ivarAccessQueue)
    {
      dispatch_release(ivarAccessQueue);
      outputDeviceDiscoverySession = self->_outputDeviceDiscoverySession;
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)AVOutputDeviceDiscoverySession;
  [(AVOutputDeviceDiscoverySession *)&v5 dealloc];
}

- (AVOutputDeviceDiscoverySession)initWithOutputDeviceDiscoverySessionImpl:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AVOutputDeviceDiscoverySession;
  v4 = [(AVOutputDeviceDiscoverySession *)&v9 init];
  if (v4
    && (objc_super v5 = objc_alloc_init(AVOutputDeviceDiscoverySessionInternal),
        (v4->_outputDeviceDiscoverySession = v5) != 0)
    && (v4->_outputDeviceDiscoverySession->ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avfoundation.avodds.ivars"), v4->_outputDeviceDiscoverySession->discoveryMode = 0, v4->_outputDeviceDiscoverySession->impl = (AVOutputDeviceDiscoverySessionImpl *)a3, (impl = v4->_outputDeviceDiscoverySession->impl) != 0))
  {
    [(AVOutputDeviceDiscoverySessionImpl *)impl setParentOutputDeviceDiscoverySession:v4];
    v7 = v4;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)outputDeviceDiscoverySessionFactory
{
  id v2 = objc_alloc_init(AVFigRouteDiscovererOutputDeviceDiscoverySessionFactory);
  return v2;
}

- (void)outputDeviceDiscoverySessionImplDidChangeAvailableOutputDevices:(id)a3
{
  uint64_t v3 = [MEMORY[0x1E4F28EA0] notificationWithName:@"AVOutputDeviceDiscoverySessionAvailableOutputDevicesDidChangeNotification" object:self userInfo:0];
  v4 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotification:v3];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work();
    fig_note_initialize_category_with_default_work();
  }
}

- (AVOutputDeviceDiscoverySession)init
{
  return [(AVOutputDeviceDiscoverySession *)self initWithDeviceFeatures:7];
}

- (void)setTargetAudioSession:(id)a3
{
  id v4 = [(AVOutputDeviceDiscoverySession *)self impl];
  [v4 setTargetAudioSession:a3];
}

- (BOOL)onlyDiscoversBluetoothDevices
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_outputDeviceDiscoverySession->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__AVOutputDeviceDiscoverySession_onlyDiscoversBluetoothDevices__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __63__AVOutputDeviceDiscoverySession_onlyDiscoversBluetoothDevices__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 32);
  return result;
}

- (void)setOnlyDiscoversBluetoothDevices:(BOOL)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (dword_1EB2D39E0)
  {
    int v10 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  ivarAccessQueue = self->_outputDeviceDiscoverySession->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__AVOutputDeviceDiscoverySession_setOnlyDiscoversBluetoothDevices___block_invoke;
  block[3] = &unk_1E57B20E8;
  block[4] = self;
  BOOL v8 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  objc_msgSend(-[AVOutputDeviceDiscoverySession impl](self, "impl"), "outputDeviceDiscoverySessionBluetoothOnlyDiscoveryDidChange:", self);
}

uint64_t __67__AVOutputDeviceDiscoverySession_setOnlyDiscoversBluetoothDevices___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 32) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setDiscoveryMode:(int64_t)a3
{
}

- (BOOL)devicePresenceDetected
{
  id v2 = [(AVOutputDeviceDiscoverySession *)self impl];
  return [v2 devicePresenceDetected];
}

- (void)outputDeviceDiscoverySessionImpl:(id)a3 didExpireWithReplacement:(id)a4
{
  uint64_t v9 = 0;
  int v10 = &v9;
  uint64_t v11 = 0x3052000000;
  uint64_t v12 = __Block_byref_object_copy__8;
  uint64_t v13 = __Block_byref_object_dispose__8;
  uint64_t v14 = 0;
  ivarAccessQueue = self->_outputDeviceDiscoverySession->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__AVOutputDeviceDiscoverySession_outputDeviceDiscoverySessionImpl_didExpireWithReplacement___block_invoke;
  block[3] = &unk_1E57B3270;
  void block[5] = a4;
  void block[6] = &v9;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  [(id)v10[5] setParentOutputDeviceDiscoverySession:0];
  [a4 setParentOutputDeviceDiscoverySession:self];
  [(AVOutputDeviceDiscoverySession *)self outputDeviceDiscoverySessionImplDidChangeAvailableOutputDevices:[(AVOutputDeviceDiscoverySession *)self impl]];
  id v7 = [(AVOutputDeviceDiscoverySession *)self impl];
  [v7 outputDeviceDiscoverySessionDidChangeDiscoveryMode:self forClientIdentifiers:MEMORY[0x1E4F1CBF0]];
  objc_msgSend(-[AVOutputDeviceDiscoverySession impl](self, "impl"), "outputDeviceDiscoverySessionBluetoothOnlyDiscoveryDidChange:", self);

  _Block_object_dispose(&v9, 8);
}

id __92__AVOutputDeviceDiscoverySession_outputDeviceDiscoverySessionImpl_didExpireWithReplacement___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_retain(*(id *)(*(void *)(*(void *)(a1 + 32)
                                                                                              + 8)
                                                                                  + 16));

  id result = *(id *)(a1 + 40);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 16) = result;
  return result;
}

- (void)outputDeviceDiscoverySessionImplDidChangeAvailableOutputDeviceGroups:(id)a3
{
  uint64_t v3 = [MEMORY[0x1E4F28EA0] notificationWithName:@"AVOutputDeviceDiscoverySessionAvailableOutputDeviceGroupsDidChangeNotification" object:self userInfo:0];
  id v4 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotification:v3];
}

- (OpaqueFigRouteDiscoverer)routeDiscoverer
{
  id v2 = [(AVOutputDeviceDiscoverySession *)self impl];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  return (OpaqueFigRouteDiscoverer *)[v2 routeDiscoverer];
}

@end