id AXVectorKitLocString(void *a1)
{
  id v1;
  void *v2;
  uint64_t vars8;

  v1 = a1;
  if (AXVectorKitLocString_onceToken != -1) {
    dispatch_once(&AXVectorKitLocString_onceToken, &__block_literal_global);
  }
  if (AXVectorKitLocString_bundle)
  {
    v2 = [(id)AXVectorKitLocString_bundle localizedStringForKey:v1 value:&stru_26F81E868 table:@"Accessibility"];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void __AXVectorKitLocString_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.VectorKit.axbundle"];
  v1 = (void *)AXVectorKitLocString_bundle;
  AXVectorKitLocString_bundle = v0;
}

id AXMapKitLocString(void *a1)
{
  id v1 = a1;
  if (AXMapKitLocString_onceToken != -1) {
    dispatch_once(&AXMapKitLocString_onceToken, &__block_literal_global_276);
  }
  if (AXMapKitLocString_bundle)
  {
    v2 = [(id)AXMapKitLocString_bundle localizedStringForKey:v1 value:&stru_26F81E868 table:@"Accessibility"];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void __AXMapKitLocString_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.MapKitFramework.axbundle"];
  id v1 = (void *)AXMapKitLocString_bundle;
  AXMapKitLocString_bundle = v0;
}

id AXMapsLocString(void *a1)
{
  id v1 = a1;
  if (AXMapsLocString_onceToken != -1) {
    dispatch_once(&AXMapsLocString_onceToken, &__block_literal_global_281);
  }
  if (AXMapsLocString_bundle)
  {
    v2 = [(id)AXMapsLocString_bundle localizedStringForKey:v1 value:&stru_26F81E868 table:@"Accessibility-Maps"];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void __AXMapsLocString_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F086E0] accessibilityBundleWithLastPathComponent:@"Maps.axbundle"];
  id v1 = (void *)AXMapsLocString_bundle;
  AXMapsLocString_bundle = v0;
}

id AXStringByReplacingMiddleDots(void *a1)
{
  uint64_t v1 = AXStringByReplacingMiddleDots_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&AXStringByReplacingMiddleDots_onceToken, &__block_literal_global_289);
  }
  v3 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  v4 = [v2 stringByTrimmingCharactersInSet:v3];

  v5 = [v4 stringByTrimmingCharactersInSet:AXStringByReplacingMiddleDots_MiddleDotCharacterSet];

  v6 = [v5 componentsSeparatedByCharactersInSet:AXStringByReplacingMiddleDots_MiddleDotCharacterSet];
  v7 = objc_msgSend(v6, "ax_flatMappedArrayUsingBlock:", &__block_literal_global_296);

  v8 = [v7 componentsJoinedByString:@", "];

  return v8;
}

void __AXStringByReplacingMiddleDots_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"·"];
  uint64_t v1 = (void *)AXStringByReplacingMiddleDots_MiddleDotCharacterSet;
  AXStringByReplacingMiddleDots_MiddleDotCharacterSet = v0;
}

id __AXStringByReplacingMiddleDots_block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x263F08708];
  id v3 = a2;
  v4 = [v2 whitespaceAndNewlineCharacterSet];
  v5 = [v3 stringByTrimmingCharactersInSet:v4];

  if (![v5 length])
  {

    v5 = 0;
  }

  return v5;
}

id AXShortAddressDescriptionForPlacemark(void *a1, int a2)
{
  id v3 = a1;
  id v4 = objc_alloc_init(MEMORY[0x263F089D8]);
  v5 = [v3 subThoroughfare];
  uint64_t v6 = [v5 length];
  BOOL v7 = v6 != 0;
  if (!v6) {
    goto LABEL_4;
  }
  if ([v5 rangeOfString:@"-"] == 0x7FFFFFFFFFFFFFFFLL)
  {
    [v4 appendString:v5];
LABEL_4:
    int v8 = 0;
    goto LABEL_6;
  }
  v9 = NSString;
  v10 = AXVectorKitLocString(@"BETWEEN_ADDRESS_RANGE");
  v11 = objc_msgSend(v9, "localizedStringWithFormat:", v10, v5);
  [v4 appendString:v11];

  int v8 = 1;
LABEL_6:
  v12 = [v3 thoroughfare];

  if ([v12 length])
  {
    if (v6) {
      [v4 appendString:@" "];
    }
    if (v8)
    {
      v13 = NSString;
      v14 = AXVectorKitLocString(@"ON_ROAD");
      v15 = objc_msgSend(v13, "localizedStringWithFormat:", v14, v12);
      [v4 appendString:v15];
    }
    else
    {
      [v4 appendString:v12];
    }
    BOOL v7 = 1;
  }
  if (!v7 || a2)
  {
    v16 = [v3 subLocality];

    if ([v16 length])
    {
      if (v7) {
        [v4 appendString:@", "];
      }
      [v4 appendString:v16];
      BOOL v7 = 1;
    }
    v17 = [v3 locality];

    if ([v17 length])
    {
      if (v7) {
        [v4 appendString:@", "];
      }
      [v4 appendString:v17];
      BOOL v7 = 1;
    }
    v18 = [v3 subAdministrativeArea];

    if ([v18 length])
    {
      v19 = [v3 locality];
      char v20 = [v18 isEqualToString:v19];

      if ((v20 & 1) == 0)
      {
        if (v7) {
          [v4 appendString:@", "];
        }
        [v4 appendString:v18];
        BOOL v7 = 1;
      }
    }
    v12 = [v3 administrativeArea];

    if ([v12 length])
    {
      if (v7) {
        [v4 appendString:@", "];
      }
      [v4 appendString:v12];
    }
  }
  if ([v4 length])
  {
    id v21 = v4;
  }
  else
  {
    v22 = [v3 formattedAddressLines];
    id v21 = [v22 componentsJoinedByString:@"\n"];
  }

  return v21;
}

