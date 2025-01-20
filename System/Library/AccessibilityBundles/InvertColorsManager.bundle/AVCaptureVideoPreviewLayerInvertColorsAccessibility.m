@interface AVCaptureVideoPreviewLayerInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)layerDidBecomeVisible:(BOOL)a3;
@end

@implementation AVCaptureVideoPreviewLayerInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVCaptureVideoPreviewLayer";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)layerDidBecomeVisible:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AVCaptureVideoPreviewLayerInvertColorsAccessibility;
  [(AVCaptureVideoPreviewLayerInvertColorsAccessibility *)&v4 layerDidBecomeVisible:a3];
  [(AVCaptureVideoPreviewLayerInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)_accessibilityLoadInvertColors
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  objc_opt_class();
  id v3 = v2;
  objc_super v4 = v3;
  if (v3)
  {
    v5 = v3;
    while (1)
    {
      v6 = [v5 delegate];
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        break;
      }
      uint64_t v8 = [v5 superlayer];

      v5 = (void *)v8;
      if (!v8) {
        goto LABEL_7;
      }
    }
    v9 = [v5 delegate];
    [v9 setAccessibilityIgnoresInvertColors:1];
  }
LABEL_7:
}

@end