@interface PLExpandableViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)setState:(int)a3 withDuration:(double)a4;
@end

@implementation PLExpandableViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PLExpandableView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)setState:(int)a3 withDuration:(double)a4
{
  v4.receiver = self;
  v4.super_class = (Class)PLExpandableViewAccessibility;
  [(PLExpandableViewAccessibility *)&v4 setState:*(void *)&a3 withDuration:a4];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end