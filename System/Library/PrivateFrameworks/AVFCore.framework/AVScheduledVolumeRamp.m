@interface AVScheduledVolumeRamp
+ (id)_defaultAdditionalFigRepresentationObjects;
+ (id)volumeRampWithStartVolume:(float)a3 endVolume:(float)a4 timeRange:(id *)a5 rampMode:(int64_t)a6;
- (AVScheduledVolumeRamp)initWithPropertyList:(id)a3;
- (AVScheduledVolumeRamp)initWithStartVolume:(float)a3 endVolume:(float)a4 timeRange:(id *)a5 rampMode:(int64_t)a6;
- (float)endVolume;
- (float)startVolume;
- (id)_additionalFigRepresentationObjects;
- (id)_makeRampWithTruncatedTimeRange:(id *)a3 endValue:(float)a4;
- (id)propertyList;
- (int64_t)_parameterRampMode;
- (int64_t)rampMode;
@end

@implementation AVScheduledVolumeRamp

+ (id)_defaultAdditionalFigRepresentationObjects
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = [NSString stringWithString:*MEMORY[0x1E4F334F0]];
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
}

+ (id)volumeRampWithStartVolume:(float)a3 endVolume:(float)a4 timeRange:(id *)a5 rampMode:(int64_t)a6
{
  id v10 = objc_alloc((Class)objc_opt_class());
  long long v11 = *(_OWORD *)&a5->var0.var3;
  v13[0] = *(_OWORD *)&a5->var0.var0;
  v13[1] = v11;
  *(float *)&long long v11 = a4;
  return (id)objc_msgSend(v10, "initWithStartVolume:endVolume:timeRange:rampMode:", v13, a6, COERCE_DOUBLE(__PAIR64__(HIDWORD(*(void *)&a5->var1.var1), LODWORD(a3))), *(double *)&v11);
}

- (AVScheduledVolumeRamp)initWithStartVolume:(float)a3 endVolume:(float)a4 timeRange:(id *)a5 rampMode:(int64_t)a6
{
  v10.receiver = self;
  v10.super_class = (Class)AVScheduledVolumeRamp;
  long long v7 = *(_OWORD *)&a5->var0.var3;
  v9[0] = *(_OWORD *)&a5->var0.var0;
  v9[1] = v7;
  v9[2] = *(_OWORD *)&a5->var1.var1;
  result = -[AVScheduledFloatValueRamp initWithStartValue:endValue:timeRange:](&v10, sel_initWithStartValue_endValue_timeRange_, v9);
  if (result) {
    result->_rampMode = a6;
  }
  return result;
}

- (float)startVolume
{
  v3.receiver = self;
  v3.super_class = (Class)AVScheduledVolumeRamp;
  [(AVScheduledFloatValueRamp *)&v3 startFloatValue];
  return result;
}

- (float)endVolume
{
  v3.receiver = self;
  v3.super_class = (Class)AVScheduledVolumeRamp;
  [(AVScheduledFloatValueRamp *)&v3 endFloatValue];
  return result;
}

- (int64_t)rampMode
{
  return self->_rampMode;
}

- (int64_t)_parameterRampMode
{
  return self->_rampMode;
}

- (id)_additionalFigRepresentationObjects
{
  v5[1] = *MEMORY[0x1E4F143B8];
  int64_t v2 = [(AVScheduledVolumeRamp *)self rampMode];
  objc_super v3 = (void *)MEMORY[0x1E4F334E8];
  if (v2 != 1) {
    objc_super v3 = (void *)MEMORY[0x1E4F334F0];
  }
  v5[0] = [NSString stringWithString:*v3];
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
}

- (id)_makeRampWithTruncatedTimeRange:(id *)a3 endValue:(float)a4
{
  long long v7 = objc_opt_class();
  [(AVScheduledVolumeRamp *)self startVolume];
  unsigned int v9 = v8;
  int64_t v10 = [(AVScheduledVolumeRamp *)self rampMode];
  long long v11 = *(_OWORD *)&a3->var0.var3;
  v13[0] = *(_OWORD *)&a3->var0.var0;
  v13[1] = v11;
  *(float *)&long long v11 = a4;
  return (id)objc_msgSend(v7, "volumeRampWithStartVolume:endVolume:timeRange:rampMode:", v13, v10, COERCE_DOUBLE(__PAIR64__(HIDWORD(*(void *)&a3->var1.var1), v9)), *(double *)&v11);
}

- (AVScheduledVolumeRamp)initWithPropertyList:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVScheduledVolumeRamp;
  v4 = -[AVScheduledFloatValueRamp initWithPropertyList:](&v6, sel_initWithPropertyList_);
  if (v4) {
    v4->_rampMode = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"rampMode"), "integerValue");
  }
  return v4;
}

- (id)propertyList
{
  v5.receiver = self;
  v5.super_class = (Class)AVScheduledVolumeRamp;
  id v3 = [(AVScheduledFloatValueRamp *)&v5 propertyList];
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[AVScheduledVolumeRamp rampMode](self, "rampMode")), @"rampMode");
  return v3;
}

@end