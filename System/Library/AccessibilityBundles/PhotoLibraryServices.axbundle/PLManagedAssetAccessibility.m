@interface PLManagedAssetAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation PLManagedAssetAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PLManagedAsset";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PLManagedAsset", @"isPhoto", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PLManagedAsset", @"isVideo", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PLManagedAsset", @"isAudio", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PLManagedAsset", @"isPhotoIris", "B", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(PLManagedAssetAccessibility *)self safeValueForKey:@"isPhoto"];
  int v4 = [v3 BOOLValue];

  v5 = [(PLManagedAssetAccessibility *)self safeValueForKey:@"isVideo"];
  int v6 = [v5 BOOLValue];

  v7 = [(PLManagedAssetAccessibility *)self safeValueForKey:@"isAudio"];
  int v8 = [v7 BOOLValue];

  v9 = [(PLManagedAssetAccessibility *)self safeValueForKey:@"isPhotoIris"];
  int v10 = [v9 BOOLValue];

  v11 = [(PLManagedAssetAccessibility *)self safeValueForKey:@"mainFileURL"];
  int v44 = v6;
  int v42 = v8;
  if (!v4)
  {
    if (v6)
    {
      v13 = @"photo.label.type.video";
    }
    else
    {
      if (!v8)
      {
        v43 = 0;
        goto LABEL_13;
      }
      v13 = @"photo.label.type.audio";
    }
    goto LABEL_11;
  }
  if (UIAccessibilityIsImageScreenshot())
  {
    uint64_t v12 = accessibilityUIKitLocalizedString();
LABEL_12:
    v43 = (void *)v12;
    goto LABEL_13;
  }
  if (!v10)
  {
    v13 = @"photo.label.type.photo";
LABEL_11:
    uint64_t v12 = accessibilityPLServicesLocalizedString(v13);
    goto LABEL_12;
  }
  v14 = accessibilityPLServicesLocalizedString(@"photo.label.type.photo.iris");
  v43 = AXAttributedStringForBetterPronuciation();

LABEL_13:
  v15 = [(PLManagedAssetAccessibility *)self safeValueForKey:@"width"];
  uint64_t v16 = [(PLManagedAssetAccessibility *)self safeValueForKey:@"height"];
  v17 = (void *)v16;
  v18 = 0;
  if (v15 && v16 && ((v4 ^ 1) & 1) == 0)
  {
    uint64_t v19 = [v15 integerValue];
    if (v19 >= [v17 integerValue]) {
      v20 = @"photo.label.orientation.landscape";
    }
    else {
      v20 = @"photo.label.orientation.portrait";
    }
    v18 = accessibilityPLServicesLocalizedString(v20);
  }
  v21 = [(PLManagedAssetAccessibility *)self safeValueForKey:@"dateCreated"];
  if (v21)
  {
    v41 = v11;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = [MEMORY[0x263EFF8F0] currentCalendar];
      v23 = [v22 components:28 fromDate:v21];

      v24 = [MEMORY[0x263EFF8F0] currentCalendar];
      v25 = [MEMORY[0x263EFF910] date];
      v26 = [v24 components:28 fromDate:v25];

      uint64_t v27 = [v23 year];
      if (v27 == [v26 year])
      {
        uint64_t v28 = [v23 month];
        if (v28 == [v26 month])
        {
          [v23 day];
          [v26 day];
        }
      }
      v29 = AXDateStringForFormat();
    }
    else
    {
      v29 = 0;
    }
    v11 = v41;
  }
  else
  {
    v29 = 0;
  }
  v30 = [(PLManagedAssetAccessibility *)self safeValueForKey:@"duration"];
  [v30 floatValue];
  float v32 = roundf(v31);

  v33 = 0;
  if (v32 > 0.0 && v42 | v44)
  {
    v34 = (void *)MEMORY[0x263F21660];
    objc_msgSend(NSString, "stringWithFormat:", @"%.0f", v32);
    v36 = v35 = v11;
    v33 = [v34 axAttributedStringWithString:v36];

    v11 = v35;
    if (v32 >= 3600.0) {
      v37 = (void *)MEMORY[0x263F21730];
    }
    else {
      v37 = (void *)MEMORY[0x263F21740];
    }
    [v33 setAttribute:*MEMORY[0x263EFFB40] forKey:*v37];
  }
  if (v4)
  {
    v38 = UIAccessibilityMetadataDescriptionForImage();
  }
  else if (v44)
  {
    v38 = UIAccessibilityMetadataDescriptionForVideo();
  }
  else
  {
    v38 = 0;
  }
  v39 = __UIAXStringForVariables();

  return v39;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF00];
}

@end