@interface JFXOrientationMonitor
+ (BOOL)initialized;
+ (BOOL)isDeviceInterfaceLandscape;
+ (UIWindow)keyWindow;
+ (int64_t)deviceInterfaceOrientation;
+ (int64_t)deviceOrientation;
+ (int64_t)interfaceOrientation;
+ (void)JFX_initLock;
+ (void)initializeWithKeyWindow:(id)a3;
+ (void)initializeWithViewController:(id)a3;
+ (void)uninitialize;
- (JFXOrientationMonitor)initWithKeyWindow:(id)a3;
- (OS_dispatch_queue)darwinNotificationQ;
- (UIWindow)keyWindow;
- (int)darwinNotificationToken;
- (int64_t)JFX_deviceOrientation_darwinNotificationQ;
- (int64_t)deviceInterfaceOrientation;
- (int64_t)deviceInterfaceOrientation_lock;
- (int64_t)deviceOrientation;
- (int64_t)deviceOrientation_lock;
- (int64_t)interfaceOrientation;
- (int64_t)interfaceOrientation_lock;
- (void)JFX_UIApplicationDidChangeStatusBarOrientationNotification:(id)a3;
- (void)JFX_UIApplicationDidEnterBackgroundNotification:(id)a3;
- (void)JFX_UIApplicationWillEnterForegroundNotification:(id)a3;
- (void)JFX_initDarwinNotification;
- (void)dealloc;
- (void)setDarwinNotificationToken:(int)a3;
- (void)setDeviceInterfaceOrientation:(int64_t)a3;
- (void)setDeviceInterfaceOrientation_lock:(int64_t)a3;
- (void)setDeviceOrientation:(int64_t)a3;
- (void)setDeviceOrientation_lock:(int64_t)a3;
- (void)setInterfaceOrientation:(int64_t)a3;
- (void)setInterfaceOrientation_lock:(int64_t)a3;
@end

@implementation JFXOrientationMonitor

+ (BOOL)initialized
{
  objc_msgSend(a1, "JFX_initLock");
  [(id)s_instance_lock lock];
  BOOL v2 = s_instance != 0;
  [(id)s_instance_lock unlock];
  return v2;
}

+ (void)initializeWithKeyWindow:(id)a3
{
  id v4 = a3;
  objc_msgSend(a1, "JFX_initLock");
  [(id)s_instance_lock lock];
  uint64_t v5 = [objc_alloc((Class)a1) initWithKeyWindow:v4];

  v6 = (void *)s_instance;
  s_instance = v5;

  v7 = (void *)s_instance_lock;
  [v7 unlock];
}

+ (void)initializeWithViewController:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  v20 = (id *)&v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__4;
  v23 = __Block_byref_object_dispose__4;
  id v24 = 0;
  uint64_t v5 = [MEMORY[0x263F1C408] sharedApplication];
  v6 = [v5 windows];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __54__JFXOrientationMonitor_initializeWithViewController___block_invoke;
  v18[3] = &unk_264C0A9A0;
  v18[4] = &v19;
  [v6 enumerateObjectsUsingBlock:v18];

  if (v20[5]) {
    goto LABEL_5;
  }
  id v7 = v4;
  if (!v20[5])
  {
    while (1)
    {
      v9 = [v7 view];
      uint64_t v10 = [v9 window];
      id v11 = v20[5];
      v20[5] = (id)v10;

      v12 = [v7 parentViewController];

      if (!v12) {
        break;
      }
      v8 = [v7 parentViewController];

      id v7 = v8;
      if (v20[5]) {
        goto LABEL_4;
      }
    }
    if (!v20[5])
    {
      v13 = [v7 view];
      if (!v20[5])
      {
        while (1)
        {
          uint64_t v15 = [v13 window];
          id v16 = v20[5];
          v20[5] = (id)v15;

          v17 = [v13 superview];

          if (!v17) {
            break;
          }
          v14 = [v13 superview];

          v13 = v14;
          if (v20[5]) {
            goto LABEL_12;
          }
        }
        if (!v20[5])
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_storeStrong(v20 + 5, v13);
          }
        }
      }
      v14 = v13;
