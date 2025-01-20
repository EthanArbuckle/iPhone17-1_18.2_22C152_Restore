@interface HKWorkoutTrainingLoadQueryResults
+ (BOOL)supportsSecureCoding;
- (HKWorkoutTrainingLoad)totalTrainingLoad;
- (HKWorkoutTrainingLoadQueryResults)initWithCoder:(id)a3;
- (HKWorkoutTrainingLoadQueryResults)initWithTotalTrainingLoad:(id)a3;
- (HKWorkoutTrainingLoadQueryResults)initWithTotalTrainingLoad:(id)a3 trainingloadByActivityType:(id)a4;
- (NSDictionary)trainingloadByActivityType;
- (id)activityTypes;
- (id)trainingLoadForActivityType:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKWorkoutTrainingLoadQueryResults

- (HKWorkoutTrainingLoadQueryResults)initWithTotalTrainingLoad:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKWorkoutTrainingLoadQueryResults;
  v5 = [(HKWorkoutTrainingLoadQueryResults *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    totalTrainingLoad = v5->_totalTrainingLoad;
    v5->_totalTrainingLoad = (HKWorkoutTrainingLoad *)v6;
  }
  return v5;
}

- (HKWorkoutTrainingLoadQueryResults)initWithTotalTrainingLoad:(id)a3 trainingloadByActivityType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKWorkoutTrainingLoadQueryResults;
  v8 = [(HKWorkoutTrainingLoadQueryResults *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    totalTrainingLoad = v8->_totalTrainingLoad;
    v8->_totalTrainingLoad = (HKWorkoutTrainingLoad *)v9;

    uint64_t v11 = [v7 copy];
    trainingloadByActivityType = v8->_trainingloadByActivityType;
    v8->_trainingloadByActivityType = (NSDictionary *)v11;
  }
  return v8;
}

- (id)trainingLoadForActivityType:(unint64_t)a3
{
  if (a3 == 84)
  {
    v3 = 0;
  }
  else
  {
    trainingloadByActivityType = self->_trainingloadByActivityType;
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    v3 = [(NSDictionary *)trainingloadByActivityType objectForKeyedSubscript:v5];
  }

  return v3;
}

- (id)activityTypes
{
  return [(NSDictionary *)self->_trainingloadByActivityType allKeys];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  totalTrainingLoad = self->_totalTrainingLoad;
  id v5 = a3;
  [v5 encodeObject:totalTrainingLoad forKey:@"totalTrainingLoad"];
  [v5 encodeObject:self->_trainingloadByActivityType forKey:@"trainingloadByActivityType"];
}

- (HKWorkoutTrainingLoadQueryResults)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKWorkoutTrainingLoadQueryResults;
  id v5 = [(HKWorkoutTrainingLoadQueryResults *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalTrainingLoad"];
    totalTrainingLoad = v5->_totalTrainingLoad;
    v5->_totalTrainingLoad = (HKWorkoutTrainingLoad *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"trainingloadByActivityType"];
    trainingloadByActivityType = v5->_trainingloadByActivityType;
    v5->_trainingloadByActivityType = (NSDictionary *)v12;
  }
  return v5;
}

- (HKWorkoutTrainingLoad)totalTrainingLoad
{
  return (HKWorkoutTrainingLoad *)objc_getProperty(self, a2, 8, 1);
}

- (NSDictionary)trainingloadByActivityType
{
  return self->_trainingloadByActivityType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trainingloadByActivityType, 0);

  objc_storeStrong((id *)&self->_totalTrainingLoad, 0);
}

@end