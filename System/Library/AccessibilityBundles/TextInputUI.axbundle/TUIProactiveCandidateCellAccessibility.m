@interface TUIProactiveCandidateCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation TUIProactiveCandidateCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TUIProactiveCandidateCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  char v12 = 0;
  objc_opt_class();
  v3 = [(TUIProactiveCandidateCellAccessibility *)self safeValueForKey:@"candidate"];
  v4 = __UIAccessibilityCastAsClass();

  uint64_t v5 = [v4 slotID];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F21660]);
    v7 = accessibilityLocalizedString(@"proactive.suggestion");
    v8 = (void *)[v6 initWithString:v7];

    v9 = [NSNumber numberWithUnsignedInt:v5];
    [v8 setAttribute:v9 forKey:*MEMORY[0x263F21830]];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)TUIProactiveCandidateCellAccessibility;
    v8 = [(TUIProactiveCandidateCellAccessibility *)&v11 accessibilityLabel];
  }

  return v8;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (BOOL)isAccessibilityElement
{
  if (AXRequestingClient() == 4) {
    return 1;
  }
  v4 = [(TUIProactiveCandidateCellAccessibility *)self accessibilityLabel];
  BOOL v3 = [v4 length] != 0;

  return v3;
}

@end