BOOL AXRequiresMapAccessibilityForAccessibilityTechnology()
{
  return UIAccessibilityIsVoiceOverRunning()
      || UIAccessibilityIsSwitchControlRunning()
      || _AXSCommandAndControlEnabled()
      || _AXSFullKeyboardAccessEnabled() != 0;
}

id AXNotificationsForMapAccessibilityClients()
{
  v4[4] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F8B138];
  v4[0] = *MEMORY[0x263F8B3F0];
  v4[1] = v0;
  uint64_t v1 = *MEMORY[0x263F8B1B8];
  v4[2] = *MEMORY[0x263F8B178];
  v4[3] = v1;
  id v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:4];

  return v2;
}

uint64_t AXRequiresMapAccessibility()
{
  return 1;
}

uint64_t AXRequiresMapAccessibilityPurelyForAutomation()
{
  uint64_t result = _AXSAutomationEnabled();
  if (result) {
    return !AXRequiresMapAccessibilityForAccessibilityTechnology();
  }
  return result;
}

BOOL AXRequiresLongerTimeouts()
{
  if (UIAccessibilityIsVoiceOverRunning()) {
    return 1;
  }

  return UIAccessibilityIsSwitchControlRunning();
}

uint64_t AXPublisherDescriptionForAttribution(void *a1, const char *a2)
{
  return [a1 safeStringForKey:@"displayName"];
}

id AXPublisherDescriptionForCollection(void *a1)
{
  uint64_t v1 = [a1 safeValueForKey:@"publisherAttribution"];
  id v2 = [v1 safeStringForKey:@"displayName"];

  return v2;
}

