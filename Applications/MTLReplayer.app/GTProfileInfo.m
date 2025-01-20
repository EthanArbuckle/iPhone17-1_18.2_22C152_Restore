@interface GTProfileInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)analyzeBinaries;
- (BOOL)pause;
- (BOOL)resume;
- (BOOL)useOverlap;
- (GTProfileInfo)initWithCoder:(id)a3;
- (NSArray)activePerEncoderDrawCallCount;
- (NSArray)batchFilteredDerivedCounters;
- (NSArray)blitEncoderIndices;
- (NSArray)counters;
- (NSArray)encoderBatchPriorityList;
- (NSArray)highPriorityBatches;
- (NSArray)perCommandBufferEncoderCount;
- (NSArray)perEncoderKickCount;
- (NSArray)perFrameCommandBufferCount;
- (NSArray)profileCounters;
- (NSArray)splitEncoderCommandCount;
- (NSArray)splitPerEncoderKickCount;
- (NSDictionary)counterConfig;
- (NSDictionary)derivedCounterData;
- (NSDictionary)derivedCounterInfo;
- (NSDictionary)highPriorityBatchInfo;
- (NSDictionary)perEncoderDrawCallCount;
- (NSDictionary)perEncoderIndexDrawCallCount;
- (NSDictionary)profilingConfig;
- (NSDictionary)timelineConfig;
- (NSDictionary)withoutBlitEncoderToDrawCallCountDict;
- (NSString)gpuTarget;
- (NSString)metalPluginName;
- (id)initFromProfileInfo:(id)a3;
- (id)toDictionary;
- (unsigned)gpuState;
- (unsigned)totalDrawCallCount;
- (unsigned)xpState;
- (void)encodeWithCoder:(id)a3;
- (void)setActivePerEncoderDrawCallCount:(id)a3;
- (void)setAnalyzeBinaries:(BOOL)a3;
- (void)setBatchFilteredDerivedCounters:(id)a3;
- (void)setBlitEncoderIndices:(id)a3;
- (void)setCounterConfig:(id)a3;
- (void)setCounters:(id)a3;
- (void)setDerivedCounterData:(id)a3;
- (void)setDerivedCounterInfo:(id)a3;
- (void)setEncoderBatchPriorityList:(id)a3;
- (void)setGpuState:(unsigned int)a3;
- (void)setGpuTarget:(id)a3;
- (void)setHighPriorityBatchInfo:(id)a3;
- (void)setHighPriorityBatches:(id)a3;
- (void)setMetalPluginName:(id)a3;
- (void)setPause:(BOOL)a3;
- (void)setPerCommandBufferEncoderCount:(id)a3;
- (void)setPerEncoderDrawCallCount:(id)a3;
- (void)setPerEncoderIndexDrawCallCount:(id)a3;
- (void)setPerEncoderKickCount:(id)a3;
- (void)setPerFrameCommandBufferCount:(id)a3;
- (void)setProfileCounters:(id)a3;
- (void)setProfilingConfig:(id)a3;
- (void)setResume:(BOOL)a3;
- (void)setSplitEncoderCommandCount:(id)a3;
- (void)setSplitPerEncoderKickCount:(id)a3;
- (void)setTimelineConfig:(id)a3;
- (void)setTotalDrawCallCount:(unsigned int)a3;
- (void)setUseOverlap:(BOOL)a3;
- (void)setWithoutBlitEncoderToDrawCallCountDict:(id)a3;
- (void)setXpState:(unsigned int)a3;
@end

@implementation GTProfileInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perCommandBufferEncoderCount, 0);
  objc_storeStrong((id *)&self->_perEncoderKickCount, 0);
  objc_storeStrong((id *)&self->_perFrameCommandBufferCount, 0);
  objc_storeStrong((id *)&self->_splitPerEncoderKickCount, 0);
  objc_storeStrong((id *)&self->_splitEncoderCommandCount, 0);
  objc_storeStrong((id *)&self->_derivedCounterInfo, 0);
  objc_storeStrong((id *)&self->_timelineConfig, 0);
  objc_storeStrong((id *)&self->_counterConfig, 0);
  objc_storeStrong((id *)&self->_profilingConfig, 0);
  objc_storeStrong((id *)&self->_activePerEncoderDrawCallCount, 0);
  objc_storeStrong((id *)&self->_blitEncoderIndices, 0);
  objc_storeStrong((id *)&self->_withoutBlitEncoderToDrawCallCountDict, 0);
  objc_storeStrong((id *)&self->_perEncoderIndexDrawCallCount, 0);
  objc_storeStrong((id *)&self->_perEncoderDrawCallCount, 0);
  objc_storeStrong((id *)&self->_batchFilteredDerivedCounters, 0);
  objc_storeStrong((id *)&self->_highPriorityBatchInfo, 0);
  objc_storeStrong((id *)&self->_highPriorityBatches, 0);
  objc_storeStrong((id *)&self->_encoderBatchPriorityList, 0);
  objc_storeStrong((id *)&self->_gpuTarget, 0);
  objc_storeStrong((id *)&self->_metalPluginName, 0);
  objc_storeStrong((id *)&self->_derivedCounterData, 0);
  objc_storeStrong((id *)&self->_profileCounters, 0);

  objc_storeStrong((id *)&self->_counters, 0);
}

