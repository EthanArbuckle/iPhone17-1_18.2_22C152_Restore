@interface MTUILabelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation MTUILabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UILabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v3 = [(MTUILabelAccessibility *)self accessibilityIdentifier];
  int v4 = [v3 isEqualToString:@"TimeRemaining"];

  if (v4)
  {
    v5 = @"time.remaining";
LABEL_5:
    v8 = accessibilityLocalizedString(v5);
    goto LABEL_7;
  }
  v6 = [(MTUILabelAccessibility *)self accessibilityIdentifier];
  int v7 = [v6 isEqualToString:@"TimeElapsed"];

  if (v7)
  {
    v5 = @"time.elapsed";
    goto LABEL_5;
  }
  v10.receiver = self;
  v10.super_class = (Class)MTUILabelAccessibility;
  v8 = [(MTUILabelAccessibility *)&v10 accessibilityLabel];
LABEL_7:

  return v8;
}

- (id)accessibilityValue
{
  v3 = [(MTUILabelAccessibility *)self accessibilityIdentifier];
  if ([v3 isEqualToString:@"TimeRemaining"])
  {

LABEL_4:
    v11 = self;
    v6 = &selRef_accessibilityLabel;
    int v7 = &v11;
    goto LABEL_6;
  }
  int v4 = [(MTUILabelAccessibility *)self accessibilityIdentifier];
  int v5 = [v4 isEqualToString:@"TimeElapsed"];

  if (v5) {
    goto LABEL_4;
  }
  objc_super v10 = self;
  v6 = &selRef_accessibilityValue;
  int v7 = &v10;
LABEL_6:
  v7[1] = (MTUILabelAccessibility *)MTUILabelAccessibility;
  v8 = objc_msgSendSuper2((objc_super *)v7, *v6, v10);

  return v8;
}

@end