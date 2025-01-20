@interface CAMSharedLibraryButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axLabelForSharedLibraryMode:(int64_t)a3;
- (id)accessibilityHint;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation CAMSharedLibraryButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMSharedLibraryButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityHint
{
  return accessibilityCameraUILocalizedString(@"Shared_Library_Hint");
}

- (id)accessibilityIdentifier
{
  return @"SharedLibraryButton";
}

- (id)_axLabelForSharedLibraryMode:(int64_t)a3
{
  if ((unint64_t)a3 > 5)
  {
    v4 = 0;
  }
  else
  {
    v4 = accessibilityCameraUILocalizedString(off_26509FB90[a3]);
  }
  return v4;
}

- (id)accessibilityLabel
{
  uint64_t v3 = [(CAMSharedLibraryButtonAccessibility *)self safeIntegerForKey:@"sharedLibraryMode"];

  return [(CAMSharedLibraryButtonAccessibility *)self _axLabelForSharedLibraryMode:v3];
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CAMSharedLibraryButtonAccessibility;
  return *MEMORY[0x263F1CEE8] | [(CAMSharedLibraryButtonAccessibility *)&v3 accessibilityTraits];
}

@end