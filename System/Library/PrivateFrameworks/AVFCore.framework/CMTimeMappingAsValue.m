@interface CMTimeMappingAsValue
+ (BOOL)supportsSecureCoding;
+ (id)valueWithCMTimeMapping:(id *)a3;
- ($4C6D1E162277694FB76656457146213A)CMTimeMappingValue;
- (BOOL)isEqualToValue:(id)a3;
- (CMTimeMappingAsValue)initWithCoder:(id)a3;
- (const)objCType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)getValue:(void *)a3;
@end

@implementation CMTimeMappingAsValue

+ (id)valueWithCMTimeMapping:(id *)a3
{
  uint64_t v4 = [objc_allocWithZone((Class)a1) init];
  long long v5 = *(_OWORD *)&a3->var0.var0.var3;
  *(_OWORD *)(v4 + 8) = *(_OWORD *)&a3->var0.var0.var0;
  *(_OWORD *)(v4 + 24) = v5;
  long long v6 = *(_OWORD *)&a3->var1.var1.var1;
  long long v8 = *(_OWORD *)&a3->var0.var1.var1;
  long long v7 = *(_OWORD *)&a3->var1.var0.var0;
  *(_OWORD *)(v4 + 72) = *(_OWORD *)&a3->var1.var0.var3;
  *(_OWORD *)(v4 + 88) = v6;
  *(_OWORD *)(v4 + 40) = v8;
  *(_OWORD *)(v4 + 56) = v7;
  return (id)v4;
}

- ($4C6D1E162277694FB76656457146213A)CMTimeMappingValue
{
  long long v3 = *(_OWORD *)&self->var1.var0.var1;
  *(_OWORD *)&retstr->var0.var1.var1 = *(_OWORD *)&self->var0.var1.var3;
  *(_OWORD *)&retstr->var1.var0.var0 = v3;
  long long v4 = *(_OWORD *)&self->var1.var1.var3;
  *(_OWORD *)&retstr->var1.var0.var3 = *(_OWORD *)&self->var1.var1.var0;
  *(_OWORD *)&retstr->var1.var1.var1 = v4;
  long long v5 = *(_OWORD *)&self->var0.var1.var0;
  *(_OWORD *)&retstr->var0.var0.var0 = *(_OWORD *)&self->var0.var0.var1;
  *(_OWORD *)&retstr->var0.var0.var3 = v5;
  return self;
}

- (void)getValue:(void *)a3
{
  long long v3 = *(_OWORD *)&self->_timeMapping.source.start.epoch;
  *(_OWORD *)a3 = *(_OWORD *)&self->_timeMapping.source.start.value;
  *((_OWORD *)a3 + 1) = v3;
  long long v4 = *(_OWORD *)&self->_timeMapping.target.duration.timescale;
  long long v6 = *(_OWORD *)&self->_timeMapping.source.duration.timescale;
  long long v5 = *(_OWORD *)&self->_timeMapping.target.start.value;
  *((_OWORD *)a3 + 4) = *(_OWORD *)&self->_timeMapping.target.start.epoch;
  *((_OWORD *)a3 + 5) = v4;
  *((_OWORD *)a3 + 2) = v6;
  *((_OWORD *)a3 + 3) = v5;
}

- (const)objCType
{
  return "{?={?={?=qiIq}{?=qiIq}}{?={?=qiIq}{?=qiIq}}}";
}

- (id)description
{
  memset(v7, 0, sizeof(v7));
  if (self) {
    [(CMTimeMappingAsValue *)self CMTimeMappingValue];
  }
  v2 = NSString;
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CMTimeRange range = v7[0];
  CFStringRef v4 = (id)CMTimeRangeCopyDescription(v3, &range);
  CMTimeRange range = v7[1];
  return (id)[v2 stringWithFormat:@"CMTimeMapping: {%@, %@}", v4, (id)CMTimeRangeCopyDescription(v3, &range)];
}

