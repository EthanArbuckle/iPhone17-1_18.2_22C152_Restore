@interface AVAssetTrackSegment
+ (BOOL)supportsSecureCoding;
- (AVAssetTrackSegment)init;
- (AVAssetTrackSegment)initWithCoder:(id)a3;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (CMTimeMapping)timeMapping;
- (id)_initWithTimeMapping:(id *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AVAssetTrackSegment

- (AVAssetTrackSegment)init
{
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1FA00] + 48);
  v6[2] = *(_OWORD *)(MEMORY[0x1E4F1FA00] + 32);
  v6[3] = v2;
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1FA00] + 80);
  v6[4] = *(_OWORD *)(MEMORY[0x1E4F1FA00] + 64);
  v6[5] = v3;
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1FA00] + 16);
  v6[0] = *MEMORY[0x1E4F1FA00];
  v6[1] = v4;
  return (AVAssetTrackSegment *)[(AVAssetTrackSegment *)self _initWithTimeMapping:v6];
}

- (id)_initWithTimeMapping:(id *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AVAssetTrackSegment;
  id result = [(AVAssetTrackSegment *)&v9 init];
  if (result)
  {
    long long v5 = *(_OWORD *)&a3->var0.var0.var0;
    *(_OWORD *)((char *)result + 24) = *(_OWORD *)&a3->var0.var0.var3;
    *(_OWORD *)((char *)result + 8) = v5;
    long long v6 = *(_OWORD *)&a3->var0.var1.var1;
    long long v7 = *(_OWORD *)&a3->var1.var0.var0;
    long long v8 = *(_OWORD *)&a3->var1.var0.var3;
    *(_OWORD *)((char *)result + 88) = *(_OWORD *)&a3->var1.var1.var1;
    *(_OWORD *)((char *)result + 72) = v8;
    *(_OWORD *)((char *)result + 56) = v7;
    *(_OWORD *)((char *)result + 40) = v6;
  }
  return result;
}

- (id)description
{
  long long v3 = NSString;
  long long v4 = (objc_class *)objc_opt_class();
  long long v5 = NSStringFromClass(v4);
  BOOL v6 = [(AVAssetTrackSegment *)self isEmpty];
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  if (v6)
  {
    long long v8 = @"empty";
  }
  else
  {
    long long v9 = *(_OWORD *)&self->_timeMapping.source.start.epoch;
    *(_OWORD *)&range.start.value = *(_OWORD *)&self->_timeMapping.source.start.value;
    *(_OWORD *)&range.start.epoch = v9;
    *(_OWORD *)&range.duration.timescale = *(_OWORD *)&self->_timeMapping.source.duration.timescale;
    long long v8 = (__CFString *)[NSString stringWithFormat:@"source = %@", (id)CMTimeRangeCopyDescription(v7, &range)];
  }
  long long v10 = *(_OWORD *)&self->_timeMapping.target.start.epoch;
  *(_OWORD *)&range.start.value = *(_OWORD *)&self->_timeMapping.target.start.value;
  *(_OWORD *)&range.start.epoch = v10;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&self->_timeMapping.target.duration.timescale;
  return (id)[v3 stringWithFormat:@"<%@: %p, %@, target = %@>", v5, self, v8, (id)CMTimeRangeCopyDescription(v7, &range)];
}

- (BOOL)isEmpty
{
  return (self->_timeMapping.source.start.flags & 0x1D) != 1
      && (self->_timeMapping.target.start.flags & 1) != 0
      && (self->_timeMapping.target.duration.flags & 1) != 0
      && !self->_timeMapping.target.duration.epoch
      && self->_timeMapping.target.duration.value >= 0;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  uint64_t v14 = v3;
  uint64_t v15 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  if (-[AVAssetTrackSegment isEmpty](self, "isEmpty") && ([a3 isEmpty] & 1) != 0) {
    return 1;
  }
  long long v7 = 0uLL;
  memset(v13, 0, sizeof(v13));
  if (self)
  {
    [(AVAssetTrackSegment *)self timeMapping];
    long long v7 = 0uLL;
  }
  *(_OWORD *)&v12.start.epoch = v7;
  *(_OWORD *)&v12.duration.timescale = v7;
  *(_OWORD *)&v11.duration.timescale = v7;
  *(_OWORD *)&v12.start.value = v7;
  *(_OWORD *)&v11.start.value = v7;
  *(_OWORD *)&v11.start.epoch = v7;
  if (a3) {
    [a3 timeMapping];
  }
  CMTimeRange range1 = v13[0];
  CMTimeRange v9 = v11;
  if (CMTimeRangeEqual(&range1, &v9) && (range1 = v13[1], CMTimeRange v9 = v12, CMTimeRangeEqual(&range1, &v9))) {
    return 1;
  }
  else {
    return 0;
  }
}

