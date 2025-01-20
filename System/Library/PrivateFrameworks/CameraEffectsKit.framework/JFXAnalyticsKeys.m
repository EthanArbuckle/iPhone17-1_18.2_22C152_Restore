@interface JFXAnalyticsKeys
+ (id)allDistributionEvents;
+ (id)allEventNames;
+ (id)allIncrementScalarEffectEvents;
+ (id)allIncrementScalarEvents;
+ (id)allOverrideScalarEvents;
@end

@implementation JFXAnalyticsKeys

+ (id)allEventNames
{
  if (allEventNames_onceToken_0 != -1) {
    dispatch_once(&allEventNames_onceToken_0, &__block_literal_global_59);
  }
  v2 = (void *)allEventNames_eventNamesArray_0;
  return v2;
}

void __33__JFXAnalyticsKeys_allEventNames__block_invoke()
{
  id v7 = +[JFXAnalyticsKeys allIncrementScalarEvents];
  v0 = +[JFXAnalyticsKeys allDistributionEvents];
  v1 = [v7 arrayByAddingObjectsFromArray:v0];
  v2 = +[JFXAnalyticsKeys allOverrideScalarEvents];
  v3 = [v1 arrayByAddingObjectsFromArray:v2];
  v4 = +[JFXAnalyticsKeys allIncrementScalarEffectEvents];
  uint64_t v5 = [v3 arrayByAddingObjectsFromArray:v4];
  v6 = (void *)allEventNames_eventNamesArray_0;
  allEventNames_eventNamesArray_0 = v5;
}

+ (id)allIncrementScalarEffectEvents
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)allOverrideScalarEvents
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)allIncrementScalarEvents
{
  if (allIncrementScalarEvents_onceToken_1 != -1) {
    dispatch_once(&allIncrementScalarEvents_onceToken_1, &__block_literal_global_42_0);
  }
  v2 = (void *)allIncrementScalarEvents_allIncrementScalarEvents_1;
  return v2;
}

void __44__JFXAnalyticsKeys_allIncrementScalarEvents__block_invoke()
{
  v6[11] = *MEMORY[0x263EF8340];
  v6[0] = @"thermalnominaltolight";
  v6[1] = @"thermallighttomoderate";
  v6[2] = @"thermalmoderatetoheavy";
  v6[3] = @"thermalheavytotrapping";
  v6[4] = @"thermaltrappingtosleeping";
  v6[5] = @"thermalsleepingtotrapping";
  v6[6] = @"thermaltrappingtoheavy";
  v6[7] = @"thermalheavytomoderate";
  v6[8] = @"thermalmoderatetolight";
  v6[9] = @"thermallighttonominal";
  v6[10] = @"facetrackedoverlaychangedplanes";
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:11];
  v1 = (void *)allIncrementScalarEvents_allIncrementScalarEvents_1;
  allIncrementScalarEvents_allIncrementScalarEvents_1 = v0;

  v2 = (void *)allIncrementScalarEvents_allIncrementScalarEvents_1;
  v3 = JFX_CaptureSessionInterruptionReasonsList();
  uint64_t v4 = [v2 arrayByAddingObjectsFromArray:v3];
  uint64_t v5 = (void *)allIncrementScalarEvents_allIncrementScalarEvents_1;
  allIncrementScalarEvents_allIncrementScalarEvents_1 = v4;
}

+ (id)allDistributionEvents
{
  return (id)MEMORY[0x263EFFA68];
}

@end