@interface GEOFeatureStyleAttributes(MapKitExtras)
+ (id)annotationViewProvidedCustomFeatureStyleAttributes;
+ (id)genericMarkerStyleAttributes;
+ (id)genericServiceStyleAttributes;
+ (id)markerStyleAttributes;
+ (id)styleAttributesForCalloutWithAttributes:()MapKitExtras;
+ (id)styleAttributesForDraggingWithAttributes:()MapKitExtras;
+ (id)styleAttributesForMapFeatureAttributes:()MapKitExtras elevatedGround:;
+ (id)styleAttributesForRouteAnnotationWithAttributes:()MapKitExtras;
+ (id)styleAttributesForSearchResultWithAttributes:()MapKitExtras;
+ (id)styleAttributesForTrafficCameraType:()MapKitExtras isAboveThreshold:;
+ (id)styleAttributesForTrafficIncidentType:()MapKitExtras;
+ (id)styleAttributesForTransitType:()MapKitExtras;
+ (id)styleAttributesForUnpickedFeatureWithAttributes:()MapKitExtras;
+ (id)trainStationStyleAttributes;
- (id)styleAttributesWithElevatedGround:()MapKitExtras;
@end

@implementation GEOFeatureStyleAttributes(MapKitExtras)

+ (id)markerStyleAttributes
{
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F645A0]), "initWithAttributes:", 4, 226, 5, 3, 6, 348, 10, 0, 0);

  return v0;
}

+ (id)styleAttributesForTrafficCameraType:()MapKitExtras isAboveThreshold:
{
  id v6 = objc_alloc((Class)objc_opt_class());
  switch(a3)
  {
    case 1:
      if (a4) {
        uint64_t v7 = 1;
      }
      else {
        uint64_t v7 = 2;
      }
      break;
    case 2:
      uint64_t v7 = 3;
      break;
    case 3:
      uint64_t v7 = 4;
      break;
    case 4:
      uint64_t v7 = 5;
      break;
    case 5:
      uint64_t v7 = 6;
      break;
    case 6:
      uint64_t v7 = 7;
      break;
    default:
      uint64_t v7 = 0;
      break;
  }
  v8 = objc_msgSend(v6, "initWithAttributes:", 5, 3, 6, 248, 65602, v7, 0);

  return v8;
}

+ (id)styleAttributesForTrafficIncidentType:()MapKitExtras
{
  v3 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAttributes:", 5, 3, 6, 222, 65544, a3, 0);

  return v3;
}

+ (id)styleAttributesForRouteAnnotationWithAttributes:()MapKitExtras
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F645A0]), "initWithStyleAttributes:", objc_msgSend(v3, "featureStyleAttributes"));
  v6[0] = 0x19C00000006;
  [v4 replaceAttributes:v6 count:1];

  return v4;
}

+ (id)styleAttributesForUnpickedFeatureWithAttributes:()MapKitExtras
{
  id v3 = a3;
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F645A0]), "initWithStyleAttributes:", objc_msgSend(v3, "featureStyleAttributes"));
  uint64_t v6 = 65573;
  [v4 replaceAttributes:&v6 count:1];

  return v4;
}

+ (id)styleAttributesForSearchResultWithAttributes:()MapKitExtras
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F645A0]), "initWithStyleAttributes:", objc_msgSend(v3, "featureStyleAttributes"));
  long long v6 = xmmword_18BD1C600;
  uint64_t v7 = 0x100010024;
  [v4 replaceAttributes:&v6 count:3];

  return v4;
}

+ (id)styleAttributesForCalloutWithAttributes:()MapKitExtras
{
  id v3 = a3;
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F645A0]), "initWithStyleAttributes:", objc_msgSend(v3, "featureStyleAttributes"));
  uint64_t v6 = 0x100010025;
  [v4 replaceAttributes:&v6 count:1];

  return v4;
}

+ (id)styleAttributesForDraggingWithAttributes:()MapKitExtras
{
  id v3 = a3;
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F645A0]), "initWithStyleAttributes:", objc_msgSend(v3, "featureStyleAttributes"));
  uint64_t v6 = 0x100010043;
  [v4 replaceAttributes:&v6 count:1];

  return v4;
}

+ (id)genericServiceStyleAttributes
{
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F645A0]), "initWithAttributes:", 5, 3, 6, 223, 0);

  return v0;
}

+ (id)trainStationStyleAttributes
{
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F645A0]), "initWithAttributes:", 5, 3, 6, 24, 10, 0, 0);

  return v0;
}

+ (id)genericMarkerStyleAttributes
{
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F645A0]), "initWithAttributes:", 4, 226, 5, 3, 6, 348, 10, 0, 65572, 1, 65573, 0, 0);

  return v0;
}

+ (id)annotationViewProvidedCustomFeatureStyleAttributes
{
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F645A0]), "initWithAttributes:", 5, 3, 6, 348, 65572, 1, 65567, 3, 0);

  return v0;
}

+ (id)styleAttributesForTransitType:()MapKitExtras
{
  if (a3 > 0xB) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = dword_18BD1C610[a3];
  }
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F645A0]), "initWithAttributes:", 5, 3, 6, v3, 10, 0, 0);

  return v4;
}

- (id)styleAttributesWithElevatedGround:()MapKitExtras
{
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F645A0]), "initWithStyleAttributes:", objc_msgSend(a1, "featureStyleAttributes"));
  v6[0] = 65617;
  v6[1] = a3;
  [v4 replaceAttributes:v6 count:1];

  return v4;
}

+ (id)styleAttributesForMapFeatureAttributes:()MapKitExtras elevatedGround:
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F645A0]), "initWithStyleAttributes:", objc_msgSend(v5, "featureStyleAttributes"));
  uint64_t v8 = 0x100010025;
  int v9 = 65617;
  int v10 = a4;
  uint64_t v11 = 0x200010075;
  [v6 replaceAttributes:&v8 count:3];

  return v6;
}

@end