void sub_2426A55CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20)
{
  objc_destroyWeak(v20);
  _Block_object_dispose(&a16, 8);
  _Block_object_dispose(&a20, 8);
  objc_destroyWeak((id *)(v21 - 40));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_2426A6404(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

id AXVKAccessibilityPaths(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a1;
  v5 = [MEMORY[0x263EFF980] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ((objc_opt_isKindOfClass() & 1) != 0 && (!a3 || objc_msgSend(v10, "mapFeatureType", (void)v14) == a3))
        {
          objc_msgSend(v10, "accessibilityPath", (void)v14);
          id v11 = objc_claimAutoreleasedReturnValue();
          v12 = (const CGPath *)[v11 CGPath];

          if (!CGPathIsEmpty(v12)) {
            [v5 addObject:v12];
          }
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v5;
}

void sub_2426A70E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id AXVKAccessibilityPoints(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a1;
  v5 = objc_msgSend(MEMORY[0x263EFF980], "array", v4);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obuint64_t j = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(id **)(*((void *)&v21 + 1) + 8 * i);
        if ((objc_opt_isKindOfClass() & 1) != 0 && (!a3 || [v9 mapFeatureType] == a3))
        {
          id v10 = v9[19];
          long long v17 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          id v11 = v10;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
          if (v12)
          {
            uint64_t v13 = *(void *)v18;
            do
            {
              for (uint64_t j = 0; j != v12; ++j)
              {
                if (*(void *)v18 != v13) {
                  objc_enumerationMutation(v11);
                }
                [v5 addObjectsFromArray:*(void *)(*((void *)&v17 + 1) + 8 * j)];
              }
              uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
            }
            while (v12);
          }
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v6);
  }

  return v5;
}

void sub_2426A732C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

BOOL AXVKBuildingShouldBeVisible(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  [v4 accessibilityZoomLevel];
  float v6 = v5;
  BOOL v7 = AXVKFeatureMaxVisibleLength(v3, v4) > 30.0;
  BOOL v8 = v6 >= 17.0 && v7;

  return v8;
}

void sub_2426A73F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double AXVKFeatureMaxVisibleLength(void *a1, void *a2)
{
  id v3 = a2;
  v20.origin.CGFloat x = AXVKFeatureScreenBounds(a1, v3);
  CGFloat x = v20.origin.x;
  CGFloat y = v20.origin.y;
  CGFloat width = v20.size.width;
  CGFloat height = v20.size.height;
  double v8 = CGRectGetWidth(v20);
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  double v9 = CGRectGetHeight(v21);
  [v3 bounds];
  v23.origin.CGFloat x = v10;
  v23.origin.CGFloat y = v11;
  v23.size.CGFloat width = v12;
  v23.size.CGFloat height = v13;
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  BOOL v14 = CGRectIntersectsRect(v22, v23);
  float v15 = v8;
  float v16 = v9;
  double v17 = sqrtf((float)(v15 * v15) + (float)(v16 * v16));
  if (v14) {
    double v18 = v17;
  }
  else {
    double v18 = 0.0;
  }

  return v18;
}

void sub_2426A74E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double AXVKFeatureScreenBounds(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  GEOMultiSectionFeatureBounds();
  float v5 = [v3 feature];
  float v6 = [v5 containingTile];
  [v6 geoTileKey];

  VKWorldBoundsFromGEOTileKey();
  VKLocationCoordinate2DForVKPoint();
  double v8 = v7;
  double v10 = v9;
  VKLocationCoordinate2DForVKPoint();
  double v12 = v11;
  double v14 = v13;
  objc_msgSend(v4, "accessibilityConvertCoordinateToWindow:", v8, v10);
  double v16 = v15;
  objc_msgSend(v4, "accessibilityConvertCoordinateToWindow:", v12, v14);
  if (v16 >= v17) {
    double v18 = v17;
  }
  else {
    double v18 = v16;
  }

  return v18;
}

void sub_2426A7660(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double AXVKPointForTileGLPoint(double a1, double a2, double a3, double a4, float a5)
{
  return a1 + a5 * (a2 - a1);
}

BOOL AXVKIsInvalidLocationDegrees(double a1)
{
  return a1 == 0.0;
}

BOOL AXVKLabelMarkerIsPointOfInterest(void *a1)
{
  return [a1 featureType] == 3;
}

BOOL AXVKLocationDegreesEqualToLocationDegrees(double a1, double a2)
{
  return vabdd_f64(a1, a2) < 1.0;
}

BOOL AXVKFeatureEqualToFeature(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  float v5 = v4;
  BOOL v6 = 0;
  if (v3 && v4)
  {
    double v7 = [v3 containingTile];
    double v8 = [v5 containingTile];
    char v9 = [v7 isEqual:v8];

    if ((v9 & 1) == 0) {
      goto LABEL_16;
    }
    uint64_t v10 = [v3 labelOffset];
    if (v10 != [v5 labelOffset]) {
      goto LABEL_16;
    }
    uint64_t v11 = [v3 labelCount];
    if (v11 != [v5 labelCount]) {
      goto LABEL_16;
    }
    uint64_t v12 = [v3 shieldOffset];
    if (v12 != [v5 shieldOffset]) {
      goto LABEL_16;
    }
    uint64_t v13 = [v3 shieldCount];
    if (v13 != [v5 shieldCount]) {
      goto LABEL_16;
    }
    int v14 = [v3 styleID];
    if (v14 != [v5 styleID]) {
      goto LABEL_16;
    }
    uint64_t v15 = [v3 featureID];
    if (v15 != [v5 featureID]) {
      goto LABEL_16;
    }
    if ([v3 hasBusinessID])
    {
      if ([v5 hasBusinessID])
      {
        uint64_t v16 = [v3 businessID];
        if (v16 != [v5 businessID]) {
          goto LABEL_16;
        }
      }
    }
    [v3 minZoomRank];
    float v18 = v17;
    [v5 minZoomRank];
    if (v18 == v19 && (uint64_t v20 = [v3 flyoverAnimationID], v20 == objc_msgSend(v5, "flyoverAnimationID")))
    {
      int v21 = [v3 type];
      BOOL v6 = v21 == [v5 type];
    }
    else
    {
LABEL_16:
      BOOL v6 = 0;
    }
  }

  return v6;
}

void sub_2426A78E0(_Unwind_Exception *a1)
{
  float v5 = v4;

  _Unwind_Resume(a1);
}

unint64_t AXVKFeatureHash(void *a1)
{
  id v1 = a1;
  id v2 = [v1 containingTile];
  uint64_t v3 = [v2 hash];

  uint64_t v4 = AXVKFeatureLabelsAndShieldsHash(v1);
  unsigned int v5 = [v1 styleID];
  uint64_t v6 = [v1 featureID] + 53 * (53 * (v4 + 53 * v3 + 2809) + v5);
  if ([v1 hasBusinessID]) {
    uint64_t v6 = [v1 businessID] + 53 * v6;
  }
  [v1 minZoomRank];
  float v8 = v7;
  uint64_t v9 = [v1 flyoverAnimationID];
  unint64_t v10 = 53 * (v9 + 53 * (unint64_t)(float)(v8 + (float)(unint64_t)(53 * v6)))
      + (int)[v1 type];

  return v10;
}

void sub_2426A7A04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t AXVKFeatureLabelsAndShieldsHash(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 labelOffset];
  uint64_t v3 = [v1 labelCount];
  uint64_t v4 = [v1 shieldOffset];
  uint64_t v5 = [v1 shieldCount] + 53 * (v4 + 53 * (v3 + 53 * v2 + 2809));

  return v5;
}

void sub_2426A7A90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL AXVKMultiSectionFeatureEqualToMultiSectionFeature(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = v4;
  BOOL v6 = 0;
  if (v3 && v4)
  {
    float v7 = [v3 feature];
    float v8 = [v5 feature];
    BOOL v9 = AXVKFeatureEqualToFeature(v7, v8);

    if (v9
      && (uint64_t v10 = [v3 sectionOffset], v10 == objc_msgSend(v5, "sectionOffset"))
      && (uint64_t v11 = [v3 sectionCount], v11 == objc_msgSend(v5, "sectionCount"))
      && (uint64_t v12 = [v3 roadPointIndex], v12 == objc_msgSend(v5, "roadPointIndex"))
      && (uint64_t v13 = [v3 roadPointCount], v13 == objc_msgSend(v5, "roadPointCount"))
      && (int v14 = [v3 roadClass], v14 == objc_msgSend(v5, "roadClass"))
      && (int v15 = [v3 formOfWay], v15 == objc_msgSend(v5, "formOfWay")))
    {
      int v16 = [v3 travelDirection];
      BOOL v6 = v16 == [v5 travelDirection];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

void sub_2426A7C00(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

uint64_t AXVKMultiSectionFeatureHash(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 feature];
  unint64_t v3 = AXVKFeatureHash(v2);

  uint64_t v4 = [v1 sectionOffset];
  uint64_t v5 = [v1 sectionCount];
  uint64_t v6 = [v1 roadPointIndex];
  uint64_t v7 = [v1 roadPointCount];
  int v8 = [v1 roadClass];
  int v9 = [v1 formOfWay];
  uint64_t v10 = 53 * (53 * (53 * (v7 + 53 * (v6 + 53 * (v5 + 53 * (v4 + 53 * v3 + 2809)))) + v8) + v9)
      + (int)[v1 travelDirection];

  return v10;
}

void sub_2426A7D0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id AXVKMapElementComparator()
{
  if (AXVKMapElementComparator::_MapElementComparatorOnceToken != -1) {
    dispatch_once(&AXVKMapElementComparator::_MapElementComparatorOnceToken, &__block_literal_global_1);
  }
  uint64_t v0 = (void *)MEMORY[0x245668F10](AXVKMapElementComparator::_MapElementComparator);

  return v0;
}

void __AXVKMapElementComparator_block_invoke()
{
  uint64_t v0 = [&__block_literal_global_274 copy];
  id v1 = (void *)AXVKMapElementComparator::_MapElementComparator;
  AXVKMapElementComparator::_MapElementComparator = v0;
}

uint64_t __AXVKMapElementComparator_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 accessibilityActivationPoint];
  double v6 = v5;
  double v8 = v7;
  [v4 accessibilityActivationPoint];
  if (v8 <= v10 && (v8 == v10 ? (BOOL v11 = v6 <= v9) : (BOOL v11 = 1), v11))
  {
    LODWORD(v12) = v8 == v10;
    if (v6 >= v9) {
      LODWORD(v12) = 0;
    }
    if (v8 < v10) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = v12;
    }
    uint64_t v13 = v12 << 63 >> 63;
  }
  else
  {
    uint64_t v13 = 1;
  }

  return v13;
}

void sub_2426A7E44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id AXVKTransitRouteElementComparator()
{
  if (AXVKTransitRouteElementComparator::onceToken != -1) {
    dispatch_once(&AXVKTransitRouteElementComparator::onceToken, &__block_literal_global_276_0);
  }
  uint64_t v0 = (void *)MEMORY[0x245668F10](AXVKTransitRouteElementComparator::_TransitRouteElementComparator);

  return v0;
}

void __AXVKTransitRouteElementComparator_block_invoke()
{
  uint64_t v0 = [&__block_literal_global_279 copy];
  id v1 = (void *)AXVKTransitRouteElementComparator::_TransitRouteElementComparator;
  AXVKTransitRouteElementComparator::_TransitRouteElementComparator = v0;
}

uint64_t __AXVKTransitRouteElementComparator_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  int v5 = [a2 sortKey];
  int v6 = [v4 sortKey];
  uint64_t v7 = -1;
  if (v5 >= v6) {
    uint64_t v7 = 1;
  }
  if (v5 == v6) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = v7;
  }

  return v8;
}

void sub_2426A7F40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t AXVKRectDescription(double a1, double a2, double a3, double a4)
{
  return [NSString localizedStringWithFormat:@"Minimum point: (%f, %f), Maximum point: (%f, %f)", *(void *)&a1, *(void *)&a3, *(void *)&a2, *(void *)&a4];
}

BOOL AXVKRectEqualToRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  return vabdd_f64(a1, a5) < 0.000001
      && vabdd_f64(a3, a7) < 0.000001
      && vabdd_f64(a2, a6) < 0.000001
      && vabdd_f64(a4, a8) < 0.000001;
}

