@interface HKCurrentActivityCacheQueryResult
+ (BOOL)supportsSecureCoding;
- (HKActivityCache)currentActivityCache;
- (HKCurrentActivityCacheQueryResult)initWithCoder:(id)a3;
- (NSArray)activeEnergyResults;
- (NSArray)appleExerciseTimeResults;
- (NSArray)appleMoveTimeResults;
- (NSArray)appleStandHourResults;
- (void)encodeWithCoder:(id)a3;
- (void)setActiveEnergyResults:(id)a3;
- (void)setAppleExerciseTimeResults:(id)a3;
- (void)setAppleMoveTimeResults:(id)a3;
- (void)setAppleStandHourResults:(id)a3;
- (void)setCurrentActivityCache:(id)a3;
@end

@implementation HKCurrentActivityCacheQueryResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  currentActivityCache = self->_currentActivityCache;
  id v5 = a3;
  v6 = NSStringFromSelector(sel_currentActivityCache);
  [v5 encodeObject:currentActivityCache forKey:v6];

  activeEnergyResults = self->_activeEnergyResults;
  v8 = NSStringFromSelector(sel_activeEnergyResults);
  [v5 encodeObject:activeEnergyResults forKey:v8];

  appleMoveTimeResults = self->_appleMoveTimeResults;
  v10 = NSStringFromSelector(sel_appleMoveTimeResults);
  [v5 encodeObject:appleMoveTimeResults forKey:v10];

  appleExerciseTimeResults = self->_appleExerciseTimeResults;
  v12 = NSStringFromSelector(sel_appleExerciseTimeResults);
  [v5 encodeObject:appleExerciseTimeResults forKey:v12];

  appleStandHourResults = self->_appleStandHourResults;
  NSStringFromSelector(sel_appleStandHourResults);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:appleStandHourResults forKey:v14];
}

- (HKCurrentActivityCacheQueryResult)initWithCoder:(id)a3
{
  v39[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)HKCurrentActivityCacheQueryResult;
  id v5 = [(HKCurrentActivityCacheQueryResult *)&v35 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_currentActivityCache);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    currentActivityCache = v5->_currentActivityCache;
    v5->_currentActivityCache = (HKActivityCache *)v8;

    v10 = (void *)MEMORY[0x1E4F1CAD0];
    v39[0] = objc_opt_class();
    v39[1] = objc_opt_class();
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
    v12 = [v10 setWithArray:v11];
    v13 = NSStringFromSelector(sel_activeEnergyResults);
    uint64_t v14 = [v4 decodeObjectOfClasses:v12 forKey:v13];
    activeEnergyResults = v5->_activeEnergyResults;
    v5->_activeEnergyResults = (NSArray *)v14;

    v16 = (void *)MEMORY[0x1E4F1CAD0];
    v38[0] = objc_opt_class();
    v38[1] = objc_opt_class();
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
    v18 = [v16 setWithArray:v17];
    v19 = NSStringFromSelector(sel_appleMoveTimeResults);
    uint64_t v20 = [v4 decodeObjectOfClasses:v18 forKey:v19];
    appleMoveTimeResults = v5->_appleMoveTimeResults;
    v5->_appleMoveTimeResults = (NSArray *)v20;

    v22 = (void *)MEMORY[0x1E4F1CAD0];
    v37[0] = objc_opt_class();
    v37[1] = objc_opt_class();
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
    v24 = [v22 setWithArray:v23];
    v25 = NSStringFromSelector(sel_appleExerciseTimeResults);
    uint64_t v26 = [v4 decodeObjectOfClasses:v24 forKey:v25];
    appleExerciseTimeResults = v5->_appleExerciseTimeResults;
    v5->_appleExerciseTimeResults = (NSArray *)v26;

    v28 = (void *)MEMORY[0x1E4F1CAD0];
    v36[0] = objc_opt_class();
    v36[1] = objc_opt_class();
    v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
    v30 = [v28 setWithArray:v29];
    v31 = NSStringFromSelector(sel_appleStandHourResults);
    uint64_t v32 = [v4 decodeObjectOfClasses:v30 forKey:v31];
    appleStandHourResults = v5->_appleStandHourResults;
    v5->_appleStandHourResults = (NSArray *)v32;
  }
  return v5;
}

- (HKActivityCache)currentActivityCache
{
  return self->_currentActivityCache;
}

- (void)setCurrentActivityCache:(id)a3
{
}

- (NSArray)activeEnergyResults
{
  return self->_activeEnergyResults;
}

- (void)setActiveEnergyResults:(id)a3
{
}

- (NSArray)appleMoveTimeResults
{
  return self->_appleMoveTimeResults;
}

- (void)setAppleMoveTimeResults:(id)a3
{
}

- (NSArray)appleExerciseTimeResults
{
  return self->_appleExerciseTimeResults;
}

- (void)setAppleExerciseTimeResults:(id)a3
{
}

- (NSArray)appleStandHourResults
{
  return self->_appleStandHourResults;
}

- (void)setAppleStandHourResults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleStandHourResults, 0);
  objc_storeStrong((id *)&self->_appleExerciseTimeResults, 0);
  objc_storeStrong((id *)&self->_appleMoveTimeResults, 0);
  objc_storeStrong((id *)&self->_activeEnergyResults, 0);

  objc_storeStrong((id *)&self->_currentActivityCache, 0);
}

@end