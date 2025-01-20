@interface CNContactListCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation CNContactListCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNContactListCollectionViewCell";
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
  v7.receiver = self;
  v7.super_class = (Class)CNContactListCollectionViewCellAccessibility;
  v3 = [(CNContactListCollectionViewCellAccessibility *)&v7 accessibilityLabel];
  if ([(CNContactListCollectionViewCellAccessibility *)self safeBoolForKey:@"_isEmergencyContact"])
  {
    v4 = accessibilityLocalizedString(@"contact.cell.emergency");
  }
  else
  {
    v4 = 0;
  }
  v5 = __UIAXStringForVariables();

  return v5;
}

@end