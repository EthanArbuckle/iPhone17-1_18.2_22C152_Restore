@interface GAX_WKContentViewOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_gaxIsInTestingScenario;
- (id)_contextMenuInteraction:(id)a3 overrideSuggestedActionsForConfiguration:(id)a4;
- (void)continueContextMenuInteraction:(id)a3;
- (void)continueContextMenuInteractionWithDataDetectors:(id)a3;
@end

@implementation GAX_WKContentViewOverride

+ (id)safeCategoryTargetClassName
{
  return @"WKContentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WKContentView", @"continueContextMenuInteractionWithDataDetectors:", "v", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WKContentView", @"_contextMenuInteraction:overrideSuggestedActionsForConfiguration:", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WKContentView", @"continueContextMenuInteraction:", "v", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WKContentView", @"_contentsOfUserInterfaceItem:", "@", "@", 0);
}

- (BOOL)_gaxIsInTestingScenario
{
  v2 = +[UIAutonomousSingleAppModeSession currentlyActiveSession];
  id v3 = [v2 effectiveConfiguration];

  if (v3 && [v3 style] != (char *)&dword_0 + 3)
  {
    v5 = SecTaskCreateFromSelf(kCFAllocatorDefault);
    if (GAXSecTaskHasBooleanEntitlement(v5, kAXAACLegacyEntitlement))
    {
      char HasBooleanEntitlement = 1;
      if (!v5) {
        goto LABEL_9;
      }
    }
    else
    {
      char HasBooleanEntitlement = GAXSecTaskHasBooleanEntitlement(v5, kAXAACEntitlement);
      if (!v5) {
        goto LABEL_9;
      }
    }
    CFRelease(v5);
    goto LABEL_9;
  }
  char HasBooleanEntitlement = 0;
LABEL_9:

  return HasBooleanEntitlement;
}

- (void)continueContextMenuInteractionWithDataDetectors:(id)a3
{
  v4 = (void (**)(id, void))a3;
  if ([(GAX_WKContentViewOverride *)self _gaxIsInTestingScenario])
  {
    v4[2](v4, 0);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)GAX_WKContentViewOverride;
    [(GAX_WKContentViewOverride *)&v5 continueContextMenuInteractionWithDataDetectors:v4];
  }
}

- (void)continueContextMenuInteraction:(id)a3
{
  v4 = (void (**)(id, void))a3;
  if (![(GAX_WKContentViewOverride *)self _gaxIsInTestingScenario]) {
    goto LABEL_12;
  }
  char v26 = 0;
  objc_opt_class();
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = sub_72CC;
  v24 = sub_72DC;
  id v25 = 0;
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_72E4;
  v17 = &unk_14B98;
  v18 = self;
  v19 = &v20;
  AXPerformSafeBlock();
  id v5 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  v6 = __UIAccessibilityCastAsClass();

  if (v26) {
    abort();
  }
  v7 = [v6 objectForKeyedSubscript:@"contextMenu"];
  v8 = [v7 objectForKeyedSubscript:@"isImage"];

  v9 = [v6 objectForKeyedSubscript:@"contextMenu"];
  v10 = [v9 objectForKeyedSubscript:@"isLink"];

  if (!v8 || !v10)
  {
    v12 = AXLogValidations();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      sub_B6D0((uint64_t)v8, (uint64_t)v10, v12);
    }

    goto LABEL_11;
  }
  if (![v8 BOOLValue])
  {
LABEL_11:

    goto LABEL_12;
  }
  unsigned __int8 v11 = [v10 BOOLValue];

  if (v11)
  {
LABEL_12:
    v13.receiver = self;
    v13.super_class = (Class)GAX_WKContentViewOverride;
    [(GAX_WKContentViewOverride *)&v13 continueContextMenuInteraction:v4];
    goto LABEL_13;
  }
  v4[2](v4, 0);
LABEL_13:
}

- (id)_contextMenuInteraction:(id)a3 overrideSuggestedActionsForConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)GAX_WKContentViewOverride;
  v8 = [(GAX_WKContentViewOverride *)&v13 _contextMenuInteraction:v6 overrideSuggestedActionsForConfiguration:v7];
  if ([(GAX_WKContentViewOverride *)self _gaxIsInTestingScenario])
  {
    objc_opt_class();
    v9 = __UIAccessibilityCastAsClass();
    v10 = v9;
    if (v9)
    {
      uint64_t v11 = objc_msgSend(v9, "ax_filteredArrayUsingBlock:", &stru_14BD8);

      v8 = (void *)v11;
    }
  }

  return v8;
}

@end