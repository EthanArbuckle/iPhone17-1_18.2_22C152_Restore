@interface COSDiscoverCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_hasArrowUnicodeInSubtitleLabel;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation COSDiscoverCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"COSDiscoverCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"COSDiscoverCell" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v3 validateClass:@"COSDiscoverCell" hasInstanceVariable:@"_subtitleLabel" withType:"UILabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(COSDiscoverCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"_titleLabel"];
}

- (id)accessibilityValue
{
  id v3 = [(COSDiscoverCellAccessibility *)self safeValueForKey:@"_subtitleLabel"];
  v4 = [v3 accessibilityLabel];

  if ([(COSDiscoverCellAccessibility *)self _hasArrowUnicodeInSubtitleLabel])
  {
    uint64_t v5 = objc_msgSend(v4, "stringByReplacingCharactersInRange:withString:", objc_msgSend(v4, "length") - 1, 1, &stru_26F63E378);

    v4 = (void *)v5;
  }

  return v4;
}

- (id)accessibilityHint
{
  if ([(COSDiscoverCellAccessibility *)self _hasArrowUnicodeInSubtitleLabel])
  {
    id v3 = accessibilityLocalizedString(@"discovery.link.to.content");
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)COSDiscoverCellAccessibility;
    id v3 = [(COSDiscoverCellAccessibility *)&v5 accessibilityHint];
  }

  return v3;
}

- (BOOL)_hasArrowUnicodeInSubtitleLabel
{
  v2 = [(COSDiscoverCellAccessibility *)self safeValueForKey:@"_subtitleLabel"];
  id v3 = [v2 accessibilityLabel];

  uint64_t v4 = [v3 length];
  if (v3) {
    BOOL v5 = v4 < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5) {
    goto LABEL_9;
  }
  v6 = objc_msgSend(v3, "substringWithRange:", v4 - 1, 1);
  if ([v6 length] != 1)
  {

    goto LABEL_9;
  }
  int v7 = [v6 characterAtIndex:0];

  if (v7 != 8599)
  {
LABEL_9:
    BOOL v8 = 0;
    goto LABEL_10;
  }
  BOOL v8 = 1;
LABEL_10:

  return v8;
}

@end