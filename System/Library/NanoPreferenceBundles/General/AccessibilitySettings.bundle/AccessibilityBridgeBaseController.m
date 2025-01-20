@interface AccessibilityBridgeBaseController
+ (NPSDomainAccessor)accessibilityDomainAccessor;
+ (NPSDomainAccessor)touchAccommodationsDomainAccessor;
+ (id)domainAccessorForDomain:(id)a3;
+ (void)setGizmoAccessibilityPref:(id)a3 forKey:(id)a4;
+ (void)setGizmoPref:(id)a3 forKey:(id)a4 domainAccessor:(id)a5;
- (AccessibilityBridgeBaseController)init;
- (NPSDomainAccessor)accessibilityDomainAccessor;
- (NPSDomainAccessor)touchAccommodationsDomainAccessor;
- (id)gizmoValueForKey:(id)a3 domainAccessor:(id)a4;
- (id)imageForKey:(id)a3;
- (id)specifierForIndexPath:(id)a3;
- (void)dealloc;
- (void)presentDisableEltonAlert:(id)a3 greyOptional:(BOOL)a4 confirmBlock:(id)a5 disableGreyBlock:(id)a6;
- (void)setGizmoAccessibilityPref:(id)a3 forKey:(id)a4;
- (void)setGizmoAccessibilityPref:(id)a3 forKey:(id)a4 reloadSpecifiers:(BOOL)a5;
- (void)setGizmoPref:(id)a3 forKey:(id)a4 domainAccessor:(id)a5;
- (void)setGizmoPref:(id)a3 forKey:(id)a4 domainAccessor:(id)a5 reloadSpecifiers:(BOOL)a6;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation AccessibilityBridgeBaseController

+ (id)domainAccessorForDomain:(id)a3
{
  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x263F57520];
    id v4 = a3;
    v5 = (void *)[[v3 alloc] initWithDomain:v4];

    id v6 = (id)[v5 synchronize];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (AccessibilityBridgeBaseController)init
{
  v12.receiver = self;
  v12.super_class = (Class)AccessibilityBridgeBaseController;
  v2 = [(AccessibilityBridgeBaseController *)&v12 init];
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_reloadSettings, @"NanoAccessibilityDefaultsChanged", 0, (CFNotificationSuspensionBehavior)1028);
    id v4 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v4, v2, (CFNotificationCallback)_reloadSettings, @"NanoZoomDefaultsChanged", 0, (CFNotificationSuspensionBehavior)1028);
    v5 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v5, v2, (CFNotificationCallback)_reloadSettings, @"NanoTouchAccommodationsDefaultsChanged", 0, (CFNotificationSuspensionBehavior)1028);
    id v6 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v6, v2, (CFNotificationCallback)_reloadSettings, @"NanoHearingDevicesDefaultsChanged", 0, (CFNotificationSuspensionBehavior)1028);
    v7 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v7, v2, (CFNotificationCallback)_reloadSettings, @"NanoRTTDefaultsChanged", 0, (CFNotificationSuspensionBehavior)1028);
    v8 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v8, v2, (CFNotificationCallback)_reloadSettings, @"NanoPreferredContentSizeChangedNotification", 0, (CFNotificationSuspensionBehavior)1028);
    v9 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v9, v2, (CFNotificationCallback)_reloadSettings, @"WatchControlSettingsChanged", 0, (CFNotificationSuspensionBehavior)1028);
    v10 = v2;
  }

  return v2;
}

+ (NPSDomainAccessor)accessibilityDomainAccessor
{
  return (NPSDomainAccessor *)[a1 domainAccessorForDomain:*MEMORY[0x263F8B0F8]];
}

- (NPSDomainAccessor)accessibilityDomainAccessor
{
  v2 = objc_opt_class();
  uint64_t v3 = *MEMORY[0x263F8B0F8];

  return (NPSDomainAccessor *)[v2 domainAccessorForDomain:v3];
}

+ (NPSDomainAccessor)touchAccommodationsDomainAccessor
{
  return (NPSDomainAccessor *)[a1 domainAccessorForDomain:*MEMORY[0x263F8B3B0]];
}

- (NPSDomainAccessor)touchAccommodationsDomainAccessor
{
  v2 = objc_opt_class();
  uint64_t v3 = *MEMORY[0x263F8B3B0];

  return (NPSDomainAccessor *)[v2 domainAccessorForDomain:v3];
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveEveryObserver(LocalCenter, self);
  v5.receiver = self;
  v5.super_class = (Class)AccessibilityBridgeBaseController;
  [(AccessibilityBridgeBaseController *)&v5 dealloc];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)AccessibilityBridgeBaseController;
  [(AccessibilityBridgeBaseController *)&v3 viewDidLoad];
  [(AccessibilityBridgeBaseController *)self beginUpdates];
  [(AccessibilityBridgeBaseController *)self reload];
  [(AccessibilityBridgeBaseController *)self endUpdates];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AccessibilityBridgeBaseController;
  [(AccessibilityBridgeBaseController *)&v4 viewWillAppear:a3];
  [(AccessibilityBridgeBaseController *)self reloadSpecifiers];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  id v4 = [(AccessibilityBridgeBaseController *)self view];
  [v4 layoutSubviews];
}

- (id)gizmoValueForKey:(id)a3 domainAccessor:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)[v5 synchronize];
  v8 = [v5 objectForKey:v6];

  return v8;
}

