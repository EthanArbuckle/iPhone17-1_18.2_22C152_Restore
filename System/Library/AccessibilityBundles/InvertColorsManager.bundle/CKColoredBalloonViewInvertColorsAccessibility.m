@interface CKColoredBalloonViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_axIsBigEmoji;
- (BOOL)_axIsMessageGray;
- (id)_axChatItemForBalloon;
- (void)_accessibilityLoadInvertColors;
- (void)layoutSubviews;
- (void)prepareForDisplayIfNeeded;
@end

@implementation CKColoredBalloonViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKColoredBalloonView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)prepareForDisplayIfNeeded
{
  v3.receiver = self;
  v3.super_class = (Class)CKColoredBalloonViewInvertColorsAccessibility;
  [(CKColoredBalloonViewInvertColorsAccessibility *)&v3 prepareForDisplayIfNeeded];
  [(CKColoredBalloonViewInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)_accessibilityLoadInvertColors
{
  uint64_t v3 = [(CKColoredBalloonViewInvertColorsAccessibility *)self superview];
  if (v3)
  {
    v4 = (void *)v3;
    while (1)
    {
      AXSafeClassFromString();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v5 = [v4 superview];

      v4 = (void *)v5;
      if (!v5) {
        return;
      }
    }
    AXSafeClassFromString();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v11 = [(CKColoredBalloonViewInvertColorsAccessibility *)self _axIsMessageGray] ^ 1;
LABEL_19:
      [v4 setAccessibilityIgnoresInvertColors:v11];

      return;
    }
    objc_opt_class();
    v6 = [(CKColoredBalloonViewInvertColorsAccessibility *)self safeValueForKey:@"textView"];
    v7 = __UIAccessibilityCastAsClass();

    unsigned int v8 = [(CKColoredBalloonViewInvertColorsAccessibility *)self _axIsMessageGray];
    if (!v7) {
      goto LABEL_17;
    }
    unsigned int v9 = v8;
    if ((v8 & 1) == 0 && ![(CKColoredBalloonViewInvertColorsAccessibility *)self _axIsBigEmoji])
    {
      [v7 setAccessibilityIgnoresInvertColors:0];
      UIAccessibilityIsInvertColorsEnabled();
      uint64_t v11 = 1;
      goto LABEL_18;
    }
    [v7 setAccessibilityIgnoresInvertColors:1];
    if (UIAccessibilityIsInvertColorsEnabled())
    {
      if (v9)
      {
        uint64_t v10 = +[UIColor whiteColor];
LABEL_16:
        v12 = (void *)v10;
        [v7 setTextColor:v10];
      }
    }
    else if (v9)
    {
      uint64_t v10 = +[UIColor labelColor];
      goto LABEL_16;
    }
LABEL_17:
    uint64_t v11 = 0;
LABEL_18:

    goto LABEL_19;
  }
}

- (BOOL)_axIsMessageGray
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  AXPerformSafeBlock();
  int v2 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2 == 255;
}

- (id)_axChatItemForBalloon
{
  uint64_t v3 = [(CKColoredBalloonViewInvertColorsAccessibility *)self safeValueForKey:@"delegate"];
  AXSafeClassFromString();
  if (objc_opt_isKindOfClass())
  {
    LOBYTE(v18) = 0;
    objc_opt_class();
    uint64_t v4 = [v3 safeValueForKey:@"collectionView"];
    uint64_t v5 = __UIAccessibilityCastAsClass();

    uint64_t v6 = self;
    char v7 = [(CKColoredBalloonViewInvertColorsAccessibility *)v6 superview];
    unsigned int v8 = [v7 superview];

    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x3032000000;
    v21 = sub_1DB64;
    v22 = sub_1DB74;
    id v23 = 0;
    id v9 = v5;
    id v10 = v8;
    AXPerformSafeBlock();
    id v11 = (id)v19[5];

    _Block_object_dispose(&v18, 8);
    LOBYTE(v18) = 0;
    objc_opt_class();
    v12 = [v3 safeValueForKey:@"chatItems"];
    v13 = __UIAccessibilityCastAsClass();

    if ((_BYTE)v18) {
      abort();
    }
    if (v11)
    {
      uint64_t v18 = 0;
      v19 = &v18;
      uint64_t v20 = 0x3032000000;
      v21 = sub_1DB64;
      v22 = sub_1DB74;
      id v23 = 0;
      id v16 = v13;
      id v17 = v11;
      AXPerformSafeBlock();
      id v14 = (id)v19[5];

      _Block_object_dispose(&v18, 8);
    }
    else
    {
      id v14 = 0;
    }
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (BOOL)_axIsBigEmoji
{
  return objc_opt_isKindOfClass() & 1;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CKColoredBalloonViewInvertColorsAccessibility;
  [(CKColoredBalloonViewInvertColorsAccessibility *)&v3 layoutSubviews];
  [(CKColoredBalloonViewInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end