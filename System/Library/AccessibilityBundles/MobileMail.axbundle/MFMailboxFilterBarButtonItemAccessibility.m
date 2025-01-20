@interface MFMailboxFilterBarButtonItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (MFMailboxFilterBarButtonItemAccessibility)initWithTarget:(id)a3 action:(SEL)a4;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation MFMailboxFilterBarButtonItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MFMailboxFilterBarButtonItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFMailboxFilterBarButtonItem", @"initWithTarget:action:", "@", "@", ":", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFMailboxFilterBarButtonItem", @"isFilterEnabled", "B", 0);
  [v3 validateClass:@"MFMailboxFilterBarButtonItem" isKindOfClass:@"UIBarButtonItem"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIBarButtonItem", @"view", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v8.receiver = self;
  v8.super_class = (Class)MFMailboxFilterBarButtonItemAccessibility;
  [(MFMailboxFilterBarButtonItemAccessibility *)&v8 _accessibilityLoadAccessibilityInformation];
  id v3 = [(MFMailboxFilterBarButtonItemAccessibility *)self safeValueForKey:@"_view"];
  v4 = (void *)[(MFMailboxFilterBarButtonItemAccessibility *)self accessibilityTraits];
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __87__MFMailboxFilterBarButtonItemAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v5[3] = &unk_2651334B8;
  objc_copyWeak(v6, &location);
  v6[1] = v4;
  [v3 _setAccessibilityTraitsBlock:v5];
  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
}

uint64_t __87__MFMailboxFilterBarButtonItemAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v3 = [WeakRetained safeBoolForKey:@"isFilterEnabled"];

  uint64_t v4 = *MEMORY[0x263F1CF38];
  if (!v3) {
    uint64_t v4 = 0;
  }
  return *(void *)(a1 + 40) | v4;
}

- (MFMailboxFilterBarButtonItemAccessibility)initWithTarget:(id)a3 action:(SEL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)MFMailboxFilterBarButtonItemAccessibility;
  uint64_t v4 = [(MFMailboxFilterBarButtonItemAccessibility *)&v6 initWithTarget:a3 action:a4];
  [(MFMailboxFilterBarButtonItemAccessibility *)v4 _accessibilityLoadAccessibilityInformation];
  return v4;
}

@end