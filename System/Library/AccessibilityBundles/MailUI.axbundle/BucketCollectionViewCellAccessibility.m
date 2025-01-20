@interface BucketCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation BucketCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MailUI.BucketCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MailUI.BucketCollectionViewCell" hasSwiftField:@"item" withSwiftType:"Optional<BucketItem>"];
  [v3 validateClass:@"MailUI.BucketItem" hasSwiftField:@"title" withSwiftType:"String"];
  [v3 validateClass:@"MailUI.BucketItem" hasSwiftField:@"isUnread" withSwiftType:"Bool"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(BucketCollectionViewCellAccessibility *)self safeSwiftValueForKey:@"item"];
  id v3 = [v2 safeSwiftValueForKey:@"title"];

  return v3;
}

- (id)accessibilityValue
{
  id v3 = [(BucketCollectionViewCellAccessibility *)self safeSwiftValueForKey:@"item"];
  if ([v3 safeSwiftBoolForKey:@"isUnread"])
  {
    uint64_t v4 = accessibilityLocalizedString(@"category.unread");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)BucketCollectionViewCellAccessibility;
    uint64_t v4 = [(BucketCollectionViewCellAccessibility *)&v7 accessibilityValue];
  }
  v5 = (void *)v4;

  return v5;
}

@end