LABEL_12:
    }
  }
  v8 = v7;
LABEL_4:

  if (v20[5]) {
LABEL_5:
  }
    objc_msgSend(a1, "initializeWithKeyWindow:");
  _Block_object_dispose(&v19, 8);
}

void __54__JFXOrientationMonitor_initializeWithViewController___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 isKeyWindow])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

+ (void)uninitialize
{
  BOOL v2 = (void *)s_instance;
  s_instance = 0;
}

+ (UIWindow)keyWindow
{
  return (UIWindow *)[(id)s_instance keyWindow];
}

+ (int64_t)deviceOrientation
{
  return [(id)s_instance deviceOrientation];
}

+ (int64_t)deviceInterfaceOrientation
{
  return [(id)s_instance deviceInterfaceOrientation];
}

+ (int64_t)interfaceOrientation
{
  return [(id)s_instance interfaceOrientation];
}

+ (BOOL)isDeviceInterfaceLandscape
{
  return (unint64_t)([a1 deviceInterfaceOrientation] - 3) < 2;
}

- (JFXOrientationMonitor)initWithKeyWindow:(id)a3
{
  id v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)JFXOrientationMonitor;
  v6 = [(JFXOrientationMonitor *)&v28 init];
  objc_storeStrong((id *)&v6->_keyWindow, a3);
  uint64_t v7 = JFXCreateDispatchQueue(v6, @"DarwinNotificationQ", 0);
  darwinNotificationQ = v6->_darwinNotificationQ;
  v6->_darwinNotificationQ = (OS_dispatch_queue *)v7;

  v6->_darwinNotificationToken = -48879;
  [(JFXOrientationMonitor *)v6 JFX_initDarwinNotification];
  v9 = [MEMORY[0x263F08A00] defaultCenter];
  [v9 addObserver:v6 selector:sel_JFX_UIApplicationDidChangeStatusBarOrientationNotification_ name:*MEMORY[0x263F1D048] object:0];

  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0;
  uint64_t v10 = v6->_darwinNotificationQ;
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  v20 = __43__JFXOrientationMonitor_initWithKeyWindow___block_invoke;
  uint64_t v21 = &unk_264C09EE8;
  v23 = &v24;
  id v11 = v6;
  v22 = v11;
  dispatch_sync(v10, &v18);
  v11->_deviceOrientation_lock = v25[3];
  v12 = objc_msgSend(v5, "windowScene", v18, v19, v20, v21);
  uint64_t v13 = [v12 interfaceOrientation];

  v11->_interfaceOrientation_lock = v13;
  int64_t v14 = v25[3];
  if ((unint64_t)(v14 - 1) >= 4) {
    int64_t v14 = v13;
  }
  v11->_deviceInterfaceOrientation_lock = v14;
  uint64_t v15 = [MEMORY[0x263F08A00] defaultCenter];
  [v15 addObserver:v11 selector:sel_JFX_UIApplicationDidEnterBackgroundNotification_ name:*MEMORY[0x263F1D050] object:0];

  id v16 = [MEMORY[0x263F08A00] defaultCenter];
  [v16 addObserver:v11 selector:sel_JFX_UIApplicationWillEnterForegroundNotification_ name:*MEMORY[0x263F1D0D0] object:0];

  _Block_object_dispose(&v24, 8);
  return v11;
}

uint64_t __43__JFXOrientationMonitor_initWithKeyWindow___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "JFX_deviceOrientation_darwinNotificationQ");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int64_t)deviceOrientation
{
  [(id)s_instance_lock lock];
  int64_t v3 = [(JFXOrientationMonitor *)self deviceOrientation_lock];
  [(id)s_instance_lock unlock];
  return v3;
}

