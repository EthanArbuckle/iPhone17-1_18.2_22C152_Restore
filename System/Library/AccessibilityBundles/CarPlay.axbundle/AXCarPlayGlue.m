@interface AXCarPlayGlue
+ (void)accessibilityInitializeBundle;
- (AXCarPlayGlue)init;
- (AXFrontBoardProcessWatcher)watcher;
- (void)setWatcher:(id)a3;
@end

@implementation AXCarPlayGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_267 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_276];

    _Failover = [objc_allocWithZone((Class)AXCarPlayGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __46__AXCarPlayGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __46__AXCarPlayGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"CarPlay AX"];
  [v2 setOverrideProcessName:@"CarPlay"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __46__AXCarPlayGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"CARFolderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CarZoomButtonViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CARApplicationAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CARIconScrollViewAccessibility" canInteractWithTargetClass:1];
}

- (AXCarPlayGlue)init
{
  v5.receiver = self;
  v5.super_class = (Class)AXCarPlayGlue;
  id v2 = [(AXCarPlayGlue *)&v5 init];
  v3 = objc_opt_new();
  [(AXCarPlayGlue *)v2 setWatcher:v3];

  return v2;
}

- (AXFrontBoardProcessWatcher)watcher
{
  return self->_watcher;
}

- (void)setWatcher:(id)a3
{
}

- (void).cxx_destruct
{
}

@end