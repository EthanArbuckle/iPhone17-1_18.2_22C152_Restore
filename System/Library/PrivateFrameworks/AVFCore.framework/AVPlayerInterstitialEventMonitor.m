@interface AVPlayerInterstitialEventMonitor
+ (AVPlayerInterstitialEventMonitor)interstitialEventMonitorWithPrimaryPlayer:(AVPlayer *)primaryPlayer;
- (AVPlayer)primaryPlayer;
- (AVPlayerInterstitialEvent)currentEvent;
- (AVPlayerInterstitialEventMonitor)init;
- (AVPlayerInterstitialEventMonitor)initWithPrimaryPlayer:(AVPlayer *)primaryPlayer;
- (AVQueuePlayer)interstitialPlayer;
- (NSArray)events;
- (id)makeCopyOf:(id)a3 immutable:(BOOL)a4;
- (void)_addMonitorListeners:(OpaqueFigPlayerInterstitialCoordinator *)a3;
- (void)_removeMonitorListeners;
- (void)dealloc;
@end

@implementation AVPlayerInterstitialEventMonitor

+ (AVPlayerInterstitialEventMonitor)interstitialEventMonitorWithPrimaryPlayer:(AVPlayer *)primaryPlayer
{
  v3 = (void *)[objc_alloc((Class)a1) initWithPrimaryPlayer:primaryPlayer];
  return (AVPlayerInterstitialEventMonitor *)v3;
}

- (AVPlayerInterstitialEventMonitor)initWithPrimaryPlayer:(AVPlayer *)primaryPlayer
{
  if ([(AVPlayer *)primaryPlayer _isInterstitialPlayer])
  {
    v15 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v16 = *MEMORY[0x1E4F1C3C8];
    v17 = @"Cannot create an InterstitialEventMonitor for an interstitial player.";
    goto LABEL_9;
  }
  v19.receiver = self;
  v19.super_class = (Class)AVPlayerInterstitialEventMonitor;
  v11 = [(AVPlayerInterstitialEventMonitor *)&v19 init];
  self = v11;
  if (!v11) {
    goto LABEL_6;
  }
  objc_storeWeak((id *)&v11->_primaryPlayer, primaryPlayer);
  v12 = (AVQueuePlayer *)[(AVPlayer *)primaryPlayer interstitialPlayer];
  self->_interstitialPlayer = v12;
  if (!v12)
  {
    v15 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v16 = *MEMORY[0x1E4F28790];
    v17 = @"Could not obtain the interstitial player.";
LABEL_9:
    v18 = objc_msgSend(v15, "exceptionWithName:reason:userInfo:", v16, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v17, v6, v7, v8, v9, v10, (uint64_t)v19.receiver), 0);
    objc_exception_throw(v18);
  }
  self->_weakReference = [[AVWeakReference alloc] initWithReferencedObject:self];
  v13 = [(AVPlayer *)primaryPlayer _copyInterstitialCoordinator];
  [(AVPlayerInterstitialEventMonitor *)self _addMonitorListeners:v13];
  if (v13) {
    CFRelease(v13);
  }
LABEL_6:
  FigNote_AllowInternalDefaultLogs();
  fig_note_initialize_category_with_default_work();
  fig_note_initialize_category_with_default_work();
  return self;
}

- (AVPlayerInterstitialEventMonitor)init
{
  [(AVPlayerInterstitialEventMonitor *)self init];
  v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3C8];
  uint64_t v6 = NSStringFromSelector(sel_initWithPrimaryPlayer_);
  v12 = (void *)[v4 exceptionWithName:v5, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Use %@ instead.", v7, v8, v9, v10, v11, (uint64_t)v6), 0 reason userInfo];
  objc_exception_throw(v12);
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (dword_1E93569F0)
  {
    int v8 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  [(AVPlayerInterstitialEventMonitor *)self _removeMonitorListeners];

  v6.receiver = self;
  v6.super_class = (Class)AVPlayerInterstitialEventMonitor;
  [(AVPlayerInterstitialEventMonitor *)&v6 dealloc];
}

- (AVPlayer)primaryPlayer
{
  return (AVPlayer *)objc_loadWeak((id *)&self->_primaryPlayer);
}

- (AVQueuePlayer)interstitialPlayer
{
  return self->_interstitialPlayer;
}

- (id)makeCopyOf:(id)a3 immutable:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  objc_super v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a3, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(a3);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v14 + 1) + 8 * v10) copy];
        v12 = v11;
        if (v4) {
          [v11 setImmutable];
        }
        [v6 addObject:v12];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [a3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
  return v6;
}

