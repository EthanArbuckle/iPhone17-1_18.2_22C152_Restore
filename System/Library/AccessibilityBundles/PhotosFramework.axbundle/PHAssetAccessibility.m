@interface PHAssetAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsPHAssetLocallyAvailable;
- (BOOL)_accessibilitySavePhotoLabel:(id)a3;
- (BOOL)_axICloudLabelWasSet;
- (BOOL)shouldMeasureBlurriness;
- (id)_accessibilityAssetDuration;
- (id)_accessibilityCaptionLabel;
- (id)_accessibilityCreationDate;
- (id)_accessibilityCreationTime;
- (id)_accessibilityFacesInfo;
- (id)_accessibilityOrientation;
- (id)_accessibilityPHAssetLocalIdentifier;
- (id)_accessibilityPeopleInPhoto;
- (id)_accessibilityPhotoLibraryURL;
- (id)_accessibilityiCloudPhotoLabel;
- (id)_axValueCallback;
- (id)accessibilityCustomContent;
- (id)accessibilityLabel;
- (id)accessibilityURL;
- (unint64_t)accessibilityTraits;
- (void)_axSetICloudLabelWasSet:(BOOL)a3;
- (void)_setAXValueCallback:(id)a3;
- (void)accessibilityApplyValueBlock:(id)a3;
@end

@implementation PHAssetAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PHAsset";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axValueCallback
{
}

- (void)_setAXValueCallback:(id)a3
{
  id v3 = (id)MEMORY[0x2455E3B50](a3, a2);
  __UIAccessibilitySetAssociatedCopiedObject();
}

- (BOOL)_axICloudLabelWasSet
{
  return MEMORY[0x270F0A438](self, &__PHAsset___axICloudLabelWasSet);
}

- (void)_axSetICloudLabelWasSet:(BOOL)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHAsset", @"pixelWidth", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHAsset", @"pixelHeight", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHAsset", @"isPhoto", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHAsset", @"isVideo", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHAsset", @"isLoopingVideo", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHAsset", @"pixelHeight", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHAsset", @"pixelWidth", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHAsset", @"isAudio", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHAsset", @"duration", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHAsset", @"mainFileURL", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHAsset", @"creationDate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHAsset", @"mediaSubtypes", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHAsset", @"isPhotoIris", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHAsset", @"isFavorite", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHObject", @"localIdentifier", "@", 0);
  [v3 validateClass:@"PHAsset" isKindOfClass:@"PHObject"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHObject", @"photoLibrary", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHPhotoLibrary", @"isSystemPhotoLibrary", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHPhotoLibrary", @"photoLibraryURL", "@", 0);
}

- (BOOL)shouldMeasureBlurriness
{
  v2 = [(PHAssetAccessibility *)self safeValueForKey:@"mediaSubtypes"];
  char v3 = [v2 unsignedIntegerValue];

  return (v3 & 0x10) == 0;
}

- (id)_accessibilityCreationTime
{
  v2 = [(PHAssetAccessibility *)self safeValueForKey:@"creationDate"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v3 = AXDateStringForFormat();
  }
  else
  {
    char v3 = 0;
  }

  return v3;
}

- (id)_accessibilityCreationDate
{
  v2 = [(PHAssetAccessibility *)self safeValueForKey:@"creationDate"];
  char v3 = __UIAccessibilitySafeClass();

  if (v3)
  {
    v4 = [MEMORY[0x263EFF8F0] currentCalendar];
    v5 = [v4 components:28 fromDate:v3];

    v6 = [MEMORY[0x263EFF8F0] currentCalendar];
    v7 = [MEMORY[0x263EFF910] date];
    v8 = [v6 components:28 fromDate:v7];

    [v5 year];
    [v8 year];
    v9 = AXDateStringForFormat();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_accessibilityOrientation
{
  char v3 = [(PHAssetAccessibility *)self safeValueForKey:@"pixelWidth"];
  uint64_t v4 = [(PHAssetAccessibility *)self safeValueForKey:@"pixelHeight"];
  v5 = (void *)v4;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    v7 = 0;
  }
  else
  {
    uint64_t v8 = [v3 integerValue];
    if (v8 >= [v5 integerValue]) {
      v9 = @"photo.label.orientation.landscape";
    }
    else {
      v9 = @"photo.label.orientation.portrait";
    }
    v7 = accessibilityPLServicesLocalizedString(v9);
  }

  return v7;
}

- (id)_accessibilityAssetDuration
{
  [(PHAssetAccessibility *)self safeFloatForKey:@"duration"];
  float v3 = roundf(v2);
  if (v3 <= 0.0)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = MEMORY[0x2455E3880](1, v3);
  }

  return v4;
}

