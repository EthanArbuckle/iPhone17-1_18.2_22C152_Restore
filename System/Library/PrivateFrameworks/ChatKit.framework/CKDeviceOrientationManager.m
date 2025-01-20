@interface CKDeviceOrientationManager
- (BKSAccelerometer)accelerometer;
- (BOOL)_wantsOrientationEvents;
- (BOOL)isListeningForOrientationEvents;
- (CKDeviceOrientationManager)init;
- (CKDeviceOrientationManagerDelegate)delegate;
- (NSMutableSet)listenerKeys;
- (int64_t)_springboardDeviceLockOrientation;
- (int64_t)currentDeviceOrientation;
- (void)_broadcastOrientation:(int64_t)a3;
- (void)_updateListeningState;
- (void)accelerometer:(id)a3 didChangeDeviceOrientation:(int64_t)a4;
- (void)beginListeningForOrientationEventsWithKey:(id)a3;
- (void)dealloc;
- (void)endListeningForOrientationEventsWithKey:(id)a3;
- (void)invalidate;
- (void)setAccelerometer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setListenerKeys:(id)a3;
@end

@implementation CKDeviceOrientationManager

- (CKDeviceOrientationManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)CKDeviceOrientationManager;
  v2 = [(CKDeviceOrientationManager *)&v9 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel__applicationWillEnterForeground_ name:*MEMORY[0x1E4F43708] object:0];
    [v3 addObserver:v2 selector:sel__applicationDidEnterBackground_ name:*MEMORY[0x1E4F43660] object:0];
    v4 = (BKSAccelerometer *)objc_alloc_init(MEMORY[0x1E4F4F218]);
    accelerometer = v2->_accelerometer;
    v2->_accelerometer = v4;

    [(BKSAccelerometer *)v2->_accelerometer setDelegate:v2];
    [(BKSAccelerometer *)v2->_accelerometer setOrientationEventsEnabled:1];
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    listenerKeys = v2->_listenerKeys;
    v2->_listenerKeys = v6;

    [(CKDeviceOrientationManager *)v2 _updateListeningState];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(BKSAccelerometer *)self->_accelerometer setDelegate:0];
  [(BKSAccelerometer *)self->_accelerometer setPassiveOrientationEvents:1];
  [(BKSAccelerometer *)self->_accelerometer setOrientationEventsEnabled:0];
  v4.receiver = self;
  v4.super_class = (Class)CKDeviceOrientationManager;
  [(CKDeviceOrientationManager *)&v4 dealloc];
}

- (void)beginListeningForOrientationEventsWithKey:(id)a3
{
  id v4 = a3;
  v5 = [(CKDeviceOrientationManager *)self listenerKeys];
  [v5 addObject:v4];

  [(CKDeviceOrientationManager *)self _updateListeningState];
}

- (void)endListeningForOrientationEventsWithKey:(id)a3
{
  id v4 = a3;
  v5 = [(CKDeviceOrientationManager *)self listenerKeys];
  [v5 removeObject:v4];

  [(CKDeviceOrientationManager *)self _updateListeningState];
}

- (BOOL)isListeningForOrientationEvents
{
  v2 = [(CKDeviceOrientationManager *)self listenerKeys];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (int64_t)currentDeviceOrientation
{
  int64_t result = [(CKDeviceOrientationManager *)self _springboardDeviceLockOrientation];
  if (!result)
  {
    id v4 = [(CKDeviceOrientationManager *)self accelerometer];
    int64_t v5 = [v4 currentDeviceOrientation];

    return v5;
  }
  return result;
}

- (void)invalidate
{
  BOOL v3 = [(CKDeviceOrientationManager *)self listenerKeys];
  [v3 removeAllObjects];

  [(CKDeviceOrientationManager *)self _updateListeningState];
}

- (void)accelerometer:(id)a3 didChangeDeviceOrientation:(int64_t)a4
{
  if ([(CKDeviceOrientationManager *)self _wantsOrientationEvents])
  {
    [(CKDeviceOrientationManager *)self _broadcastOrientation:a4];
  }
}

- (BOOL)_wantsOrientationEvents
{
  if ([(id)*MEMORY[0x1E4F43630] applicationState]) {
    return 0;
  }

  return [(CKDeviceOrientationManager *)self isListeningForOrientationEvents];
}

- (void)_updateListeningState
{
  BOOL v3 = [(CKDeviceOrientationManager *)self accelerometer];
  int v4 = [v3 passiveOrientationEvents];

  BOOL v5 = [(CKDeviceOrientationManager *)self _wantsOrientationEvents];
  v6 = [(CKDeviceOrientationManager *)self accelerometer];
  [v6 setPassiveOrientationEvents:!v5];

  if (v4 && v5)
  {
    id v7 = [(CKDeviceOrientationManager *)self accelerometer];
    -[CKDeviceOrientationManager _broadcastOrientation:](self, "_broadcastOrientation:", [v7 currentDeviceOrientation]);
  }
}

- (int64_t)_springboardDeviceLockOrientation
{
  v2 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (v3 == 1)
  {
    CFStringRef v4 = @"SBLastRotationLockedOrientationiPad";
  }
  else
  {
    if (v3) {
      return 0;
    }
    CFStringRef v4 = @"SBLastRotationLockedOrientation";
  }
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(v4, @"com.apple.springboard", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat && (unint64_t)(AppIntegerValue - 1) <= 3) {
    return qword_18F81D8F0[AppIntegerValue - 1];
  }
  return 0;
}

- (void)_broadcastOrientation:(int64_t)a3
{
  int64_t v5 = [(CKDeviceOrientationManager *)self _springboardDeviceLockOrientation];
  v6 = [(CKDeviceOrientationManager *)self delegate];
  id v8 = v6;
  if (v5) {
    int64_t v7 = v5;
  }
  else {
    int64_t v7 = a3;
  }
  [v6 deviceOrientationManager:self orientationDidChange:v7];
}

- (CKDeviceOrientationManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKDeviceOrientationManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BKSAccelerometer)accelerometer
{
  return self->_accelerometer;
}

- (void)setAccelerometer:(id)a3
{
}

- (NSMutableSet)listenerKeys
{
  return self->_listenerKeys;
}

- (void)setListenerKeys:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listenerKeys, 0);
  objc_storeStrong((id *)&self->_accelerometer, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end