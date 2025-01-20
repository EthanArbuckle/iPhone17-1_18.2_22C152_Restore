@interface CKSpeakerButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation CKSpeakerButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKSpeakerButton";
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
  return accessibilityLocalizedString(@"speaker.button.label");
}

- (id)accessibilityValue
{
  if ([(CKSpeakerButtonAccessibility *)self safeBoolForKey:@"isSpeakerEnabled"]) {
    v2 = @"switch.on";
  }
  else {
    v2 = @"switch.off";
  }
  v3 = accessibilityLocalizedString(v2);

  return v3;
}

@end