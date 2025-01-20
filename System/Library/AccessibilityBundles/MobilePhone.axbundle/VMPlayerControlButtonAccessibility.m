@interface VMPlayerControlButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation VMPlayerControlButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VMPlayerControlButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  uint64_t v2 = [(VMPlayerControlButtonAccessibility *)self safeUnsignedIntegerForKey:@"_playerState"];
  if (!v2)
  {
    v3 = @"play.voicemail.button";
    goto LABEL_5;
  }
  if (v2 == 1)
  {
    v3 = @"pause.voicemail.button";
LABEL_5:
    v4 = accessibilityLocalizedString(v3);
    goto LABEL_7;
  }
  v4 = 0;
LABEL_7:

  return v4;
}

@end