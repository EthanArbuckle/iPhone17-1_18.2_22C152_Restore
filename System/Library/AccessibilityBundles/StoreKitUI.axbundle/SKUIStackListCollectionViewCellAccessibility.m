@interface SKUIStackListCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation SKUIStackListCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUIStackListCollectionViewCell";
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
  objc_opt_class();
  v3 = [(SKUIStackListCollectionViewCellAccessibility *)self safeValueForKey:@"listViews"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 keyEnumerator];
  v6 = [v5 allObjects];
  v7 = MEMORY[0x2455E57F0]();

  return v7;
}

@end