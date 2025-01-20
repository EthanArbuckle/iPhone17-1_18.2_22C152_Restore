@interface AccessibilitySettingsBaseController
- (AccessibilitySettingsBaseController)init;
- (BOOL)isSettingAvailableOnPlatform;
- (Class)detailClassForFeature:(int64_t)a3;
- (NPSDomainAccessor)domainAccessor;
- (id)imageForKey:(id)a3;
- (void)dealloc;
- (void)handleHACorNoiseCancellationToggle;
- (void)reloadSpecifierFromID:(id)a3;
- (void)reloadSpecifiersFromNotification;
- (void)setDomainAccessor:(id)a3;
- (void)setGizmoPref:(id)a3 forKey:(id)a4 domain:(id)a5;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AccessibilitySettingsBaseController

- (id)imageForKey:(id)a3
{
  id v3 = a3;
  v4 = AXSettingsBundle();
  v5 = +[UIImage imageNamed:v3 inBundle:v4];

  return v5;
}

- (AccessibilitySettingsBaseController)init
{
  v7.receiver = self;
  v7.super_class = (Class)AccessibilitySettingsBaseController;
  v2 = [(AccessibilitySettingsBaseController *)&v7 init];
  if (v2)
  {
    id v3 = (AXDispatchTimer *)[objc_alloc((Class)AXDispatchTimer) initWithTargetSerialQueue:&_dispatch_main_q];
    coalesceTimer = v2->_coalesceTimer;
    v2->_coalesceTimer = v3;

    [(AXDispatchTimer *)v2->_coalesceTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
    v5 = v2;
  }

  return v2;
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveEveryObserver(LocalCenter, self);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v6.receiver = self;
  v6.super_class = (Class)AccessibilitySettingsBaseController;
  [(AccessibilitySettingsBaseController *)&v6 dealloc];
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AccessibilitySettingsBaseController;
  [(AccessibilitySettingsBaseController *)&v9 viewWillAppear:a3];
  if (AXProcessIsSetup())
  {
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x2050000000;
    v4 = (void *)getBFFStyleClass_softClass_0;
    uint64_t v14 = getBFFStyleClass_softClass_0;
    if (!getBFFStyleClass_softClass_0)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = __getBFFStyleClass_block_invoke_0;
      v10[3] = &unk_2089B8;
      v10[4] = &v11;
      __getBFFStyleClass_block_invoke_0((uint64_t)v10);
      v4 = (void *)v12[3];
    }
    id v5 = v4;
    _Block_object_dispose(&v11, 8);
    objc_super v6 = [v5 sharedStyle];
    objc_super v7 = [v6 backgroundColor];
    v8 = [(AccessibilitySettingsBaseController *)self table];
    [v8 setBackgroundColor:v7];
  }
}

- (void)setGizmoPref:(id)a3 forKey:(id)a4 domain:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  domainAccessor = self->_domainAccessor;
  if (!domainAccessor)
  {
    v12 = (NPSDomainAccessor *)[objc_alloc((Class)NPSDomainAccessor) initWithDomain:v10];
    uint64_t v13 = self->_domainAccessor;
    self->_domainAccessor = v12;

    domainAccessor = self->_domainAccessor;
  }
  [(NPSDomainAccessor *)domainAccessor setObject:v8 forKey:v9];
  id v14 = [(NPSDomainAccessor *)self->_domainAccessor synchronize];
  v15 = objc_opt_new();
  id v18 = v9;
  v16 = +[NSArray arrayWithObjects:&v18 count:1];
  v17 = +[NSSet setWithArray:v16];
  [v15 synchronizeNanoDomain:v10 keys:v17];
}

- (void)handleHACorNoiseCancellationToggle
{
  id v6 = objc_alloc_init((Class)PSConfirmationSpecifier);
  id v3 = settingsLocString(@"OK", @"Accessibility");
  [v6 setTitle:v3];

  v4 = settingsLocString(@"NOISE_CANCELLATION_HAC_TOGGLE_MESSAGE", @"Accessibility");
  [v6 setPrompt:v4];

  id v5 = settingsLocString(@"OK", @"Accessibility");
  [v6 setOkButton:v5];

  [(AccessibilitySettingsBaseController *)self showConfirmationViewForSpecifier:v6];
}

- (Class)detailClassForFeature:(int64_t)a3
{
  v4 = +[NSBundle bundleWithPath:@"/System/Library/PreferenceBundles/HearingSettings.bundle"];
  [v4 load];
  if (detailClassForFeature__onceToken != -1) {
    dispatch_once(&detailClassForFeature__onceToken, &__block_literal_global_63);
  }
  if ((unint64_t)(a3 - 1) > 2)
  {
    id v6 = 0;
  }
  else
  {
    id v5 = [v4 objectForInfoDictionaryKey:off_20BDC0[a3 - 1]];
    id v6 = [v4 classNamed:v5];
  }
  objc_super v7 = (objc_class *)v6;

  return v7;
}

void __61__AccessibilitySettingsBaseController_detailClassForFeature___block_invoke(id a1)
{
}

- (void)reloadSpecifiersFromNotification
{
  coalesceTimer = self->_coalesceTimer;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __71__AccessibilitySettingsBaseController_reloadSpecifiersFromNotification__block_invoke;
  v3[3] = &unk_2087C0;
  v3[4] = self;
  [(AXDispatchTimer *)coalesceTimer afterDelay:v3 processBlock:0.5];
}

id __71__AccessibilitySettingsBaseController_reloadSpecifiersFromNotification__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (void)reloadSpecifierFromID:(id)a3
{
  id v4 = a3;
  coalesceTimer = self->_coalesceTimer;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __61__AccessibilitySettingsBaseController_reloadSpecifierFromID___block_invoke;
  v7[3] = &unk_208948;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(AXDispatchTimer *)coalesceTimer afterDelay:v7 processBlock:0.5];
}

id __61__AccessibilitySettingsBaseController_reloadSpecifierFromID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifierID:*(void *)(a1 + 40)];
}

- (BOOL)isSettingAvailableOnPlatform
{
  return 1;
}

- (NPSDomainAccessor)domainAccessor
{
  return self->_domainAccessor;
}

- (void)setDomainAccessor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainAccessor, 0);

  objc_storeStrong((id *)&self->_coalesceTimer, 0);
}

@end