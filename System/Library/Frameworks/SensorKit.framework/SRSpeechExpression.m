@interface SRSpeechExpression
+ (BOOL)supportsSecureCoding;
+ (SRSpeechExpression)new;
- (BOOL)isEqual:(id)a3;
- (CMTimeRange)timeRange;
- (NSString)version;
- (SRSpeechExpression)init;
- (SRSpeechExpression)initWithCoder:(id)a3;
- (SRSpeechExpression)initWithVersion:(id)a3 timeRange:(id *)a4 confidence:(double)a5 mood:(double)a6 valence:(double)a7 activation:(double)a8 dominance:(double)a9;
- (double)activation;
- (double)confidence;
- (double)dominance;
- (double)mood;
- (double)valence;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SRSpeechExpression

- (SRSpeechExpression)init
{
  return 0;
}

+ (SRSpeechExpression)new
{
  return 0;
}

- (SRSpeechExpression)initWithVersion:(id)a3 timeRange:(id *)a4 confidence:(double)a5 mood:(double)a6 valence:(double)a7 activation:(double)a8 dominance:(double)a9
{
  v20.receiver = self;
  v20.super_class = (Class)SRSpeechExpression;
  v16 = [(SRSpeechExpression *)&v20 init];
  if (v16)
  {
    *((void *)v16 + 1) = [a3 copy];
    long long v18 = *(_OWORD *)&a4->var0.var3;
    long long v17 = *(_OWORD *)&a4->var1.var1;
    *(_OWORD *)(v16 + 56) = *(_OWORD *)&a4->var0.var0;
    *(_OWORD *)(v16 + 72) = v18;
    *(_OWORD *)(v16 + 88) = v17;
    *((double *)v16 + 2) = a5;
    *((double *)v16 + 3) = a6;
    *((double *)v16 + 4) = a7;
    *((double *)v16 + 5) = a8;
    *((double *)v16 + 6) = a9;
  }
  return (SRSpeechExpression *)v16;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SRSpeechExpression;
  [(SRSpeechExpression *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    uint64_t v26 = v6;
    uint64_t v27 = v5;
    uint64_t v28 = v3;
    uint64_t v29 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || !self) {
      goto LABEL_17;
    }
    if (!-[SRSpeechExpression version](self, "version") && ![a3 version]
      || (int v9 = -[NSString isEqual:](-[SRSpeechExpression version](self, "version"), "isEqual:", [a3 version])) != 0)
    {
      v10 = (void *)MEMORY[0x263F08D40];
      [(SRSpeechExpression *)self timeRange];
      v11 = (void *)[v10 valueWithCMTimeRange:v25];
      v12 = (void *)MEMORY[0x263F08D40];
      if (a3) {
        [a3 timeRange];
      }
      else {
        memset(v24, 0, sizeof(v24));
      }
      int v9 = objc_msgSend(v11, "isEqual:", objc_msgSend(v12, "valueWithCMTimeRange:", v24));
      if (v9)
      {
        double confidence = self->_confidence;
        [a3 confidence];
        if (confidence == v14)
        {
          double mood = self->_mood;
          [a3 mood];
          if (mood == v16)
          {
            double valence = self->_valence;
            [a3 valence];
            if (valence == v18)
            {
              double activation = self->_activation;
              [a3 activation];
              if (activation == v20)
              {
                double dominance = self->_dominance;
                [a3 dominance];
                LOBYTE(v9) = dominance == v22;
                return v9;
              }
            }
          }
        }
LABEL_17:
        LOBYTE(v9) = 0;
      }
    }
  }
  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)[(SRSpeechExpression *)self version] hash];
  uint64_t v4 = (void *)MEMORY[0x263F08D40];
  if (self) {
    [(SRSpeechExpression *)self timeRange];
  }
  else {
    memset(v16, 0, sizeof(v16));
  }
  uint64_t v5 = objc_msgSend((id)objc_msgSend(v4, "valueWithCMTimeRange:", v16), "hash") ^ v3;
  uint64_t v6 = NSNumber;
  [(SRSpeechExpression *)self confidence];
  uint64_t v7 = objc_msgSend((id)objc_msgSend(v6, "numberWithDouble:"), "hash");
  v8 = NSNumber;
  [(SRSpeechExpression *)self mood];
  uint64_t v9 = v5 ^ v7 ^ objc_msgSend((id)objc_msgSend(v8, "numberWithDouble:"), "hash");
  v10 = NSNumber;
  [(SRSpeechExpression *)self valence];
  uint64_t v11 = objc_msgSend((id)objc_msgSend(v10, "numberWithDouble:"), "hash");
  v12 = NSNumber;
  [(SRSpeechExpression *)self activation];
  uint64_t v13 = v11 ^ objc_msgSend((id)objc_msgSend(v12, "numberWithDouble:"), "hash");
  double v14 = NSNumber;
  [(SRSpeechExpression *)self dominance];
  return v9 ^ v13 ^ objc_msgSend((id)objc_msgSend(v14, "numberWithDouble:"), "hash");
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
  uint64_t v7 = (objc_class *)objc_opt_class();
  v8 = (void *)[v6 stringWithFormat:@"%@ (%p): version: %@, timeRange: %@, confidence: %f, mood: %f, valence: %f, activation: %f, dominance: %f", NSStringFromClass(v7), self, self->_version, v5, *(void *)&self->_confidence, *(void *)&self->_mood, *(void *)&self->_valence, *(void *)&self->_activation, *(void *)&self->_dominance];
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
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRSpeechMetrics.m", 219, @"Invalid parameter not satisfying: %@", @"[encoder allowsKeyedCoding]");
  }
  [a3 encodeObject:self->_version forKey:@"version"];
  uint64_t v6 = (void *)MEMORY[0x263F08D40];
  [(SRSpeechExpression *)self timeRange];
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(v6, "valueWithCMTimeRange:", v7), @"timeRange");
  [a3 encodeDouble:@"confidence" forKey:self->_confidence];
  [a3 encodeDouble:@"mood" forKey:self->_mood];
  [a3 encodeDouble:@"valence" forKey:self->_valence];
  [a3 encodeDouble:@"activation" forKey:self->_activation];
  [a3 encodeDouble:@"dominance" forKey:self->_dominance];
}

