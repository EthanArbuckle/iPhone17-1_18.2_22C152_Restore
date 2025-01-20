@interface PUIProgressWindowAccessibility
+ (BOOL)_isSerializableAccessibilityElement;
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)dealloc;
@end

@implementation PUIProgressWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUIProgressWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"data.migration.title");
}

- (id)accessibilityValue
{
  v3 = NSString;
  v4 = accessibilityLocalizedString(@"data.migration.value");
  [(PUIProgressWindowAccessibility *)self safeFloatForKey:@"_currentProgress"];
  v6 = objc_msgSend(v3, "localizedStringWithFormat:", v4, roundf(v5));

  return v6;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F21B30] | *MEMORY[0x263F21C38];
}

- (CGRect)accessibilityFrame
{
  MEMORY[0x270F09F78](self, a2);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

+ (BOOL)_isSerializableAccessibilityElement
{
  return 1;
}

- (void)dealloc
{
  if (objc_opt_respondsToSelector()) {
    [(PUIProgressWindowAccessibility *)self _accessibilityUnregister];
  }
  v3.receiver = self;
  v3.super_class = (Class)PUIProgressWindowAccessibility;
  [(PUIProgressWindowAccessibility *)&v3 dealloc];
}

@end