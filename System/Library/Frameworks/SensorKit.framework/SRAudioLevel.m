@interface SRAudioLevel
+ (BOOL)supportsSecureCoding;
+ (SRAudioLevel)new;
- (BOOL)isEqual:(id)a3;
- (CMTimeRange)timeRange;
- (SRAudioLevel)init;
- (SRAudioLevel)initWithCoder:(id)a3;
- (SRAudioLevel)initWithTimeRange:(id *)a3 loudness:(double)a4;
- (double)loudness;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SRAudioLevel

- (SRAudioLevel)init
{
  return 0;
}

+ (SRAudioLevel)new
{
  return 0;
}

- (SRAudioLevel)initWithTimeRange:(id *)a3 loudness:(double)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SRAudioLevel;
  result = [(SRAudioLevel *)&v9 init];
  if (result)
  {
    long long v7 = *(_OWORD *)&a3->var0.var0;
    long long v8 = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)&result->_timeRange.start.epoch = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&result->_timeRange.duration.timescale = v8;
    *(_OWORD *)&result->_timeRange.start.value = v7;
    result->_loudness = a4;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    uint64_t v18 = v6;
    uint64_t v19 = v5;
    uint64_t v20 = v3;
    uint64_t v21 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && self)
    {
      objc_super v9 = (void *)MEMORY[0x263F08D40];
      [(SRAudioLevel *)self timeRange];
      v10 = (void *)[v9 valueWithCMTimeRange:v17];
      v11 = (void *)MEMORY[0x263F08D40];
      if (a3) {
        [a3 timeRange];
      }
      else {
        memset(v16, 0, sizeof(v16));
      }
      int v12 = objc_msgSend(v10, "isEqual:", objc_msgSend(v11, "valueWithCMTimeRange:", v16));
      if (v12)
      {
        double loudness = self->_loudness;
        [a3 loudness];
        LOBYTE(v12) = loudness == v14;
      }
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  return v12;
}

- (unint64_t)hash
{
  uint64_t v3 = (void *)MEMORY[0x263F08D40];
  if (self) {
    [(SRAudioLevel *)self timeRange];
  }
  else {
    memset(v6, 0, sizeof(v6));
  }
  uint64_t v4 = objc_msgSend((id)objc_msgSend(v3, "valueWithCMTimeRange:", v6), "hash");
  return objc_msgSend((id)objc_msgSend(NSNumber, "numberWithDouble:", self->_loudness), "hash") ^ v4;
}

- (id)description
{
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  long long v4 = *(_OWORD *)&self->_timeRange.start.epoch;
  *(_OWORD *)&range.start.value = *(_OWORD *)&self->_timeRange.start.value;
  *(_OWORD *)&range.start.epoch = v4;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&self->_timeRange.duration.timescale;
  CFStringRef v5 = CMTimeRangeCopyDescription(v3, &range);
  uint64_t v6 = NSString;
  long long v7 = (objc_class *)objc_opt_class();
  long long v8 = (void *)[v6 stringWithFormat:@"%@ (%p): timeRange: %@, loudness: %f", NSStringFromClass(v7), self, v5, *(void *)&self->_loudness];
  CFRelease(v5);
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRSpeechMetrics.m", 312, @"Invalid parameter not satisfying: %@", @"[encoder allowsKeyedCoding]");
  }
  uint64_t v6 = (void *)MEMORY[0x263F08D40];
  if (self) {
    [(SRAudioLevel *)self timeRange];
  }
  else {
    memset(v7, 0, sizeof(v7));
  }
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(v6, "valueWithCMTimeRange:", v7), @"timeRange");
  [a3 encodeDouble:@"loudness" forKey:self->_loudness];
}

- (SRAudioLevel)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRSpeechMetrics.m", 318, @"Invalid parameter not satisfying: %@", @"[decoder allowsKeyedCoding]");
  }
  uint64_t v6 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"timeRange"];
  [a3 decodeDoubleForKey:@"loudness"];
  double v8 = v7;
  if (v6) {
    [v6 CMTimeRangeValue];
  }
  else {
    memset(v10, 0, sizeof(v10));
  }
  return [(SRAudioLevel *)self initWithTimeRange:v10 loudness:v8];
}

- (CMTimeRange)timeRange
{
  long long v3 = *(_OWORD *)&self->duration.timescale;
  *(_OWORD *)&retstr->start.value = *(_OWORD *)&self->start.epoch;
  *(_OWORD *)&retstr->start.epoch = v3;
  *(_OWORD *)&retstr->duration.timescale = *(_OWORD *)&self[1].start.value;
  return self;
}

- (double)loudness
{
  return self->_loudness;
}

@end