- (unint64_t)hash
{
  if ([(AVAssetTrackSegment *)self isEmpty]) {
    return 0;
  }
  memset(v11, 0, sizeof(v11));
  long long v10 = 0u;
  long long v8 = 0u;
  memset(v9, 0, sizeof(v9));
  if (self) {
    [(AVAssetTrackSegment *)self timeMapping];
  }
  *(_OWORD *)&v7.value = v8;
  v7.epoch = *(void *)&v9[0];
  CMTimeEpoch v4 = CMTimeHash(&v7);
  CMTime v7 = *(CMTime *)((char *)v9 + 8);
  CMTimeEpoch v5 = CMTimeHash(&v7) ^ v4;
  *(_OWORD *)&v7.value = v10;
  v7.epoch = *(void *)&v11[0];
  CMTimeEpoch v6 = CMTimeHash(&v7);
  CMTime v7 = *(CMTime *)((char *)v11 + 8);
  return v5 ^ v6 ^ CMTimeHash(&v7);
}

- (AVAssetTrackSegment)initWithCoder:(id)a3
{
  CMTimeEpoch v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  CFDictionaryRef v8 = (const __CFDictionary *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0), @"timeMapping");
  memset(&v15, 0, sizeof(v15));
  CMTimeMappingMakeFromDictionary(&v15, v8);
  v14.receiver = self;
  v14.super_class = (Class)AVAssetTrackSegment;
  id result = [(AVAssetTrackSegment *)&v14 init];
  if (result)
  {
    long long v10 = *(_OWORD *)&v15.source.start.value;
    *(_OWORD *)&result->_timeMapping.source.start.epoch = *(_OWORD *)&v15.source.start.epoch;
    *(_OWORD *)&result->_timeMapping.source.start.value = v10;
    long long v11 = *(_OWORD *)&v15.source.duration.timescale;
    long long v12 = *(_OWORD *)&v15.target.start.value;
    long long v13 = *(_OWORD *)&v15.target.start.epoch;
    *(_OWORD *)&result->_timeMapping.target.duration.timescale = *(_OWORD *)&v15.target.duration.timescale;
    *(_OWORD *)&result->_timeMapping.target.start.epoch = v13;
    *(_OWORD *)&result->_timeMapping.target.start.value = v12;
    *(_OWORD *)&result->_timeMapping.source.duration.timescale = v11;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (self) {
    [(AVAssetTrackSegment *)self timeMapping];
  }
  else {
    memset(&v4, 0, sizeof(v4));
  }
  objc_msgSend(a3, "encodeObject:forKey:", CMTimeMappingCopyAsDictionary(&v4, (CFAllocatorRef)*MEMORY[0x1E4F1CF80]), @"timeMapping");
}

- (CMTimeMapping)timeMapping
{
  long long v3 = *(_OWORD *)&self->target.start.timescale;
  *(_OWORD *)&retstr->source.duration.timescale = *(_OWORD *)&self->source.duration.epoch;
  *(_OWORD *)&retstr->target.start.value = v3;
  long long v4 = *(_OWORD *)&self->target.duration.epoch;
  *(_OWORD *)&retstr->target.start.epoch = *(_OWORD *)&self->target.duration.value;
  *(_OWORD *)&retstr->target.duration.timescale = v4;
  long long v5 = *(_OWORD *)&self->source.duration.value;
  *(_OWORD *)&retstr->source.start.value = *(_OWORD *)&self->source.start.timescale;
  *(_OWORD *)&retstr->source.start.epoch = v5;
  return self;
}

@end