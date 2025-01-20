@interface ACCNavigationRouteGuidanceUpdateInfo
@end

@implementation ACCNavigationRouteGuidanceUpdateInfo

id __86__ACCNavigationRouteGuidanceUpdateInfo_CPAccNavInfo__initWithRouteGuidance_component___block_invoke(id *a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  int v3 = [a2 key];
  v4 = 0;
  if (v3 <= 12)
  {
    if (v3 == 3)
    {
      id v14 = a1[4];
      v6 = [a1[5] currentRoadNameVariants];
      uint64_t v7 = objc_msgSend(v14, "CP_variantFittingCurrentRoadName:", v6);
    }
    else
    {
      if (v3 != 4) {
        goto LABEL_24;
      }
      id v5 = a1[4];
      v6 = [a1[5] destinationNameVariants];
      uint64_t v7 = objc_msgSend(v5, "CP_variantFittingDestinationRoadName:", v6);
    }
    v4 = (void *)v7;
LABEL_17:

    goto LABEL_24;
  }
  if (v3 != 13)
  {
    if (v3 != 23) {
      goto LABEL_24;
    }
    v4 = objc_opt_new();
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v8 = objc_msgSend(a1[5], "electricVehicleDestination", 0);
    v6 = [v8 connectors];

    uint64_t v9 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v6);
          }
          v13 = +[CPAccNavUpdate dictionaryIAPFormat:*(void *)(*((void *)&v21 + 1) + 8 * i)];
          [v4 addObject:v13];
        }
        uint64_t v10 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v10);
    }
    goto LABEL_17;
  }
  v15 = [a1[5] currentManeuverIndexes];
  v16 = [a1[5] currentManeuverIndexes];
  unint64_t v17 = [v16 count];
  unint64_t v18 = objc_msgSend(a1[4], "CP_maxCapacity_GuidanceManeuver");
  if (v17 >= v18)
  {
    uint64_t v19 = objc_msgSend(a1[4], "CP_maxCapacity_GuidanceManeuver");
  }
  else
  {
    a1 = [a1[5] currentManeuverIndexes];
    uint64_t v19 = [a1 count];
  }
  v4 = objc_msgSend(v15, "subarrayWithRange:", 0, v19);
  if (v17 < v18) {

  }
LABEL_24:

  return v4;
}

@end