@interface AVExternalStorageDeviceDiscoverySession
+ (AVExternalStorageDeviceDiscoverySession)sharedSession;
+ (BOOL)isSupported;
+ (void)initialize;
- (AVExternalStorageDeviceDiscoverySession)init;
- (NSArray)externalStorageDevices;
- (int)_checkAuthorizationStatus;
- (int)_setupExternalStorageDeviceDiscoverySession;
- (void)_reconnectToServer;
- (void)_requestAuthorization:(id)a3;
- (void)_tearDownExternalStorageDeviceDiscoverySessionToReconnectToServer:(BOOL)a3;
- (void)dealloc;
@end

@implementation AVExternalStorageDeviceDiscoverySession

+ (AVExternalStorageDeviceDiscoverySession)sharedSession
{
  if (sharedSession_onceToken != -1) {
    dispatch_once(&sharedSession_onceToken, &__block_literal_global_0);
  }
  if (dword_1E9544D58)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return (AVExternalStorageDeviceDiscoverySession *)sharedSession_sAVExternalStorageDeviceDiscoverySession;
}

AVExternalStorageDeviceDiscoverySession *__56__AVExternalStorageDeviceDiscoverySession_sharedSession__block_invoke()
{
  result = objc_alloc_init(AVExternalStorageDeviceDiscoverySession);
  sharedSession_sAVExternalStorageDeviceDiscoverySession = (uint64_t)result;
  return result;
}

+ (BOOL)isSupported
{
  if (isSupported_once != -1) {
    dispatch_once(&isSupported_once, &__block_literal_global_62);
  }
  return isSupported_sIsSupported;
}

uint64_t __54__AVExternalStorageDeviceDiscoverySession_isSupported__block_invoke()
{
  uint64_t result = FigExternalStorageDeviceManagerRemoteSupported();
  if (result) {
    uint64_t result = AVGestaltGetBoolAnswer(@"AVGQN46I2BPHSDKPVN3YSGNPHPTAPE");
  }
  isSupported_sIsSupported = result;
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

- (AVExternalStorageDeviceDiscoverySession)init
{
  v5.receiver = self;
  v5.super_class = (Class)AVExternalStorageDeviceDiscoverySession;
  v2 = [(AVExternalStorageDeviceDiscoverySession *)&v5 init];
  v3 = v2;
  if (v2
    && [(AVExternalStorageDeviceDiscoverySession *)v2 _setupExternalStorageDeviceDiscoverySession])
  {

    return 0;
  }
  return v3;
}

- (void)dealloc
{
  MEMORY[0x1A6234330](self->_lock, a2);
  [(AVExternalStorageDeviceDiscoverySession *)self _tearDownExternalStorageDeviceDiscoverySessionToReconnectToServer:0];
  MEMORY[0x1A6234340](self->_lock);
  FigSimpleMutexDestroy();
  self->_lock = 0;
  v3.receiver = self;
  v3.super_class = (Class)AVExternalStorageDeviceDiscoverySession;
  [(AVExternalStorageDeviceDiscoverySession *)&v3 dealloc];
}

- (int)_checkAuthorizationStatus
{
  int v7 = 0;
  externalStorageDeviceManager = self->_externalStorageDeviceManager;
  if (!externalStorageDeviceManager) {
    return 0;
  }
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 16);
  uint64_t v4 = v3 ? v3 : 0;
  objc_super v5 = *(void (**)(OpaqueFigExternalStorageDeviceManager *, void, int *))(v4 + 40);
  if (!v5) {
    return 0;
  }
  v5(externalStorageDeviceManager, 0, &v7);
  return v7;
}

- (void)_requestAuthorization:(id)a3
{
  externalStorageDeviceManager = self->_externalStorageDeviceManager;
  if (externalStorageDeviceManager)
  {
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
    uint64_t v6 = v5 ? v5 : 0;
    int v7 = *(void (**)(OpaqueFigExternalStorageDeviceManager *, void, id))(v6 + 48);
    if (v7)
    {
      v7(externalStorageDeviceManager, 0, a3);
    }
  }
}

- (int)_setupExternalStorageDeviceDiscoverySession
{
  if (!self->_externalStorageDevices) {
    self->_externalStorageDevices = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  if (!self->_uuidOfExternalStorageDevice) {
    self->_uuidOfExternalStorageDevice = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  if (!self->_lock) {
    self->_lock = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
  }
  if (+[AVExternalStorageDeviceDiscoverySession isSupported])
  {
    int result = FigExternalStorageDeviceManagerRemoteCreate();
    if (result == -16155)
    {
      usleep(0x3D090u);
      int result = FigExternalStorageDeviceManagerRemoteCreate();
    }
    if (!result)
    {
      externalStorageDeviceManager = self->_externalStorageDeviceManager;
      if (!externalStorageDeviceManager) {
        return 0;
      }
      uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v5) {
        uint64_t v6 = v5;
      }
      else {
        uint64_t v6 = 0;
      }
      int v7 = *(uint64_t (**)(OpaqueFigExternalStorageDeviceManager *, void, AVExternalStorageDeviceDiscoverySession *, uint64_t (*)(void *, uint64_t, uint64_t)))(v6 + 8);
      if (v7)
      {
        int result = v7(externalStorageDeviceManager, 0, self, esdds_handleStorageDeviceManagerCallback);
        if (!result)
        {
          self->_weakReference = (AVWeakReference *)[objc_alloc(MEMORY[0x1E4F47DF0]) initWithReferencedObject:self];
          objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F47DB8], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter()), "addListenerWithWeakReference:callback:name:object:flags:", self->_weakReference, avExternalStorageDeviceNotification, *MEMORY[0x1E4F526C0], self->_externalStorageDeviceManager, 0);
          return 0;
        }
      }
      else
      {
        return -12782;
      }
    }
  }
  else
  {
    return FigSignalErrorAt();
  }
  return result;
}

- (void)_tearDownExternalStorageDeviceDiscoverySessionToReconnectToServer:(BOOL)a3
{
  FigSimpleMutexCheckIsLockedOnThisThread();
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F47DB8], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter()), "removeListenerWithWeakReference:callback:name:object:", self->_weakReference, avExternalStorageDeviceNotification, *MEMORY[0x1E4F526C0], self->_externalStorageDeviceManager);

  self->_weakReference = 0;
  externalStorageDeviceManager = self->_externalStorageDeviceManager;
  if (externalStorageDeviceManager)
  {
    CFRelease(externalStorageDeviceManager);
    self->_externalStorageDeviceManager = 0;
  }
  if (!a3)
  {

    self->_externalStorageDevices = 0;
  }

  self->_uuidOfExternalStorageDevice = 0;
}

- (void)_reconnectToServer
{
  MEMORY[0x1A6234330](self->_lock, a2);
  [(AVExternalStorageDeviceDiscoverySession *)self _tearDownExternalStorageDeviceDiscoverySessionToReconnectToServer:1];
  [(AVExternalStorageDeviceDiscoverySession *)self _setupExternalStorageDeviceDiscoverySession];

  JUMPOUT(0x1A6234340);
}

- (NSArray)externalStorageDevices
{
  return &self->_externalStorageDevices->super;
}

@end