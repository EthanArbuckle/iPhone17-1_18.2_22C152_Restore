@interface GAXSBDragAndDropWorkspaceTransactionOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_gaxHasLoggedDisallowedDrop;
- (void)_gaxSetHasLoggedDisallowedDrop:(BOOL)a3;
- (void)_updateCurrentDropActionForSession:(id)a3;
@end

@implementation GAXSBDragAndDropWorkspaceTransactionOverride

+ (id)safeCategoryTargetClassName
{
  return @"SBDragAndDropWorkspaceTransaction";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBDragAndDropWorkspaceTransaction", @"_updateCurrentDropActionForSession:", "v", "@", 0);
  [v3 validateClass:@"SBDragAndDropWorkspaceTransaction" hasInstanceVariable:@"_dropSession" withType:"SBApplicationDropSession"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplicationDropSession", @"systemSession", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIDraggingSystemSession", @"info", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIDraggingSystemSessionInfo", @"processIdentifier", "i", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"SBApplicationController", @"sharedInstance", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplicationController", @"applicationWithPid:", "@", "i", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplication", @"bundleIdentifier", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplicationDropSession", @"application", "@", 0);
}

- (BOOL)_gaxHasLoggedDisallowedDrop
{
  return ___UIAccessibilityGetAssociatedBool(self, &unk_37A29);
}

- (void)_gaxSetHasLoggedDisallowedDrop:(BOOL)a3
{
}

- (void)_updateCurrentDropActionForSession:(id)a3
{
  id v4 = a3;
  v5 = +[GAXSpringboard sharedInstanceIfExists];
  unsigned int v6 = [v5 isActive];

  if (!v6) {
    goto LABEL_5;
  }
  v7 = [(GAXSBDragAndDropWorkspaceTransactionOverride *)self safeValueForKey:@"_dropSession"];
  v8 = [v7 safeValueForKey:@"systemSession"];
  v9 = [v8 safeValueForKey:@"info"];
  unsigned int v10 = [v9 safeIntForKey:@"processIdentifier"];

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v26 = sub_AE90;
  v27 = sub_AEA0;
  id v28 = 0;
  v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472;
  v21 = sub_AEA8;
  v22 = &unk_28EC8;
  v23 = buf;
  unsigned int v24 = v10;
  AXPerformSafeBlock();
  id v11 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  v12 = [v11 safeStringForKey:@"bundleIdentifier"];

  v13 = [v7 safeValueForKey:@"application"];
  v14 = [v13 safeStringForKey:@"bundleIdentifier"];

  v15 = +[AXSettings sharedInstance];
  if ([v15 guidedAccessAllowsMultipleWindows])
  {
    unsigned __int8 v16 = [v12 isEqualToString:v14];

    if (v16)
    {

LABEL_5:
      v18.receiver = self;
      v18.super_class = (Class)GAXSBDragAndDropWorkspaceTransactionOverride;
      [(GAXSBDragAndDropWorkspaceTransactionOverride *)&v18 _updateCurrentDropActionForSession:v4];
      goto LABEL_12;
    }
  }
  else
  {
  }
  if (![(GAXSBDragAndDropWorkspaceTransactionOverride *)self _gaxHasLoggedDisallowedDrop])
  {
    v17 = GAXLogCommon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v14;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "Blocking drop. Source: %@, destination: %@", buf, 0x16u);
    }

    [(GAXSBDragAndDropWorkspaceTransactionOverride *)self _gaxSetHasLoggedDisallowedDrop:1];
  }

LABEL_12:
}

@end