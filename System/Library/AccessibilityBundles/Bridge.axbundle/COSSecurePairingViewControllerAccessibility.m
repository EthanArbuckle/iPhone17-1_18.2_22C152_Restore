@interface COSSecurePairingViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
@end

@implementation COSSecurePairingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"COSSecurePairingViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)COSSecurePairingViewControllerAccessibility;
  v4 = [(COSSecurePairingViewControllerAccessibility *)&v10 tableView:a3 cellForRowAtIndexPath:a4];
  v5 = (void *)MEMORY[0x263F21660];
  v6 = [v4 textLabel];
  v7 = [v6 text];
  v8 = [v5 stringWithString:v7];

  [v8 setAttribute:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F21888]];
  [v4 setAccessibilityLabel:v8];

  return v4;
}

@end