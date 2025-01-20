@interface CKNavBarUnifiedCallButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (void)accessibilityLabel;
@end

@implementation CKNavBarUnifiedCallButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKNavBarUnifiedCallButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKNavBarUnifiedCallButton", @"isFaceTimeVideoAvailable", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKNavBarUnifiedCallButton", @"isFaceTimeAudioAvailable", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKNavBarUnifiedCallButton", @"isTelephonyAvailable", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKNavBarUnifiedCallButton", @"buttonStyle", "q", 0);
}

- (id)accessibilityLabel
{
  uint64_t v2 = [(CKNavBarUnifiedCallButtonAccessibility *)self safeIntegerForKey:@"buttonStyle"];
  switch(v2)
  {
    case 0:
      id v3 = @"details.facetime.video.button.label";
      goto LABEL_12;
    case 1:
      id v3 = @"details.join.facetime.video.button.label";
      goto LABEL_12;
    case 2:
      id v3 = @"details.joined.facetime.video.button.label";
      goto LABEL_12;
    case 3:
      id v3 = @"details.join.facetime.audio.button.label";
      goto LABEL_12;
    case 4:
      id v3 = @"details.joined.facetime.audio.button.label";
      goto LABEL_12;
    case 5:
      id v3 = @"details.join.facetime.expanse.button.label";
      goto LABEL_12;
    case 6:
      id v3 = @"details.joined.facetime.expanse.button.label";
LABEL_12:
      v5 = accessibilityLocalizedString(v3);
      break;
    default:
      v4 = AXLogCommon();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        [(CKNavBarUnifiedCallButtonAccessibility *)v2 accessibilityLabel];
      }

      v5 = 0;
      break;
  }

  return v5;
}

- (BOOL)isAccessibilityElement
{
  if ([(CKNavBarUnifiedCallButtonAccessibility *)self safeBoolForKey:@"isFaceTimeVideoAvailable"] & 1) != 0|| ([(CKNavBarUnifiedCallButtonAccessibility *)self safeBoolForKey:@"isFaceTimeAudioAvailable"])
  {
    return 1;
  }

  return [(CKNavBarUnifiedCallButtonAccessibility *)self safeBoolForKey:@"isTelephonyAvailable"];
}

- (void)accessibilityLabel
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = [NSNumber numberWithInteger:a1];
  int v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_241FFB000, a2, OS_LOG_TYPE_ERROR, "Missing label for button style: %@", (uint8_t *)&v4, 0xCu);
}

@end