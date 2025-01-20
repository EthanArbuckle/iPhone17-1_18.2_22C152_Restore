@interface CMTimeRangeAsValue
+ (BOOL)supportsSecureCoding;
+ (id)valueWithCMTimeRange:(id *)a3;
- ($1CE2C3FC342086196D07C2B4E8C70800)CMTimeRangeValue;
- (BOOL)isEqualToValue:(id)a3;
- (CMTimeRangeAsValue)initWithCoder:(id)a3;
- (const)objCType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)getValue:(void *)a3;
@end

@implementation CMTimeRangeAsValue

+ (id)valueWithCMTimeRange:(id *)a3
{
  uint64_t v4 = [objc_allocWithZone((Class)a1) init];
  long long v6 = *(_OWORD *)&a3->var0.var3;
  long long v5 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)(v4 + 8) = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)(v4 + 24) = v6;
  *(_OWORD *)(v4 + 40) = v5;
  return (id)v4;
}

- ($1CE2C3FC342086196D07C2B4E8C70800)CMTimeRangeValue
{
  long long v3 = *(_OWORD *)&self->var1.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var0.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self->var1.var3;
  return self;
}

- (void)getValue:(void *)a3
{
  long long v4 = *(_OWORD *)&self->_timeRange.start.epoch;
  long long v3 = *(_OWORD *)&self->_timeRange.duration.timescale;
  *(_OWORD *)a3 = *(_OWORD *)&self->_timeRange.start.value;
  *((_OWORD *)a3 + 1) = v4;
  *((_OWORD *)a3 + 2) = v3;
}

- (const)objCType
{
  return "{?={?=qiIq}{?=qiIq}}";
}

- (id)description
{
  v2 = NSString;
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  if (self) {
    [(CMTimeRangeAsValue *)self CMTimeRangeValue];
  }
  else {
    memset(&range, 0, sizeof(range));
  }
  return (id)[v2 stringWithFormat:@"CMTimeRange: %@", (id)CMTimeRangeCopyDescription(v3, &range)];
}

- (BOOL)isEqualToValue:(id)a3
{
  if (self == a3) {
    return 1;
  }
  uint64_t v12 = v3;
  uint64_t v13 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  p_timeRange = &self->_timeRange;
  if (a3) {
    [a3 CMTimeRangeValue];
  }
  else {
    memset(&range2, 0, sizeof(range2));
  }
  long long v9 = *(_OWORD *)&p_timeRange->start.epoch;
  *(_OWORD *)&v10.start.value = *(_OWORD *)&p_timeRange->start.value;
  *(_OWORD *)&v10.start.epoch = v9;
  *(_OWORD *)&v10.duration.timescale = *(_OWORD *)&p_timeRange->duration.timescale;
  return CMTimeRangeEqual(&v10, &range2) != 0;
}

- (unint64_t)hash
{
  p_timeRange = &self->_timeRange;
  $95D729B680665BEAEFA1D6FCA8238556 start = self->_timeRange.start;
  CMTimeEpoch v3 = CMTimeHash((CMTime *)&start);
  $95D729B680665BEAEFA1D6FCA8238556 start = p_timeRange->duration;
  return CMTimeHash((CMTime *)&start) ^ v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (NSShouldRetainWithZone(self, a3))
  {
    return self;
  }
  else
  {
    long long v4 = *(_OWORD *)&self->_timeRange.start.epoch;
    v6[0] = *(_OWORD *)&self->_timeRange.start.value;
    v6[1] = v4;
    v6[2] = *(_OWORD *)&self->_timeRange.duration.timescale;
    return +[CMTimeRangeAsValue valueWithCMTimeRange:v6];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMTimeRangeAsValue)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    v8 = self;
    v14 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v9, v10, v11, v12, v13, (uint64_t)"[coder allowsKeyedCoding]"), 0 reason userInfo];
    objc_exception_throw(v14);
  }
  v18.receiver = self;
  v18.super_class = (Class)CMTimeRangeAsValue;
  long long v6 = [(CMTimeRangeAsValue *)&v18 init];
  if (v6)
  {
    if (a3)
    {
      [a3 decodeCMTimeRangeForKey:@"CMTimeRange"];
    }
    else
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v15 = 0u;
    }
    *(_OWORD *)(v6 + 24) = v16;
    *(_OWORD *)(v6 + 40) = v17;
    *(_OWORD *)(v6 + 8) = v15;
  }
  return (CMTimeRangeAsValue *)v6;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    uint64_t v12 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v6, v7, v8, v9, v10, (uint64_t)"[coder allowsKeyedCoding]"), 0 reason userInfo];
    objc_exception_throw(v12);
  }
  long long v11 = *(_OWORD *)&self->_timeRange.start.epoch;
  v13[0] = *(_OWORD *)&self->_timeRange.start.value;
  v13[1] = v11;
  v13[2] = *(_OWORD *)&self->_timeRange.duration.timescale;
  [a3 encodeCMTimeRange:v13 forKey:@"CMTimeRange"];
}

@end