- (void)setUseOverlap:(BOOL)a3
{
  self->_useOverlap = a3;
}

- (BOOL)useOverlap
{
  return self->_useOverlap;
}

- (void)setPerCommandBufferEncoderCount:(id)a3
{
}

- (NSArray)perCommandBufferEncoderCount
{
  return self->_perCommandBufferEncoderCount;
}

- (void)setTotalDrawCallCount:(unsigned int)a3
{
  self->_totalDrawCallCount = a3;
}

- (unsigned)totalDrawCallCount
{
  return self->_totalDrawCallCount;
}

- (void)setPerEncoderKickCount:(id)a3
{
}

- (NSArray)perEncoderKickCount
{
  return self->_perEncoderKickCount;
}

- (void)setPerFrameCommandBufferCount:(id)a3
{
}

- (NSArray)perFrameCommandBufferCount
{
  return self->_perFrameCommandBufferCount;
}

- (void)setSplitPerEncoderKickCount:(id)a3
{
}

- (NSArray)splitPerEncoderKickCount
{
  return self->_splitPerEncoderKickCount;
}

- (void)setSplitEncoderCommandCount:(id)a3
{
}

- (NSArray)splitEncoderCommandCount
{
  return self->_splitEncoderCommandCount;
}

- (void)setDerivedCounterInfo:(id)a3
{
}

- (NSDictionary)derivedCounterInfo
{
  return self->_derivedCounterInfo;
}

- (void)setTimelineConfig:(id)a3
{
}

- (NSDictionary)timelineConfig
{
  return self->_timelineConfig;
}

- (void)setCounterConfig:(id)a3
{
}

- (NSDictionary)counterConfig
{
  return self->_counterConfig;
}

- (void)setProfilingConfig:(id)a3
{
}

- (NSDictionary)profilingConfig
{
  return self->_profilingConfig;
}

- (void)setActivePerEncoderDrawCallCount:(id)a3
{
}

- (NSArray)activePerEncoderDrawCallCount
{
  return self->_activePerEncoderDrawCallCount;
}

- (void)setBlitEncoderIndices:(id)a3
{
}

- (NSArray)blitEncoderIndices
{
  return self->_blitEncoderIndices;
}

- (void)setWithoutBlitEncoderToDrawCallCountDict:(id)a3
{
}

- (NSDictionary)withoutBlitEncoderToDrawCallCountDict
{
  return self->_withoutBlitEncoderToDrawCallCountDict;
}

- (void)setPerEncoderIndexDrawCallCount:(id)a3
{
}

- (NSDictionary)perEncoderIndexDrawCallCount
{
  return self->_perEncoderIndexDrawCallCount;
}

- (void)setPerEncoderDrawCallCount:(id)a3
{
}

- (NSDictionary)perEncoderDrawCallCount
{
  return self->_perEncoderDrawCallCount;
}

- (void)setAnalyzeBinaries:(BOOL)a3
{
  self->_analyzeBinaries = a3;
}

- (BOOL)analyzeBinaries
{
  return self->_analyzeBinaries;
}

- (void)setXpState:(unsigned int)a3
{
  self->_xpState = a3;
}

- (unsigned)xpState
{
  return self->_xpState;
}

- (void)setResume:(BOOL)a3
{
  self->_resume = a3;
}

- (BOOL)resume
{
  return self->_resume;
}

- (void)setPause:(BOOL)a3
{
  self->_pause = a3;
}

- (BOOL)pause
{
  return self->_pause;
}

- (void)setBatchFilteredDerivedCounters:(id)a3
{
}

- (NSArray)batchFilteredDerivedCounters
{
  return self->_batchFilteredDerivedCounters;
}

- (void)setHighPriorityBatchInfo:(id)a3
{
}

- (NSDictionary)highPriorityBatchInfo
{
  return self->_highPriorityBatchInfo;
}

- (void)setHighPriorityBatches:(id)a3
{
}