- (SRSpeechExpression)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRSpeechMetrics.m", 230, @"Invalid parameter not satisfying: %@", @"[decoder allowsKeyedCoding]");
  }
  uint64_t v6 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"version"];
  uint64_t v7 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"timeRange"];
  [a3 decodeDoubleForKey:@"confidence"];
  double v9 = v8;
  [a3 decodeDoubleForKey:@"mood"];
  double v11 = v10;
  [a3 decodeDoubleForKey:@"valence"];
  double v13 = v12;
  [a3 decodeDoubleForKey:@"activation"];
  double v15 = v14;
  [a3 decodeDoubleForKey:@"dominance"];
  double v17 = v16;
  if (v7) {
    [v7 CMTimeRangeValue];
  }
  else {
    memset(v19, 0, sizeof(v19));
  }
  return [(SRSpeechExpression *)self initWithVersion:v6 timeRange:v19 confidence:v9 mood:v11 valence:v13 activation:v15 dominance:v17];
}

- (NSString)version
{
  return self->_version;
}

- (CMTimeRange)timeRange
{
  long long v3 = *(_OWORD *)&self[1].duration.value;
  *(_OWORD *)&retstr->start.value = *(_OWORD *)&self[1].start.timescale;
  *(_OWORD *)&retstr->start.epoch = v3;
  *(_OWORD *)&retstr->duration.timescale = *(_OWORD *)&self[1].duration.epoch;
  return self;
}

- (double)confidence
{
  return self->_confidence;
}

- (double)mood
{
  return self->_mood;
}

- (double)valence
{
  return self->_valence;
}

- (double)activation
{
  return self->_activation;
}

- (double)dominance
{
  return self->_dominance;
}

@end