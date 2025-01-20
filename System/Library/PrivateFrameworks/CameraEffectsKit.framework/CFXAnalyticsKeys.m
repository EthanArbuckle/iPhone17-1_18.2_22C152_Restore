@interface CFXAnalyticsKeys
+ (id)allDistributionEvents;
+ (id)allEventNames;
+ (id)allIncrementScalarEffectEvents;
+ (id)allIncrementScalarEvents;
@end

@implementation CFXAnalyticsKeys

+ (id)allEventNames
{
  if (allEventNames_onceToken != -1) {
    dispatch_once(&allEventNames_onceToken, &__block_literal_global_18);
  }
  v2 = (void *)allEventNames_eventNamesArray;
  return v2;
}

void __33__CFXAnalyticsKeys_allEventNames__block_invoke()
{
  id v3 = +[CFXAnalyticsKeys allIncrementScalarEvents];
  v0 = +[CFXAnalyticsKeys allDistributionEvents];
  uint64_t v1 = [v3 arrayByAddingObjectsFromArray:v0];
  v2 = (void *)allEventNames_eventNamesArray;
  allEventNames_eventNamesArray = v1;
}

+ (id)allIncrementScalarEffectEvents
{
  if (allIncrementScalarEffectEvents_onceToken != -1) {
    dispatch_once(&allIncrementScalarEffectEvents_onceToken, &__block_literal_global_93);
  }
  v2 = (void *)allIncrementScalarEffectEvents_allIncrementScalarEffectEvents;
  return v2;
}

void __50__CFXAnalyticsKeys_allIncrementScalarEffectEvents__block_invoke()
{
  v2[5] = *MEMORY[0x263EF8340];
  v2[0] = @"filterusedwithid";
  v2[1] = @"labelusedwithid";
  v2[2] = @"shapeusedwithid";
  v2[3] = @"messagesstickerusedwithid";
  v2[4] = @"animojiusedwithid";
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:5];
  uint64_t v1 = (void *)allIncrementScalarEffectEvents_allIncrementScalarEffectEvents;
  allIncrementScalarEffectEvents_allIncrementScalarEffectEvents = v0;
}

+ (id)allIncrementScalarEvents
{
  if (allIncrementScalarEvents_onceToken != -1) {
    dispatch_once(&allIncrementScalarEvents_onceToken, &__block_literal_global_96);
  }
  v2 = (void *)allIncrementScalarEvents_allIncrementScalarEvents;
  return v2;
}

void __44__CFXAnalyticsKeys_allIncrementScalarEvents__block_invoke()
{
  v2[13] = *MEMORY[0x263EF8340];
  v2[0] = @"thermalnominaltolight";
  v2[1] = @"thermallighttomoderate";
  v2[2] = @"thermalmoderatetoheavy";
  v2[3] = @"thermalheavytotrapping";
  v2[4] = @"thermaltrappingtosleeping";
  v2[5] = @"thermalsleepingtotrapping";
  void v2[6] = @"thermaltrappingtoheavy";
  v2[7] = @"thermalheavytomoderate";
  v2[8] = @"thermalmoderatetolight";
  v2[9] = @"thermallighttonominal";
  v2[10] = @"extensionlaunched";
  v2[11] = @"sentpostcapturewithfuncamphoto";
  v2[12] = @"sentpostcapturewithfuncamvideo";
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:13];
  uint64_t v1 = (void *)allIncrementScalarEvents_allIncrementScalarEvents;
  allIncrementScalarEvents_allIncrementScalarEvents = v0;
}

+ (id)allDistributionEvents
{
  if (allDistributionEvents_onceToken != -1) {
    dispatch_once(&allDistributionEvents_onceToken, &__block_literal_global_98);
  }
  v2 = (void *)allDistributionEvents_allDistributionEventNamesArray;
  return v2;
}

void __41__CFXAnalyticsKeys_allDistributionEvents__block_invoke()
{
  v2[5] = *MEMORY[0x263EF8340];
  v2[0] = @"activetime";
  v2[1] = @"activefrontcameratime";
  v2[2] = @"activebackcameratime";
  v2[3] = @"activeexternalcameratime";
  v2[4] = @"videoduration";
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:5];
  uint64_t v1 = (void *)allDistributionEvents_allDistributionEventNamesArray;
  allDistributionEvents_allDistributionEventNamesArray = v0;
}

@end