@interface SFMagicHeadPlaceholderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)setTiltedTooFarColor:(BOOL)a3 useRaiseLabel:(BOOL)a4 useNoUWBCapableLabel:(BOOL)a5;
@end

@implementation SFMagicHeadPlaceholderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFMagicHeadPlaceholderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)setTiltedTooFarColor:(BOOL)a3 useRaiseLabel:(BOOL)a4 useNoUWBCapableLabel:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  char v9 = [(SFMagicHeadPlaceholderViewAccessibility *)self safeBoolForKey:@"_useRaiseLabel"];
  int v10 = [(SFMagicHeadPlaceholderViewAccessibility *)self safeBoolForKey:@"_useNoUWBCapableLabel"];
  v16.receiver = self;
  v16.super_class = (Class)SFMagicHeadPlaceholderViewAccessibility;
  [(SFMagicHeadPlaceholderViewAccessibility *)&v16 setTiltedTooFarColor:v7 useRaiseLabel:v6 useNoUWBCapableLabel:v5];
  double Current = CFAbsoluteTimeGetCurrent();
  v12 = [(SFMagicHeadPlaceholderViewAccessibility *)self safeUIViewForKey:@"_label"];
  v13 = [v12 accessibilityLabel];

  int v14 = (v9 & 1) == 0 && v6 || v5 & ~v10;
  if (v6 && Current - *(double *)&setTiltedTooFarColor_useRaiseLabel_useNoUWBCapableLabel__LastAnnouncementTime > 4.0) {
    int v15 = objc_msgSend(v13, "isEqualToString:", setTiltedTooFarColor_useRaiseLabel_useNoUWBCapableLabel__LastAnnouncementString, Current - *(double *)&setTiltedTooFarColor_useRaiseLabel_useNoUWBCapableLabel__LastAnnouncementTime) ^ 1;
  }
  else {
    int v15 = 0;
  }
  if ((v14 | v15) == 1)
  {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v13);
    setTiltedTooFarColor_useRaiseLabel_useNoUWBCapableLabel__LastAnnouncementTime = *(void *)&Current;
    objc_storeStrong((id *)&setTiltedTooFarColor_useRaiseLabel_useNoUWBCapableLabel__LastAnnouncementString, v13);
  }
}

@end