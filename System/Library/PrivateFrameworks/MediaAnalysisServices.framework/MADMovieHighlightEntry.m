@interface MADMovieHighlightEntry
+ (BOOL)supportsSecureCoding;
+ (id)entryWithTimeRange:(id *)a3 score:(double)a4 attributes:(id)a5;
- ($1C75447F214D9465CD650DD956230C7F)timeRange;
- (MADMovieHighlightEntry)initWithCoder:(id)a3;
- (MADMovieHighlightEntry)initWithTimeRange:(id *)a3 score:(double)a4 attributes:(id)a5;
- (NSDictionary)attributes;
- (double)score;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MADMovieHighlightEntry

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADMovieHighlightEntry)initWithTimeRange:(id *)a3 score:(double)a4 attributes:(id)a5
{
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MADMovieHighlightEntry;
  v10 = [(MADMovieHighlightEntry *)&v15 init];
  v11 = (MADMovieHighlightEntry *)v10;
  if (v10)
  {
    long long v12 = *(_OWORD *)&a3->var0.var0;
    long long v13 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)(v10 + 56) = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)(v10 + 40) = v13;
    *(_OWORD *)(v10 + 24) = v12;
    *((double *)v10 + 1) = a4;
    objc_storeStrong((id *)v10 + 2, a5);
  }

  return v11;
}

+ (id)entryWithTimeRange:(id *)a3 score:(double)a4 attributes:(id)a5
{
  id v8 = a5;
  id v9 = objc_alloc((Class)a1);
  long long v10 = *(_OWORD *)&a3->var0.var3;
  v13[0] = *(_OWORD *)&a3->var0.var0;
  v13[1] = v10;
  v13[2] = *(_OWORD *)&a3->var1.var1;
  v11 = (void *)[v9 initWithTimeRange:v13 score:v8 attributes:a4];

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  long long v5 = *(_OWORD *)&self->_timeRange.start.epoch;
  v6[0] = *(_OWORD *)&self->_timeRange.start.value;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&self->_timeRange.duration.timescale;
  [v4 encodeCMTimeRange:v6 forKey:@"TimeRange"];
  [v4 encodeDouble:@"Score" forKey:self->_score];
  [v4 encodeObject:self->_attributes forKey:@"Attributes"];
}

- (MADMovieHighlightEntry)initWithCoder:(id)a3
{
  v17[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MADMovieHighlightEntry;
  long long v5 = [(MADMovieHighlightEntry *)&v16 init];
  if (v5)
  {
    if (v4)
    {
      [v4 decodeCMTimeRangeForKey:@"TimeRange"];
    }
    else
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v13 = 0u;
    }
    *(_OWORD *)(v5 + 24) = v13;
    *(_OWORD *)(v5 + 40) = v14;
    *(_OWORD *)(v5 + 56) = v15;
    objc_msgSend(v4, "decodeDoubleForKey:", @"Score", v13, v14, v15);
    *((void *)v5 + 1) = v6;
    v7 = (void *)MEMORY[0x1E4F1CAD0];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v17[2] = objc_opt_class();
    v17[3] = objc_opt_class();
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:4];
    id v9 = [v7 setWithArray:v8];

    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"Attributes"];
    v11 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v10;
  }
  return (MADMovieHighlightEntry *)v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  long long v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  CMTime time = (CMTime)self->_timeRange.start;
  Float64 Seconds = CMTimeGetSeconds(&time);
  long long v7 = *(_OWORD *)&self->_timeRange.start.epoch;
  *(_OWORD *)&range.start.value = *(_OWORD *)&self->_timeRange.start.value;
  *(_OWORD *)&range.start.epoch = v7;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&self->_timeRange.duration.timescale;
  CMTimeRangeGetEnd(&v10, &range);
  [v3 appendFormat:@"%@: %-.4fs-%-.4fs, ", @"TimeRange", *(void *)&Seconds, CMTimeGetSeconds(&v10)];
  [v3 appendFormat:@"%@: %@, ", @"Attributes", self->_attributes];
  [v3 appendFormat:@"%@: %.2f>", @"Score", *(void *)&self->_score];
  return v3;
}

- ($1C75447F214D9465CD650DD956230C7F)timeRange
{
  long long v3 = *(_OWORD *)&self->var1.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var1.var0;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var0.var1;
  return self;
}

- (double)score
{
  return self->_score;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (void).cxx_destruct
{
}

@end