@interface CKTranscriptDNDCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)setMuteSwitch:(id)a3;
@end

@implementation CKTranscriptDNDCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKTranscriptDNDCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKTranscriptDNDCell", @"setMuteSwitch:", "v", "@", 0);
  [v3 validateClass:@"CKTranscriptDNDCell" hasInstanceVariable:@"_muteSwitch" withType:"UISwitch"];
}

- (void)setMuteSwitch:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKTranscriptDNDCellAccessibility;
  id v3 = a3;
  [(CKTranscriptDNDCellAccessibility *)&v4 setMuteSwitch:v3];
  objc_msgSend(v3, "setIsAccessibilityElement:", 0, v4.receiver, v4.super_class);
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (CGPoint)accessibilityActivationPoint
{
  v2 = [(CKTranscriptDNDCellAccessibility *)self safeValueForKey:@"muteSwitch"];
  [v2 accessibilityActivationPoint];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityValue
{
  v2 = [(CKTranscriptDNDCellAccessibility *)self safeValueForKey:@"muteSwitch"];
  if ([v2 isOn]) {
    double v3 = @"switch.on";
  }
  else {
    double v3 = @"switch.off";
  }
  double v4 = accessibilityLocalizedString(v3);

  return v4;
}

@end