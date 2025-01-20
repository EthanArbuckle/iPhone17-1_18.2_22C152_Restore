@interface NSLineFragmentRenderingContextAccessibility__UIKit__UIFoundation
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)drawAtPoint:(CGPoint)a3 inContext:(CGContext *)a4;
@end

@implementation NSLineFragmentRenderingContextAccessibility__UIKit__UIFoundation

+ (id)safeCategoryTargetClassName
{
  return @"NSLineFragmentRenderingContext";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v5 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = @"NSLineFragmentRenderingContext";
  [location[0] validateClass:"{CGPoint=dd}" hasInstanceMethod:"^{CGContext=}" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"imageBounds", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_storeStrong(v5, obj);
}

- (void)drawAtPoint:(CGPoint)a3 inContext:(CGContext *)a4
{
  CGPoint v21 = a3;
  v20 = self;
  SEL v19 = a2;
  v18 = a4;
  v17.receiver = self;
  v17.super_class = (Class)NSLineFragmentRenderingContextAccessibility__UIKit__UIFoundation;
  -[NSLineFragmentRenderingContextAccessibility__UIKit__UIFoundation drawAtPoint:inContext:](&v17, sel_drawAtPoint_inContext_, a4, a3.x, a3.y);
  char v15 = 0;
  objc_opt_class();
  id v8 = (id)[(NSLineFragmentRenderingContextAccessibility__UIKit__UIFoundation *)v20 _accessibilityValueForKey:@"AXStringToBeRenderedByContext"];
  id v14 = (id)__UIAccessibilityCastAsClass();

  id v13 = v14;
  objc_storeStrong(&v14, 0);
  id v16 = v13;
  [(NSLineFragmentRenderingContextAccessibility__UIKit__UIFoundation *)v20 safeCGRectForKey:@"imageBounds"];
  double v9 = v4;
  double v10 = v5;
  double v11 = v6;
  double v12 = v7;
  if (v18 && [v16 length]) {
    objc_msgSend(MEMORY[0x263F22290], "addLabel:boundingRect:withContext:", v16, v18, v9, v10, v11, v12);
  }
  objc_storeStrong(&v16, 0);
}

@end