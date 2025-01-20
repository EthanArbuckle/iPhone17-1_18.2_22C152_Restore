@interface CESRAudioSamplingUtilities
+ (BOOL)isUniformlySampled:(unint64_t)a3 fromTotal:(unint64_t)a4;
+ (BOOL)isUniformlySampledWithPercentage:(unint64_t)a3;
+ (BOOL)isUniformlySampledWithSamplingRate:(float)a3;
@end

@implementation CESRAudioSamplingUtilities

+ (BOOL)isUniformlySampledWithSamplingRate:(float)a3
{
  return +[CESRAudioSamplingUtilities isUniformlySampledWithPercentage:vcvtas_u32_f32(a3 * 100.0)];
}

+ (BOOL)isUniformlySampledWithPercentage:(unint64_t)a3
{
  return +[CESRAudioSamplingUtilities isUniformlySampled:a3 fromTotal:100];
}

+ (BOOL)isUniformlySampled:(unint64_t)a3 fromTotal:(unint64_t)a4
{
  return arc4random_uniform(a4) < a3;
}

@end