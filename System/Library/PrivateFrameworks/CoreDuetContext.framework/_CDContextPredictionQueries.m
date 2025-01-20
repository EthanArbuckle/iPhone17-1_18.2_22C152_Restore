@interface _CDContextPredictionQueries
+ (id)keyPathForCellQualityPrediction;
+ (id)keyPathForWiFiQualityPrediction;
- (_CDContextPredictionQueries)init;
@end

@implementation _CDContextPredictionQueries

- (_CDContextPredictionQueries)init
{
  return 0;
}

+ (id)keyPathForWiFiQualityPrediction
{
  if (keyPathForWiFiQualityPrediction_onceToken != -1) {
    dispatch_once(&keyPathForWiFiQualityPrediction_onceToken, &__block_literal_global_25);
  }
  v2 = (void *)keyPathForWiFiQualityPrediction_wifiQualityPrediction;
  return v2;
}

+ (id)keyPathForCellQualityPrediction
{
  if (keyPathForCellQualityPrediction_onceToken != -1) {
    dispatch_once(&keyPathForCellQualityPrediction_onceToken, &__block_literal_global_6_0);
  }
  v2 = (void *)keyPathForCellQualityPrediction_cellQualityPrediction;
  return v2;
}

@end