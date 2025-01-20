@interface MTSwitchAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation MTSwitchAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MTSwitch";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(MTSwitchAccessibility *)self accessibilityIdentifier];
  int v3 = [v2 isEqualToString:@"AudioVideoSwitch"];

  if (v3)
  {
    v4 = accessibilityLocalizedString(@"av.switch.label");
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)accessibilityValue
{
  int v3 = [(MTSwitchAccessibility *)self accessibilityIdentifier];
  int v4 = [v3 isEqualToString:@"AudioVideoSwitch"];

  if (v4)
  {
    v5 = [(MTSwitchAccessibility *)self safeValueForKey:@"isOn"];
    int v6 = [v5 BOOLValue];

    if (v6) {
      v7 = @"av.switch.value.video";
    }
    else {
      v7 = @"av.switch.value.audio";
    }
    v8 = accessibilityLocalizedString(v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end