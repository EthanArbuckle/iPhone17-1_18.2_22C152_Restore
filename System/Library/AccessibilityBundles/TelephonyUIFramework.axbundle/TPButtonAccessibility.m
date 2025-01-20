@interface TPButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation TPButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TPButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v3 = [(TPButtonAccessibility *)self accessibilityUserDefinedLabel];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
    goto LABEL_13;
  }
  v6 = [(TPButtonAccessibility *)self accessibilityIdentification];
  v7 = v6;
  if (v6)
  {
    if ([v6 isEqualToString:@"emergencyCallButton"])
    {
      v8 = @"emergencyCallButton.title";
LABEL_8:
      uint64_t v9 = accessibilityLocalizedString(v8);
LABEL_11:
      id v5 = (id)v9;
      goto LABEL_12;
    }
    if ([v7 isEqualToString:@"emergencyCancelButton"])
    {
      v8 = @"emergencyCancelButton.title";
      goto LABEL_8;
    }
  }
  id v5 = [(TPButtonAccessibility *)self safeValueForKey:@"title"];
  if (!v5)
  {
    v11.receiver = self;
    v11.super_class = (Class)TPButtonAccessibility;
    uint64_t v9 = [(TPButtonAccessibility *)&v11 accessibilityLabel];
    goto LABEL_11;
  }
LABEL_12:

LABEL_13:

  return v5;
}

@end