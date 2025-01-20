@interface MRUActivityTrailingAccessoryViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)setRouteImage:(id)a3;
@end

@implementation MRUActivityTrailingAccessoryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MRUActivityTrailingAccessoryView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUActivityTrailingAccessoryView", @"setRouteImage:", "v", "@", 0);
  [v3 validateClass:@"MRUActivityNowPlayingView"];
}

- (void)setRouteImage:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MRUActivityTrailingAccessoryViewAccessibility;
  [(MRUActivityTrailingAccessoryViewAccessibility *)&v6 setRouteImage:a3];
  v4 = [(MRUActivityTrailingAccessoryViewAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Mruactivitynow.isa)];
  v5 = v4;
  if (v4) {
    [v4 _accessibilityLoadAccessibilityInformation];
  }
}

@end