- (void)setDeviceOrientation:(int64_t)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  [(id)s_instance_lock lock];
  [(JFXOrientationMonitor *)self setDeviceOrientation_lock:a3];
  if ((unint64_t)(a3 - 1) > 3)
  {
    uint64_t v7 = 0;
  }
  else
  {
    int64_t v5 = [(JFXOrientationMonitor *)self deviceInterfaceOrientation_lock];
    [(JFXOrientationMonitor *)self setDeviceInterfaceOrientation_lock:a3];
    id v11 = @"kJFXOrientationMonitorDeviceInterfaceOrientationPreviousOrientationUserInfoKey";
    v6 = [NSNumber numberWithInteger:v5];
    v12[0] = v6;
    uint64_t v7 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  }
  [(id)s_instance_lock unlock];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __46__JFXOrientationMonitor_setDeviceOrientation___block_invoke;
  v9[3] = &unk_264C09FA8;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(MEMORY[0x263EF83A0], v9);
}

void __46__JFXOrientationMonitor_setDeviceOrientation___block_invoke(uint64_t a1)
{
  BOOL v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"kJFXOrientationMonitorDeviceOrientationNotification" object:0 userInfo:0];

  if (*(void *)(a1 + 32))
  {
    id v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 postNotificationName:@"kJFXOrientationMonitorDeviceInterfaceOrientationNotification" object:0 userInfo:*(void *)(a1 + 32)];
  }
}

- (int64_t)deviceInterfaceOrientation
{
  [(id)s_instance_lock lock];
  int64_t v3 = [(JFXOrientationMonitor *)self deviceInterfaceOrientation_lock];
  [(id)s_instance_lock unlock];
  return v3;
}

- (int64_t)interfaceOrientation
{
  [(id)s_instance_lock lock];
  int64_t v3 = [(JFXOrientationMonitor *)self interfaceOrientation_lock];
  [(id)s_instance_lock unlock];
  return v3;
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  [(id)s_instance_lock lock];
  [(JFXOrientationMonitor *)self setInterfaceOrientation_lock:a3];
  [(id)s_instance_lock unlock];
  int64_t v5 = MEMORY[0x263EF83A0];
  dispatch_async(v5, &__block_literal_global_8);
}

void __49__JFXOrientationMonitor_setInterfaceOrientation___block_invoke()
{
  id v0 = [MEMORY[0x263F08A00] defaultCenter];
  [v0 postNotificationName:@"kJFXOrientationMonitorInterfaceOrientationNotification" object:0 userInfo:0];
}

- (void)dealloc
{
  if ([(JFXOrientationMonitor *)self darwinNotificationToken] != -48879) {
    notify_cancel([(JFXOrientationMonitor *)self darwinNotificationToken]);
  }
  v3.receiver = self;
  v3.super_class = (Class)JFXOrientationMonitor;
  [(JFXOrientationMonitor *)&v3 dealloc];
}

- (void)JFX_UIApplicationDidChangeStatusBarOrientationNotification:(id)a3
{
  objc_super v3 = objc_msgSend((id)s_instance, "keyWindow", a3);
  id v4 = [v3 windowScene];
  uint64_t v5 = [v4 interfaceOrientation];

  v6 = (void *)s_instance;
  [v6 setInterfaceOrientation:v5];
}

- (void)JFX_UIApplicationDidEnterBackgroundNotification:(id)a3
{
  notify_cancel([(JFXOrientationMonitor *)self darwinNotificationToken]);
  [(JFXOrientationMonitor *)self setDarwinNotificationToken:4294918417];
}

