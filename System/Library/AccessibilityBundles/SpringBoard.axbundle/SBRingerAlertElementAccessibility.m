@interface SBRingerAlertElementAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_updateStateWithTransitionType:(unint64_t)a3;
@end

@implementation SBRingerAlertElementAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBRingerAlertElement";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_updateStateWithTransitionType:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBRingerAlertElementAccessibility;
  -[SBRingerAlertElementAccessibility _updateStateWithTransitionType:](&v7, sel__updateStateWithTransitionType_);
  switch(a3)
  {
    case 0uLL:
    case 2uLL:
      UIAccessibilityNotifications v4 = *MEMORY[0x263F1CDC8];
      v5 = @"silent.mode";
      goto LABEL_4;
    case 1uLL:
    case 3uLL:
      UIAccessibilityNotifications v4 = *MEMORY[0x263F1CDC8];
      v5 = @"ring.mode";
LABEL_4:
      v6 = accessibilityLocalizedString(v5);
      UIAccessibilityPostNotification(v4, v6);

      break;
    default:
      return;
  }
}

@end