@interface SUUIStackListCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation SUUIStackListCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUIStackListCollectionViewCell";
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
  v3 = [(SUUIStackListCollectionViewCellAccessibility *)self safeValueForKey:@"listViews"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 keyEnumerator];
  v6 = [v5 allObjects];
  v7 = MEMORY[0x245656BA0]();

  return v7;
}

@end