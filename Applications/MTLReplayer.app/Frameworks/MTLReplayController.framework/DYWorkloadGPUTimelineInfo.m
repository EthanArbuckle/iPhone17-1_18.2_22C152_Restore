@interface DYWorkloadGPUTimelineInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)consistentStateAchieved;
- (BOOL)isMio;
- (DYGPUDerivedEncoderCounterInfo)derivedEncoderCounterInfo;
- (DYGPUTimelineInfo)aggregatedGPUTimelineInfo;
- (DYWorkloadGPUTimelineInfo)init;
- (DYWorkloadGPUTimelineInfo)initWithCoder:(id)a3;
- (NSArray)coreCounts;
- (NSArray)perRingSampledDerivedCounters;
- (NSArray)restoreTimestamps;
- (NSDictionary)coalescedEncoderInfo;
- (NSMutableArray)counterGroups;
- (NSMutableArray)mGPUTimelineInfos;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createCounterGroup;
- (id)mGPUTimelineInfoAtIndex:(unint64_t)a3;
- (unint64_t)metalFXCallDuration:(unint64_t)a3;
- (unsigned)profiledState;
- (unsigned)timeBaseDenominator;
- (unsigned)timeBaseNumerator;
- (unsigned)version;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateEncoderDerivedData:(id)a3;
- (void)enumerateEncoderDerivedDataAtIndex:(unsigned int)a3 withBlock:(id)a4;
- (void)setAggregatedGPUTimelineInfo:(id)a3;
- (void)setCoalescedEncoderInfo:(id)a3;
- (void)setConsistentStateAchieved:(BOOL)a3;
- (void)setCoreCounts:(id)a3;
- (void)setCounterGroups:(id)a3;
- (void)setDerivedEncoderCounterInfo:(id)a3;
- (void)setMGPUTimelineInfos:(id)a3;
- (void)setPerRingSampledDerivedCounters:(id)a3;
- (void)setProfiledState:(unsigned int)a3;
- (void)setRestoreTimestamps:(id)a3;
- (void)setTimeBaseDenominator:(unsigned int)a3;
- (void)setTimeBaseNumerator:(unsigned int)a3;
- (void)setVersion:(unsigned int)a3;
@end

@implementation DYWorkloadGPUTimelineInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_counterGroups, 0);
  objc_storeStrong((id *)&self->_coalescedEncoderInfo, 0);
  objc_storeStrong((id *)&self->_restoreTimestamps, 0);
  objc_storeStrong((id *)&self->_derivedEncoderCounterInfo, 0);
  objc_storeStrong((id *)&self->_coreCounts, 0);
  objc_storeStrong((id *)&self->_perRingSampledDerivedCounters, 0);
  objc_storeStrong((id *)&self->_aggregatedGPUTimelineInfo, 0);

  objc_storeStrong((id *)&self->_mGPUTimelineInfos, 0);
}

- (void)setCounterGroups:(id)a3
{
}

- (NSMutableArray)counterGroups
{
  return self->_counterGroups;
}

- (void)setCoalescedEncoderInfo:(id)a3
{
}

- (NSDictionary)coalescedEncoderInfo
{
  return self->_coalescedEncoderInfo;
}

- (void)setRestoreTimestamps:(id)a3
{
}

- (NSArray)restoreTimestamps
{
  return self->_restoreTimestamps;
}

- (void)setConsistentStateAchieved:(BOOL)a3
{
  self->_consistentStateAchieved = a3;
}

- (BOOL)consistentStateAchieved
{
  return self->_consistentStateAchieved;
}

- (void)setProfiledState:(unsigned int)a3
{
  self->_profiledState = a3;
}

- (unsigned)profiledState
{
  return self->_profiledState;
}

- (void)setDerivedEncoderCounterInfo:(id)a3
{
}

- (DYGPUDerivedEncoderCounterInfo)derivedEncoderCounterInfo
{
  return self->_derivedEncoderCounterInfo;
}

- (void)setCoreCounts:(id)a3
{
}

- (NSArray)coreCounts
{
  return self->_coreCounts;
}

- (void)setPerRingSampledDerivedCounters:(id)a3
{
}

- (NSArray)perRingSampledDerivedCounters
{
  return self->_perRingSampledDerivedCounters;
}

- (void)setAggregatedGPUTimelineInfo:(id)a3
{
}

- (DYGPUTimelineInfo)aggregatedGPUTimelineInfo
{
  return self->_aggregatedGPUTimelineInfo;
}

- (void)setMGPUTimelineInfos:(id)a3
{
}

- (NSMutableArray)mGPUTimelineInfos
{
  return self->_mGPUTimelineInfos;
}

- (void)setTimeBaseDenominator:(unsigned int)a3
{
  self->_timeBaseDenominator = a3;
}

