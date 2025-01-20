@interface PHAudioControlsButtonInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (PHAudioControlsButtonInvertColorsAccessibility)initWithFrame:(CGRect)a3;
- (id)_accessibilityBackgroundColor;
- (void)_accessibilityLoadInvertColors;
- (void)_setAccessibilityBackgroundColor:(id)a3;
- (void)updateRoundViewColorAnimated:(BOOL)a3;
@end

@implementation PHAudioControlsButtonInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PHAudioControlsButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityBackgroundColor
{
  return (id)___UIAccessibilityGetAssociatedObject(self, &unk_8365E);
}

- (void)_setAccessibilityBackgroundColor:(id)a3
{
}

- (void)_accessibilityLoadInvertColors
{
  char v38 = 0;
  objc_opt_class();
  v27 = __UIAccessibilityCastAsClass();
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = [v27 subviews];
  id v3 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v3)
  {
    id v4 = v3;
    v5 = 0;
    uint64_t v29 = *(void *)v35;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v35 != v29) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        v8 = [v7 layer];
        v9 = [v8 sublayers];

        v10 = (char *)[v9 countByEnumeratingWithState:&v30 objects:v39 count:16];
        if (v10)
        {
          v11 = v10;
          uint64_t v12 = *(void *)v31;
          while (2)
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(void *)v31 != v12) {
                objc_enumerationMutation(v9);
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v14 = v7;

                v5 = v14;
                goto LABEL_16;
              }
            }
            v11 = (char *)[v9 countByEnumeratingWithState:&v30 objects:v39 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }
LABEL_16:
      }
      id v4 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  v15 = [v5 layer];
  +[AXInvertColorsAppHelper toggleInvertColors:v15];

  [v5 setAccessibilityIgnoresInvertColors:0];
  char v38 = 0;
  objc_opt_class();
  v16 = [(PHAudioControlsButtonInvertColorsAccessibility *)self safeValueForKey:@"roundView"];
  v17 = __UIAccessibilityCastAsClass();

  if (v38) {
    abort();
  }
  v18 = [(PHAudioControlsButtonInvertColorsAccessibility *)self _accessibilityBackgroundColor];
  v19 = v18;
  if (v18)
  {
    id v20 = v18;
  }
  else
  {
    id v20 = [v17 backgroundColor];
  }
  v21 = v20;

  if (_AXSInvertColorsEnabled())
  {
    if (!AXProcessIsInCallService())
    {
      uint64_t v25 = AXInvertColorForColorPreservingAlpha();
      goto LABEL_29;
    }
    v22 = [v17 window];
    v23 = [v22 traitCollection];
    v24 = (char *)[v23 userInterfaceStyle];

    if (v24 == (unsigned char *)&dword_0 + 1)
    {
      uint64_t v25 = +[UIColor blackColor];
LABEL_29:
      v26 = (void *)v25;

      v21 = v26;
    }
  }
  [v17 setBackgroundColor:v21];
}

- (void)updateRoundViewColorAnimated:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PHAudioControlsButtonInvertColorsAccessibility;
  [(PHAudioControlsButtonInvertColorsAccessibility *)&v4 updateRoundViewColorAnimated:a3];
  [(PHAudioControlsButtonInvertColorsAccessibility *)self _setAccessibilityBackgroundColor:0];
  [(PHAudioControlsButtonInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (PHAudioControlsButtonInvertColorsAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PHAudioControlsButtonInvertColorsAccessibility;
  id v3 = -[PHAudioControlsButtonInvertColorsAccessibility initWithFrame:](&v5, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(PHAudioControlsButtonInvertColorsAccessibility *)v3 _accessibilityLoadInvertColors];
  return v3;
}

@end