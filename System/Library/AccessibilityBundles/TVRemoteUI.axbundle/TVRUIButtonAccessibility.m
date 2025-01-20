@interface TVRUIButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation TVRUIButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVRUIButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)TVRUIButtonAccessibility;
  return *MEMORY[0x263F1CEE8] | [(TVRUIButtonAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityLabel
{
  char v11 = 0;
  objc_opt_class();
  objc_super v3 = __UIAccessibilityCastAsClass();
  uint64_t v4 = [v3 buttonType];
  switch(v4)
  {
    case 0:
    case 17:
    case 18:
    case 20:
    case 21:
    case 22:
      v10.receiver = self;
      v10.super_class = (Class)TVRUIButtonAccessibility;
      [(TVRUIButtonAccessibility *)&v10 accessibilityLabel];
      goto LABEL_3;
    case 1:
      v6 = @"tv.remote.touchpad.select.button";
      goto LABEL_29;
    case 2:
      v6 = @"tv.button.menu.label";
      goto LABEL_29;
    case 3:
      v6 = @"tv.button.home.label";
      goto LABEL_29;
    case 4:
      if ((AXDeviceIsSiriAvailable() & 1) == 0) {
        goto LABEL_13;
      }
      v6 = @"tv.button.siri.label";
      goto LABEL_29;
    case 5:
      v6 = @"tv.button.play.label";
      goto LABEL_29;
    case 6:
      v6 = @"tv.button.fast.forward.label";
      goto LABEL_29;
    case 7:
      v6 = @"tv.button.rewind.label";
      goto LABEL_29;
    case 8:
      v6 = @"tv.button.skip.next.label";
      goto LABEL_29;
    case 9:
      v6 = @"tv.button.skip.previous.label";
      goto LABEL_29;
    case 10:
      v6 = @"tv.button.volume.up.label";
      goto LABEL_29;
    case 11:
      v6 = @"tv.button.volume.down.label";
      goto LABEL_29;
    case 12:
      v6 = @"tv.remote.touchpad.up.button";
      goto LABEL_29;
    case 13:
      v6 = @"tv.remote.touchpad.down.button";
      goto LABEL_29;
    case 14:
      v6 = @"tv.remote.touchpad.left.button";
      goto LABEL_29;
    case 15:
      v6 = @"tv.remote.touchpad.right.button";
      goto LABEL_29;
    case 16:
      v6 = @"tv.button.toggle.captions";
      goto LABEL_29;
    case 19:
      goto LABEL_7;
    case 23:
      v6 = @"tv.button.back.label";
      goto LABEL_29;
    case 24:
      v6 = @"tv.button.exit.label";
      goto LABEL_29;
    case 25:
      v6 = @"tv.button.info.label";
      goto LABEL_29;
    default:
      if (v4 == 9998)
      {
LABEL_13:
        v6 = @"tv.button.search.label";
        goto LABEL_29;
      }
      if (v4 == 9999)
      {
        v6 = @"tv.button.keyboard.label";
LABEL_29:
        uint64_t v5 = accessibilityLocalizedString(v6);
        goto LABEL_30;
      }
LABEL_7:
      v9.receiver = self;
      v9.super_class = (Class)TVRUIButtonAccessibility;
      [(TVRUIButtonAccessibility *)&v9 accessibilityLabel];
      uint64_t v5 = LABEL_3:;
LABEL_30:
      v7 = (void *)v5;

      return v7;
  }
}

- (id)accessibilityHint
{
  char v9 = 0;
  objc_opt_class();
  objc_super v3 = __UIAccessibilityCastAsClass();
  if ([v3 buttonType] == 4)
  {
    if (AXDeviceIsSiriAvailable()) {
      uint64_t v4 = @"tv.button.siri.hint";
    }
    else {
      uint64_t v4 = @"tv.button.search.hint";
    }
    uint64_t v5 = accessibilityLocalizedString(v4);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)TVRUIButtonAccessibility;
    uint64_t v5 = [(TVRUIButtonAccessibility *)&v8 accessibilityHint];
  }
  v6 = (void *)v5;

  return v6;
}

@end