uint64_t AXVKRoadShouldBeVisible(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  int v5 = [v3 feature];
  GEOFeatureGetLocalizedLabel();

  if ([v4 containsObject:0])
  {
    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v7 = [v3 feature];
    GEOFeatureGetNativeLabel();

    uint64_t v6 = [v4 containsObject:0];
  }

  return v6;
}

void sub_2426A80F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

float AXVKStrokeWidthForRoad(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  [v4 accessibilityZoomLevel];
  float v6 = v5;
  float v7 = 1.5;
  if (v5 > 14.0)
  {
    if ([v3 travelDirection])
    {
      unsigned int v8 = [v3 roadClass];
      float v9 = 2.0;
      if (v8 < 4)
      {
        double v10 = (float *)&unk_2426CBC00;
LABEL_7:
        float v9 = v10[v8];
      }
    }
    else
    {
      unsigned int v8 = [v3 roadClass];
      float v9 = 2.0;
      if (v8 < 8)
      {
        double v10 = (float *)&unk_2426CBBD8;
        goto LABEL_7;
      }
    }
    float v7 = (float)((float)((float)(v6 + -14.0) / 10.0) + 1.0) * v9;
  }

  return v7;
}

void sub_2426A81FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426A82A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2426A83F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426A8458(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426A84F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void AXVKMathGetVectorAndDistanceForPoints(double *a1, long double *a2, CGPoint a3, CGPoint a4)
{
  double y = a4.y;
  double v5 = a3.y;
  double v7 = a3.x - a4.x;
  double v8 = vabdd_f64(a3.x, a4.x);
  double v9 = vabdd_f64(a3.y, a4.y);
  *a2 = hypot(v8, v9);
  if (v7 == 0.0) {
    double v10 = 90.0;
  }
  else {
    double v10 = atan(v9 / v8) * 57.2957795;
  }
  double v11 = v5 - y;
  if (v7 >= 0.0)
  {
    if (v11 >= 0.0) {
      goto LABEL_11;
    }
    double v10 = 90.0 - v10;
    double v12 = 270.0;
  }
  else if (v11 <= 0.0)
  {
    double v12 = 180.0;
  }
  else
  {
    double v12 = 90.0;
    double v10 = 90.0 - v10;
  }
  double v10 = v10 + v12;
LABEL_11:
  double v13 = *a1;
  double v14 = v10 + floor(*a1 / 360.0) * 360.0;
  *a1 = v14;
  if (v10 <= 270.0)
  {
    if (v10 >= 90.0) {
      return;
    }
    if (v13 <= 180.0 || v13 >= 360.0)
    {
      if (v13 > 0.0) {
        return;
      }
    }
    else
    {
      double v10 = v14 + 360.0;
    }
    goto LABEL_23;
  }
  if (v13 > 0.0 && v13 < 180.0)
  {
    double v10 = v10 + -360.0;
LABEL_23:
    *a1 = v10;
    return;
  }
  if (v13 > 360.0 || v13 == 0.0) {
    goto LABEL_23;
  }
}

double AXVKMathGetDistanceBetweenPoints(CGPoint a1, CGPoint a2)
{
  return fabs(hypot(a1.x - a2.x, a1.y - a2.y));
}

double AXVKGetWalkingDirectionBetweenVertices(AXVKExplorationVertexElement *a1, AXVKExplorationVertexElement *a2)
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  v46 = v3;
  [(AXVKExplorationVertexElement *)v3 getScreenPoint];
  double v6 = v5;
  double v8 = v7;
  [(AXVKExplorationVertexElement *)v4 getScreenPoint];
  double v10 = v9;
  double v12 = v11;
  double v60 = 0.0;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  obuint64_t j = [(AXVKExplorationVertexElement *)v3 roads];
  uint64_t v13 = [obj countByEnumeratingWithState:&v55 objects:v62 count:16];
  if (v13)
  {
    uint64_t v48 = *(void *)v56;
    v50 = v4;
    do
    {
      uint64_t v49 = v13;
      for (uint64_t i = 0; i != v49; ++i)
      {
        if (*(void *)v56 != v48) {
          objc_enumerationMutation(obj);
        }
        int v15 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        int v16 = [(AXVKExplorationVertexElement *)v4 roads];
        int v17 = [v16 containsObject:v15];

        if (v17)
        {
          float v18 = [v15 consolidatedAndOrderedFeatures];
          long long v53 = 0u;
          long long v54 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          id v19 = v18;
          uint64_t v20 = [v19 countByEnumeratingWithState:&v51 objects:v61 count:16];
          if (v20)
          {
            uint64_t v21 = *(void *)v52;
            while (2)
            {
              for (uint64_t j = 0; j != v20; ++j)
              {
                if (*(void *)v52 != v21) {
                  objc_enumerationMutation(v19);
                }
                unint64_t v23 = 0;
                long long v24 = *(void **)(*((void *)&v51 + 1) + 8 * j);
                uint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
                uint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
                while (v23 < [v24 count])
                {
                  uint64_t v27 = [v24 objectAtIndexedSubscript:v23];
                  [v27 pointValue];
                  double v29 = v28;
                  double v31 = v30;

                  if (vabdd_f64(v29, v6) + vabdd_f64(v31, v8) < 1.0) {
                    uint64_t v26 = v23;
                  }
                  if (vabdd_f64(v29, v10) + vabdd_f64(v31, v12) < 1.0) {
                    uint64_t v25 = v23;
                  }
                  ++v23;
                }
                if (v26 != 0x7FFFFFFFFFFFFFFFLL && v25 != 0x7FFFFFFFFFFFFFFFLL && v26 != v25)
                {
                  v32 = [v24 objectAtIndexedSubscript:v26];
                  [v32 pointValue];
                  double v6 = v33;
                  double v8 = v34;

                  if (v25 < v26) {
                    uint64_t v35 = -1;
                  }
                  else {
                    uint64_t v35 = 1;
                  }
                  if (v26 + v35 >= 0)
                  {
                    double v36 = 0.0;
                    do
                    {
                      if (v35 + v26 >= (unint64_t)[v24 count]) {
                        break;
                      }
                      v37 = objc_msgSend(v24, "objectAtIndexedSubscript:");
                      [v37 pointValue];
                      double v10 = v38;
                      double v12 = v39;

                      v40 = [(AXVKExplorationVertexElement *)v50 mapView];
                      objc_msgSend(v40, "accessibilityRealDistanceBetweenPoint:screenPoint2:", v6, v8, v10, v12);
                      float v42 = v41;

                      double v36 = v36 + v42;
                      if (v36 >= 50.0) {
                        break;
                      }
                      uint64_t v43 = 2 * v35 + v26;
                      v26 += v35;
                    }
                    while ((v43 & 0x8000000000000000) == 0);
                  }
                  goto LABEL_33;
                }
              }
              uint64_t v20 = [v19 countByEnumeratingWithState:&v51 objects:v61 count:16];
              if (v20) {
                continue;
              }
              break;
            }
          }
LABEL_33:
        }
        id v4 = v50;
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v55 objects:v62 count:16];
    }
    while (v13);
  }

  v64.CGFloat x = v6;
  v64.double y = v8;
  v65.CGFloat x = v10;
  v65.double y = v12;
  AXVKMathGetVectorAndDistanceForPoints(&v60, &v59, v64, v65);
  double v44 = v60;

  return v44;
}

