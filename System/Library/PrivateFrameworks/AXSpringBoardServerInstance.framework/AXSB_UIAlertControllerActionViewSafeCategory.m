@interface AXSB_UIAlertControllerActionViewSafeCategory
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)layoutSubviews;
@end

@implementation AXSB_UIAlertControllerActionViewSafeCategory

+ (id)safeCategoryTargetClassName
{
  return @"_UIAlertControllerActionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_UIAlertControllerActionView", @"action", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIAlertAction", @"title", "@", 0);
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)AXSB_UIAlertControllerActionViewSafeCategory;
  [(AXSB_UIAlertControllerActionViewSafeCategory *)&v10 layoutSubviews];
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsClass();
  objc_opt_class();
  v4 = [v3 safeValueForKey:@"action"];
  v5 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  v6 = [v5 safeValueForKey:@"title"];
  v7 = __UIAccessibilityCastAsClass();

  int v8 = [v5 _isChecked];
  uint64_t v9 = *MEMORY[0x263F832A8];
  if (!v8) {
    uint64_t v9 = 0;
  }
  [(AXSB_UIAlertControllerActionViewSafeCategory *)self setAccessibilityTraits:*MEMORY[0x263F83260] | v9];
  [(AXSB_UIAlertControllerActionViewSafeCategory *)self setAccessibilityLabel:v7];
}

@end