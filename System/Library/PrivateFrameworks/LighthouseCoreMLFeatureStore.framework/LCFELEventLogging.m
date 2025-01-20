@interface LCFELEventLogging
+ (BOOL)emitChangePointDetectionEvent:(id)a3;
+ (BOOL)emitFeatureImportanceEvent:(id)a3;
+ (BOOL)emitModelTrainingEvent:(id)a3;
+ (BOOL)emitShadowEvaluationEvent:(id)a3;
@end

@implementation LCFELEventLogging

+ (BOOL)emitModelTrainingEvent:(id)a3
{
  return 1;
}

+ (BOOL)emitShadowEvaluationEvent:(id)a3
{
  return 1;
}

+ (BOOL)emitFeatureImportanceEvent:(id)a3
{
  return 1;
}

+ (BOOL)emitChangePointDetectionEvent:(id)a3
{
  return 1;
}

@end