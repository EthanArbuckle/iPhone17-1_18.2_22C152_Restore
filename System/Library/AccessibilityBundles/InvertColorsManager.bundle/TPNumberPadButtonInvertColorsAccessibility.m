@interface TPNumberPadButtonInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_accessibilityBackgroundColor;
- (id)initForCharacter:(int64_t)a3;
- (void)_accessibilityLoadInvertColors;
- (void)_setAccessibilityBackgroundColor:(id)a3;
- (void)setColor:(id)a3;
@end

@implementation TPNumberPadButtonInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TPNumberPadButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityBackgroundColor
{
  return (id)___UIAccessibilityGetAssociatedObject(self, &unk_83660);
}

- (void)_setAccessibilityBackgroundColor:(id)a3
{
}

- (void)_accessibilityLoadInvertColors
{
  if (qword_83670 != -1) {
    dispatch_once(&qword_83670, &stru_447C0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v36 = 0;
    objc_opt_class();
    v3 = __UIAccessibilityCastAsClass();
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = [v3 subviews];
    id v4 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
    if (v4)
    {
      id v5 = v4;
      v24 = self;
      v25 = v3;
      v6 = 0;
      uint64_t v27 = *(void *)v33;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v33 != v27) {
            objc_enumerationMutation(obj);
          }
          v8 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          v9 = objc_msgSend(v8, "layer", v24, v25);
          v10 = [v9 sublayers];

          v11 = (char *)[v10 countByEnumeratingWithState:&v28 objects:v37 count:16];
          if (v11)
          {
            v12 = v11;
            uint64_t v13 = *(void *)v29;
            while (2)
            {
              for (j = 0; j != v12; ++j)
              {
                if (*(void *)v29 != v13) {
                  objc_enumerationMutation(v10);
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v15 = v8;

                  v6 = v15;
                  goto LABEL_19;
                }
              }
              v12 = (char *)[v10 countByEnumeratingWithState:&v28 objects:v37 count:16];
              if (v12) {
                continue;
              }
              break;
            }
          }
LABEL_19:
        }
        id v5 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
      }
      while (v5);

      if (!v6)
      {
        self = v24;
        v3 = v25;
        goto LABEL_26;
      }
      v16 = [v6 layer];
      +[AXInvertColorsAppHelper toggleInvertColors:v16];
      self = v24;
      v3 = v25;
    }
    else
    {
      v6 = 0;
      v16 = obj;
    }

LABEL_26:
    [v6 setAccessibilityIgnoresInvertColors:0];
    [v3 setAccessibilityIgnoresInvertColors:1];
    char v36 = 0;
    objc_opt_class();
    v17 = [(TPNumberPadButtonInvertColorsAccessibility *)self safeValueForKey:@"circleView"];
    v18 = __UIAccessibilityCastAsClass();

    if (v36) {
      abort();
    }
    v19 = [(TPNumberPadButtonInvertColorsAccessibility *)self _accessibilityBackgroundColor];
    v20 = v19;
    if (v19)
    {
      id v21 = v19;
    }
    else
    {
      id v21 = [v18 backgroundColor];
    }
    v22 = v21;

    if (_AXSInvertColorsEnabled())
    {
      uint64_t v23 = AXInvertColorForColorPreservingAlpha();

      v22 = (void *)v23;
    }
    [v18 setBackgroundColor:v22];
  }
}

- (void)setColor:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TPNumberPadButtonInvertColorsAccessibility;
  id v4 = a3;
  [(TPNumberPadButtonInvertColorsAccessibility *)&v5 setColor:v4];
  -[TPNumberPadButtonInvertColorsAccessibility _setAccessibilityBackgroundColor:](self, "_setAccessibilityBackgroundColor:", v4, v5.receiver, v5.super_class);

  [(TPNumberPadButtonInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (id)initForCharacter:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TPNumberPadButtonInvertColorsAccessibility;
  id v3 = [(TPNumberPadButtonInvertColorsAccessibility *)&v5 initForCharacter:a3];
  [v3 _accessibilityLoadInvertColors];
  return v3;
}

@end