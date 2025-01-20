@interface _ATXFeedbackConstants
+ (double)actionDecayHalfLifeSeconds;
+ (double)alphaForBundleId:(id)a3;
+ (double)baseAlpha;
+ (double)baseBeta;
+ (double)betaForBundleId:(id)a3;
+ (double)decayHalfLifeSeconds;
+ (double)multiplierForAppAlphasAndBetas;
@end

@implementation _ATXFeedbackConstants

+ (double)baseAlpha
{
  if (initFeedbackConstantsData_onceToken != -1) {
    dispatch_once(&initFeedbackConstantsData_onceToken, &__block_literal_global_39);
  }
  return *(double *)&_ATXFeedbackConstantsData_0;
}

+ (double)baseBeta
{
  if (initFeedbackConstantsData_onceToken != -1) {
    dispatch_once(&initFeedbackConstantsData_onceToken, &__block_literal_global_39);
  }
  return *(double *)&_ATXFeedbackConstantsData_1;
}

+ (double)multiplierForAppAlphasAndBetas
{
  if (initFeedbackConstantsData_onceToken != -1) {
    dispatch_once(&initFeedbackConstantsData_onceToken, &__block_literal_global_39);
  }
  return *(double *)&_ATXFeedbackConstantsData_2;
}

+ (double)decayHalfLifeSeconds
{
  if (initFeedbackConstantsData_onceToken != -1) {
    dispatch_once(&initFeedbackConstantsData_onceToken, &__block_literal_global_39);
  }
  return *(double *)&_ATXFeedbackConstantsData_3;
}

+ (double)actionDecayHalfLifeSeconds
{
  if (initFeedbackConstantsData_onceToken != -1) {
    dispatch_once(&initFeedbackConstantsData_onceToken, &__block_literal_global_39);
  }
  return *(double *)&_ATXFeedbackConstantsData_4;
}

+ (double)alphaForBundleId:(id)a3
{
  id v3 = a3;
  if (initFeedbackConstantsData_onceToken != -1) {
    dispatch_once(&initFeedbackConstantsData_onceToken, &__block_literal_global_39);
  }
  v4 = [(id)_ATXFeedbackConstantsData_5 objectForKeyedSubscript:v3];

  if (v4
    && (([(id)_ATXFeedbackConstantsData_5 objectForKeyedSubscript:v3],
         v5 = objc_claimAutoreleasedReturnValue(),
         [v5 doubleValue],
         double v7 = v6,
         v5,
         v7 > 0.0)
      ? (BOOL v8 = v7 < 1.0)
      : (BOOL v8 = 0),
        v8))
  {
    double v9 = v7 * *(double *)&_ATXFeedbackConstantsData_2;
  }
  else
  {
    double v9 = 0.0;
  }

  return v9;
}

+ (double)betaForBundleId:(id)a3
{
  id v3 = a3;
  if (initFeedbackConstantsData_onceToken != -1) {
    dispatch_once(&initFeedbackConstantsData_onceToken, &__block_literal_global_39);
  }
  v4 = [(id)_ATXFeedbackConstantsData_5 objectForKeyedSubscript:v3];

  if (v4
    && (([(id)_ATXFeedbackConstantsData_5 objectForKeyedSubscript:v3],
         v5 = objc_claimAutoreleasedReturnValue(),
         [v5 doubleValue],
         double v7 = 1.0 - v6,
         v5,
         v7 > 0.0)
      ? (BOOL v8 = v7 < 1.0)
      : (BOOL v8 = 0),
        v8))
  {
    double v9 = v7 * *(double *)&_ATXFeedbackConstantsData_2;
  }
  else
  {
    double v9 = 0.0;
  }

  return v9;
}

@end