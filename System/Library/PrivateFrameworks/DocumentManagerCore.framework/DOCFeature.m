@interface DOCFeature
+ (BOOL)_UIPTabInfrastructureEnabled;
+ (BOOL)_docImplementation_uip_isFloatingTabBarEnabled;
+ (BOOL)_docImplementation_uip_isUIPDocumentLandingEnabled;
+ (BOOL)protectedAppsEnabled;
+ (BOOL)quickLookInSeparateProcess;
+ (BOOL)supportsQuickLookInSharedWindow;
+ (BOOL)supportsQuickLookInsteadOfOpen:(id)a3;
+ (DOCFeatureState)contextMenuShowsOpenWithApp;
+ (DOCFeatureState)dsEnumerationFPv2;
+ (DOCFeatureState)dsEnumerationLocal;
+ (DOCFeatureState)dsEnumerationSMB;
+ (DOCFeatureState)dsEnumerationUSB;
+ (DOCFeatureState)forceUnmount;
+ (DOCFeatureState)protectedApps;
+ (DOCFeatureState)quickLookAllDocumentsInFiles;
+ (DOCFeatureState)quickLookEntireFolderInWindow;
+ (DOCFeatureState)quickLookInWindow;
+ (DOCFeatureState)quickLookInWindowShared;
+ (DOCFeatureState)quickLookRestrictContentTypesThatOpenInWindow;
+ (DOCFeatureState)returnToSender;
+ (DOCFeatureState)semanticSearch;
+ (DOCFeatureState)showTips;
+ (DOCFeatureState)suggestedMoveToFolderInContextMenu;
+ (DOCFeatureState)usbDiskProperties;
+ (DOCFeatureState)usbEraseDialog;
+ (DOCFeatureState)usbRenameErase;
+ (DOCFeatureState)useBlastDoorThumbnails;
+ (DOCFeatureState)viewOptionsSizeSetting;
+ (DOCFeatureState)workaroundFor_113995648;
@end

@implementation DOCFeature

+ (BOOL)protectedAppsEnabled
{
  v2 = +[DOCFeature protectedApps];
  char v3 = [v2 isEnabled];

  return v3;
}

+ (DOCFeatureState)protectedApps
{
  if (protectedApps_onceToken != -1) {
    dispatch_once(&protectedApps_onceToken, &__block_literal_global_82);
  }
  v2 = (void *)protectedApps_cachedValue;
  return (DOCFeatureState *)v2;
}

+ (BOOL)_UIPTabInfrastructureEnabled
{
  Class v3 = NSClassFromString(&cfstr_Uitabbarcontro.isa);
  if (objc_opt_respondsToSelector())
  {
    return [(objc_class *)v3 _uip_isFloatingTabBarEnabled];
  }
  else
  {
    return objc_msgSend(a1, "_docImplementation_uip_isFloatingTabBarEnabled");
  }
}

+ (DOCFeatureState)returnToSender
{
  if (returnToSender_onceToken != -1) {
    dispatch_once(&returnToSender_onceToken, &__block_literal_global_59);
  }
  v2 = (void *)returnToSender_cachedValue;
  return (DOCFeatureState *)v2;
}