- (unsigned)timeBaseDenominator
{
  return self->_timeBaseDenominator;
}

- (void)setTimeBaseNumerator:(unsigned int)a3
{
  self->_timeBaseNumerator = a3;
}

- (unsigned)timeBaseNumerator
{
  return self->_timeBaseNumerator;
}

- (void)setVersion:(unsigned int)a3
{
  self->_version = a3;
}

- (unsigned)version
{
  return self->_version;
}

- (BOOL)isMio
{
  return 0;
}

- (unint64_t)metalFXCallDuration:(unint64_t)a3
{
  v5 = [(DYGPUTimelineInfo *)self->_aggregatedGPUTimelineInfo metalFXTimelineInfo];

  if (!v5) {
    return 0;
  }
  id v6 = [(DYGPUTimelineInfo *)self->_aggregatedGPUTimelineInfo metalFXTimelineInfo];
  v7 = (uint64_t *)[v6 bytes];

  v8 = [(DYGPUTimelineInfo *)self->_aggregatedGPUTimelineInfo metalFXTimelineInfo];
  unint64_t v9 = (unint64_t)[v8 length];

  if (v9 < 0x10) {
    return 0;
  }
  uint64_t v10 = 0;
  v11 = v7;
  while (1)
  {
    uint64_t v12 = *v11;
    v11 += 2;
    if (v12 == a3) {
      break;
    }
    if (v9 >> 4 == ++v10) {
      return 0;
    }
  }
  return (unint64_t)*(double *)&v7[2 * v10 + 1];
}

- (void)enumerateEncoderDerivedDataAtIndex:(unsigned int)a3 withBlock:(id)a4
{
}

- (void)enumerateEncoderDerivedData:(id)a3
{
}

- (id)createCounterGroup
{
  v3 = objc_opt_new();
  [(NSMutableArray *)self->_counterGroups addObject:v3];

  return v3;
}

- (id)mGPUTimelineInfoAtIndex:(unint64_t)a3
{
  while ((unint64_t)[(NSMutableArray *)self->_mGPUTimelineInfos count] <= a3)
  {
    mGPUTimelineInfos = self->_mGPUTimelineInfos;
    id v6 = objc_opt_new();
    [(NSMutableArray *)mGPUTimelineInfos addObject:v6];
  }
  v7 = self->_mGPUTimelineInfos;

  return [(NSMutableArray *)v7 objectAtIndexedSubscript:a3];
}

- (DYWorkloadGPUTimelineInfo)init
{
  v12.receiver = self;
  v12.super_class = (Class)DYWorkloadGPUTimelineInfo;
  v2 = [(DYWorkloadGPUTimelineInfo *)&v12 init];
  v3 = v2;
  if (v2)
  {
    v2->_version = 8;
    uint64_t v4 = +[NSMutableArray arrayWithCapacity:16];
    mGPUTimelineInfos = v3->_mGPUTimelineInfos;
    v3->_mGPUTimelineInfos = (NSMutableArray *)v4;

    uint64_t v6 = +[NSMutableArray arrayWithCapacity:2];
    counterGroups = v3->_counterGroups;
    v3->_counterGroups = (NSMutableArray *)v6;

    uint64_t v8 = objc_opt_new();
    aggregatedGPUTimelineInfo = v3->_aggregatedGPUTimelineInfo;
    v3->_aggregatedGPUTimelineInfo = (DYGPUTimelineInfo *)v8;

    uint64_t v10 = v3;
  }

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  self->_version = 8;
  id v5 = v4;
  [v4 encodeInt:8 forKey:@"version"];
  [v5 encodeInt:self->_timeBaseNumerator forKey:@"timeBaseNumerator"];
  [v5 encodeInt:self->_timeBaseDenominator forKey:@"timeBaseDenominator"];
  [v5 encodeObject:self->_mGPUTimelineInfos forKey:@"mGPUTimelineInfos"];
  [v5 encodeObject:self->_aggregatedGPUTimelineInfo forKey:@"aggregatedGPUTimelineInfo"];
  [v5 encodeObject:self->_perRingSampledDerivedCounters forKey:@"perRingSampledDerivedCounters"];
  [v5 encodeObject:self->_coreCounts forKey:@"coreCounts"];
  [v5 encodeObject:self->_derivedEncoderCounterInfo forKey:@"derivedEncoderCounterInfo"];
  [v5 encodeInt:self->_profiledState forKey:@"profiledState"];
  [v5 encodeBool:self->_consistentStateAchieved forKey:@"consistentStateAchieved"];
  [v5 encodeObject:self->_restoreTimestamps forKey:@"restoreTimestamps"];
  [v5 encodeObject:self->_coalescedEncoderInfo forKey:@"coalescedEncoderInfo"];
  [v5 encodeObject:self->_counterGroups forKey:@"counterGroups"];
}

- (DYWorkloadGPUTimelineInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)DYWorkloadGPUTimelineInfo;
  id v5 = [(DYWorkloadGPUTimelineInfo *)&v48 init];
  if (v5)
  {
    v5->_version = [v4 decodeIntForKey:@"version"];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"mGPUTimelineInfos"];
    mGPUTimelineInfos = v5->_mGPUTimelineInfos;
    v5->_mGPUTimelineInfos = (NSMutableArray *)v9;

    v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"aggregatedGPUTimelineInfo"];
    aggregatedGPUTimelineInfo = v5->_aggregatedGPUTimelineInfo;
    v5->_aggregatedGPUTimelineInfo = (DYGPUTimelineInfo *)v12;

    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    v17 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v14, v15, v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"perRingSampledDerivedCounters"];
    perRingSampledDerivedCounters = v5->_perRingSampledDerivedCounters;
    v5->_perRingSampledDerivedCounters = (NSArray *)v18;

    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    v22 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v20, v21, objc_opt_class(), 0);
    uint64_t v23 = [v4 decodeObjectOfClasses:v22 forKey:@"coreCounts"];
    coreCounts = v5->_coreCounts;
    v5->_coreCounts = (NSArray *)v23;

    if (v5->_version < 2)
    {
      *(void *)&v5->_timeBaseNumerator = 0x30000007DLL;
    }
    else
    {
      v5->_timeBaseNumerator = [v4 decodeIntForKey:@"timeBaseNumerator"];
      v5->_timeBaseDenominator = [v4 decodeIntForKey:@"timeBaseDenominator"];
      v25 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
      uint64_t v26 = [v4 decodeObjectOfClasses:v25 forKey:@"derivedEncoderCounterInfo"];
      derivedEncoderCounterInfo = v5->_derivedEncoderCounterInfo;
      v5->_derivedEncoderCounterInfo = (DYGPUDerivedEncoderCounterInfo *)v26;

      if (v5->_version >= 3)
      {
        v5->_profiledState = [v4 decodeIntForKey:@"profiledState"];
        v5->_consistentStateAchieved = [v4 decodeBoolForKey:@"consistentStateAchieved"];
        if (v5->_version >= 4)
        {
          uint64_t v28 = objc_opt_class();
          uint64_t v29 = objc_opt_class();
          v30 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v28, v29, objc_opt_class(), 0);
          uint64_t v31 = [v4 decodeObjectOfClasses:v30 forKey:@"restoreTimestamps"];
          restoreTimestamps = v5->_restoreTimestamps;
          v5->_restoreTimestamps = (NSArray *)v31;

          if (v5->_version >= 6)
          {
            uint64_t v33 = objc_opt_class();
            uint64_t v34 = objc_opt_class();
            uint64_t v35 = objc_opt_class();
            uint64_t v36 = objc_opt_class();
            v37 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v33, v34, v35, v36, objc_opt_class(), 0);
            uint64_t v38 = [v4 decodeObjectOfClasses:v37 forKey:@"coalescedEncoderInfo"];
            coalescedEncoderInfo = v5->_coalescedEncoderInfo;
            v5->_coalescedEncoderInfo = (NSDictionary *)v38;

            if (v5->_version >= 7)
            {
              uint64_t v40 = objc_opt_class();
              uint64_t v41 = objc_opt_class();
              uint64_t v42 = objc_opt_class();
              v43 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v40, v41, v42, objc_opt_class(), 0);
              uint64_t v44 = [v4 decodeObjectOfClasses:v43 forKey:@"counterGroups"];
              counterGroups = v5->_counterGroups;
              v5->_counterGroups = (NSMutableArray *)v44;
            }
          }
        }
      }
    }
    v46 = v5;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[objc_opt_class() allocWithZone:a3] init];
  id v5 = [(DYWorkloadGPUTimelineInfo *)self mGPUTimelineInfos];
  id v6 = [v5 copy];
  [v4 setMGPUTimelineInfos:v6];

  uint64_t v7 = [(DYWorkloadGPUTimelineInfo *)self aggregatedGPUTimelineInfo];
  id v8 = [v7 copy];
  [v4 setAggregatedGPUTimelineInfo:v8];

  uint64_t v9 = [(DYWorkloadGPUTimelineInfo *)self perRingSampledDerivedCounters];
  id v10 = [v9 copy];
  [v4 setPerRingSampledDerivedCounters:v10];

  v11 = [(DYWorkloadGPUTimelineInfo *)self coreCounts];
  id v12 = [v11 copy];
  [v4 setCoreCounts:v12];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end