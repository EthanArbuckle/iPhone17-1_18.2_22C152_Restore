@interface PersonHorizontalCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation PersonHorizontalCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.PersonHorizontalCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.PersonHorizontalCell", @"accessibilityPersonName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.PersonHorizontalCell", @"accessibilityPersonSubtitle", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(PersonHorizontalCellAccessibility *)self safeStringForKey:@"accessibilityPersonName"];
  v6 = [(PersonHorizontalCellAccessibility *)self safeStringForKey:@"accessibilityPersonSubtitle"];
  v4 = __AXStringForVariables();

  return v4;
}

@end