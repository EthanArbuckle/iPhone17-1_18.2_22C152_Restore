@interface DOCMetadataKeyValueRowAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
@end

@implementation DOCMetadataKeyValueRowAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Files.DOCMetadataKeyValueRow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Files.DOCMetadataKeyValueRow", @"accessibilityElementWithLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Files.DOCMetadataKeyValueRow", @"accessibilityElementWithValue", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(DOCMetadataKeyValueRowAccessibility *)self _accessibilityStringForLabelKeyValues:@"accessibilityElementWithLabel, accessibilityElementWithValue"];
  if ([v3 length])
  {
    id v4 = v3;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)DOCMetadataKeyValueRowAccessibility;
    id v4 = [(DOCMetadataKeyValueRowAccessibility *)&v7 accessibilityLabel];
  }
  v5 = v4;

  return v5;
}

- (id)accessibilityCustomActions
{
  id v3 = [MEMORY[0x263EFF980] array];
  v8.receiver = self;
  v8.super_class = (Class)DOCMetadataKeyValueRowAccessibility;
  id v4 = [(DOCMetadataKeyValueRowAccessibility *)&v8 accessibilityCustomActions];
  [v3 axSafelyAddObjectsFromArray:v4];

  v5 = [(DOCMetadataKeyValueRowAccessibility *)self safeValueForKey:@"accessibilityElementWithValue"];
  v6 = [v5 accessibilityCustomActions];
  [v3 axSafelyAddObjectsFromArray:v6];

  return v3;
}

- (BOOL)accessibilityActivate
{
  v2 = [(DOCMetadataKeyValueRowAccessibility *)self safeValueForKey:@"accessibilityElementWithValue"];
  char v3 = [v2 accessibilityActivate];

  return v3;
}

@end