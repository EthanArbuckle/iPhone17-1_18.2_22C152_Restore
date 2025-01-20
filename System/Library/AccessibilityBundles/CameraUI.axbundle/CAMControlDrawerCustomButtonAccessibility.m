@interface CAMControlDrawerCustomButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (CGRect)accessibilityFrame;
@end

@implementation CAMControlDrawerCustomButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMControlDrawerCustomButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateProtocol:@"CAMControlDrawerExpandableButton" hasMethod:@"isExpanded" isInstanceMethod:1 isRequired:1];
  [v3 validateClass:@"CAMControlDrawerCustomButton" conformsToProtocol:@"CAMControlDrawerExpandableButton"];
  [v3 validateClass:@"CAMControlDrawerCustomButton" isKindOfClass:@"CAMControlDrawerButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMControlDrawerButton", @"_backgroundView", "@", 0);
}

- (CGRect)accessibilityFrame
{
  if ([(CAMControlDrawerCustomButtonAccessibility *)self safeBoolForKey:@"isExpanded"])
  {
    id v3 = [(CAMControlDrawerCustomButtonAccessibility *)self safeValueForKey:@"_backgroundView"];
    [v3 accessibilityFrame];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)CAMControlDrawerCustomButtonAccessibility;
    [(CAMControlDrawerCustomButtonAccessibility *)&v20 accessibilityFrame];
    double v5 = v12;
    double v7 = v13;
    double v9 = v14;
    double v11 = v15;
  }
  double v16 = v5;
  double v17 = v7;
  double v18 = v9;
  double v19 = v11;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

@end