- (void)JFX_UIApplicationWillEnterForegroundNotification:(id)a3
{
  id v4 = a3;
  [(JFXOrientationMonitor *)self JFX_initDarwinNotification];
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  uint64_t v5 = [(JFXOrientationMonitor *)self darwinNotificationQ];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __74__JFXOrientationMonitor_JFX_UIApplicationWillEnterForegroundNotification___block_invoke;
  v9[3] = &unk_264C09EE8;
  void v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(v5, v9);

  [(id)s_instance setDeviceOrientation:v11[3]];
  v6 = [(JFXOrientationMonitor *)self keyWindow];
  uint64_t v7 = [v6 windowScene];
  uint64_t v8 = [v7 interfaceOrientation];

  [(id)s_instance setInterfaceOrientation:v8];
  _Block_object_dispose(&v10, 8);
}

uint64_t __74__JFXOrientationMonitor_JFX_UIApplicationWillEnterForegroundNotification___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "JFX_deviceOrientation_darwinNotificationQ");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

+ (void)JFX_initLock
{
  if (JFX_initLock_onceToken != -1) {
    dispatch_once(&JFX_initLock_onceToken, &__block_literal_global_31);
  }
}

uint64_t __37__JFXOrientationMonitor_JFX_initLock__block_invoke()
{
  s_instance_lock = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (void)JFX_initDarwinNotification
{
  if ([(JFXOrientationMonitor *)self darwinNotificationToken] != -48879) {
    notify_cancel([(JFXOrientationMonitor *)self darwinNotificationToken]);
  }
  [(JFXOrientationMonitor *)self setDarwinNotificationToken:4294918417];
  int out_token = -48879;
  objc_super v3 = (const char *)[@"com.apple.backboardd.rawOrientation" UTF8String];
  id v4 = [(JFXOrientationMonitor *)self darwinNotificationQ];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __51__JFXOrientationMonitor_JFX_initDarwinNotification__block_invoke;
  v5[3] = &unk_264C0A9C8;
  v5[4] = self;
  LODWORD(v3) = notify_register_dispatch(v3, &out_token, v4, v5);

  if (!v3) {
    [(JFXOrientationMonitor *)self setDarwinNotificationToken:out_token];
  }
}

uint64_t __51__JFXOrientationMonitor_JFX_initDarwinNotification__block_invoke(uint64_t a1)
{
  uint64_t v1 = objc_msgSend(*(id *)(a1 + 32), "JFX_deviceOrientation_darwinNotificationQ");
  BOOL v2 = (void *)s_instance;
  return [v2 setDeviceOrientation:v1];
}

- (int64_t)JFX_deviceOrientation_darwinNotificationQ
{
  objc_super v3 = [(JFXOrientationMonitor *)self darwinNotificationQ];
  dispatch_assert_queue_V2(v3);

  uint64_t state64 = 0;
  if (notify_get_state([(JFXOrientationMonitor *)self darwinNotificationToken], &state64)) {
    return 0;
  }
  else {
    return state64;
  }
}

- (UIWindow)keyWindow
{
  return self->_keyWindow;
}

- (OS_dispatch_queue)darwinNotificationQ
{
  return self->_darwinNotificationQ;
}

- (int)darwinNotificationToken
{
  return self->_darwinNotificationToken;
}

- (void)setDarwinNotificationToken:(int)a3
{
  self->_darwinNotificationToken = a3;
}

- (int64_t)deviceOrientation_lock
{
  return self->_deviceOrientation_lock;
}

- (void)setDeviceOrientation_lock:(int64_t)a3
{
  self->_deviceOrientation_lock = a3;
}

- (void)setDeviceInterfaceOrientation:(int64_t)a3
{
  self->_deviceInterfaceOrientation = a3;
}

- (int64_t)deviceInterfaceOrientation_lock
{
  return self->_deviceInterfaceOrientation_lock;
}

- (void)setDeviceInterfaceOrientation_lock:(int64_t)a3
{
  self->_deviceInterfaceOrientation_lock = a3;
}

- (int64_t)interfaceOrientation_lock
{
  return self->_interfaceOrientation_lock;
}

- (void)setInterfaceOrientation_lock:(int64_t)a3
{
  self->_interfaceOrientation_lock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darwinNotificationQ, 0);
  objc_storeStrong((id *)&self->_keyWindow, 0);
}

@end