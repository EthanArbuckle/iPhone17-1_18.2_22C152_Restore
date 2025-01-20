@interface AVScheduledParameterRamp
+ (NSArray)_defaultAdditionalFigRepresentationObjects;
+ (id)defaultValue;
+ (id)scheduledParameterRampWithPropertyList:(id)a3;
- ($1CE2C3FC342086196D07C2B4E8C70800)timeRange;
- (AVScheduledParameterRamp)initWithPropertyList:(id)a3;
- (AVScheduledParameterRamp)initWithTimeRange:(id *)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)_additionalFigRepresentationObjects;
- (id)description;
- (id)endValue;
- (id)propertyList;
- (id)scheduledParameterRampInterpolatedToTime:(id *)a3;
- (id)startValue;
- (unint64_t)hash;
@end

@implementation AVScheduledParameterRamp

+ (id)defaultValue
{
  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)a1, a2, v4);
  return 0;
}

+ (NSArray)_defaultAdditionalFigRepresentationObjects
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (AVScheduledParameterRamp)initWithTimeRange:(id *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AVScheduledParameterRamp;
  result = [(AVScheduledParameterRamp *)&v7 init];
  if (result)
  {
    long long v5 = *(_OWORD *)&a3->var0.var0;
    long long v6 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&result->_timeRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)&result->_timeRange.start.epoch = v6;
    *(_OWORD *)&result->_timeRange.start.value = v5;
  }
  return result;
}

- ($1CE2C3FC342086196D07C2B4E8C70800)timeRange
{
  long long v3 = *(_OWORD *)&self->var1.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var0.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self->var1.var3;
  return self;
}

- (id)startValue
{
  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (id)endValue
{
  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (NSArray)_additionalFigRepresentationObjects
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (id)scheduledParameterRampInterpolatedToTime:(id *)a3
{
  long long v5 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v5);
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    LOBYTE(v5) = 0;
    return v5;
  }
  if (!self)
  {
    memset(&range1, 0, sizeof(range1));
    if (a3) {
      goto LABEL_4;
    }
LABEL_7:
    memset(&v7, 0, sizeof(v7));
    goto LABEL_8;
  }
  [(AVScheduledParameterRamp *)self timeRange];
  if (!a3) {
    goto LABEL_7;
  }
LABEL_4:
  [a3 timeRange];
LABEL_8:
  int v5 = CMTimeRangeEqual(&range1, &v7);
  if (v5)
  {
    int v5 = objc_msgSend(-[AVScheduledParameterRamp startValue](self, "startValue"), "isEqual:", objc_msgSend(a3, "startValue"));
    if (v5)
    {
      int v5 = objc_msgSend(-[AVScheduledParameterRamp endValue](self, "endValue"), "isEqual:", objc_msgSend(a3, "endValue"));
      if (v5) {
        LOBYTE(v5) = -[NSArray isEqual:](-[AVScheduledParameterRamp _additionalFigRepresentationObjects](self, "_additionalFigRepresentationObjects"), "isEqual:", [a3 _additionalFigRepresentationObjects]);
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  $95D729B680665BEAEFA1D6FCA8238556 start = self->_timeRange.start;
  CMTimeEpoch v3 = CMTimeHash((CMTime *)&start);
  $95D729B680665BEAEFA1D6FCA8238556 start = self->_timeRange.duration;
  CMTimeEpoch v4 = CMTimeHash((CMTime *)&start) ^ v3;
  uint64_t v5 = objc_msgSend(-[AVScheduledParameterRamp startValue](self, "startValue"), "hash");
  uint64_t v6 = v4 ^ v5 ^ objc_msgSend(-[AVScheduledParameterRamp endValue](self, "endValue"), "hash");
  return v6 ^ [(NSArray *)[(AVScheduledParameterRamp *)self _additionalFigRepresentationObjects] hash];
}

- (id)description
{
  CMTimeEpoch v3 = NSString;
  CMTimeEpoch v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  long long v7 = *(_OWORD *)&self->_timeRange.start.epoch;
  *(_OWORD *)&range.start.value = *(_OWORD *)&self->_timeRange.start.value;
  *(_OWORD *)&range.start.epoch = v7;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&self->_timeRange.duration.timescale;
  return (id)[v3 stringWithFormat:@"<%@: %p, timeRange:%@ startValue:%@ endValue:%@ extras:%@>", v5, self, (id)CMTimeRangeCopyDescription(v6, &range), -[AVScheduledParameterRamp startValue](self, "startValue"), -[AVScheduledParameterRamp endValue](self, "endValue"), -[AVScheduledParameterRamp _additionalFigRepresentationObjects](self, "_additionalFigRepresentationObjects")];
}

+ (id)scheduledParameterRampWithPropertyList:(id)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  return (id)[v4 initWithPropertyList:a3];
}

- (AVScheduledParameterRamp)initWithPropertyList:(id)a3
{
  uint64_t v5 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v5);
  return 0;
}

- (id)propertyList
{
  id v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

@end