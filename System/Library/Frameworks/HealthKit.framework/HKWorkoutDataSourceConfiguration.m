@interface HKWorkoutDataSourceConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)collectsDefaultTypes;
- (HKWorkoutConfiguration)workoutConfiguration;
- (HKWorkoutDataSourceConfiguration)initWithCoder:(id)a3;
- (HKWorkoutDataSourceConfiguration)initWithWorkoutConfiguration:(id)a3 sampleTypesToCollect:(id)a4 filters:(id)a5 eventTypesToCollect:(id)a6 collectsDefaultTypes:(BOOL)a7;
- (NSDictionary)filtersBySampleType;
- (NSSet)eventTypesToCollect;
- (NSSet)sampleTypesToCollect;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCollectsDefaultTypes:(BOOL)a3;
@end

@implementation HKWorkoutDataSourceConfiguration

- (HKWorkoutDataSourceConfiguration)initWithWorkoutConfiguration:(id)a3 sampleTypesToCollect:(id)a4 filters:(id)a5 eventTypesToCollect:(id)a6 collectsDefaultTypes:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v26.receiver = self;
  v26.super_class = (Class)HKWorkoutDataSourceConfiguration;
  v16 = [(HKWorkoutDataSourceConfiguration *)&v26 init];
  if (v16)
  {
    v17 = (HKWorkoutConfiguration *)[v12 copy];
    v18 = v17;
    if (!v17) {
      v18 = objc_alloc_init(HKWorkoutConfiguration);
    }
    objc_storeStrong((id *)&v16->_workoutConfiguration, v18);
    if (!v17) {

    }
    uint64_t v19 = [v13 copy];
    sampleTypesToCollect = v16->_sampleTypesToCollect;
    v16->_sampleTypesToCollect = (NSSet *)v19;

    uint64_t v21 = [v14 copy];
    filtersBySampleType = v16->_filtersBySampleType;
    v16->_filtersBySampleType = (NSDictionary *)v21;

    uint64_t v23 = [v15 copy];
    eventTypesToCollect = v16->_eventTypesToCollect;
    v16->_eventTypesToCollect = (NSSet *)v23;

    v16->_collectsDefaultTypes = a7;
  }

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HKWorkoutDataSourceConfiguration allocWithZone:a3];
  workoutConfiguration = self->_workoutConfiguration;
  sampleTypesToCollect = self->_sampleTypesToCollect;
  filtersBySampleType = self->_filtersBySampleType;
  eventTypesToCollect = self->_eventTypesToCollect;
  BOOL collectsDefaultTypes = self->_collectsDefaultTypes;

  return [(HKWorkoutDataSourceConfiguration *)v4 initWithWorkoutConfiguration:workoutConfiguration sampleTypesToCollect:sampleTypesToCollect filters:filtersBySampleType eventTypesToCollect:eventTypesToCollect collectsDefaultTypes:collectsDefaultTypes];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKWorkoutDataSourceConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)HKWorkoutDataSourceConfiguration;
  v5 = [(HKTaskConfiguration *)&v25 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"workoutConfiguration"];
    workoutConfiguration = v5->_workoutConfiguration;
    v5->_workoutConfiguration = (HKWorkoutConfiguration *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"sampleTypesToCollect"];
    sampleTypesToCollect = v5->_sampleTypesToCollect;
    v5->_sampleTypesToCollect = (NSSet *)v11;

    id v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    v16 = objc_msgSend(v13, "setWithObjects:", v14, v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"filtersBySampleType"];
    filtersBySampleType = v5->_filtersBySampleType;
    v5->_filtersBySampleType = (NSDictionary *)v17;

    uint64_t v19 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"eventTypesToCollect"];
    eventTypesToCollect = v5->_eventTypesToCollect;
    v5->_eventTypesToCollect = (NSSet *)v22;

    v5->_BOOL collectsDefaultTypes = [v4 decodeBoolForKey:@"collectsDefaultTypes"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKWorkoutDataSourceConfiguration;
  id v4 = a3;
  [(HKTaskConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_workoutConfiguration, @"workoutConfiguration", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_sampleTypesToCollect forKey:@"sampleTypesToCollect"];
  [v4 encodeObject:self->_filtersBySampleType forKey:@"filtersBySampleType"];
  [v4 encodeObject:self->_eventTypesToCollect forKey:@"eventTypesToCollect"];
  [v4 encodeBool:self->_collectsDefaultTypes forKey:@"collectsDefaultTypes"];
}

- (HKWorkoutConfiguration)workoutConfiguration
{
  return (HKWorkoutConfiguration *)objc_getProperty(self, a2, 16, 1);
}

- (NSSet)sampleTypesToCollect
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (NSDictionary)filtersBySampleType
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (NSSet)eventTypesToCollect
{
  return (NSSet *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)collectsDefaultTypes
{
  return self->_collectsDefaultTypes;
}

- (void)setCollectsDefaultTypes:(BOOL)a3
{
  self->_BOOL collectsDefaultTypes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventTypesToCollect, 0);
  objc_storeStrong((id *)&self->_filtersBySampleType, 0);
  objc_storeStrong((id *)&self->_sampleTypesToCollect, 0);

  objc_storeStrong((id *)&self->_workoutConfiguration, 0);
}

@end