- (BOOL)isEqualToValue:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    uint64_t v15 = v3;
    uint64_t v16 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      memset(v14, 0, sizeof(v14));
      if (a3) {
        [a3 CMTimeMappingValue];
      }
      p_timeMapping = &self->_timeMapping;
      long long v8 = *(_OWORD *)&p_timeMapping->source.start.epoch;
      *(_OWORD *)&range1.start.value = *(_OWORD *)&p_timeMapping->source.start.value;
      *(_OWORD *)&range1.start.epoch = v8;
      *(_OWORD *)&range1.duration.timescale = *(_OWORD *)&p_timeMapping->source.duration.timescale;
      CMTimeRange v12 = v14[0];
      int v9 = CMTimeRangeEqual(&range1, &v12);
      if (v9)
      {
        long long v10 = *(_OWORD *)&p_timeMapping->target.start.epoch;
        *(_OWORD *)&range1.start.value = *(_OWORD *)&p_timeMapping->target.start.value;
        *(_OWORD *)&range1.start.epoch = v10;
        *(_OWORD *)&range1.duration.timescale = *(_OWORD *)&p_timeMapping->target.duration.timescale;
        CMTimeRange v12 = v14[1];
        LOBYTE(v9) = CMTimeRangeEqual(&range1, &v12) != 0;
      }
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }
  return v9;
}

- (unint64_t)hash
{
  p_timeMapping = &self->_timeMapping;
  $95D729B680665BEAEFA1D6FCA8238556 start = self->_timeMapping.source.start;
  CMTimeEpoch v3 = CMTimeHash((CMTime *)&start);
  $95D729B680665BEAEFA1D6FCA8238556 start = p_timeMapping->source.duration;
  CMTimeEpoch v4 = CMTimeHash((CMTime *)&start) ^ v3;
  $95D729B680665BEAEFA1D6FCA8238556 start = p_timeMapping->target.start;
  CMTimeEpoch v5 = CMTimeHash((CMTime *)&start);
  $95D729B680665BEAEFA1D6FCA8238556 start = p_timeMapping->target.duration;
  return v4 ^ v5 ^ CMTimeHash((CMTime *)&start);
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (NSShouldRetainWithZone(self, a3))
  {
    return self;
  }
  else
  {
    long long v4 = *(_OWORD *)&self->_timeMapping.target.start.value;
    v8[2] = *(_OWORD *)&self->_timeMapping.source.duration.timescale;
    v8[3] = v4;
    long long v5 = *(_OWORD *)&self->_timeMapping.target.duration.timescale;
    v8[4] = *(_OWORD *)&self->_timeMapping.target.start.epoch;
    v8[5] = v5;
    long long v6 = *(_OWORD *)&self->_timeMapping.source.start.epoch;
    v8[0] = *(_OWORD *)&self->_timeMapping.source.start.value;
    v8[1] = v6;
    return +[CMTimeMappingAsValue valueWithCMTimeMapping:v8];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMTimeMappingAsValue)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    long long v10 = self;
    uint64_t v16 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v11, v12, v13, v14, v15, (uint64_t)"[coder allowsKeyedCoding]"), 0 reason userInfo];
    objc_exception_throw(v16);
  }
  v23.receiver = self;
  v23.super_class = (Class)CMTimeMappingAsValue;
  long long v6 = [(CMTimeMappingAsValue *)&v23 init];
  long long v7 = v6;
  if (v6)
  {
    p_timeMapping = &v6->_timeMapping;
    if (a3)
    {
      [a3 decodeCMTimeMappingForKey:@"CMTimeMapping"];
    }
    else
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
    }
    *(_OWORD *)&p_timeMapping->source.start.value = v17;
    *(_OWORD *)&v7->_timeMapping.source.start.epoch = v18;
    *(_OWORD *)&v7->_timeMapping.target.start.epoch = v21;
    *(_OWORD *)&v7->_timeMapping.target.duration.timescale = v22;
    *(_OWORD *)&v7->_timeMapping.source.duration.timescale = v19;
    *(_OWORD *)&v7->_timeMapping.target.start.value = v20;
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    uint64_t v14 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v6, v7, v8, v9, v10, (uint64_t)"[coder allowsKeyedCoding]"), 0 reason userInfo];
    objc_exception_throw(v14);
  }
  long long v11 = *(_OWORD *)&self->_timeMapping.target.start.value;
  v15[2] = *(_OWORD *)&self->_timeMapping.source.duration.timescale;
  v15[3] = v11;
  long long v12 = *(_OWORD *)&self->_timeMapping.target.duration.timescale;
  v15[4] = *(_OWORD *)&self->_timeMapping.target.start.epoch;
  v15[5] = v12;
  long long v13 = *(_OWORD *)&self->_timeMapping.source.start.epoch;
  v15[0] = *(_OWORD *)&self->_timeMapping.source.start.value;
  v15[1] = v13;
  [a3 encodeCMTimeMapping:v15 forKey:@"CMTimeMapping"];
}

@end