- (NSArray)highPriorityBatches
{
  return self->_highPriorityBatches;
}

- (void)setEncoderBatchPriorityList:(id)a3
{
}

- (NSArray)encoderBatchPriorityList
{
  return self->_encoderBatchPriorityList;
}

- (void)setGpuTarget:(id)a3
{
}

- (NSString)gpuTarget
{
  return self->_gpuTarget;
}

- (void)setMetalPluginName:(id)a3
{
}

- (NSString)metalPluginName
{
  return self->_metalPluginName;
}

- (void)setDerivedCounterData:(id)a3
{
}

- (NSDictionary)derivedCounterData
{
  return self->_derivedCounterData;
}

- (void)setProfileCounters:(id)a3
{
}

- (NSArray)profileCounters
{
  return self->_profileCounters;
}

- (void)setCounters:(id)a3
{
}

- (NSArray)counters
{
  return self->_counters;
}

- (void)setGpuState:(unsigned int)a3
{
  self->_gpuState = a3;
}

- (unsigned)gpuState
{
  return self->_gpuState;
}

- (id)toDictionary
{
  v3 = objc_opt_new();
  if (self->_gpuState)
  {
    v4 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:");
    [v3 setObject:v4 forKeyedSubscript:@"gpuState"];
  }
  counters = self->_counters;
  if (counters) {
    [v3 setObject:counters forKeyedSubscript:@"counters"];
  }
  profileCounters = self->_profileCounters;
  if (profileCounters) {
    [v3 setObject:profileCounters forKeyedSubscript:@"profileCounters"];
  }
  derivedCounterData = self->_derivedCounterData;
  if (derivedCounterData) {
    [v3 setObject:derivedCounterData forKeyedSubscript:@"derivedCounterData"];
  }
  metalPluginName = self->_metalPluginName;
  if (metalPluginName) {
    [v3 setObject:metalPluginName forKeyedSubscript:@"metalPluginName"];
  }
  gpuTarget = self->_gpuTarget;
  if (gpuTarget) {
    [v3 setObject:gpuTarget forKeyedSubscript:@"gpuTarget"];
  }
  encoderBatchPriorityList = self->_encoderBatchPriorityList;
  if (encoderBatchPriorityList) {
    [v3 setObject:encoderBatchPriorityList forKeyedSubscript:@"encoderBatchPriorityList"];
  }
  highPriorityBatches = self->_highPriorityBatches;
  if (highPriorityBatches) {
    [v3 setObject:highPriorityBatches forKeyedSubscript:@"highPriorityBatches"];
  }
  highPriorityBatchInfo = self->_highPriorityBatchInfo;
  if (highPriorityBatchInfo) {
    [v3 setObject:highPriorityBatchInfo forKeyedSubscript:@"HighPriorityBatchInfo"];
  }
  batchFilteredDerivedCounters = self->_batchFilteredDerivedCounters;
  if (batchFilteredDerivedCounters) {
    [v3 setObject:batchFilteredDerivedCounters forKeyedSubscript:@"batchFilteredDerivedCounters"];
  }
  if (self->_pause)
  {
    v14 = +[NSNumber numberWithBool:1];
    [v3 setObject:v14 forKeyedSubscript:@"pause"];
  }
  if (self->_resume)
  {
    v15 = +[NSNumber numberWithBool:1];
    [v3 setObject:v15 forKeyedSubscript:@"resume"];
  }
  if (self->_xpState)
  {
    v16 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:");
    [v3 setObject:v16 forKeyedSubscript:@"XPState"];
  }
  if (self->_analyzeBinaries)
  {
    v17 = +[NSNumber numberWithBool:1];
    [v3 setObject:v17 forKeyedSubscript:@"AnalyzeBinaries"];
  }
  perEncoderDrawCallCount = self->_perEncoderDrawCallCount;
  if (perEncoderDrawCallCount) {
    [v3 setObject:perEncoderDrawCallCount forKeyedSubscript:@"perEncoderDrawCallCount"];
  }
  perEncoderIndexDrawCallCount = self->_perEncoderIndexDrawCallCount;
  if (perEncoderIndexDrawCallCount) {
    [v3 setObject:perEncoderIndexDrawCallCount forKeyedSubscript:@"perEncoderIndexDrawCallCount"];
  }
  withoutBlitEncoderToDrawCallCountDict = self->_withoutBlitEncoderToDrawCallCountDict;
  if (withoutBlitEncoderToDrawCallCountDict) {
    [v3 setObject:withoutBlitEncoderToDrawCallCountDict forKeyedSubscript:@"withoutBlitEncoderToDrawCallCountDict"];
  }
  blitEncoderIndices = self->_blitEncoderIndices;
  if (blitEncoderIndices) {
    [v3 setObject:blitEncoderIndices forKeyedSubscript:@"blitEncoderIndices"];
  }
  activePerEncoderDrawCallCount = self->_activePerEncoderDrawCallCount;
  if (activePerEncoderDrawCallCount) {
    [v3 setObject:activePerEncoderDrawCallCount forKeyedSubscript:@"activePerEncoderDrawCallCount"];
  }
  splitEncoderCommandCount = self->_splitEncoderCommandCount;
  if (splitEncoderCommandCount) {
    [v3 setObject:splitEncoderCommandCount forKeyedSubscript:@"splitEncoderCommandCount"];
  }
  splitPerEncoderKickCount = self->_splitPerEncoderKickCount;
  if (splitPerEncoderKickCount) {
    [v3 setObject:splitPerEncoderKickCount forKeyedSubscript:@"splitPerEncoderKickCount"];
  }
  perFrameCommandBufferCount = self->_perFrameCommandBufferCount;
  if (perFrameCommandBufferCount) {
    [v3 setObject:perFrameCommandBufferCount forKeyedSubscript:@"perFrameCommandBufferCount"];
  }
  perEncoderKickCount = self->_perEncoderKickCount;
  if (perEncoderKickCount) {
    [v3 setObject:perEncoderKickCount forKeyedSubscript:@"perEncoderKickCount"];
  }
  if (self->_totalDrawCallCount)
  {
    v27 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:");
    [v3 setObject:v27 forKeyedSubscript:@"totalDrawCallCount"];
  }
  perCommandBufferEncoderCount = self->_perCommandBufferEncoderCount;
  if (perCommandBufferEncoderCount) {
    [v3 setObject:perCommandBufferEncoderCount forKeyedSubscript:@"perCommandBufferEncoderCount"];
  }
  profilingConfig = self->_profilingConfig;
  if (profilingConfig) {
    [v3 setObject:profilingConfig forKeyedSubscript:@"profilingConfig"];
  }
  counterConfig = self->_counterConfig;
  if (counterConfig) {
    [v3 setObject:counterConfig forKeyedSubscript:@"counterConfig"];
  }
  timelineConfig = self->_timelineConfig;
  if (timelineConfig) {
    [v3 setObject:timelineConfig forKeyedSubscript:@"timelineConfig"];
  }
  derivedCounterInfo = self->_derivedCounterInfo;
  if (derivedCounterInfo) {
    [v3 setObject:derivedCounterInfo forKeyedSubscript:@"derivedCounterInfo"];
  }
  if (self->_useOverlap)
  {
    v33 = +[NSNumber numberWithBool:1];
    [v3 setObject:v33 forKeyedSubscript:@"useOverlap"];
  }

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v30 = a3;
  [v30 encodeInt32:self->_version forKey:@"version"];
  [v30 encodeInt32:self->_gpuState forKey:@"state"];
  counters = self->_counters;
  if (counters) {
    [v30 encodeObject:counters forKey:@"counters"];
  }
  profileCounters = self->_profileCounters;
  if (profileCounters) {
    [v30 encodeObject:profileCounters forKey:@"profileCounters"];
  }
  derivedCounterData = self->_derivedCounterData;
  v7 = v30;
  if (derivedCounterData)
  {
    [v30 encodeObject:derivedCounterData forKey:@"derivedCounterData"];
    v7 = v30;
  }
  metalPluginName = self->_metalPluginName;
  if (metalPluginName)
  {
    [v30 encodeObject:metalPluginName forKey:@"metalPluginName"];
    v7 = v30;
  }
  gpuTarget = self->_gpuTarget;
  if (gpuTarget)
  {
    [v30 encodeObject:gpuTarget forKey:@"gpuTarget"];
    v7 = v30;
  }
  encoderBatchPriorityList = self->_encoderBatchPriorityList;
  if (encoderBatchPriorityList)
  {
    [v30 encodeObject:encoderBatchPriorityList forKey:@"encoderBatchPriorityList"];
    v7 = v30;
  }
  highPriorityBatches = self->_highPriorityBatches;
  if (highPriorityBatches)
  {
    [v30 encodeObject:highPriorityBatches forKey:@"highPriorityBatches"];
    v7 = v30;
  }
  highPriorityBatchInfo = self->_highPriorityBatchInfo;
  if (highPriorityBatchInfo)
  {
    [v30 encodeObject:highPriorityBatchInfo forKey:@"HighPriorityBatchInfo"];
    v7 = v30;
  }
  batchFilteredDerivedCounters = self->_batchFilteredDerivedCounters;
  if (batchFilteredDerivedCounters)
  {
    [v30 encodeObject:batchFilteredDerivedCounters forKey:@"batchFilteredDerivedCounters"];
    v7 = v30;
  }
  if (self->_pause)
  {
    [v30 encodeBool:1 forKey:@"pause"];
    v7 = v30;
  }
  if (self->_resume)
  {
    [v30 encodeBool:1 forKey:@"resume"];
    v7 = v30;
  }
  uint64_t xpState = self->_xpState;
  if (xpState)
  {
    [v30 encodeInt32:xpState forKey:@"XPState"];
    v7 = v30;
  }
  if (self->_analyzeBinaries)
  {
    [v30 encodeBool:1 forKey:@"AnalyzeBinaries"];
    v7 = v30;
  }
  perEncoderDrawCallCount = self->_perEncoderDrawCallCount;
  if (perEncoderDrawCallCount)
  {
    [v30 encodeObject:perEncoderDrawCallCount forKey:@"perEncoderDrawCallCount"];
    v7 = v30;
  }
  perEncoderIndexDrawCallCount = self->_perEncoderIndexDrawCallCount;
  if (perEncoderIndexDrawCallCount)
  {
    [v30 encodeObject:perEncoderIndexDrawCallCount forKey:@"perEncoderIndexDrawCallCount"];
    v7 = v30;
  }
  withoutBlitEncoderToDrawCallCountDict = self->_withoutBlitEncoderToDrawCallCountDict;
  if (withoutBlitEncoderToDrawCallCountDict)
  {
    [v30 encodeObject:withoutBlitEncoderToDrawCallCountDict forKey:@"withoutBlitEncoderToDrawCallCountDict"];
    v7 = v30;
  }
  blitEncoderIndices = self->_blitEncoderIndices;
  if (blitEncoderIndices)
  {
    [v30 encodeObject:blitEncoderIndices forKey:@"blitEncoderIndices"];
    v7 = v30;
  }
  activePerEncoderDrawCallCount = self->_activePerEncoderDrawCallCount;
  if (activePerEncoderDrawCallCount)
  {
    [v30 encodeObject:activePerEncoderDrawCallCount forKey:@"activePerEncoderDrawCallCount"];
    v7 = v30;
  }
  splitEncoderCommandCount = self->_splitEncoderCommandCount;
  if (splitEncoderCommandCount)
  {
    [v30 encodeObject:splitEncoderCommandCount forKey:@"splitEncoderCommandCount"];
    v7 = v30;
  }
  splitPerEncoderKickCount = self->_splitPerEncoderKickCount;
  if (splitPerEncoderKickCount)
  {
    [v30 encodeObject:splitPerEncoderKickCount forKey:@"splitPerEncoderKickCount"];
    v7 = v30;
  }
  perFrameCommandBufferCount = self->_perFrameCommandBufferCount;
  if (perFrameCommandBufferCount)
  {
    [v30 encodeObject:perFrameCommandBufferCount forKey:@"perFrameCommandBufferCount"];
    v7 = v30;
  }
  perEncoderKickCount = self->_perEncoderKickCount;
  if (perEncoderKickCount)
  {
    [v30 encodeObject:perEncoderKickCount forKey:@"perEncoderKickCount"];
    v7 = v30;
  }
  uint64_t totalDrawCallCount = self->_totalDrawCallCount;
  if (totalDrawCallCount)
  {
    [v30 encodeInt32:totalDrawCallCount forKey:@"totalDrawCallCount"];
    v7 = v30;
  }
  perCommandBufferEncoderCount = self->_perCommandBufferEncoderCount;
  if (perCommandBufferEncoderCount)
  {
    [v30 encodeObject:perCommandBufferEncoderCount forKey:@"perCommandBufferEncoderCount"];
    v7 = v30;
  }
  profilingConfig = self->_profilingConfig;
  if (profilingConfig)
  {
    [v30 encodeObject:profilingConfig forKey:@"profilingConfig"];
    v7 = v30;
  }
  counterConfig = self->_counterConfig;
  if (counterConfig)
  {
    [v30 encodeObject:counterConfig forKey:@"counterConfig"];
    v7 = v30;
  }
  timelineConfig = self->_timelineConfig;
  if (timelineConfig)
  {
    [v30 encodeObject:timelineConfig forKey:@"timelineConfig"];
    v7 = v30;
  }
  derivedCounterInfo = self->_derivedCounterInfo;
  if (derivedCounterInfo)
  {
    [v30 encodeObject:derivedCounterInfo forKey:@"derivedCounterInfo"];
    v7 = v30;
  }
  if (self->_useOverlap)
  {
    [v30 encodeBool:1 forKey:@"useOverlap"];
    v7 = v30;
  }
}

