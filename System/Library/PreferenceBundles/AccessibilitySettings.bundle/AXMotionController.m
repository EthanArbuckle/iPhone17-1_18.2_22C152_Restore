@interface AXMotionController
- (PSSpecifier)reduceMotionReduceSlideTransitionsFooterSpecifier;
- (PSSpecifier)reduceMotionReduceSlideTransitionsSpecifier;
- (id)specifiers;
- (void)setReduceMotionReduceSlideTransitionsFooterSpecifier:(id)a3;
- (void)setReduceMotionReduceSlideTransitionsSpecifier:(id)a3;
- (void)viewDidLoad;
@end

@implementation AXMotionController

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)AXMotionController;
  [(AXMotionController *)&v6 viewDidLoad];
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(LocalCenter, self, (CFNotificationCallback)_accessibilitySettingsChanged_0, kAXSReduceMotionChangedNotification, 0, (CFNotificationSuspensionBehavior)1028);
  v4 = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(v4, self, (CFNotificationCallback)_accessibilitySettingsChanged_0, kAXSPhotosensitiveMitigationEnabledNotification, 0, (CFNotificationSuspensionBehavior)1028);
  if (AXDeviceSupportsMotionCues())
  {
    v5 = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(v5, self, (CFNotificationCallback)_accessibilitySettingsChanged_0, kAXSMotionCuesPreferenceDidChangeNotification, 0, (CFNotificationSuspensionBehavior)1028);
  }
}

- (id)specifiers
{
  if (!self->_helper)
  {
    v3 = (AXDisplayTextMotionSpecifiersHelper *)objc_opt_new();
    helper = self->_helper;
    self->_helper = v3;

    [(AXDisplayTextMotionSpecifiersHelper *)self->_helper setSettingsController:self];
  }
  uint64_t v5 = OBJC_IVAR___PSListController__specifiers;
  objc_super v6 = *(void **)&self->super.AXUISettingsListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v6)
  {
    id v7 = [objc_allocWithZone((Class)NSMutableArray) init];
    v8 = [(AXDisplayTextMotionSpecifiersHelper *)self->_helper motionSpecifiers];
    [v7 axSafelyAddObjectsFromArray:v8];

    id v9 = [v7 copy];
    v10 = *(void **)&self->super.AXUISettingsListController_opaque[v5];
    *(void *)&self->super.AXUISettingsListController_opaque[v5] = v9;

    objc_super v6 = *(void **)&self->super.AXUISettingsListController_opaque[v5];
  }

  return v6;
}

- (PSSpecifier)reduceMotionReduceSlideTransitionsSpecifier
{
  return self->_reduceMotionReduceSlideTransitionsSpecifier;
}

- (void)setReduceMotionReduceSlideTransitionsSpecifier:(id)a3
{
}

- (PSSpecifier)reduceMotionReduceSlideTransitionsFooterSpecifier
{
  return self->_reduceMotionReduceSlideTransitionsFooterSpecifier;
}

- (void)setReduceMotionReduceSlideTransitionsFooterSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reduceMotionReduceSlideTransitionsFooterSpecifier, 0);
  objc_storeStrong((id *)&self->_reduceMotionReduceSlideTransitionsSpecifier, 0);

  objc_storeStrong((id *)&self->_helper, 0);
}

@end