@interface BucketCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation BucketCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MobileMail.BucketCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"BucketCollectionViewCell" isKindOfClass:@"UICollectionViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BucketCollectionViewCell", @"accessibilityBucketCollectConfiguration", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(BucketCollectionViewCellAccessibility *)self safeArrayForKey:@"accessibilityBucketCollectConfiguration"];
  objc_opt_class();
  id v3 = [v2 axSafeObjectAtIndex:0];
  v4 = __UIAccessibilityCastAsClass();

  if (![v4 length])
  {
    objc_opt_class();
    v5 = [v2 axSafeObjectAtIndex:1];
    v6 = __UIAccessibilityCastAsClass();

    v7 = [v6 lowercaseString];
    int v8 = [v7 isEqualToString:@"clock"];

    if (v8)
    {
      accessibilityLocalizedString(@"mail.filter.button.later");
      id v9 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
  }
  id v9 = v4;
LABEL_6:

  return v9;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)BucketCollectionViewCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(BucketCollectionViewCellAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"mail.filter.button.hint");
}

@end