- (GTProfileInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v56.receiver = self;
  v56.super_class = (Class)GTProfileInfo;
  v5 = [(GTProfileInfo *)&v56 init];
  if (v5)
  {
    v57[0] = objc_opt_class();
    v57[1] = objc_opt_class();
    v57[2] = objc_opt_class();
    v57[3] = objc_opt_class();
    v57[4] = objc_opt_class();
    v57[5] = objc_opt_class();
    v6 = +[NSArray arrayWithObjects:v57 count:6];
    v7 = +[NSSet setWithArray:v6];

    v5->_version = [v4 decodeInt32ForKey:@"version"];
    v5->_gpuState = [v4 decodeInt32ForKey:@"state"];
    uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"counters"];
    counters = v5->_counters;
    v5->_counters = (NSArray *)v8;

    uint64_t v10 = [v4 decodeObjectOfClasses:v7 forKey:@"profileCounters"];
    profileCounters = v5->_profileCounters;
    v5->_profileCounters = (NSArray *)v10;

    uint64_t v12 = [v4 decodeObjectOfClasses:v7 forKey:@"derivedCounterData"];
    derivedCounterData = v5->_derivedCounterData;
    v5->_derivedCounterData = (NSDictionary *)v12;

    uint64_t v14 = [v4 decodeObjectOfClasses:v7 forKey:@"metalPluginName"];
    metalPluginName = v5->_metalPluginName;
    v5->_metalPluginName = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClasses:v7 forKey:@"gpuTarget"];
    gpuTarget = v5->_gpuTarget;
    v5->_gpuTarget = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClasses:v7 forKey:@"encoderBatchPriorityList"];
    encoderBatchPriorityList = v5->_encoderBatchPriorityList;
    v5->_encoderBatchPriorityList = (NSArray *)v18;

    uint64_t v20 = [v4 decodeObjectOfClasses:v7 forKey:@"highPriorityBatches"];
    highPriorityBatches = v5->_highPriorityBatches;
    v5->_highPriorityBatches = (NSArray *)v20;

    uint64_t v22 = [v4 decodeObjectOfClasses:v7 forKey:@"HighPriorityBatchInfo"];
    highPriorityBatchInfo = v5->_highPriorityBatchInfo;
    v5->_highPriorityBatchInfo = (NSDictionary *)v22;

    uint64_t v24 = [v4 decodeObjectOfClasses:v7 forKey:@"batchFilteredDerivedCounters"];
    batchFilteredDerivedCounters = v5->_batchFilteredDerivedCounters;
    v5->_batchFilteredDerivedCounters = (NSArray *)v24;

    v5->_pause = [v4 decodeBoolForKey:@"pause"];
    v5->_resume = [v4 decodeBoolForKey:@"resume"];
    v5->_uint64_t xpState = [v4 decodeInt32ForKey:@"XPState"];
    v5->_analyzeBinaries = [v4 decodeBoolForKey:@"AnalyzeBinaries"];
    uint64_t v26 = [v4 decodeObjectOfClasses:v7 forKey:@"perEncoderDrawCallCount"];
    perEncoderDrawCallCount = v5->_perEncoderDrawCallCount;
    v5->_perEncoderDrawCallCount = (NSDictionary *)v26;

    uint64_t v28 = [v4 decodeObjectOfClasses:v7 forKey:@"perEncoderIndexDrawCallCount"];
    perEncoderIndexDrawCallCount = v5->_perEncoderIndexDrawCallCount;
    v5->_perEncoderIndexDrawCallCount = (NSDictionary *)v28;

    uint64_t v30 = [v4 decodeObjectOfClasses:v7 forKey:@"perEncoderIndexDrawCallCount"];
    v31 = v5->_perEncoderIndexDrawCallCount;
    v5->_perEncoderIndexDrawCallCount = (NSDictionary *)v30;

    uint64_t v32 = [v4 decodeObjectOfClasses:v7 forKey:@"blitEncoderIndices"];
    blitEncoderIndices = v5->_blitEncoderIndices;
    v5->_blitEncoderIndices = (NSArray *)v32;

    uint64_t v34 = [v4 decodeObjectOfClasses:v7 forKey:@"activePerEncoderDrawCallCount"];
    activePerEncoderDrawCallCount = v5->_activePerEncoderDrawCallCount;
    v5->_activePerEncoderDrawCallCount = (NSArray *)v34;

    uint64_t v36 = [v4 decodeObjectOfClasses:v7 forKey:@"splitEncoderCommandCount"];
    splitEncoderCommandCount = v5->_splitEncoderCommandCount;
    v5->_splitEncoderCommandCount = (NSArray *)v36;

    uint64_t v38 = [v4 decodeObjectOfClasses:v7 forKey:@"splitPerEncoderKickCount"];
    splitPerEncoderKickCount = v5->_splitPerEncoderKickCount;
    v5->_splitPerEncoderKickCount = (NSArray *)v38;

    uint64_t v40 = [v4 decodeObjectOfClasses:v7 forKey:@"perFrameCommandBufferCount"];
    perFrameCommandBufferCount = v5->_perFrameCommandBufferCount;
    v5->_perFrameCommandBufferCount = (NSArray *)v40;

    uint64_t v42 = [v4 decodeObjectOfClasses:v7 forKey:@"perEncoderKickCount"];
    perEncoderKickCount = v5->_perEncoderKickCount;
    v5->_perEncoderKickCount = (NSArray *)v42;

    v5->_uint64_t totalDrawCallCount = [v4 decodeInt32ForKey:@"totalDrawCallCount"];
    uint64_t v44 = [v4 decodeObjectOfClasses:v7 forKey:@"perCommandBufferEncoderCount"];
    perCommandBufferEncoderCount = v5->_perCommandBufferEncoderCount;
    v5->_perCommandBufferEncoderCount = (NSArray *)v44;

    uint64_t v46 = [v4 decodeObjectOfClasses:v7 forKey:@"profilingConfig"];
    profilingConfig = v5->_profilingConfig;
    v5->_profilingConfig = (NSDictionary *)v46;

    uint64_t v48 = [v4 decodeObjectOfClasses:v7 forKey:@"counterConfig"];
    counterConfig = v5->_counterConfig;
    v5->_counterConfig = (NSDictionary *)v48;

    uint64_t v50 = [v4 decodeObjectOfClasses:v7 forKey:@"timelineConfig"];
    timelineConfig = v5->_timelineConfig;
    v5->_timelineConfig = (NSDictionary *)v50;

    uint64_t v52 = [v4 decodeObjectOfClasses:v7 forKey:@"derivedCounterInfo"];
    derivedCounterInfo = v5->_derivedCounterInfo;
    v5->_derivedCounterInfo = (NSDictionary *)v52;

    v5->_useOverlap = [v4 decodeBoolForKey:@"useOverlap"];
    v54 = v5;
  }
  return v5;
}