+ (void)setGizmoPref:(id)a3 forKey:(id)a4 domainAccessor:(id)a5
{
  v15[1] = *MEMORY[0x263EF8340];
  id v7 = a5;
  id v8 = a4;
  [v7 setObject:a3 forKey:v8];
  id v9 = (id)[v7 synchronize];
  v10 = objc_opt_new();
  v11 = [v7 domain];

  objc_super v12 = (void *)MEMORY[0x263EFFA08];
  v15[0] = v8;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  v14 = [v12 setWithArray:v13];

  [v10 synchronizeNanoDomain:v11 keys:v14];
}

- (void)setGizmoPref:(id)a3 forKey:(id)a4 domainAccessor:(id)a5
{
}

- (void)setGizmoPref:(id)a3 forKey:(id)a4 domainAccessor:(id)a5 reloadSpecifiers:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  [(id)objc_opt_class() setGizmoPref:v12 forKey:v11 domainAccessor:v10];

  if (v6)
  {
    [(AccessibilityBridgeBaseController *)self reload];
  }
}

+ (void)setGizmoAccessibilityPref:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 accessibilityDomainAccessor];
  [a1 setGizmoPref:v7 forKey:v6 domainAccessor:v8];
}

- (void)setGizmoAccessibilityPref:(id)a3 forKey:(id)a4
{
}

- (void)setGizmoAccessibilityPref:(id)a3 forKey:(id)a4 reloadSpecifiers:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  [(AccessibilityBridgeBaseController *)self setGizmoPref:v9 forKey:v8 domainAccessor:v10 reloadSpecifiers:v5];
}

- (id)specifierForIndexPath:(id)a3
{
  uint64_t v4 = [(AccessibilityBridgeBaseController *)self indexForIndexPath:a3];

  return (id)[(AccessibilityBridgeBaseController *)self specifierAtIndex:v4];
}

- (id)imageForKey:(id)a3
{
  objc_super v3 = (void *)MEMORY[0x263F827E8];
  id v4 = a3;
  BOOL v5 = AXSettingsBundle();
  id v6 = [v3 imageNamed:v4 inBundle:v5];

  return v6;
}

- (void)presentDisableEltonAlert:(id)a3 greyOptional:(BOOL)a4 confirmBlock:(id)a5 disableGreyBlock:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (v8) {
    v13 = @"DISABLE_ELTON_ALERT_MESSAGE_HAND_GESTURES";
  }
  else {
    v13 = @"DISABLE_ELTON_ALERT_MESSAGE";
  }
  v14 = settingsLocString(v13, @"AccessibilitySettings-elton");
  v15 = AXCFormattedString();

  v16 = (void *)MEMORY[0x263F82418];
  v17 = settingsLocString(@"DISABLE_ELTON_ALERT_TITLE", @"AccessibilitySettings-elton");
  v18 = objc_msgSend(v16, "alertControllerWithTitle:message:preferredStyle:", v17, v15, 1, v10);

  v19 = (void *)MEMORY[0x263F82400];
  v20 = settingsLocString(@"ACTION_DISABLE_FEATURE", @"AccessibilitySettings-elton");
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __122__AccessibilityBridgeBaseController_EltonManagement__presentDisableEltonAlert_greyOptional_confirmBlock_disableGreyBlock___block_invoke;
  v34[3] = &unk_2651F2070;
  id v21 = v11;
  v34[4] = self;
  id v35 = v21;
  v22 = [v19 actionWithTitle:v20 style:0 handler:v34];

  [v18 addAction:v22];
  if (v12)
  {
    v23 = (void *)MEMORY[0x263F82400];
    v24 = settingsLocString(@"ACTION_USE_WIHOUT_GREY", @"AccessibilitySettings-elton");
    v25 = AXCFormattedString();
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __122__AccessibilityBridgeBaseController_EltonManagement__presentDisableEltonAlert_greyOptional_confirmBlock_disableGreyBlock___block_invoke_2;
    v31[3] = &unk_2651F2098;
    id v32 = v12;
    id v33 = v21;
    v31[4] = self;
    v26 = objc_msgSend(v23, "actionWithTitle:style:handler:", v25, 0, v31, v10);

    [v18 addAction:v26];
  }
  v27 = (void *)MEMORY[0x263F82400];
  v28 = settingsLocString(@"ACTION_CANCEL", @"AccessibilitySettings-elton");
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __122__AccessibilityBridgeBaseController_EltonManagement__presentDisableEltonAlert_greyOptional_confirmBlock_disableGreyBlock___block_invoke_3;
  v30[3] = &unk_2651F20C0;
  v30[4] = self;
  v29 = [v27 actionWithTitle:v28 style:1 handler:v30];

  [v18 addAction:v29];
  [(AccessibilityBridgeBaseController *)self presentViewController:v18 animated:1 completion:0];
}

uint64_t __122__AccessibilityBridgeBaseController_EltonManagement__presentDisableEltonAlert_greyOptional_confirmBlock_disableGreyBlock___block_invoke(uint64_t a1)
{
  AXActivePairedDeviceDisableElton();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);

  return [v2 reloadSpecifiers];
}

uint64_t __122__AccessibilityBridgeBaseController_EltonManagement__presentDisableEltonAlert_greyOptional_confirmBlock_disableGreyBlock___block_invoke_2(void *a1)
{
  (*(void (**)(void))(a1[5] + 16))();
  (*(void (**)(void))(a1[6] + 16))();
  v2 = (void *)a1[4];

  return [v2 reloadSpecifiers];
}

uint64_t __122__AccessibilityBridgeBaseController_EltonManagement__presentDisableEltonAlert_greyOptional_confirmBlock_disableGreyBlock___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

@end