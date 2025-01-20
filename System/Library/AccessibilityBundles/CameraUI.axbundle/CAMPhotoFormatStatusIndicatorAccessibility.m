@interface CAMPhotoFormatStatusIndicatorAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsCurrentFormatEssential;
- (BOOL)accessibilityActivate;
- (id)_axAllowedFormats;
- (id)_axCurrentFormatValue;
- (id)_axEncodingName:(id)a3;
- (id)_axLocalizedStringForPhotoFormat:(id)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)_axAdvancedFormatIndex;
- (unint64_t)_axEssentialFormatIndex;
@end

@implementation CAMPhotoFormatStatusIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMPhotoFormatStatusIndicator";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CAMPhotoFormatStatusIndicator" isKindOfClass:@"CAMExpandingControl"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMExpandingControl", @"selectedState", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMPhotoFormatStatusIndicator", @"allowedFormats", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMPhotoFormatStatusIndicator", @"_essentialFormatIndex", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMPhotoFormatStatusIndicator", @"_advancedFormatIndex", "Q", 0);
}

- (id)accessibilityLabel
{
  return accessibilityCameraUILocalizedString(@"PHOTO_ENCODING_FORMAT");
}

- (id)accessibilityValue
{
  id v3 = [(CAMPhotoFormatStatusIndicatorAccessibility *)self safeValueForKey:@"selectedState"];
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  [v3 getValue:&v12 size:16];
  uint64_t v4 = v12;
  uint64_t v5 = v13;
  if ([(CAMPhotoFormatStatusIndicatorAccessibility *)self _axIsCurrentFormatEssential])
  {
    v6 = [(CAMPhotoFormatStatusIndicatorAccessibility *)self _axAllowedFormats];
    v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", -[CAMPhotoFormatStatusIndicatorAccessibility _axAdvancedFormatIndex](self, "_axAdvancedFormatIndex"));
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    [v7 getValue:&v12 size:16];
    uint64_t v4 = v12;
    uint64_t v5 = v13;
  }
  v8 = -[CAMPhotoFormatStatusIndicatorAccessibility _axLocalizedStringForPhotoFormat:](self, "_axLocalizedStringForPhotoFormat:", v4, v5);
  v11 = [(CAMPhotoFormatStatusIndicatorAccessibility *)self _axCurrentFormatValue];
  v9 = __UIAXStringForVariables();

  return v9;
}

- (BOOL)accessibilityActivate
{
  v8.receiver = self;
  v8.super_class = (Class)CAMPhotoFormatStatusIndicatorAccessibility;
  BOOL v3 = [(CAMPhotoFormatStatusIndicatorAccessibility *)&v8 accessibilityActivate];
  uint64_t v4 = [(CAMPhotoFormatStatusIndicatorAccessibility *)self _axCurrentFormatValue];
  uint64_t v5 = v4;
  if (v4)
  {
    id v7 = v4;
    AXPerformBlockOnMainThreadAfterDelay();
  }
  return v3;
}

void __67__CAMPhotoFormatStatusIndicatorAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
}

- (id)_axAllowedFormats
{
  return (id)[(CAMPhotoFormatStatusIndicatorAccessibility *)self safeArrayForKey:@"allowedFormats"];
}

- (unint64_t)_axEssentialFormatIndex
{
  return [(CAMPhotoFormatStatusIndicatorAccessibility *)self safeUnsignedIntegerForKey:@"_essentialFormatIndex"];
}

- (unint64_t)_axAdvancedFormatIndex
{
  return [(CAMPhotoFormatStatusIndicatorAccessibility *)self safeUnsignedIntegerForKey:@"_advancedFormatIndex"];
}

- (id)_axCurrentFormatValue
{
  if ([(CAMPhotoFormatStatusIndicatorAccessibility *)self _axIsCurrentFormatEssential]) {
    v2 = @"PHOTO_ENCODING_OFF";
  }
  else {
    v2 = @"PHOTO_ENCODING_ON";
  }
  BOOL v3 = accessibilityCameraUILocalizedString(v2);

  return v3;
}

- (id)_axEncodingName:(id)a3
{
  if (a3.var0 > 2uLL)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = accessibilityCameraUILocalizedString(off_26509FB78[a3.var0]);
  }
  return v4;
}

- (id)_axLocalizedStringForPhotoFormat:(id)a3
{
  int64_t var1 = a3.var1;
  uint64_t v4 = [(CAMPhotoFormatStatusIndicatorAccessibility *)self _axEncodingName:a3.var0];
  uint64_t v5 = 24;
  uint64_t v6 = 12;
  if (var1 != 1) {
    uint64_t v6 = 0;
  }
  if (var1 != 2) {
    uint64_t v5 = v6;
  }
  BOOL v7 = var1 == 3;
  if (var1 == 3) {
    uint64_t v8 = 48;
  }
  else {
    uint64_t v8 = v5;
  }
  v9 = +[AXCameraUIGlue integerFormatter];
  v10 = [NSNumber numberWithInteger:v8];
  v11 = [v9 stringFromNumber:v10];

  if (v7)
  {
    uint64_t v12 = accessibilityCameraUILocalizedString(@"PHOTO_ENCODING_MAX");

    v11 = (void *)v12;
  }
  uint64_t v13 = __UIAXStringForVariables();

  return v13;
}

- (BOOL)_axIsCurrentFormatEssential
{
  uint64_t v3 = [(CAMPhotoFormatStatusIndicatorAccessibility *)self safeValueForKey:@"selectedState"];
  uint64_t v4 = [(CAMPhotoFormatStatusIndicatorAccessibility *)self _axAllowedFormats];
  unint64_t v5 = [(CAMPhotoFormatStatusIndicatorAccessibility *)self _axEssentialFormatIndex];
  LOBYTE(v5) = [v4 indexOfObject:v3] == v5;

  return v5;
}

@end