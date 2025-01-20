@interface CollectionAccessoryViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation CollectionAccessoryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.CollectionAccessoryView";
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
  return (id)[(CollectionAccessoryViewAccessibility *)self safeValueForKey:@"title"];
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CollectionAccessoryViewAccessibility;
  return *MEMORY[0x263F1CEE8] | [(CollectionAccessoryViewAccessibility *)&v3 accessibilityTraits];
}

@end