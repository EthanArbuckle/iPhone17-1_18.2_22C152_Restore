@interface AVExternalPlaybackMonitor
+ (id)longFormVideoExternalPlaybackMonitor;
+ (void)initialize;
- (AVExternalPlaybackMonitor)init;
- (AVExternalPlaybackMonitor)initWithFigRoutingSessionManager:(OpaqueFigRoutingSessionManager *)a3;
- (BOOL)isAirPlayVideoActive;
- (BOOL)isAirPlayVideoPlaying;
- (id)description;
- (void)dealloc;
@end

@implementation AVExternalPlaybackMonitor

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work();
    fig_note_initialize_category_with_default_work();
  }
}

+ (id)longFormVideoExternalPlaybackMonitor
{
  if (FigRoutingSessionManagerResilientRemoteCopyLongFormVideoManager()) {
    v3 = 0;
  }
  else {
    v3 = (void *)[objc_alloc((Class)a1) initWithFigRoutingSessionManager:0];
  }
  return v3;
}

- (AVExternalPlaybackMonitor)initWithFigRoutingSessionManager:(OpaqueFigRoutingSessionManager *)a3
{
  CMNotificationCenterGetDefaultLocalCenter();
  v10.receiver = self;
  v10.super_class = (Class)AVExternalPlaybackMonitor;
  v5 = [(AVExternalPlaybackMonitor *)&v10 init];
  if (v5
    && (ivars = objc_alloc_init(AVExternalPlaybackMonitorInternal), (v5->_ivars = ivars) != 0)
    && (!a3
      ? (v7 = 0)
      : (OpaqueFigRoutingSessionManager *)(v7 = (OpaqueFigRoutingSessionManager *)CFRetain(a3), ivars = v5->_ivars),
        (ivars->figRoutingSessionManager = v7, v5->_ivars->figRoutingSessionManager)
     && !FigNotificationCenterAddWeakListener()
     && !FigNotificationCenterAddWeakListener()))
  {
    v8 = v5;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (AVExternalPlaybackMonitor)init
{
  return [(AVExternalPlaybackMonitor *)self initWithFigRoutingSessionManager:0];
}

- (void)dealloc
{
  ivars = self->_ivars;
  if (ivars)
  {
    if (ivars->figRoutingSessionManager)
    {
      CMNotificationCenterGetDefaultLocalCenter();
      FigNotificationCenterRemoveWeakListener();
      FigNotificationCenterRemoveWeakListener();
      ivars = self->_ivars;
      figRoutingSessionManager = ivars->figRoutingSessionManager;
      if (figRoutingSessionManager)
      {
        CFRelease(figRoutingSessionManager);
        ivars = self->_ivars;
      }
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)AVExternalPlaybackMonitor;
  [(AVExternalPlaybackMonitor *)&v5 dealloc];
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p, airPlayVideoActive=%d, airPlayVideoPlaying=%d>", NSStringFromClass(v4), self, -[AVExternalPlaybackMonitor isAirPlayVideoActive](self, "isAirPlayVideoActive"), -[AVExternalPlaybackMonitor isAirPlayVideoPlaying](self, "isAirPlayVideoPlaying")];
}

- (BOOL)isAirPlayVideoActive
{
  char v7 = 0;
  figRoutingSessionManager = self->_ivars->figRoutingSessionManager;
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  objc_super v5 = *(void (**)(OpaqueFigRoutingSessionManager *, char *))(v4 + 40);
  if (!v5) {
    return 0;
  }
  v5(figRoutingSessionManager, &v7);
  return v7 != 0;
}

- (BOOL)isAirPlayVideoPlaying
{
  char v7 = 0;
  figRoutingSessionManager = self->_ivars->figRoutingSessionManager;
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  objc_super v5 = *(void (**)(OpaqueFigRoutingSessionManager *, char *))(v4 + 48);
  if (!v5) {
    return 0;
  }
  v5(figRoutingSessionManager, &v7);
  return v7 != 0;
}

@end