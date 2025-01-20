@interface MRUViewServiceRoutingViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)updateVisibility;
@end

@implementation MRUViewServiceRoutingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MRUViewServiceRoutingView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)updateVisibility
{
  v2.receiver = self;
  v2.super_class = (Class)MRUViewServiceRoutingViewAccessibility;
  [(MRUViewServiceRoutingViewAccessibility *)&v2 updateVisibility];
  AXPerformBlockOnMainThreadAfterDelay();
}

void __58__MRUViewServiceRoutingViewAccessibility_updateVisibility__block_invoke(uint64_t a1)
{
}

@end