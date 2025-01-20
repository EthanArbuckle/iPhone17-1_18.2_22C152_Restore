@interface NSStringDrawingTextStorageAccessibility__UIKit__UIFoundation
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)drawTextContainer:(id)a3 range:(_NSRange)a4 withRect:(CGRect)a5 graphicsContext:(CGContext *)a6 baselineMode:(BOOL)a7 scrollable:(BOOL)a8 padding:(double)a9;
@end

@implementation NSStringDrawingTextStorageAccessibility__UIKit__UIFoundation

+ (id)safeCategoryTargetClassName
{
  return @"NSStringDrawingTextStorage";
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
  id v4 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = @"NSStringDrawingTextStorage";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  [location[0] validateClass:@"NSConcreteNotifyingMutableAttributedString" isKindOfClass:@"NSAttributedString"];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"NSStringDrawingTextStorage", @"drawTextContainer:range:withRect:graphicsContext:baselineMode:scrollable:padding:", "v", "@", "{_NSRange=QQ}", "{CGRect={CGPoint=dd}{CGSize=dd}}", "^{CGContext=}", "B", "B", "d", 0);
  objc_storeStrong(v5, v4);
}

- (void)drawTextContainer:(id)a3 range:(_NSRange)a4 withRect:(CGRect)a5 graphicsContext:(CGContext *)a6 baselineMode:(BOOL)a7 scrollable:(BOOL)a8 padding:(double)a9
{
  _NSRange v26 = a4;
  CGRect v25 = a5;
  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v22 = a6;
  BOOL v21 = a7;
  BOOL v20 = a8;
  double v19 = a9;
  v18.receiver = v24;
  v18.super_class = (Class)NSStringDrawingTextStorageAccessibility__UIKit__UIFoundation;
  -[NSStringDrawingTextStorageAccessibility__UIKit__UIFoundation drawTextContainer:range:withRect:graphicsContext:baselineMode:scrollable:padding:](&v18, sel_drawTextContainer_range_withRect_graphicsContext_baselineMode_scrollable_padding_, location[0], v26.location, v26.length, a6, a7, a8, v25.origin.x, v25.origin.y, v25.size.width, v25.size.height, a9);
  char v16 = 0;
  objc_opt_class();
  id v13 = (id)[(NSStringDrawingTextStorageAccessibility__UIKit__UIFoundation *)v24 safeValueForKey:@"_contents"];
  id v15 = (id)__UIAccessibilityCastAsClass();

  id v14 = v15;
  objc_storeStrong(&v15, 0);
  id v17 = (id)[v14 string];

  if ([v17 length]) {
    objc_msgSend(MEMORY[0x263F22290], "addLabel:boundingRect:withContext:", v17, v22, v25.origin.x, v25.origin.y, v25.size.width, v25.size.height);
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

@end