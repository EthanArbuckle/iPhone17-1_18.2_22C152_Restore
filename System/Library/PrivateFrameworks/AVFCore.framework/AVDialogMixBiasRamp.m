@interface AVDialogMixBiasRamp
+ (float)boundsAdjustedFloatValue:(float)a3;
+ (float)defaultFloatValue;
+ (id)dialogMixBiasRampWithStartValue:(float)a3 endValue:(float)a4 timeRange:(id *)a5;
@end

@implementation AVDialogMixBiasRamp

+ (float)defaultFloatValue
{
  return 0.5;
}

+ (float)boundsAdjustedFloatValue:(float)a3
{
  double v3 = fmin(a3, 1.0);
  if (v3 <= 0.0) {
    return 0.0;
  }
  return v3;
}

+ (id)dialogMixBiasRampWithStartValue:(float)a3 endValue:(float)a4 timeRange:(id *)a5
{
  long long v5 = *(_OWORD *)&a5->var0.var3;
  v7[0] = *(_OWORD *)&a5->var0.var0;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&a5->var1.var1;
  return (id)objc_msgSend(a1, "scheduledFloatValueRampWithStartValue:endValue:timeRange:", v7);
}

@end