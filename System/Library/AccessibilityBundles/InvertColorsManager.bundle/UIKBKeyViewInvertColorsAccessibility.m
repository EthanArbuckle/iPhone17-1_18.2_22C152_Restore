@interface UIKBKeyViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityIsEmojiPopupKey;
- (BOOL)_accessibilityShouldInvertKey;
- (void)_accessibilityLoadInvertColors;
- (void)displayLayer:(id)a3;
@end

@implementation UIKBKeyViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIKBKeyView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityIsEmojiPopupKey
{
  v2 = [(UIKBKeyViewInvertColorsAccessibility *)self safeValueForKey:@"m_key"];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 safeValueForKey:@"name"];
    v5 = v4;
    if (v4) {
      int v6 = (int)([v4 isEqualToString:@"EmojiPopupKey"] << 31) >> 31;
    }
    else {
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6 & 1;
}

- (BOOL)_accessibilityShouldInvertKey
{
  return [(UIKBKeyViewInvertColorsAccessibility *)self _accessibilityIsEmojiPopupKey];
}

- (void)_accessibilityLoadInvertColors
{
  if ([(UIKBKeyViewInvertColorsAccessibility *)self _accessibilityShouldInvertKey])
  {
    [(UIKBKeyViewInvertColorsAccessibility *)self setAccessibilityIgnoresInvertColors:1];
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x3032000000;
    v15 = sub_C638;
    v16 = sub_C648;
    id v17 = 0;
    int v6 = _NSConcreteStackBlock;
    uint64_t v7 = 3221225472;
    v8 = sub_C650;
    v9 = &unk_44710;
    v10 = self;
    v11 = &v12;
    AXPerformSafeBlock();
    id v3 = (id)v13[5];
    _Block_object_dispose(&v12, 8);

    if (v3)
    {
      if (UIAccessibilityIsInvertColorsEnabled())
      {
        id v4 = +[UIColor whiteColor];
        objc_msgSend(v3, "setShadowColor:", objc_msgSend(v4, "CGColor"));

        LODWORD(v5) = 0.5;
        [v3 setShadowOpacity:v5];
      }
      +[AXInvertColorsAppHelper toggleInvertColors:](AXInvertColorsAppHelper, "toggleInvertColors:", v3, v6, v7, v8, v9, v10, v11);
    }
  }
  else
  {
    [(UIKBKeyViewInvertColorsAccessibility *)self setAccessibilityIgnoresInvertColors:0];
  }
}

- (void)displayLayer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIKBKeyViewInvertColorsAccessibility;
  [(UIKBKeyViewInvertColorsAccessibility *)&v4 displayLayer:a3];
  [(UIKBKeyViewInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end