- (id)accessibilityCustomContent
{
  float v3 = objc_opt_new();
  uint64_t v4 = [(PHAssetAccessibility *)self safeValueForKey:@"creationDate"];
  v57 = __UIAccessibilitySafeClass();

  v5 = [MEMORY[0x263EFF8F0] currentCalendar];
  v58 = [v5 components:28 fromDate:v57];

  BOOL v6 = [MEMORY[0x263EFF8F0] currentCalendar];
  v7 = [MEMORY[0x263EFF910] date];
  uint64_t v8 = [v6 components:28 fromDate:v7];

  v9 = [(PHAssetAccessibility *)self _accessibilityCreationDate];
  if ([v9 length])
  {
    v10 = (void *)MEMORY[0x263EFABD0];
    v11 = accessibilityPLServicesLocalizedString(@"date.title");
    v12 = [v10 customContentWithLabel:v11 value:v9];

    uint64_t v13 = [v58 month];
    if (v13 != [v8 month]
      || (uint64_t v14 = [v58 day], v14 != objc_msgSend(v8, "day"))
      || (uint64_t v15 = [v58 year], v15 != objc_msgSend(v8, "year")))
    {
      [v12 setImportance:1];
    }
    [v3 addObject:v12];
  }
  v16 = [(PHAssetAccessibility *)self _accessibilityCreationTime];
  if ([v16 length])
  {
    v17 = (void *)MEMORY[0x263EFABD0];
    v18 = accessibilityPLServicesLocalizedString(@"time.title");
    v19 = [v17 customContentWithLabel:v18 value:v16];

    [v19 setImportance:1];
    [v3 addObject:v19];
  }
  v20 = [(PHAssetAccessibility *)self _accessibilityOrientation];
  if ([v20 length])
  {
    v21 = (void *)MEMORY[0x263EFABD0];
    v22 = accessibilityPLServicesLocalizedString(@"orientation.title");
    v23 = [v21 customContentWithLabel:v22 value:v20];

    [v3 addObject:v23];
  }
  v55 = v20;
  v24 = [(PHAssetAccessibility *)self _accessibilityAssetDuration];
  if ([v24 length])
  {
    v25 = (void *)MEMORY[0x263EFABD0];
    v26 = accessibilityPLServicesLocalizedString(@"duration.title");
    v27 = [v25 customContentWithLabel:v26 value:v24];

    [v3 addObject:v27];
  }
  v28 = [(PHAssetAccessibility *)self _accessibilityCaptionLabel];
  if ([v28 length])
  {
    v29 = (void *)MEMORY[0x263EFABD0];
    v30 = accessibilityPLServicesLocalizedString(@"caption.title");
    v31 = [v29 customContentWithLabel:v30 value:v28];

    [v3 addObject:v31];
  }
  v54 = v28;
  v32 = [(PHAssetAccessibility *)self _accessibilityPeopleInPhoto];
  v56 = v16;
  if ([v32 length])
  {
    v33 = (void *)MEMORY[0x263EFABD0];
    v34 = accessibilityPLServicesLocalizedString(@"names.title");
    v35 = [v33 customContentWithLabel:v34 value:v32];

    [v3 addObject:v35];
  }
  else
  {
    v35 = [(PHAssetAccessibility *)self _accessibilityFacesInfo];
    if ([v35 length])
    {
      v36 = (void *)MEMORY[0x263EFABD0];
      accessibilityPLServicesLocalizedString(@"faces.title");
      v38 = v37 = v24;
      v39 = [v36 customContentWithLabel:v38 value:v35];

      v24 = v37;
      [v3 addObject:v39];
    }
  }

  v40 = [(PHAssetAccessibility *)self safeValueForKey:@"mediaSubtypes"];
  char v41 = [v40 unsignedIntegerValue];

  if ((v41 & 2) != 0)
  {
    v42 = accessibilityPLServicesLocalizedString(@"photo.label.type.photo.hdr");
    if ((v41 & 1) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  v42 = 0;
  if (v41)
  {
LABEL_23:
    v52 = accessibilityPLServicesLocalizedString(@"photo.label.type.photo.panorama");
    v53 = @"__AXStringForVariablesSentinel";
    __AXStringForVariables();
    uint64_t v44 = v43 = v24;

    v42 = (void *)v44;
    v24 = v43;
  }
LABEL_24:
  v45 = v56;
  if ((v41 & 0x10) != 0)
  {
    uint64_t v46 = accessibilityPLServicesLocalizedString(@"photo.label.type.photo.depth");

    v42 = (void *)v46;
  }
  v47 = v55;
  if (objc_msgSend(v42, "length", v52, v53))
  {
    v48 = (void *)MEMORY[0x263EFABD0];
    v49 = accessibilityPLServicesLocalizedString(@"photo.type.title");
    v50 = [v48 customContentWithLabel:v49 value:v42];

    v45 = v56;
    [v3 addObject:v50];

    v47 = v55;
  }

  return v3;
}

- (id)_accessibilityFacesInfo
{
  float v2 = [MEMORY[0x263F14DF0] fetchFacesInAsset:self options:0];
  if ([v2 count])
  {
    float v3 = NSString;
    uint64_t v4 = accessibilityPLServicesLocalizedString(@"faces.count");
    v5 = objc_msgSend(v3, "localizedStringWithFormat:", v4, objc_msgSend(v2, "count"));
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_accessibilityPeopleInPhoto
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  float v2 = [MEMORY[0x263F14E88] fetchPersonsInAsset:self options:0];
  if ([v2 count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v3 = v2;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      BOOL v6 = 0;
      uint64_t v7 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v3);
          }
          v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          v10 = objc_msgSend(v9, "name", v14, v15, (void)v16);
          uint64_t v11 = [v10 length];

          if (v11)
          {
            uint64_t v14 = [v9 name];
            uint64_t v15 = @"__AXStringForVariablesSentinel";
            uint64_t v12 = __UIAXStringForVariables();

            BOOL v6 = (void *)v12;
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v5);
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)accessibilityURL
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  char v26 = 0;
  __UIAccessibilitySafeClass();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v18 = v25 = 0u;
  objc_msgSend(MEMORY[0x263F14D70], "assetResourcesForAsset:includeDerivatives:");
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v23;
    v20 = (void *)*MEMORY[0x263F1DB40];
    long long v19 = (void *)*MEMORY[0x263F1DAF8];
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v23 != v4) {
          objc_enumerationMutation(obj);
        }
        BOOL v6 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ([v6 isLocallyAvailable])
        {
          uint64_t v7 = [v6 privateFileURL];
          if (v7)
          {
            uint64_t v8 = (void *)v7;
            v9 = [v6 uniformTypeIdentifier];
            v10 = [v20 identifier];
            if ([v9 isEqualToString:v10])
            {

LABEL_17:
              long long v16 = [v6 privateFileURL];

              uint64_t v14 = v18;
              goto LABEL_19;
            }
            uint64_t v11 = [v6 uniformTypeIdentifier];
            uint64_t v12 = [v19 identifier];
            char v13 = [v11 isEqualToString:v12];

            if (v13) {
              goto LABEL_17;
            }
          }
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

  uint64_t v14 = v18;
  if (objc_opt_respondsToSelector())
  {
    char v26 = 0;
    uint64_t v15 = [v18 safeValueForKey:@"mainFileURL"];
    long long v16 = __UIAccessibilitySafeClass();

    if (v26) {
      abort();
    }
  }
  else
  {
    long long v16 = 0;
  }
LABEL_19:

  return v16;
}

- (id)_accessibilityPHAssetLocalIdentifier
{
  return (id)[(PHAssetAccessibility *)self safeStringForKey:@"localIdentifier"];
}

- (BOOL)_accessibilityIsPHAssetLocallyAvailable
{
  uint64_t v2 = __UIAccessibilitySafeClass();
  uint64_t v3 = [MEMORY[0x263F14D70] assetResourcesForAsset:v2 includeDerivatives:0];
  uint64_t v4 = [v3 axFilterObjectsUsingBlock:&__block_literal_global_0];
  BOOL v5 = [v4 count] != 0;

  return v5;
}

uint64_t __63__PHAssetAccessibility__accessibilityIsPHAssetLocallyAvailable__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isLocallyAvailable];
}