+ (DOCFeatureState)useBlastDoorThumbnails
{
  if (useBlastDoorThumbnails_onceToken != -1) {
    dispatch_once(&useBlastDoorThumbnails_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)useBlastDoorThumbnails_cachedValue;
  return (DOCFeatureState *)v2;
}

+ (DOCFeatureState)showTips
{
  if (showTips_onceToken != -1) {
    dispatch_once(&showTips_onceToken, &__block_literal_global_67);
  }
  v2 = (void *)showTips_cachedValue;
  return (DOCFeatureState *)v2;
}

+ (DOCFeatureState)viewOptionsSizeSetting
{
  if (viewOptionsSizeSetting_onceToken != -1) {
    dispatch_once(&viewOptionsSizeSetting_onceToken, &__block_literal_global_110);
  }
  v2 = (void *)viewOptionsSizeSetting_cachedValue;
  return (DOCFeatureState *)v2;
}

uint64_t __36__DOCFeature_useBlastDoorThumbnails__block_invoke()
{
  v0 = [DOCFeatureStateFFSetting alloc];
  uint64_t v1 = [(DOCFeatureStateFFSetting *)v0 initWithDomainID:@"DocumentManager" featureID:@"UseBlastDoorThumbnails" overrideKey:0 valueMode:0 requirements:MEMORY[0x263EFFA68]];
  uint64_t v2 = useBlastDoorThumbnails_cachedValue;
  useBlastDoorThumbnails_cachedValue = v1;
  return MEMORY[0x270F9A758](v1, v2);
}

uint64_t __32__DOCFeature_dsEnumerationLocal__block_invoke()
{
  v0 = [DOCFeatureStateFFSetting alloc];
  uint64_t v1 = [(DOCFeatureStateFFSetting *)v0 initWithDomainID:@"DocumentManager" featureID:@"DSEnumeration_Local" overrideKey:0 valueMode:0 requirements:MEMORY[0x263EFFA68]];
  uint64_t v2 = dsEnumerationLocal_cachedValue;
  dsEnumerationLocal_cachedValue = v1;
  return MEMORY[0x270F9A758](v1, v2);
}

uint64_t __28__DOCFeature_returnToSender__block_invoke()
{
  v0 = [DOCFeatureStateFFSetting alloc];
  uint64_t v1 = [(DOCFeatureStateFFSetting *)v0 initWithDomainID:@"Synapse" featureID:@"ReturnToSender" overrideKey:0 valueMode:0 requirements:MEMORY[0x263EFFA68]];
  uint64_t v2 = returnToSender_cachedValue;
  returnToSender_cachedValue = v1;
  return MEMORY[0x270F9A758](v1, v2);
}

uint64_t __22__DOCFeature_showTips__block_invoke()
{
  v0 = [DOCFeatureStateFFSetting alloc];
  uint64_t v1 = [(DOCFeatureStateFFSetting *)v0 initWithDomainID:@"DocumentManager" featureID:@"ShowTips" overrideKey:0 valueMode:1 requirements:MEMORY[0x263EFFA68]];
  uint64_t v2 = showTips_cachedValue;
  showTips_cachedValue = v1;
  return MEMORY[0x270F9A758](v1, v2);
}

uint64_t __27__DOCFeature_protectedApps__block_invoke()
{
  v0 = [DOCFeatureStateFFSetting alloc];
  uint64_t v1 = [(DOCFeatureStateFFSetting *)v0 initWithDomainID:@"AppProtection" featureID:@"protected_apps" overrideKey:0 valueMode:0 requirements:MEMORY[0x263EFFA68]];
  uint64_t v2 = protectedApps_cachedValue;
  protectedApps_cachedValue = v1;
  return MEMORY[0x270F9A758](v1, v2);
}

uint64_t __36__DOCFeature_viewOptionsSizeSetting__block_invoke()
{
  v0 = [DOCFeatureStateFFSetting alloc];
  uint64_t v1 = [(DOCFeatureStateFFSetting *)v0 initWithDomainID:@"DocumentManager" featureID:@"ViewOptionsSizeSetting" overrideKey:0 valueMode:0 requirements:MEMORY[0x263EFFA68]];
  uint64_t v2 = viewOptionsSizeSetting_cachedValue;
  viewOptionsSizeSetting_cachedValue = v1;
  return MEMORY[0x270F9A758](v1, v2);
}

+ (DOCFeatureState)dsEnumerationLocal
{
  if (dsEnumerationLocal_onceToken != -1) {
    dispatch_once(&dsEnumerationLocal_onceToken, &__block_literal_global_100);
  }
  uint64_t v2 = (void *)dsEnumerationLocal_cachedValue;
  return (DOCFeatureState *)v2;
}

+ (DOCFeatureState)quickLookInWindow
{
  if (quickLookInWindow_onceToken != -1) {
    dispatch_once(&quickLookInWindow_onceToken, &__block_literal_global_9);
  }
  uint64_t v2 = (void *)quickLookInWindow_cachedValue;
  return (DOCFeatureState *)v2;
}

uint64_t __31__DOCFeature_quickLookInWindow__block_invoke()
{
  v0 = [DOCFeatureStateFFSetting alloc];
  uint64_t v1 = [(DOCFeatureStateFFSetting *)v0 initWithDomainID:@"DocumentManager" featureID:@"QuickLookInSeparateWindow" overrideKey:0 valueMode:0 requirements:MEMORY[0x263EFFA68]];
  uint64_t v2 = quickLookInWindow_cachedValue;
  quickLookInWindow_cachedValue = v1;
  return MEMORY[0x270F9A758](v1, v2);
}

+ (DOCFeatureState)quickLookEntireFolderInWindow
{
  if (quickLookEntireFolderInWindow_onceToken != -1) {
    dispatch_once(&quickLookEntireFolderInWindow_onceToken, &__block_literal_global_14);
  }
  uint64_t v2 = (void *)quickLookEntireFolderInWindow_cachedValue;
  return (DOCFeatureState *)v2;
}

uint64_t __43__DOCFeature_quickLookEntireFolderInWindow__block_invoke()
{
  v0 = [DOCFeatureStateFFSetting alloc];
  uint64_t v1 = [(DOCFeatureStateFFSetting *)v0 initWithDomainID:@"DocumentManager" featureID:@"QuickLookEntireFolderInWindow" overrideKey:0 valueMode:2 requirements:MEMORY[0x263EFFA68]];
  uint64_t v2 = quickLookEntireFolderInWindow_cachedValue;
  quickLookEntireFolderInWindow_cachedValue = v1;
  return MEMORY[0x270F9A758](v1, v2);
}

+ (DOCFeatureState)quickLookRestrictContentTypesThatOpenInWindow
{
  if (quickLookRestrictContentTypesThatOpenInWindow_onceToken != -1) {
    dispatch_once(&quickLookRestrictContentTypesThatOpenInWindow_onceToken, &__block_literal_global_19);
  }
  uint64_t v2 = (void *)quickLookRestrictContentTypesThatOpenInWindow_cachedValue;
  return (DOCFeatureState *)v2;
}

uint64_t __59__DOCFeature_quickLookRestrictContentTypesThatOpenInWindow__block_invoke()
{
  v0 = [DOCFeatureStateFFSetting alloc];
  uint64_t v1 = [(DOCFeatureStateFFSetting *)v0 initWithDomainID:@"DocumentManager" featureID:@"QuickLookRestrictContentTypesThatOpenInSeparateWindow" overrideKey:0 valueMode:0 requirements:MEMORY[0x263EFFA68]];
  uint64_t v2 = quickLookRestrictContentTypesThatOpenInWindow_cachedValue;
  quickLookRestrictContentTypesThatOpenInWindow_cachedValue = v1;
  return MEMORY[0x270F9A758](v1, v2);
}

+ (DOCFeatureState)quickLookInWindowShared
{
  if (quickLookInWindowShared_onceToken != -1) {
    dispatch_once(&quickLookInWindowShared_onceToken, &__block_literal_global_24);
  }
  uint64_t v2 = (void *)quickLookInWindowShared_cachedValue;
  return (DOCFeatureState *)v2;
}

uint64_t __37__DOCFeature_quickLookInWindowShared__block_invoke()
{
  v0 = [DOCFeatureStateFFSetting alloc];
  uint64_t v1 = [(DOCFeatureStateFFSetting *)v0 initWithDomainID:@"DocumentManager" featureID:@"QuickLookInSeparateSharedWindow" overrideKey:0 valueMode:0 requirements:MEMORY[0x263EFFA68]];
  uint64_t v2 = quickLookInWindowShared_cachedValue;
  quickLookInWindowShared_cachedValue = v1;
  return MEMORY[0x270F9A758](v1, v2);
}

+ (DOCFeatureState)quickLookAllDocumentsInFiles
{
  if (quickLookAllDocumentsInFiles_onceToken != -1) {
    dispatch_once(&quickLookAllDocumentsInFiles_onceToken, &__block_literal_global_29);
  }
  uint64_t v2 = (void *)quickLookAllDocumentsInFiles_cachedValue;
  return (DOCFeatureState *)v2;
}

uint64_t __42__DOCFeature_quickLookAllDocumentsInFiles__block_invoke()
{
  v0 = [DOCFeatureStateFFSetting alloc];
  uint64_t v1 = [(DOCFeatureStateFFSetting *)v0 initWithDomainID:@"DocumentManager" featureID:@"QuickLookAllDocumentsInFilesFirst" overrideKey:0 valueMode:0 requirements:MEMORY[0x263EFFA68]];
  uint64_t v2 = quickLookAllDocumentsInFiles_cachedValue;
  quickLookAllDocumentsInFiles_cachedValue = v1;
  return MEMORY[0x270F9A758](v1, v2);
}

+ (DOCFeatureState)suggestedMoveToFolderInContextMenu
{
  if (suggestedMoveToFolderInContextMenu_onceToken != -1) {
    dispatch_once(&suggestedMoveToFolderInContextMenu_onceToken, &__block_literal_global_34);
  }
  uint64_t v2 = (void *)suggestedMoveToFolderInContextMenu_cachedValue;
  return (DOCFeatureState *)v2;
}

uint64_t __48__DOCFeature_suggestedMoveToFolderInContextMenu__block_invoke()
{
  v0 = [DOCFeatureStateFFSetting alloc];
  uint64_t v1 = [(DOCFeatureStateFFSetting *)v0 initWithDomainID:@"DocumentManager" featureID:@"SuggestedMoveToFolderInContextMenu" overrideKey:0 valueMode:0 requirements:MEMORY[0x263EFFA68]];
  uint64_t v2 = suggestedMoveToFolderInContextMenu_cachedValue;
  suggestedMoveToFolderInContextMenu_cachedValue = v1;
  return MEMORY[0x270F9A758](v1, v2);
}

+ (DOCFeatureState)usbRenameErase
{
  if (usbRenameErase_onceToken != -1) {
    dispatch_once(&usbRenameErase_onceToken, &__block_literal_global_39);
  }
  uint64_t v2 = (void *)usbRenameErase_cachedValue;
  return (DOCFeatureState *)v2;
}

uint64_t __28__DOCFeature_usbRenameErase__block_invoke()
{
  v0 = [DOCFeatureStateFFSetting alloc];
  uint64_t v1 = [(DOCFeatureStateFFSetting *)v0 initWithDomainID:@"DocumentManager" featureID:@"USBRenameReformat" overrideKey:0 valueMode:1 requirements:MEMORY[0x263EFFA68]];
  uint64_t v2 = usbRenameErase_cachedValue;
  usbRenameErase_cachedValue = v1;
  return MEMORY[0x270F9A758](v1, v2);
}

+ (DOCFeatureState)usbEraseDialog
{
  if (usbEraseDialog_onceToken != -1) {
    dispatch_once(&usbEraseDialog_onceToken, &__block_literal_global_44);
  }
  uint64_t v2 = (void *)usbEraseDialog_cachedValue;
  return (DOCFeatureState *)v2;
}

uint64_t __28__DOCFeature_usbEraseDialog__block_invoke()
{
  v0 = [DOCFeatureStateFFSetting alloc];
  uint64_t v1 = [(DOCFeatureStateFFSetting *)v0 initWithDomainID:@"DocumentManager" featureID:@"USBReformatDialog" overrideKey:0 valueMode:0 requirements:MEMORY[0x263EFFA68]];
  uint64_t v2 = usbEraseDialog_cachedValue;
  usbEraseDialog_cachedValue = v1;
  return MEMORY[0x270F9A758](v1, v2);
}

+ (DOCFeatureState)usbDiskProperties
{
  if (usbDiskProperties_onceToken != -1) {
    dispatch_once(&usbDiskProperties_onceToken, &__block_literal_global_49);
  }
  uint64_t v2 = (void *)usbDiskProperties_cachedValue;
  return (DOCFeatureState *)v2;
}

uint64_t __31__DOCFeature_usbDiskProperties__block_invoke()
{
  v0 = [DOCFeatureStateFFSetting alloc];
  uint64_t v1 = [(DOCFeatureStateFFSetting *)v0 initWithDomainID:@"DocumentManager" featureID:@"USBDiskProperties" overrideKey:0 valueMode:1 requirements:MEMORY[0x263EFFA68]];
  uint64_t v2 = usbDiskProperties_cachedValue;
  usbDiskProperties_cachedValue = v1;
  return MEMORY[0x270F9A758](v1, v2);
}

+ (DOCFeatureState)forceUnmount
{
  if (forceUnmount_onceToken != -1) {
    dispatch_once(&forceUnmount_onceToken, &__block_literal_global_54);
  }
  uint64_t v2 = (void *)forceUnmount_cachedValue;
  return (DOCFeatureState *)v2;
}

uint64_t __26__DOCFeature_forceUnmount__block_invoke()
{
  v0 = [DOCFeatureStateFFSetting alloc];
  uint64_t v1 = [(DOCFeatureStateFFSetting *)v0 initWithDomainID:@"DocumentManager" featureID:@"USBForceUnmount" overrideKey:0 valueMode:0 requirements:MEMORY[0x263EFFA68]];
  uint64_t v2 = forceUnmount_cachedValue;
  forceUnmount_cachedValue = v1;
  return MEMORY[0x270F9A758](v1, v2);
}

+ (DOCFeatureState)semanticSearch
{
  if (semanticSearch_onceToken != -1) {
    dispatch_once(&semanticSearch_onceToken, &__block_literal_global_72);
  }
  uint64_t v2 = (void *)semanticSearch_cachedValue;
  return (DOCFeatureState *)v2;
}

uint64_t __28__DOCFeature_semanticSearch__block_invoke()
{
  v0 = [DOCFeatureStateFFSetting alloc];
  uint64_t v1 = [(DOCFeatureStateFFSetting *)v0 initWithDomainID:@"DocumentManager" featureID:@"SemanticSearch" overrideKey:0 valueMode:0 requirements:MEMORY[0x263EFFA68]];
  uint64_t v2 = semanticSearch_cachedValue;
  semanticSearch_cachedValue = v1;
  return MEMORY[0x270F9A758](v1, v2);
}

+ (DOCFeatureState)workaroundFor_113995648
{
  if (workaroundFor_113995648_onceToken != -1) {
    dispatch_once(&workaroundFor_113995648_onceToken, &__block_literal_global_77);
  }
  uint64_t v2 = (void *)workaroundFor_113995648_cachedValue;
  return (DOCFeatureState *)v2;
}

uint64_t __37__DOCFeature_workaroundFor_113995648__block_invoke()
{
  v0 = [DOCFeatureStateFFSetting alloc];
  uint64_t v1 = [(DOCFeatureStateFFSetting *)v0 initWithDomainID:@"DocumentManager" featureID:@"WorkaroundFor_113995648" overrideKey:0 valueMode:0 requirements:MEMORY[0x263EFFA68]];
  uint64_t v2 = workaroundFor_113995648_cachedValue;
  workaroundFor_113995648_cachedValue = v1;
  return MEMORY[0x270F9A758](v1, v2);
}

+ (DOCFeatureState)dsEnumerationUSB
{
  if (dsEnumerationUSB_onceToken != -1) {
    dispatch_once(&dsEnumerationUSB_onceToken, &__block_literal_global_90);
  }
  uint64_t v2 = (void *)dsEnumerationUSB_cachedValue;
  return (DOCFeatureState *)v2;
}

uint64_t __30__DOCFeature_dsEnumerationUSB__block_invoke()
{
  v0 = [DOCFeatureStateFFSetting alloc];
  uint64_t v1 = [(DOCFeatureStateFFSetting *)v0 initWithDomainID:@"DocumentManager" featureID:@"DSEnumeration_USB" overrideKey:0 valueMode:0 requirements:MEMORY[0x263EFFA68]];
  uint64_t v2 = dsEnumerationUSB_cachedValue;
  dsEnumerationUSB_cachedValue = v1;
  return MEMORY[0x270F9A758](v1, v2);
}

+ (DOCFeatureState)dsEnumerationFPv2
{
  if (dsEnumerationFPv2_onceToken != -1) {
    dispatch_once(&dsEnumerationFPv2_onceToken, &__block_literal_global_95);
  }
  uint64_t v2 = (void *)dsEnumerationFPv2_cachedValue;
  return (DOCFeatureState *)v2;
}

uint64_t __31__DOCFeature_dsEnumerationFPv2__block_invoke()
{
  v0 = [DOCFeatureStateFFSetting alloc];
  uint64_t v1 = [(DOCFeatureStateFFSetting *)v0 initWithDomainID:@"DocumentManager" featureID:@"DSEnumeration_FPv2" overrideKey:0 valueMode:0 requirements:MEMORY[0x263EFFA68]];
  uint64_t v2 = dsEnumerationFPv2_cachedValue;
  dsEnumerationFPv2_cachedValue = v1;
  return MEMORY[0x270F9A758](v1, v2);
}

+ (DOCFeatureState)dsEnumerationSMB
{
  if (dsEnumerationSMB_onceToken != -1) {
    dispatch_once(&dsEnumerationSMB_onceToken, &__block_literal_global_105);
  }
  uint64_t v2 = (void *)dsEnumerationSMB_cachedValue;
  return (DOCFeatureState *)v2;
}

uint64_t __30__DOCFeature_dsEnumerationSMB__block_invoke()
{
  v0 = [DOCFeatureStateFFSetting alloc];
  uint64_t v1 = [(DOCFeatureStateFFSetting *)v0 initWithDomainID:@"DocumentManager" featureID:@"DSEnumeration_SMB" overrideKey:0 valueMode:0 requirements:MEMORY[0x263EFFA68]];
  uint64_t v2 = dsEnumerationSMB_cachedValue;
  dsEnumerationSMB_cachedValue = v1;
  return MEMORY[0x270F9A758](v1, v2);
}

+ (DOCFeatureState)contextMenuShowsOpenWithApp
{
  if (contextMenuShowsOpenWithApp_onceToken != -1) {
    dispatch_once(&contextMenuShowsOpenWithApp_onceToken, &__block_literal_global_115);
  }
  uint64_t v2 = (void *)contextMenuShowsOpenWithApp_cachedValue;
  return (DOCFeatureState *)v2;
}

uint64_t __41__DOCFeature_contextMenuShowsOpenWithApp__block_invoke()
{
  v0 = [DOCFeatureStateFFSetting alloc];
  uint64_t v1 = [(DOCFeatureStateFFSetting *)v0 initWithDomainID:@"DocumentManager" featureID:@"ContextMenuShowsOpenWithApp" overrideKey:0 valueMode:0 requirements:MEMORY[0x263EFFA68]];
  uint64_t v2 = contextMenuShowsOpenWithApp_cachedValue;
  contextMenuShowsOpenWithApp_cachedValue = v1;
  return MEMORY[0x270F9A758](v1, v2);
}

+ (BOOL)_docImplementation_uip_isUIPDocumentLandingEnabled
{
  if (_docImplementation_uip_isUIPDocumentLandingEnabled_onceToken != -1) {
    dispatch_once(&_docImplementation_uip_isUIPDocumentLandingEnabled_onceToken, &__block_literal_global_123);
  }
  return _docImplementation_uip_isUIPDocumentLandingEnabled_enabled;
}

void __64__DOCFeature__docImplementation_uip_isUIPDocumentLandingEnabled__block_invoke()
{
  _docImplementation_uip_isUIPDocumentLandingEnabled_enabled = (MGGetSInt32Answer() & 0xFFFFFFFD) == 1;
  int v0 = dyld_program_sdk_at_least();
  if (v0) {
    LOBYTE(v0) = _os_feature_enabled_impl();
  }
  _docImplementation_uip_isUIPDocumentLandingEnabled_enabled = v0;
  id v2 = (id)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.UIKit"];
  char v1 = [v2 BOOLForKey:@"ForceDocumentViewControllerDocumentLanding"];
  _docImplementation_uip_isUIPDocumentLandingEnabled_enabled |= v1;
}

+ (BOOL)_docImplementation_uip_isFloatingTabBarEnabled
{
  if (_docImplementation_uip_isFloatingTabBarEnabled_onceToken != -1) {
    dispatch_once(&_docImplementation_uip_isFloatingTabBarEnabled_onceToken, &__block_literal_global_133);
  }
  return _docImplementation_uip_isFloatingTabBarEnabled_wantsFloatingTabBar;
}

void __60__DOCFeature__docImplementation_uip_isFloatingTabBarEnabled__block_invoke()
{
  if (dyld_program_sdk_at_least())
  {
    int v0 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.UIKit"];
    id v2 = [v0 objectForKey:@"UseFloatingTabBar"];

    if (v2) {
      char v1 = [v2 BOOLValue];
    }
    else {
      char v1 = _os_feature_enabled_impl();
    }
    _docImplementation_uip_isFloatingTabBarEnabled_wantsFloatingTabBar = v1;
  }
}

+ (BOOL)supportsQuickLookInSharedWindow
{
  Class v3 = [a1 quickLookInWindow];
  if ([v3 isEnabled])
  {
    v4 = [a1 quickLookInWindowShared];
    char v5 = [v4 isEnabled];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)supportsQuickLookInsteadOfOpen:(id)a3
{
  id v4 = a3;
  char v5 = [a1 quickLookAllDocumentsInFiles];
  if ([v5 isEnabled]) {
    char v6 = [v4 isFilesApp];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

+ (BOOL)quickLookInSeparateProcess
{
  return 0;
}

@end