- (NSArray)events
{
  v14[16] = *(id *)MEMORY[0x1E4F143B8];
  if (dword_1E93569F0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v4 = [objc_loadWeak((id *)&self->_primaryPlayer) _copyInterstitialCoordinator];
  v14[0] = 0;
  if (v4)
  {
    uint64_t v5 = (const void *)v4;
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    uint64_t v9 = *(void (**)(const void *, id *))(v7 + 8);
    if (v9) {
      v9(v5, v14);
    }
    CFRelease(v5);
    id v8 = v14[0];
  }
  else
  {
    id v8 = 0;
  }
  uint64_t v10 = -[AVPlayerInterstitialEventMonitor makeCopyOf:immutable:](self, "makeCopyOf:immutable:", v8, 1, v12, v13);

  return v10;
}

- (AVPlayerInterstitialEvent)currentEvent
{
  uint64_t v2 = [objc_loadWeak((id *)&self->_primaryPlayer) _copyInterstitialCoordinator];
  if (v2)
  {
    v3 = (const void *)v2;
    uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v4) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
    uint64_t v7 = *(uint64_t (**)(const void *))(v5 + 16);
    if (v7) {
      uint64_t v6 = (void *)v7(v3);
    }
    else {
      uint64_t v6 = 0;
    }
    CFRelease(v3);
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v8 = (void *)[v6 copy];

  return (AVPlayerInterstitialEvent *)v8;
}

- (void)_addMonitorListeners:(OpaqueFigPlayerInterstitialCoordinator *)a3
{
  id v5 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
  [v5 addListenerWithWeakReference:self->_weakReference callback:avplayerinterstitialeventmonitor_fpNotificationCallback name:*MEMORY[0x1E4F33F50] object:a3 flags:0];
  [v5 addListenerWithWeakReference:self->_weakReference callback:avplayerinterstitialeventmonitor_fpNotificationCallback name:*MEMORY[0x1E4F33F48] object:a3 flags:0];
  [v5 addListenerWithWeakReference:self->_weakReference callback:avplayerinterstitialeventmonitor_fpNotificationCallback name:*MEMORY[0x1E4F33F58] object:a3 flags:0];
  [v5 addListenerWithWeakReference:self->_weakReference callback:avplayerinterstitialeventmonitor_fpNotificationCallback name:*MEMORY[0x1E4F33F28] object:a3 flags:0];
  self->_observedCoord = a3;
}

- (void)_removeMonitorListeners
{
  id v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
  [v3 removeListenerWithWeakReference:self->_weakReference callback:avplayerinterstitialeventmonitor_fpNotificationCallback name:*MEMORY[0x1E4F33F50] object:self->_observedCoord];
  [v3 removeListenerWithWeakReference:self->_weakReference callback:avplayerinterstitialeventmonitor_fpNotificationCallback name:*MEMORY[0x1E4F33F48] object:self->_observedCoord];
  [v3 removeListenerWithWeakReference:self->_weakReference callback:avplayerinterstitialeventmonitor_fpNotificationCallback name:*MEMORY[0x1E4F33F58] object:self->_observedCoord];
  uint64_t v4 = *MEMORY[0x1E4F33F28];
  weakReference = self->_weakReference;
  observedCoord = self->_observedCoord;
  [v3 removeListenerWithWeakReference:weakReference callback:avplayerinterstitialeventmonitor_fpNotificationCallback name:v4 object:observedCoord];
}

- (void).cxx_destruct
{
}

@end