- (id)initFromProfileInfo:(id)a3
{
  id v4 = a3;
  v62.receiver = self;
  v62.super_class = (Class)GTProfileInfo;
  v5 = [(GTProfileInfo *)&v62 init];
  v6 = v5;
  if (v5)
  {
    v5->_version = 1;
    v7 = [v4 objectForKeyedSubscript:@"gpuState"];
    v6->_gpuState = [v7 unsignedIntValue];

    uint64_t v8 = [v4 objectForKeyedSubscript:@"counters"];
    counters = v6->_counters;
    v6->_counters = (NSArray *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"profileCounters"];
    profileCounters = v6->_profileCounters;
    v6->_profileCounters = (NSArray *)v10;

    uint64_t v12 = [v4 objectForKeyedSubscript:@"derivedCounterData"];
    derivedCounterData = v6->_derivedCounterData;
    v6->_derivedCounterData = (NSDictionary *)v12;

    uint64_t v14 = [v4 objectForKeyedSubscript:@"metalPluginName"];
    metalPluginName = v6->_metalPluginName;
    v6->_metalPluginName = (NSString *)v14;

    uint64_t v16 = [v4 objectForKeyedSubscript:@"gpuTarget"];
    gpuTarget = v6->_gpuTarget;
    v6->_gpuTarget = (NSString *)v16;

    uint64_t v18 = [v4 objectForKeyedSubscript:@"encoderBatchPriorityList"];
    encoderBatchPriorityList = v6->_encoderBatchPriorityList;
    v6->_encoderBatchPriorityList = (NSArray *)v18;

    uint64_t v20 = [v4 objectForKeyedSubscript:@"highPriorityBatches"];
    highPriorityBatches = v6->_highPriorityBatches;
    v6->_highPriorityBatches = (NSArray *)v20;

    uint64_t v22 = [v4 objectForKeyedSubscript:@"HighPriorityBatchInfo"];
    highPriorityBatchInfo = v6->_highPriorityBatchInfo;
    v6->_highPriorityBatchInfo = (NSDictionary *)v22;

    uint64_t v24 = [v4 objectForKeyedSubscript:@"batchFilteredDerivedCounters"];
    batchFilteredDerivedCounters = v6->_batchFilteredDerivedCounters;
    v6->_batchFilteredDerivedCounters = (NSArray *)v24;

    uint64_t v26 = [v4 objectForKeyedSubscript:@"pause"];
    v6->_pause = [v26 BOOLValue];

    v27 = [v4 objectForKeyedSubscript:@"resume"];
    v6->_resume = [v27 BOOLValue];

    uint64_t v28 = [v4 objectForKeyedSubscript:@"xpState"];
    v6->_uint64_t xpState = [v28 unsignedIntValue];

    v29 = [v4 objectForKeyedSubscript:@"analyzeBinaries"];
    v6->_analyzeBinaries = [v29 BOOLValue];

    uint64_t v30 = [v4 objectForKeyedSubscript:@"perEncoderDrawCallCount"];
    perEncoderDrawCallCount = v6->_perEncoderDrawCallCount;
    v6->_perEncoderDrawCallCount = (NSDictionary *)v30;

    uint64_t v32 = [v4 objectForKeyedSubscript:@"perEncoderIndexDrawCallCount"];
    perEncoderIndexDrawCallCount = v6->_perEncoderIndexDrawCallCount;
    v6->_perEncoderIndexDrawCallCount = (NSDictionary *)v32;

    uint64_t v34 = [v4 objectForKeyedSubscript:@"withoutBlitEncoderToDrawCallCountDict"];
    withoutBlitEncoderToDrawCallCountDict = v6->_withoutBlitEncoderToDrawCallCountDict;
    v6->_withoutBlitEncoderToDrawCallCountDict = (NSDictionary *)v34;

    uint64_t v36 = [v4 objectForKeyedSubscript:@"blitEncoderIndices"];
    blitEncoderIndices = v6->_blitEncoderIndices;
    v6->_blitEncoderIndices = (NSArray *)v36;

    uint64_t v38 = [v4 objectForKeyedSubscript:@"activePerEncoderDrawCallCount"];
    activePerEncoderDrawCallCount = v6->_activePerEncoderDrawCallCount;
    v6->_activePerEncoderDrawCallCount = (NSArray *)v38;

    uint64_t v40 = [v4 objectForKeyedSubscript:@"splitEncoderCommandCount"];
    splitEncoderCommandCount = v6->_splitEncoderCommandCount;
    v6->_splitEncoderCommandCount = (NSArray *)v40;

    uint64_t v42 = [v4 objectForKeyedSubscript:@"splitPerEncoderKickCount"];
    splitPerEncoderKickCount = v6->_splitPerEncoderKickCount;
    v6->_splitPerEncoderKickCount = (NSArray *)v42;

    uint64_t v44 = [v4 objectForKeyedSubscript:@"perFrameCommandBufferCount"];
    perFrameCommandBufferCount = v6->_perFrameCommandBufferCount;
    v6->_perFrameCommandBufferCount = (NSArray *)v44;

    uint64_t v46 = [v4 objectForKeyedSubscript:@"perEncoderKickCount"];
    perEncoderKickCount = v6->_perEncoderKickCount;
    v6->_perEncoderKickCount = (NSArray *)v46;

    uint64_t v48 = [v4 objectForKeyedSubscript:@"totalDrawCallCount"];
    v6->_uint64_t totalDrawCallCount = [v48 unsignedIntValue];

    uint64_t v49 = [v4 objectForKeyedSubscript:@"perCommandBufferEncoderCount"];
    perCommandBufferEncoderCount = v6->_perCommandBufferEncoderCount;
    v6->_perCommandBufferEncoderCount = (NSArray *)v49;

    uint64_t v51 = [v4 objectForKeyedSubscript:@"profilingConfig"];
    profilingConfig = v6->_profilingConfig;
    v6->_profilingConfig = (NSDictionary *)v51;

    uint64_t v53 = [v4 objectForKeyedSubscript:@"counterConfig"];
    counterConfig = v6->_counterConfig;
    v6->_counterConfig = (NSDictionary *)v53;

    uint64_t v55 = [v4 objectForKeyedSubscript:@"timelineConfig"];
    timelineConfig = v6->_timelineConfig;
    v6->_timelineConfig = (NSDictionary *)v55;

    uint64_t v57 = [v4 objectForKeyedSubscript:@"derivedCounterInfo"];
    derivedCounterInfo = v6->_derivedCounterInfo;
    v6->_derivedCounterInfo = (NSDictionary *)v57;

    v59 = [v4 objectForKeyedSubscript:@"useOverlap"];
    v6->_useOverlap = [v59 BOOLValue];

    v60 = v6;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end