- (id)_accessibilityPhotoLibraryURL
{
  uint64_t v2 = [(PHAssetAccessibility *)self safeValueForKey:@"photoLibrary"];
  uint64_t v3 = [v2 safeValueForKey:@"photoLibraryURL"];
  uint64_t v4 = __UIAccessibilitySafeClass();

  return v4;
}

- (id)accessibilityLabel
{
  uint64_t v3 = [(PHAssetAccessibility *)self accessibilityUserDefinedLabel];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
    goto LABEL_38;
  }
  BOOL v6 = [(PHAssetAccessibility *)self safeValueForKey:@"isPhoto"];
  int v7 = [v6 BOOLValue];

  uint64_t v8 = [(PHAssetAccessibility *)self safeValueForKey:@"isVideo"];
  int v9 = [v8 BOOLValue];

  v10 = [(PHAssetAccessibility *)self safeValueForKey:@"isAudio"];
  int v11 = [v10 BOOLValue];

  char v12 = [(PHAssetAccessibility *)self safeBoolForKey:@"isLoopingVideo"];
  int v13 = [(PHAssetAccessibility *)self safeBoolForKey:@"isFavorite"];
  uint64_t v14 = [(PHAssetAccessibility *)self safeValueForKey:@"isPhotoIris"];
  int v15 = [v14 BOOLValue];

  long long v16 = [(PHAssetAccessibility *)self safeValueForKey:@"mainFileURL"];
  if (v7)
  {
    if (UIAccessibilityIsImageScreenshot())
    {
      uint64_t v17 = accessibilityUIKitLocalizedString();
LABEL_20:
      long long v18 = (void *)v17;
      goto LABEL_26;
    }
    if (v15)
    {
      long long v19 = accessibilityCameraUILocalizedString(@"live.photo");
      uint64_t v20 = AXAttributedStringForBetterPronuciation();
LABEL_25:
      long long v18 = (void *)v20;

      goto LABEL_26;
    }
    long long v23 = @"photo.label.type.photo";
    goto LABEL_19;
  }
  if (v12)
  {
    long long v18 = accessibilityPLServicesLocalizedString(@"photo.label.type.looping.video");
    if (v9)
    {
LABEL_26:
      char v26 = [(PHAssetAccessibility *)self _accessibilityiCloudPhotoLabel];
      if ([v26 length])
      {
        id v24 = v26;
      }
      else
      {
        if (v7) {
          UIAccessibilityMetadataDescriptionForImage();
        }
        else {
          UIAccessibilityMetadataDescriptionForVideo();
        }
        id v24 = (id)objc_claimAutoreleasedReturnValue();
        if ([v24 length]) {
          [(PHAssetAccessibility *)self _accessibilitySavePhotoLabel:v24];
        }
      }

      if (v13) {
        goto LABEL_34;
      }
      goto LABEL_23;
    }
  }
  else
  {
    if (v9)
    {
      uint64_t v21 = [(PHAssetAccessibility *)self safeValueForKey:@"mediaSubtypes"];
      int v22 = [v21 unsignedIntegerValue];

      if ((v22 & 0x20000) != 0)
      {
        long long v23 = @"photo.label.type.video.slomo";
      }
      else
      {
        if ((v22 & 0x40000) != 0)
        {
          long long v19 = accessibilityPLServicesLocalizedString(@"photo.label.type.video.timelapse");
          v31 = @"__AXStringForVariablesSentinel";
          uint64_t v20 = __AXStringForVariables();
          goto LABEL_25;
        }
        long long v23 = @"photo.label.type.video";
      }
LABEL_19:
      uint64_t v17 = accessibilityPLServicesLocalizedString(v23);
      goto LABEL_20;
    }
    if (v11)
    {
      long long v18 = accessibilityPLServicesLocalizedString(@"photo.label.type.audio");
    }
    else
    {
      long long v18 = 0;
    }
  }
  id v24 = 0;
  if (v13)
  {
LABEL_34:
    long long v25 = accessibilityPLServicesLocalizedString(@"is.favorite");
    goto LABEL_35;
  }
