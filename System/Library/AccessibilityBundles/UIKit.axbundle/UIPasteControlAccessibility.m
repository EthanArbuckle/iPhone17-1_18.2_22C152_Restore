@interface UIPasteControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation UIPasteControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIPasteControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIPasteControl", @"_secureName", "I", 0);
  objc_storeStrong(v4, obj);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v10 = self;
  location[1] = (id)a2;
  id v8 = (id)[MEMORY[0x263F086E0] mainBundle];
  id v7 = (id)[v8 preferredLocalizations];
  location[0] = (id)[v7 firstObject];

  if (location[0])
  {
    [(UIPasteControlAccessibility *)v10 safeUnsignedIntForKey:@"_secureName"];
    id v6 = (id)[MEMORY[0x263F086E0] mainBundle];
    id v5 = (id)[v6 preferredLocalizations];
    id v4 = (id)[v5 firstObject];
    id v11 = (id)UISLocalizedStringForSecureName();
  }
  else
  {
    id v11 = 0;
  }
  objc_storeStrong(location, 0);
  v2 = v11;

  return v2;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

@end