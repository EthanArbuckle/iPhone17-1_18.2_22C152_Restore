@interface UIWebPlugInViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)webPlugInStart;
@end

@implementation UIWebPlugInViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIWebPlugInView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)webPlugInStart
{
  v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UIWebPlugInViewAccessibility;
  [(UIWebPlugInViewAccessibility *)&v2 webPlugInStart];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end