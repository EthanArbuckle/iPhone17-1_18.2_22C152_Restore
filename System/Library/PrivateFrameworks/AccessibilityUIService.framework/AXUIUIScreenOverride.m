@interface AXUIUIScreenOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (UIEdgeInsets)_displayPeripheryInsetsRestrictedToScene;
@end

@implementation AXUIUIScreenOverride

+ (id)safeCategoryTargetClassName
{
  return @"UIScreen";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIScreen", @"_isMainScreen", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIScreen", @"_displayPeripheryInsetsRestrictedToScene", "{UIEdgeInsets=dddd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIScreen", @"_displayPeripheryInsets", "{UIEdgeInsets=dddd}", 0);
}

- (UIEdgeInsets)_displayPeripheryInsetsRestrictedToScene
{
  if ([(AXUIUIScreenOverride *)self safeBoolForKey:@"_isMainScreen"])
  {
    objc_opt_class();
    id v3 = [(AXUIUIScreenOverride *)self safeValueForKey:@"_displayPeripheryInsets"];
    v4 = __UIAccessibilityCastAsClass();

    [v4 UIEdgeInsetsValue];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)AXUIUIScreenOverride;
    [(AXUIUIScreenOverride *)&v21 _displayPeripheryInsetsRestrictedToScene];
    double v6 = v13;
    double v8 = v14;
    double v10 = v15;
    double v12 = v16;
  }
  double v17 = v6;
  double v18 = v8;
  double v19 = v10;
  double v20 = v12;
  result.right = v20;
  result.bottom = v19;
  result.left = v18;
  result.top = v17;
  return result;
}

@end