LABEL_23:
  long long v25 = 0;
LABEL_35:
  v33 = v25;
  v34 = @"__AXStringForVariablesSentinel";
  id v32 = v24;
  __UIAXStringForVariables();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (AXDoesRequestingClientDeserveAutomation())
  {
    v27 = [(PHAssetAccessibility *)self _accessibilityAssetDuration];
    uint64_t v28 = [(PHAssetAccessibility *)self _accessibilityCreationDate];
    v34 = [(PHAssetAccessibility *)self _accessibilityCreationTime];
    v35 = @"__AXStringForVariablesSentinel";
    id v32 = v27;
    v33 = v28;
    uint64_t v29 = __UIAXStringForVariables();

    id v5 = (id)v29;
  }
  -[PHAssetAccessibility setAccessibilityLabel:](self, "setAccessibilityLabel:", v5, v32, v33, v34, v35);

LABEL_38:

  return v5;
}

- (id)_accessibilityCaptionLabel
{
  uint64_t v2 = [(PHAssetAccessibility *)self descriptionProperties];
  uint64_t v3 = [v2 assetDescription];

  return v3;
}

- (id)_accessibilityiCloudPhotoLabel
{
  uint64_t v2 = self;
  if ([(PHAssetAccessibility *)v2 _axICloudLabelWasSet])
  {
    uint64_t v3 = (void *)MEMORY[0x263EFF8C0];
    uint64_t v4 = [(PHAssetAccessibility *)v2 localIdentifier];
    id v5 = objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 1, v4);

    BOOL v6 = [MEMORY[0x263F14D18] fetchAssetsWithLocalIdentifiers:v5 options:0];
    if ([v6 count] != 1)
    {
      int v11 = v2;
      char v12 = v6;
      _AXAssert();
    }
    objc_msgSend(v6, "firstObject", v11, v12);
    int v7 = (PHAssetAccessibility *)objc_claimAutoreleasedReturnValue();

    if (!v7) {
      int v7 = v2;
    }

    uint64_t v2 = v7;
  }
  uint64_t v8 = [(PHAssetAccessibility *)v2 descriptionProperties];
  int v9 = [v8 accessibilityDescription];

  return v9;
}