void sub_2426A8A44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_2426A8BE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_2426A8C98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426A8D60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426A8E00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426A8E74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  double v10 = v9;

  a9.super_class = (Class)VKWalkAssistStatus;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void sub_2426A8F70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2426A91C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_2426A9350(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426A93F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426A97E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426A9920(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426A9C3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426A9D60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426A9E14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426A9EA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426AA08C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426AA11C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426AA1A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426AA388(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426AA428(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426AA5D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426AA7DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426AAB44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426AAC54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426AADB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426AAE14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  double v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)AXVKMultiSectionFeatureWrapper;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_2426AAEBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2426AAF44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426AAFDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426AB0A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426AB1C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426AB25C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426AB30C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426AB410(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426AB4B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426AB78C(_Unwind_Exception *a1)
{
  if (v5) {

  }
  _Unwind_Resume(a1);
}

void sub_2426AB840(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2426AB928(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426ABA0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2426ABAA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2426ABBF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426ABD64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426ABF14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426ABFE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  double v10 = v9;

  a9.super_class = (Class)VKFeatureAccessibilityElement;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_2426AC0FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426AC224(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426AC3E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426AC770(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426AC96C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426ACB18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426ACD48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426ACECC(_Unwind_Exception *a1)
{
  id v4 = v2;

  _Unwind_Resume(a1);
}

void sub_2426AD404(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426AD620(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2426AD72C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__0(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[3];
  a1[3] = result;
  return result;
}

void sub_2426AD88C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2426ADDF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id a13)
{
  _Unwind_Resume(a1);
}

uint64_t _areSetsBasicallyDuplicates(NSArray *a1, NSArray *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = 0;
  char v6 = 0;
  for (unint64_t i = 1; i < [(NSArray *)v3 count]; ++i)
  {
    double v8 = [(NSArray *)v3 objectAtIndex:i];
    [v8 CGPointValue];
    CGFloat v10 = v9;
    CGFloat v12 = v11;

    uint64_t v13 = [(NSArray *)v4 count];
    if (v13 - 1 < 0)
    {
LABEL_8:
      uint64_t v20 = v5;
      goto LABEL_10;
    }
    while (1)
    {
      double v14 = [(NSArray *)v4 objectAtIndex:--v13];
      [v14 CGPointValue];
      CGFloat v16 = v15;
      CGFloat v18 = v17;

      v22.CGFloat x = v10;
      v22.double y = v12;
      v23.CGFloat x = v16;
      v23.double y = v18;
      float DistanceBetweenPoints = AXVKMathGetDistanceBetweenPoints(v22, v23);
      if (DistanceBetweenPoints < 1.0) {
        break;
      }
LABEL_7:
      if (v13 <= 0) {
        goto LABEL_8;
      }
    }
    uint64_t v20 = v5 + 1;
    if (v5 <= 1)
    {
      ++v5;
      goto LABEL_7;
    }
    char v6 = 1;
LABEL_10:
    uint64_t v5 = v20;
  }

  return v6 & 1;
}

void sub_2426ADFD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426AEAA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__581(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[3];
  a1[3] = result;
  return result;
}

void sub_2426AF200(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426AF2DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426AF39C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426AF43C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426AF4D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426AF544(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2426AF7D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_2426AFBCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_2426AFE44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426AFEFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426AFFEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426B00FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426B0404(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_2426B04EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426B06EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426B0964(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426B0A74(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_2426B0BFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426B0E20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426B11F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2426B12C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__606(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 48);
  long long v3 = *(_OWORD *)(a2 + 64);
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v3;
  return result;
}

void sub_2426B1574(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426B1770(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426B18F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426B1A28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426B1B70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426B1D64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426B1F30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426B20B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  double v11 = v10;

  _Unwind_Resume(a1);
}

void sub_2426B2228(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426B2360(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426B26A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_2426B28DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426B2A18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2426B2B08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426B3850(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2426B3934(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426B39AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2426B3B40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426B3BE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2426B3C60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2426B3CE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2426B3E0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426B3E80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2426B4018(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426B40C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  CGFloat v10 = v9;

  a9.super_class = (Class)VKMapDebugView;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_2426B4260(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426B4E38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t geo::_retain_ptr<VKCamera * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::~_retain_ptr(uint64_t a1)
{
  *(void *)a1 = &unk_26F81E598;

  return a1;
}

void sub_2426B58E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id a16)
{
  _Unwind_Resume(a1);
}

void sub_2426B598C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2426B5E0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_2426B5FAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426B6130(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426B6248(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426B636C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426B68B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426B694C()
{
  JUMPOUT(0x2426B6944);
}

void sub_2426B6A10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2426B6D80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__1(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[3];
  a1[3] = result;
  return result;
}

void sub_2426B6E9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2426B6F10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2426B6F70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426B6FCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426B702C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426B708C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426B70D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426B7124(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426B717C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2426B7678(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_2426B78FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_2426B7EEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_2426B80CC(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_2426B8260(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426B82E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426B8480(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426B8510(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426B85DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426B8708(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426B8750(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426B8818(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426B8BF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426B8CF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_2426B8D80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426B8DD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426B8E90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426B902C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__622(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__623(uint64_t a1)
{
}

void sub_2426B91F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2426B9538(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 160), 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__630(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 48);
  long long v3 = *(_OWORD *)(a2 + 64);
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v3;
  return result;
}

__n128 __Block_byref_object_copy__633(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[3];
  a1[3] = result;
  return result;
}

void sub_2426B9748(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__638(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[3];
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a1[3] = result;
  return result;
}

void sub_2426B9814(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_2426B98EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2426B99EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426B9AC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426B9CA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__657(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[3];
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a1[3] = result;
  return result;
}

void sub_2426BA240(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_2426BA464(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_2426BA4CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2426BA5F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426BA6D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426BA7B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2426BA8F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426BA9E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426BAAA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426BAB60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426BABF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2426BAC80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2426BADC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426BAE5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2426BAF50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426BB028(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426BB0E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426BB164(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426BB204(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426BB270(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426BB300(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2426BB414(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426BB54C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2426BB650(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2426BB6D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426BB7F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426BB9B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_2426BBA20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2426BBB38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void geo::_retain_ptr<VKCamera * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::~_retain_ptr(uint64_t a1)
{
  *(void *)a1 = &unk_26F81E598;

  JUMPOUT(0x245668B60);
}

void sub_2426BBC14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  CGFloat v10 = v9;

  a9.super_class = (Class)VKMapViewOutputManager;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_2426BBD0C(_Unwind_Exception *a1)
{
  long long v3 = v2;

  _Unwind_Resume(a1);
}

void sub_2426BBE40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2426BBEAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2426BBEF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426BBFAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2426BC09C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426BC190(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426BC418(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426BC624(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id a32)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);

  _Block_object_dispose((const void *)(v33 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_2426BC80C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2426BC99C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_2426BCA90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2426BCB5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2426BCD48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426BCF24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426BD58C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,void *a23,void *a24,void *a25)
{
  _Unwind_Resume(a1);
}

void sub_2426BD780(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2426BD85C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2426BD914(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426BD9C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426BDA5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426BDAF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426BDB88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2426BDC78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426BDCEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)VKMapViewTourGuideManager;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_2426BDDF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426BDF14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v12 = v11;

  _Unwind_Resume(a1);
}

void sub_2426BE280(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426BE464(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426BE628(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426BE7C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426BE948(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426BEAA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426BEB70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_2426BEC74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2426BED04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2426BF500(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_2426BF8D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2426C0230(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426C028C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426C03DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426C0438(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426C04CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426C064C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void sub_2426C09E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_2426C0C94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426C0F84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_2426C14C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30,void *a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,void *a49,uint64_t a50,void *a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,id a63)
{
  _Block_object_dispose(&a58, 8);
  _Unwind_Resume(a1);
}

void sub_2426C2204(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_2426C26DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_2426C27D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_2426C2934(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2426C2A64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2426C2B4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2426C2F88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t _maximumVisiblePOIs(float a1)
{
  if (a1 >= 16.0) {
    return -1;
  }
  uint64_t v1 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v2 = [v1 userInterfaceIdiom];

  if (v2 == 1) {
    return 56;
  }
  else {
    return 42;
  }
}

void sub_2426C30E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426C3218(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _maximumVisibleRoads(float a1)
{
  if (a1 >= 16.0) {
    return -1;
  }
  uint64_t v1 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v2 = [v1 userInterfaceIdiom];

  if (v2 == 1) {
    return 28;
  }
  else {
    return 21;
  }
}

void sub_2426C3294(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426C33C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426C35B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426C36EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426C37F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426C38B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426C3980(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2426C3E04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_2426C41EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_2426C44C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426C461C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2426C4748(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v12 = v10;

  _Unwind_Resume(a1);
}

void sub_2426C484C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2426C49E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426C4ADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_2426C4FD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_2426C521C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2426C529C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2426C54D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_2426C5674(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426C5AC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_2426C5DCC(_Unwind_Exception *a1)
{
  char v6 = v3;

  _Unwind_Resume(a1);
}

void sub_2426C5FF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426C61A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426C66BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24)
{
  _Unwind_Resume(a1);
}

void sub_2426C6A4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426C6C18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426C6E78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426C6FC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2426C7128(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__443(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 48);
  long long v3 = *(_OWORD *)(a2 + 64);
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v3;
  return result;
}

__n128 __Block_byref_object_copy__446(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[3];
  a1[3] = result;
  return result;
}

void sub_2426C768C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_2426C7B30(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v5 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_2426C7D34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2426C87E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

uint64_t AXAccessibilityBundlesDirectory()
{
  return MEMORY[0x270F09ED8]();
}

uint64_t AXCArrayCreate()
{
  return MEMORY[0x270F09F00]();
}

uint64_t AXCArrayGetCount()
{
  return MEMORY[0x270F09F08]();
}

uint64_t AXCFormattedString()
{
  return MEMORY[0x270F09F10]();
}

uint64_t AXColorizeFormatLog()
{
  return MEMORY[0x270F09F38]();
}

uint64_t AXDescriptionForHeadingInDegrees()
{
  return MEMORY[0x270F09F60]();
}

uint64_t AXDeviceIsPad()
{
  return MEMORY[0x270F09FE0]();
}

uint64_t AXDoesRequestingClientDeserveAutomation()
{
  return MEMORY[0x270F09808]();
}

uint64_t AXFormatAndListWithElements()
{
  return MEMORY[0x270F0A0F0]();
}

uint64_t AXFormatInteger()
{
  return MEMORY[0x270F0A110]();
}

uint64_t AXLabelForElements()
{
  return MEMORY[0x270F09810]();
}

uint64_t AXLogCommon()
{
  return MEMORY[0x270F0A1C8]();
}

uint64_t AXLogTemp()
{
  return MEMORY[0x270F0A210]();
}

uint64_t AXLoggerForFacility()
{
  return MEMORY[0x270F0A230]();
}

uint64_t AXOSLogLevelFromAXLogLevel()
{
  return MEMORY[0x270F0A238]();
}

uint64_t AXPerformBlockAsynchronouslyOnMainThread()
{
  return MEMORY[0x270F0A248]();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return MEMORY[0x270F0A258]();
}

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x270F0A268]();
}

uint64_t AXPerformValidationChecks()
{
  return MEMORY[0x270F0A270]();
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x270F0A308]();
}

uint64_t AX_CGPathEnumerateElementsUsingBlock()
{
  return MEMORY[0x270F0A358]();
}

uint64_t AX_CGPathGetIntersectionPointWithRect()
{
  return MEMORY[0x270F0A360]();
}

uint64_t AX_CGPathGetStartingAndEndingPoints()
{
  return MEMORY[0x270F0A368]();
}

uint64_t AX_CGRectGetCenter()
{
  return MEMORY[0x270F0A3B0]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t CGFloatIsValid()
{
  return MEMORY[0x270EE63E8]();
}

void CGPathAddCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathAddQuadCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cpx, CGFloat cpy, CGFloat x, CGFloat y)
{
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
}

BOOL CGPathContainsPoint(CGPathRef path, const CGAffineTransform *m, CGPoint point, BOOL eoFill)
{
  return MEMORY[0x270EE6FD0](path, m, eoFill, (__n128)point, *(__n128 *)&point.y);
}

CGPathRef CGPathCreateCopyByStrokingPath(CGPathRef path, const CGAffineTransform *transform, CGFloat lineWidth, CGLineCap lineCap, CGLineJoin lineJoin, CGFloat miterLimit)
{
  return (CGPathRef)MEMORY[0x270EE6FF0](path, transform, *(void *)&lineCap, *(void *)&lineJoin, lineWidth, miterLimit);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x270EE7030]();
}

CGRect CGPathGetBoundingBox(CGPathRef path)
{
  MEMORY[0x270EE7070](path);
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.double y = v2;
  result.origin.CGFloat x = v1;
  return result;
}

CGRect CGPathGetPathBoundingBox(CGPathRef path)
{
  MEMORY[0x270EE7090](path);
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.double y = v2;
  result.origin.CGFloat x = v1;
  return result;
}

BOOL CGPathIsEmpty(CGPathRef path)
{
  return MEMORY[0x270EE70C8](path);
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathRelease(CGPathRef path)
{
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7180]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.double y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7250]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x270EE7268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.double y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

uint64_t GEOBearingFromCoordinateToCoordinate()
{
  return MEMORY[0x270F30088]();
}

uint64_t GEOCalculateDistance()
{
  return MEMORY[0x270F30090]();
}

uint64_t GEOFeatureGetLocalizedLabel()
{
  return MEMORY[0x270F30148]();
}

uint64_t GEOFeatureGetLocalizedShield()
{
  return MEMORY[0x270F30150]();
}

uint64_t GEOFeatureGetNativeLabel()
{
  return MEMORY[0x270F30158]();
}

uint64_t GEOFeatureGetNativeShield()
{
  return MEMORY[0x270F30160]();
}

uint64_t GEOMultiSectionFeatureBounds()
{
  return MEMORY[0x270F30188]();
}

uint64_t GEOMultiSectionFeatureGetGEOVectorTilePoints()
{
  return MEMORY[0x270F30190]();
}

uint64_t GEOMultiSectionFeatureGetSectionData()
{
  return MEMORY[0x270F30198]();
}

uint64_t GEOMultiSectionFeatureIsSameRoad()
{
  return MEMORY[0x270F301A0]();
}

uint64_t GEOMultiSectionFeatureRelease()
{
  return MEMORY[0x270F301A8]();
}

uint64_t GEOMultiSectionFeatureRetain()
{
  return MEMORY[0x270F301B0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

uint64_t UIAXFormatInteger()
{
  return MEMORY[0x270F808E0]();
}

uint64_t UIAccessibilityCreateEventForSceneReferencePoint()
{
  return MEMORY[0x270F80990]();
}

uint64_t UIAccessibilityFrameForBounds()
{
  return MEMORY[0x270F80998]();
}

BOOL UIAccessibilityIsSwitchControlRunning(void)
{
  return MEMORY[0x270F05F48]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x270F05F58]();
}

uint64_t UIAccessibilityPointForPoint()
{
  return MEMORY[0x270F809D8]();
}

uint64_t UIAccessibilityPointToPoint()
{
  return MEMORY[0x270F809E0]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

uint64_t UIKitAccessibilityLocalizedString()
{
  return MEMORY[0x270F80A40]();
}

uint64_t VKLocationCoordinate2DForVKPoint()
{
  return MEMORY[0x270F839E0]();
}

uint64_t VKLocationCoordinate2DMake()
{
  return MEMORY[0x270F839E8]();
}

uint64_t VKLocationCoordinate3DMake()
{
  return MEMORY[0x270F839F0]();
}

uint64_t VKPointForVKLocationCoordinate2D()
{
  return MEMORY[0x270F839F8]();
}

uint64_t VKRectContainsPoint()
{
  return MEMORY[0x270F83A00]();
}

uint64_t VKWorldBoundsFromGEOTileKey()
{
  return MEMORY[0x270F83A08]();
}

uint64_t _AXAssert()
{
  return MEMORY[0x270F0A3E8]();
}

uint64_t _AXCArrayGetUnderlyingArray()
{
  return MEMORY[0x270F0A3F0]();
}

uint64_t _AXCArrayPrepareForInsertingElementAtIndex()
{
  return MEMORY[0x270F0A3F8]();
}

uint64_t _AXLogWithFacility()
{
  return MEMORY[0x270F0A408]();
}

uint64_t _AXSAutomationEnabled()
{
  return MEMORY[0x270F90600]();
}

uint64_t _AXSCommandAndControlEnabled()
{
  return MEMORY[0x270F906C0]();
}

uint64_t _AXSFullKeyboardAccessEnabled()
{
  return MEMORY[0x270F90758]();
}

uint64_t _AXStringForArgs()
{
  return MEMORY[0x270F0A410]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _UIAccessibilityIsEnabled()
{
  return MEMORY[0x270F062E0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::terminate(void)
{
}

void operator delete()
{
  while (1)
    ;
}

uint64_t __AXStringForVariables()
{
  return MEMORY[0x270F099D8]();
}

uint64_t __UIAXStringForVariables()
{
  return MEMORY[0x270F80AF8]();
}

uint64_t __UIAccessibilityCastAsClass()
{
  return MEMORY[0x270F0A418]();
}

uint64_t __UIAccessibilityGetAssociatedObject()
{
  return MEMORY[0x270F0A468]();
}

uint64_t __UIAccessibilitySafeClass()
{
  return MEMORY[0x270F0A480]();
}

uint64_t __ax_verbose_encode_with_type_encoding_group_class()
{
  return MEMORY[0x270F0A4D8]();
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x270ED7E90](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

long double atan(long double __x)
{
  MEMORY[0x270ED86A0](__x);
  return result;
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x270ED86A8](__y, __x);
  return result;
}

float atan2f(float a1, float a2)
{
  MEMORY[0x270ED86B8](a1, a2);
  return result;
}

long double cos(long double __x)
{
  MEMORY[0x270ED9128](__x);
  return result;
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

long double hypot(long double __x, long double __y)
{
  MEMORY[0x270ED9E58](__x, __y);
  return result;
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

long double sin(long double __x)
{
  MEMORY[0x270EDB4E8](__x);
  return result;
}

time_t time(time_t *a1)
{
  return MEMORY[0x270EDB930](a1);
}