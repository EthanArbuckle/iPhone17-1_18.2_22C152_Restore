@interface _EXRunningUIExtension
+ (id)sharedInstance;
+ (void)sharedInstance;
- (BOOL)isExtensionViewServiceSessionManager:(id)a3;
- (BOOL)requiresExtensionContextForViewServiceSessionManager:(id)a3;
- (_EXExtensionSceneFactory)sceneFactory;
- (id)containingViewControllerClassNameForViewServiceSessionManager:(id)a3;
- (id)mainStoryboardNameForViewServiceSessionManager:(id)a3;
- (id)viewControllerClassNameForViewServiceSessionManager:(id)a3;
- (void)checkIn;
- (void)installRunloopObserverToPingLaunchdAfterEvent;
- (void)setSceneFactory:(id)a3;
- (void)viewServiceSessionManager:(id)a3 didCreateViewController:(id)a4 contextToken:(id)a5;
@end

@implementation _EXRunningUIExtension

+ (id)sharedInstance
{
  v2 = [MEMORY[0x263F04E00] sharedInstance];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    return v2;
  }
  else
  {
    v4 = _EXDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[_EXRunningUIExtension sharedInstance];
    }

    v5 = (_EXRunningUIExtension *)abort_with_reason();
    return [(_EXRunningUIExtension *)v5 sceneFactory];
  }
}

- (_EXExtensionSceneFactory)sceneFactory
{
  return self->_sceneFactory;
}

- (void)setSceneFactory:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)viewServiceSessionManager:(id)a3 didCreateViewController:(id)a4 contextToken:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [MEMORY[0x263F04E10] sharedInstance];
  v11 = [v10 sessionForIdentifier:v9];

  v12 = _EXDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[_EXRunningUIExtension(_UIViewServiceSessionManagerDelegate) viewServiceSessionManager:didCreateViewController:contextToken:].cold.4();
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = _EXDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[_EXRunningUIExtension(_UIViewServiceSessionManagerDelegate) viewServiceSessionManager:didCreateViewController:contextToken:]((uint64_t)v8, v16);
    }

    goto LABEL_16;
  }
  id v13 = v11;
  if (!v13)
  {
    v15 = _EXDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[_EXRunningUIExtension(_UIViewServiceSessionManagerDelegate) viewServiceSessionManager:didCreateViewController:contextToken:]((uint64_t)v9, v15);
    }

    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
LABEL_12:
    [v13 setRootViewController:v8];

    return;
  }
  v14 = _EXDefaultLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[_EXRunningUIExtension(_UIViewServiceSessionManagerDelegate) viewServiceSessionManager:didCreateViewController:contextToken:]((uint64_t)v13, v14);
  }

LABEL_16:
  v17 = (_EXRunningUIExtension *)abort_with_reason();
  [(_EXRunningUIExtension *)v17 isExtensionViewServiceSessionManager:v19];
}

- (BOOL)isExtensionViewServiceSessionManager:(id)a3
{
  return 1;
}

- (BOOL)requiresExtensionContextForViewServiceSessionManager:(id)a3
{
  return 0;
}

- (id)viewControllerClassNameForViewServiceSessionManager:(id)a3
{
  v3 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v3);
}

- (id)containingViewControllerClassNameForViewServiceSessionManager:(id)a3
{
  return 0;
}

- (id)mainStoryboardNameForViewServiceSessionManager:(id)a3
{
  return 0;
}

- (void)installRunloopObserverToPingLaunchdAfterEvent
{
  CFRunLoopRef Main = CFRunLoopGetMain();
  if (!Main) {
    -[_EXRunningUIExtension(_UIViewServiceSessionManagerDelegate) installRunloopObserverToPingLaunchdAfterEvent]();
  }
  v3 = Main;
  v4 = CFRunLoopObserverCreate(0, 0xA0uLL, 0, 0, (CFRunLoopObserverCallBack)_EXExtensionPingLaunchdAfterEvent, 0);
  sPingLaunchdObserver = (uint64_t)v4;
  CFStringRef v5 = (const __CFString *)*MEMORY[0x263EFFE78];

  CFRunLoopAddObserver(v3, v4, v5);
}

- (void)checkIn
{
  [(_EXRunningUIExtension *)self installRunloopObserverToPingLaunchdAfterEvent];
  uint64_t v2 = getpid();

  MEMORY[0x270EDA490](18, v2, 0, 0, 0);
}

+ (void)sharedInstance
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v6[0] = 136315906;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_0(&dword_2156DD000, a2, v5, "%s - %s:%d: Unexpected running extension class. Expected '_EXRunningUIExtension' got '%@'", (uint8_t *)v6);
}

@end