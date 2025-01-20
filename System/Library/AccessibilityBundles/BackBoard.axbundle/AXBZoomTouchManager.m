@interface AXBZoomTouchManager
+ (Class)getZoomBundlePrincipalClassForcingLoad:(BOOL)a3;
+ (void)initializeZoomMonitor;
- (void)setZoomTouchEnabled:(BOOL)a3;
- (void)updateSettings;
@end

@implementation AXBZoomTouchManager

+ (void)initializeZoomMonitor
{
  if (initializeZoomMonitor_onceToken != -1) {
    dispatch_once(&initializeZoomMonitor_onceToken, &__block_literal_global_23);
  }
}

void __44__AXBZoomTouchManager_initializeZoomMonitor__block_invoke()
{
  v0 = objc_alloc_init(AXBZoomTouchManager);
  v1 = (void *)SharedManager_3;
  SharedManager_3 = (uint64_t)v0;

  id v2 = (id)[MEMORY[0x263F88140] sharedInstance];
  [(id)SharedManager_3 updateSettings];
  id v6 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v3 = *MEMORY[0x263F8B458];
  v4 = [MEMORY[0x263F08A48] mainQueue];
  id v5 = (id)[v6 addObserverForName:v3 object:0 queue:v4 usingBlock:&__block_literal_global_271_0];
}

uint64_t __44__AXBZoomTouchManager_initializeZoomMonitor__block_invoke_2()
{
  return [(id)SharedManager_3 updateSettings];
}

+ (Class)getZoomBundlePrincipalClassForcingLoad:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/SpringBoardPlugins/ZoomTouch.bundle"];
  id v5 = v4;
  if (v4)
  {
    if ([v4 isLoaded])
    {
LABEL_7:
      id v9 = (id)objc_msgSend(v5, "principalClass", v11, v12, v13);
      goto LABEL_9;
    }
    if (v3)
    {
      id v14 = 0;
      char v6 = [v5 loadAndReturnError:&v14];
      id v7 = v14;
      v8 = v7;
      if ((v6 & 1) == 0)
      {
        v12 = @"**** Accessibility: Could not load ZoomTouch bundle: %@";
        id v13 = v7;
        LOBYTE(v11) = 1;
        _AXLogWithFacility();
      }

      goto LABEL_7;
    }
  }
  id v9 = 0;
LABEL_9:

  return (Class)v9;
}

- (void)setZoomTouchEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = (void *)[(id)objc_opt_class() getZoomBundlePrincipalClassForcingLoad:a3];
  if (v3) {
    id v5 = sel_enableZoom;
  }
  else {
    id v5 = sel_disableZoom;
  }
  if (objc_opt_respondsToSelector())
  {
    [v4 performSelector:v5 withObject:0];
  }
}

- (void)updateSettings
{
  BOOL v2 = _AXSZoomTouchEnabled() != 0;
  BOOL v3 = (void *)SharedManager_3;

  [v3 setZoomTouchEnabled:v2];
}

@end