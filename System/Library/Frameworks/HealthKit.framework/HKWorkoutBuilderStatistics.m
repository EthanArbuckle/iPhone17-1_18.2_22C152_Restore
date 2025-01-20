@interface HKWorkoutBuilderStatistics
+ (BOOL)supportsSecureCoding;
- (BOOL)isEmpty;
- (HKWorkoutBuilderStatistics)initWithCoder:(id)a3;
- (NSDictionary)activitiesStatistics;
- (NSDictionary)workoutStatistics;
- (NSSet)allTypes;
- (void)addActivityStatistics:(id)a3 forType:(id)a4 activityUUID:(id)a5;
- (void)addWorkoutStatistics:(id)a3 forType:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKWorkoutBuilderStatistics

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  workoutStatistics = self->_workoutStatistics;
  id v5 = a3;
  [v5 encodeObject:workoutStatistics forKey:@"workout_stats"];
  [v5 encodeObject:self->_activitiesStatistics forKey:@"activities_stats"];
}

- (HKWorkoutBuilderStatistics)initWithCoder:(id)a3
{
  v19[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HKWorkoutBuilderStatistics;
  id v5 = [(HKWorkoutBuilderStatistics *)&v17 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v19[2] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
    v8 = [v6 setWithArray:v7];

    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"workout_stats"];
    workoutStatistics = v5->_workoutStatistics;
    v5->_workoutStatistics = (NSMutableDictionary *)v9;

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    v18[2] = objc_opt_class();
    v18[3] = objc_opt_class();
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:4];
    v13 = [v11 setWithArray:v12];

    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"activities_stats"];
    activitiesStatistics = v5->_activitiesStatistics;
    v5->_activitiesStatistics = (NSMutableDictionary *)v14;
  }
  return v5;
}

- (NSDictionary)workoutStatistics
{
  v2 = (void *)[(NSMutableDictionary *)self->_workoutStatistics copy];

  return (NSDictionary *)v2;
}

- (NSDictionary)activitiesStatistics
{
  v2 = (void *)[(NSMutableDictionary *)self->_activitiesStatistics copy];

  return (NSDictionary *)v2;
}

- (BOOL)isEmpty
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableDictionary *)self->_workoutStatistics count]) {
    return 0;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = self->_activitiesStatistics;
  uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = -[NSMutableDictionary objectForKeyedSubscript:](self->_activitiesStatistics, "objectForKeyedSubscript:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        uint64_t v10 = [v9 count];

        if (v10)
        {
          BOOL v3 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v3 = 1;
LABEL_13:

  return v3;
}

- (NSSet)allTypes
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1E4F1CA80];
  id v4 = [(NSMutableDictionary *)self->_workoutStatistics allKeys];
  uint64_t v5 = [v3 setWithArray:v4];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = self->_activitiesStatistics;
  uint64_t v7 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = -[NSMutableDictionary objectForKeyedSubscript:](self->_activitiesStatistics, "objectForKeyedSubscript:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        long long v12 = [v11 allKeys];
        [v5 addObjectsFromArray:v12];
      }
      uint64_t v8 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return (NSSet *)v5;
}

- (void)addWorkoutStatistics:(id)a3 forType:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  workoutStatistics = self->_workoutStatistics;
  if (!workoutStatistics)
  {
    uint64_t v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v9 = self->_workoutStatistics;
    self->_workoutStatistics = v8;

    workoutStatistics = self->_workoutStatistics;
  }
  [(NSMutableDictionary *)workoutStatistics setObject:v10 forKeyedSubscript:v6];
}

- (void)addActivityStatistics:(id)a3 forType:(id)a4 activityUUID:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  activitiesStatistics = self->_activitiesStatistics;
  if (!activitiesStatistics)
  {
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v12 = self->_activitiesStatistics;
    self->_activitiesStatistics = v11;

    activitiesStatistics = self->_activitiesStatistics;
  }
  long long v13 = [(NSMutableDictionary *)activitiesStatistics objectForKeyedSubscript:v9];

  if (!v13)
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(NSMutableDictionary *)self->_activitiesStatistics setObject:v14 forKeyedSubscript:v9];
  }
  long long v15 = [(NSMutableDictionary *)self->_activitiesStatistics objectForKeyedSubscript:v9];
  [v15 setObject:v16 forKeyedSubscript:v8];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activitiesStatistics, 0);

  objc_storeStrong((id *)&self->_workoutStatistics, 0);
}

@end