- (BOOL)_accessibilitySavePhotoLabel:(id)a3
{
  id v4 = a3;
  [(PHAssetAccessibility *)self setAccessibilityLabel:0];
  [(PHAssetAccessibility *)self _axSetICloudLabelWasSet:1];
  LOBYTE(location) = 0;
  objc_opt_class();
  id v5 = [(PHAssetAccessibility *)self safeValueForKey:@"photoLibrary"];
  BOOL v6 = __UIAccessibilityCastAsClass();

  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __53__PHAssetAccessibility__accessibilitySavePhotoLabel___block_invoke;
  v11[3] = &unk_2650A57C8;
  v11[4] = self;
  id v7 = v4;
  id v12 = v7;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __53__PHAssetAccessibility__accessibilitySavePhotoLabel___block_invoke_2;
  v9[3] = &unk_2650A57F0;
  objc_copyWeak(&v10, &location);
  [v6 performChanges:v11 completionHandler:v9];
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
  return 1;
}

void __53__PHAssetAccessibility__accessibilitySavePhotoLabel___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F14D20] changeRequestForAsset:*(void *)(a1 + 32)];
  [v2 setAccessibilityDescription:*(void *)(a1 + 40)];
}

void __53__PHAssetAccessibility__accessibilitySavePhotoLabel___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  BOOL v6 = VOTLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v8 = 138412802;
    id v9 = WeakRetained;
    __int16 v10 = 1024;
    int v11 = a2;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_240216000, v6, OS_LOG_TYPE_DEFAULT, "Asset save: %@ success %d: %@", (uint8_t *)&v8, 0x1Cu);
  }
}

- (void)accessibilityApplyValueBlock:(id)a3
{
  id v5 = (void (**)(id, void *))a3;
  [(PHAssetAccessibility *)self _setAXValueCallback:v5];
  id v4 = [(PHAssetAccessibility *)self _accessibilityPhotoDescription];
  if (v5 && v4) {
    v5[2](v5, v4);
  }
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF00];
}

@end