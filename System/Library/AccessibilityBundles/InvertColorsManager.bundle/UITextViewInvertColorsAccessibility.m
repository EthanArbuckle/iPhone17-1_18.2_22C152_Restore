@interface UITextViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_axIgnoreNextAttributedText;
- (BOOL)keyboardInputChanged:(id)a3;
- (void)_accessibilityLoadInvertColors;
- (void)_axSetIgnoreNextAttributedText:(BOOL)a3;
- (void)_pasteAttributedString:(id)a3 pasteAsRichText:(BOOL)a4;
- (void)paste:(id)a3;
- (void)setAttributedText:(id)a3;
@end

@implementation UITextViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UITextView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_axIgnoreNextAttributedText
{
  return ___UIAccessibilityGetAssociatedBool(self, &unk_83658);
}

- (void)_axSetIgnoreNextAttributedText:(BOOL)a3
{
}

- (void)_accessibilityLoadInvertColors
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v3 = [(UITextViewInvertColorsAccessibility *)self attributedText];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_D794;
  v5[3] = &unk_44778;
  v5[4] = self;
  v5[5] = &v6;
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", NSAttachmentAttributeName, 0, objc_msgSend(v3, "length"), 0, v5);
  if (*((unsigned char *)v7 + 24))
  {
    id v4 = v3;
    AXPerformBlockAsynchronouslyOnMainThread();
  }
  _Block_object_dispose(&v6, 8);
}

- (void)paste:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UITextViewInvertColorsAccessibility;
  [(UITextViewInvertColorsAccessibility *)&v4 paste:a3];
  [(UITextViewInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)_pasteAttributedString:(id)a3 pasteAsRichText:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)UITextViewInvertColorsAccessibility;
  [(UITextViewInvertColorsAccessibility *)&v5 _pasteAttributedString:a3 pasteAsRichText:a4];
  [(UITextViewInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)setAttributedText:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UITextViewInvertColorsAccessibility;
  [(UITextViewInvertColorsAccessibility *)&v4 setAttributedText:a3];
  if (![(UITextViewInvertColorsAccessibility *)self _axIgnoreNextAttributedText]) {
    [(UITextViewInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
  }
}

- (BOOL)keyboardInputChanged:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UITextViewInvertColorsAccessibility;
  BOOL v4 = [(UITextViewInvertColorsAccessibility *)&v6 keyboardInputChanged:a3];
  [(UITextViewInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
  return v4;
}

@end