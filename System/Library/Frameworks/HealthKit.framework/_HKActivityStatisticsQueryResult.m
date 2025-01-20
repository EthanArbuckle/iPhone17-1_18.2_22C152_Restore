@interface _HKActivityStatisticsQueryResult
+ (BOOL)supportsSecureCoding;
- (NSArray)activeEnergyResults;
- (NSArray)appleExerciseTimeResults;
- (NSArray)appleMoveTimeResults;
- (NSArray)appleStandHourResults;
- (NSArray)workoutResults;
- (_HKActivityStatisticsQueryResult)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setActiveEnergyResults:(id)a3;
- (void)setAppleExerciseTimeResults:(id)a3;
- (void)setAppleMoveTimeResults:(id)a3;
- (void)setAppleStandHourResults:(id)a3;
- (void)setWorkoutResults:(id)a3;
@end

@implementation _HKActivityStatisticsQueryResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  activeEnergyResults = self->_activeEnergyResults;
  id v5 = a3;
  v6 = NSStringFromSelector(sel_activeEnergyResults);
  [v5 encodeObject:activeEnergyResults forKey:v6];

  appleMoveTimeResults = self->_appleMoveTimeResults;
  v8 = NSStringFromSelector(sel_appleMoveTimeResults);
  [v5 encodeObject:appleMoveTimeResults forKey:v8];

  appleExerciseTimeResults = self->_appleExerciseTimeResults;
  v10 = NSStringFromSelector(sel_appleExerciseTimeResults);
  [v5 encodeObject:appleExerciseTimeResults forKey:v10];

  appleStandHourResults = self->_appleStandHourResults;
  v12 = NSStringFromSelector(sel_appleStandHourResults);
  [v5 encodeObject:appleStandHourResults forKey:v12];

  workoutResults = self->_workoutResults;
  NSStringFromSelector(sel_workoutResults);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:workoutResults forKey:v14];
}

- (_HKActivityStatisticsQueryResult)initWithCoder:(id)a3
{
  v42[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)_HKActivityStatisticsQueryResult;
  id v5 = [(_HKActivityStatisticsQueryResult *)&v37 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v42[0] = objc_opt_class();
    v42[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
    v8 = [v6 setWithArray:v7];
    v9 = NSStringFromSelector(sel_activeEnergyResults);
    uint64_t v10 = [v4 decodeObjectOfClasses:v8 forKey:v9];
    activeEnergyResults = v5->_activeEnergyResults;
    v5->_activeEnergyResults = (NSArray *)v10;

    v12 = (void *)MEMORY[0x1E4F1CAD0];
    v41[0] = objc_opt_class();
    v41[1] = objc_opt_class();
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];
    id v14 = [v12 setWithArray:v13];
    v15 = NSStringFromSelector(sel_appleMoveTimeResults);
    uint64_t v16 = [v4 decodeObjectOfClasses:v14 forKey:v15];
    appleMoveTimeResults = v5->_appleMoveTimeResults;
    v5->_appleMoveTimeResults = (NSArray *)v16;

    v18 = (void *)MEMORY[0x1E4F1CAD0];
    v40[0] = objc_opt_class();
    v40[1] = objc_opt_class();
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
    v20 = [v18 setWithArray:v19];
    v21 = NSStringFromSelector(sel_appleExerciseTimeResults);
    uint64_t v22 = [v4 decodeObjectOfClasses:v20 forKey:v21];
    appleExerciseTimeResults = v5->_appleExerciseTimeResults;
    v5->_appleExerciseTimeResults = (NSArray *)v22;

    v24 = (void *)MEMORY[0x1E4F1CAD0];
    v39[0] = objc_opt_class();
    v39[1] = objc_opt_class();
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
    v26 = [v24 setWithArray:v25];
    v27 = NSStringFromSelector(sel_appleStandHourResults);
    uint64_t v28 = [v4 decodeObjectOfClasses:v26 forKey:v27];
    appleStandHourResults = v5->_appleStandHourResults;
    v5->_appleStandHourResults = (NSArray *)v28;

    v30 = (void *)MEMORY[0x1E4F1CAD0];
    v38[0] = objc_opt_class();
    v38[1] = objc_opt_class();
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
    v32 = [v30 setWithArray:v31];
    v33 = NSStringFromSelector(sel_workoutResults);
    uint64_t v34 = [v4 decodeObjectOfClasses:v32 forKey:v33];
    workoutResults = v5->_workoutResults;
    v5->_workoutResults = (NSArray *)v34;
  }
  return v5;
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

- (NSArray)workoutResults
{
  return self->_workoutResults;
}

- (void)setWorkoutResults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutResults, 0);
  objc_storeStrong((id *)&self->_appleStandHourResults, 0);
  objc_storeStrong((id *)&self->_appleExerciseTimeResults, 0);
  objc_storeStrong((id *)&self->_appleMoveTimeResults, 0);

  objc_storeStrong((id *)&self->_activeEnergyResults, 0);
}

@end