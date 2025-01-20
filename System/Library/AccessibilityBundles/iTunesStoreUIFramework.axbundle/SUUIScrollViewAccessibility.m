@interface SUUIScrollViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)setTopExtensionViewColor:(id)a3;
@end

@implementation SUUIScrollViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIScrollView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)setTopExtensionViewColor:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SUUIScrollViewAccessibility;
  [(SUUIScrollViewAccessibility *)&v5 setTopExtensionViewColor:a3];
  v4 = [(SUUIScrollViewAccessibility *)self viewWithTag:800];
  [v4 setAccessibilityViewIsModal:0];
}

@end