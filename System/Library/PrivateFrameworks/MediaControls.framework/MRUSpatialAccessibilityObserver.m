@interface MRUSpatialAccessibilityObserver
- (BOOL)isHeadTrackingEnabled;
- (BOOL)isMonoAudioEnabled;
- (MRUSpatialAccessibilityObserver)init;
- (MRUSpatialAccessibilityObserverDelegate)delegate;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setIsHeadTrackingEnabled:(BOOL)a3;
- (void)setIsMonoAudioEnabled:(BOOL)a3;
- (void)updateHeadTrackingSupported;
- (void)updateMonoAudioEnabled;
@end

@implementation MRUSpatialAccessibilityObserver

- (BOOL)isHeadTrackingEnabled
{
  return self->_isHeadTrackingEnabled;
}

- (BOOL)isMonoAudioEnabled
{
  return self->_isMonoAudioEnabled;
}

- (MRUSpatialAccessibilityObserver)init
{
  v6.receiver = self;
  v6.super_class = (Class)MRUSpatialAccessibilityObserver;
  v2 = [(MRUSpatialAccessibilityObserver *)&v6 init];
  if (v2)
  {
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, v2, (CFNotificationCallback)lockToDeviceChanged, (CFStringRef)*MEMORY[0x1E4FB8FF0], 0, (CFNotificationSuspensionBehavior)0);
    v4 = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(v4, v2, (CFNotificationCallback)monoAudioEnabledChanged, (CFStringRef)*MEMORY[0x1E4FB9210], 0, (CFNotificationSuspensionBehavior)0);
    [(MRUSpatialAccessibilityObserver *)v2 updateHeadTrackingSupported];
    [(MRUSpatialAccessibilityObserver *)v2 updateMonoAudioEnabled];
  }
  return v2;
}

- (void)dealloc
{
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveObserver(LocalCenter, self, (CFNotificationName)*MEMORY[0x1E4FB8FF0], 0);
  v4 = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveObserver(v4, self, (CFNotificationName)*MEMORY[0x1E4FB9210], 0);
  v5.receiver = self;
  v5.super_class = (Class)MRUSpatialAccessibilityObserver;
  [(MRUSpatialAccessibilityObserver *)&v5 dealloc];
}

- (void)updateHeadTrackingSupported
{
  uint64_t v3 = _AXSSpatialAudioHeadTracking() & 3;
  BOOL v4 = v3 != 0;
  if (self->_isHeadTrackingEnabled != v4)
  {
    BOOL v5 = v3 != 0;
    self->_isHeadTrackingEnabled = v4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained spatialAccessilityObserver:self didChangeHeadTrackingEnabled:v5];
  }
}

- (void)updateMonoAudioEnabled
{
  self->_isMonoAudioEnabled = _AXSMonoAudioEnabled() != 0;
}

- (MRUSpatialAccessibilityObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRUSpatialAccessibilityObserverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setIsHeadTrackingEnabled:(BOOL)a3
{
  self->_isHeadTrackingEnabled = a3;
}

- (void)setIsMonoAudioEnabled:(BOOL)a3
{
  self->_isMonoAudioEnabled = a3;
}

- (void).cxx_destruct
{
}

@end