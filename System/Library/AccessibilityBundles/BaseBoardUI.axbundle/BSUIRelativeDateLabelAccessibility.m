@interface BSUIRelativeDateLabelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation BSUIRelativeDateLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BSUIRelativeDateLabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"BSUIRelativeDateLabel" hasInstanceVariable:@"_value" withType:"NSUInteger"];
  [v3 validateClass:@"BSUIRelativeDateLabel" hasInstanceVariable:@"_resolution" withType:"Q"];
  [v3 validateClass:@"BSUIRelativeDateLabel" hasInstanceVariable:@"_comparedToNow" withType:"q"];
}

- (id)accessibilityLabel
{
  uint64_t v3 = [(BSUIRelativeDateLabelAccessibility *)self safeIntegerForKey:@"_value"];
  uint64_t v4 = [(BSUIRelativeDateLabelAccessibility *)self safeUnsignedIntegerForKey:@"_resolution"];
  uint64_t v5 = [(BSUIRelativeDateLabelAccessibility *)self safeIntegerForKey:@"_comparedToNow"];
  switch(v4)
  {
    case 0:
      if (v5 != 1)
      {
        v14.receiver = self;
        v14.super_class = (Class)BSUIRelativeDateLabelAccessibility;
        [(BSUIRelativeDateLabelAccessibility *)&v14 accessibilityLabel];
        goto LABEL_12;
      }
      v6 = NSString;
      v7 = accessibilityLocalizedString(@"minutes.ahead");
      v8 = objc_msgSend(v6, "stringWithFormat:", v7, 1);

      goto LABEL_17;
    case 1:
      v9 = NSString;
      if (v5 == 1) {
        v10 = @"minutes.ahead";
      }
      else {
        v10 = @"minutes.ago";
      }
      goto LABEL_16;
    case 2:
      v9 = NSString;
      if (v5 == 1) {
        v10 = @"hours.ahead";
      }
      else {
        v10 = @"hours.ago";
      }
      goto LABEL_16;
    case 3:
      if (v5 == 1)
      {
        v15.receiver = self;
        v15.super_class = (Class)BSUIRelativeDateLabelAccessibility;
        [(BSUIRelativeDateLabelAccessibility *)&v15 accessibilityLabel];
        v8 = LABEL_12:;
      }
      else
      {
        v9 = NSString;
        v10 = @"days.ago";
LABEL_16:
        v11 = accessibilityLocalizedString(v10);
        v8 = objc_msgSend(v9, "localizedStringWithFormat:", v11, v3);
      }
LABEL_17:
      return v8;
    default:
      v13.receiver = self;
      v13.super_class = (Class)BSUIRelativeDateLabelAccessibility;
      [(BSUIRelativeDateLabelAccessibility *)&v13 accessibilityLabel];
      goto LABEL_12;
  }
}

@end