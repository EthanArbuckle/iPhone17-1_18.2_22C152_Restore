@interface ACCNavigationAccessoryComponent(CarPlay)
+ (id)CP_variant:()CarPlay fittingMaxLength:;
+ (uint64_t)CP_ignoreMaxLength;
- (id)CP_variantFittingCurrentRoadName:()CarPlay;
- (id)CP_variantFittingDestinationRoadName:()CarPlay;
- (id)CP_variantFittingLaneGuidanceDescription:()CarPlay;
- (id)CP_variantFittingManeuverDescription:()CarPlay;
- (id)CP_variantFittingPostManeuverRoadName:()CarPlay;
- (uint64_t)CP_maxCapacity_GuidanceManeuver;
- (uint64_t)CP_maxCapacity_LaneGuidance;
@end

@implementation ACCNavigationAccessoryComponent(CarPlay)

+ (uint64_t)CP_ignoreMaxLength
{
  if (CP_ignoreMaxLength_onceToken != -1) {
    dispatch_once(&CP_ignoreMaxLength_onceToken, &__block_literal_global);
  }
  return CP_ignoreMaxLength_ignoreMaxLength;
}

+ (id)CP_variant:()CarPlay fittingMaxLength:
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([v6 count])
  {
    if (a4 && !objc_msgSend(a1, "CP_ignoreMaxLength"))
    {
      v8 = [v6 firstObject];
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v9 = v6;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v19;
        while (2)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v19 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
            if (objc_msgSend(v14, "length", (void)v18) <= a4)
            {
              id v7 = v14;

              goto LABEL_18;
            }
            unint64_t v15 = [v14 length];
            if (v15 < [v8 length])
            {
              id v16 = v14;

              v8 = v16;
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }

      id v7 = [v8 stringByEllipsingPastMaxLength:a4];
LABEL_18:
    }
    else
    {
      id v7 = [v6 firstObject];
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)CP_variantFittingCurrentRoadName:()CarPlay
{
  v4 = (void *)MEMORY[0x263F22E80];
  id v5 = a3;
  id v6 = objc_msgSend(v4, "CP_variant:fittingMaxLength:", v5, objc_msgSend(a1, "maxLength_CurrentRoadName"));

  return v6;
}

- (id)CP_variantFittingDestinationRoadName:()CarPlay
{
  v4 = (void *)MEMORY[0x263F22E80];
  id v5 = a3;
  id v6 = objc_msgSend(v4, "CP_variant:fittingMaxLength:", v5, objc_msgSend(a1, "maxLength_DestinationRoadName"));

  return v6;
}

- (id)CP_variantFittingPostManeuverRoadName:()CarPlay
{
  v4 = (void *)MEMORY[0x263F22E80];
  id v5 = a3;
  id v6 = objc_msgSend(v4, "CP_variant:fittingMaxLength:", v5, objc_msgSend(a1, "maxLength_PostManeuverRoadName"));

  return v6;
}

- (id)CP_variantFittingManeuverDescription:()CarPlay
{
  v4 = (void *)MEMORY[0x263F22E80];
  id v5 = a3;
  id v6 = objc_msgSend(v4, "CP_variant:fittingMaxLength:", v5, objc_msgSend(a1, "maxLength_ManeuverDescription"));

  return v6;
}

- (id)CP_variantFittingLaneGuidanceDescription:()CarPlay
{
  v4 = (void *)MEMORY[0x263F22E80];
  id v5 = a3;
  id v6 = objc_msgSend(v4, "CP_variant:fittingMaxLength:", v5, objc_msgSend(a1, "maxLength_LaneGuidanceDescription"));

  return v6;
}

- (uint64_t)CP_maxCapacity_GuidanceManeuver
{
  if (!objc_msgSend(a1, "maxCapacity_GuidanceManeuver")) {
    return 1000;
  }
  return objc_msgSend(a1, "maxCapacity_GuidanceManeuver");
}

- (uint64_t)CP_maxCapacity_LaneGuidance
{
  if (!objc_msgSend(a1, "maxCapacity_LaneGuidance")) {
    return 1000;
  }
  return objc_msgSend(a1, "maxCapacity_LaneGuidance");
}

@end