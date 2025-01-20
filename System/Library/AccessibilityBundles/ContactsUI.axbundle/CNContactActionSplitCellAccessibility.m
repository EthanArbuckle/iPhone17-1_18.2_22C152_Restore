@interface CNContactActionSplitCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
@end

@implementation CNContactActionSplitCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNContactActionSplitCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNContactActionSplitCell", @"rightLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNContactActionSplitCell", @"leftLabel", "@", 0);
}

- (id)accessibilityElements
{
  id v3 = objc_opt_new();
  v4 = [(CNContactActionSplitCellAccessibility *)self safeValueForKey:@"leftLabel"];
  v5 = [v4 accessibilityLabel];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    [v4 setAccessibilityContainer:self];
    [v3 addObject:v4];
  }
  v7 = [(CNContactActionSplitCellAccessibility *)self safeValueForKey:@"rightLabel"];
  v8 = [v7 accessibilityLabel];
  uint64_t v9 = [v8 length];

  if (v9)
  {
    [v7 setAccessibilityContainer:self];
    [v3 addObject:v7];
  }

  return v3;
}

@end