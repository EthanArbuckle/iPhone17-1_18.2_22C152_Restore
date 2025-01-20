@interface UIWebFormSelectPeripheralAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)createPeripheralWithDOMHTMLSelectElement:(id)a3;
+ (id)safeCategoryTargetClassName;
@end

@implementation UIWebFormSelectPeripheralAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIWebFormSelectPeripheral";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (id)createPeripheralWithDOMHTMLSelectElement:(id)a3
{
  id v8 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v8;
  v5.super_class = (Class)&OBJC_METACLASS___UIWebFormSelectPeripheralAccessibility;
  id v6 = objc_msgSendSuper2(&v5, sel_createPeripheralWithDOMHTMLSelectElement_, location[0]);
  MEMORY[0x2455E6B10](0);
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
  id v4 = v6;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);

  return v4;
}

@end