@interface SUMaskedViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityElementsHidden;
@end

@implementation SUMaskedViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUMaskedView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityElementsHidden
{
  [(SUMaskedViewAccessibility *)self accessibilityFrame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [MEMORY[0x263F1C920] mainScreen];
  [v11 bounds];
  v19.origin.x = v4;
  v19.origin.y = v6;
  v19.size.double width = v8;
  v19.size.double height = v10;
  CGRect v18 = CGRectIntersection(v17, v19);
  double width = v18.size.width;
  double height = v18.size.height;

  if (width < v8 * 0.5 || height < v10 * 0.5) {
    return 1;
  }
  v16.receiver = self;
  v16.super_class = (Class)SUMaskedViewAccessibility;
  return [(SUMaskedViewAccessibility *)&v16 accessibilityElementsHidden];
}

@end