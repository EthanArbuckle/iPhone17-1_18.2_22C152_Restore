@interface PXPeoplePickerCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation PXPeoplePickerCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXPeoplePickerCollectionViewCell";
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
  v2 = [(PXPeoplePickerCollectionViewCellAccessibility *)self safeValueForKey:@"nameLabel"];
  v3 = [v2 accessibilityLabel];

  if ([v3 length])
  {
    id v4 = v3;
  }
  else
  {
    accessibilityPhotosUICoreLocalizedString(@"people.name.unknown");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

@end