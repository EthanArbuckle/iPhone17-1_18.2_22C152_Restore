@interface HKWorkoutTrainingLoadCollectionQueryResults
+ (BOOL)supportsSecureCoding;
- (HKWorkoutTrainingLoadCollection)totalTrainingLoadCollection;
- (HKWorkoutTrainingLoadCollectionQueryResults)initWithCoder:(id)a3;
- (HKWorkoutTrainingLoadCollectionQueryResults)initWithTotalTrainingLoadCollection:(id)a3 collectionByActivityType:(id)a4;
- (NSDictionary)collectionByActivityType;
- (id)activityTypes;
- (id)trainingLoadCollectionForActivityType:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKWorkoutTrainingLoadCollectionQueryResults

- (HKWorkoutTrainingLoadCollectionQueryResults)initWithTotalTrainingLoadCollection:(id)a3 collectionByActivityType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKWorkoutTrainingLoadCollectionQueryResults;
  v8 = [(HKWorkoutTrainingLoadCollectionQueryResults *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    totalTrainingLoadCollection = v8->_totalTrainingLoadCollection;
    v8->_totalTrainingLoadCollection = (HKWorkoutTrainingLoadCollection *)v9;

    uint64_t v11 = [v7 copy];
    collectionByActivityType = v8->_collectionByActivityType;
    v8->_collectionByActivityType = (NSDictionary *)v11;
  }
  return v8;
}

- (id)trainingLoadCollectionForActivityType:(unint64_t)a3
{
  collectionByActivityType = self->_collectionByActivityType;
  v4 = [NSNumber numberWithUnsignedInteger:a3];
  v5 = [(NSDictionary *)collectionByActivityType objectForKeyedSubscript:v4];

  return v5;
}

- (id)activityTypes
{
  return [(NSDictionary *)self->_collectionByActivityType allKeys];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  totalTrainingLoadCollection = self->_totalTrainingLoadCollection;
  id v5 = a3;
  [v5 encodeObject:totalTrainingLoadCollection forKey:@"totalTrainingLoadCollection"];
  [v5 encodeObject:self->_collectionByActivityType forKey:@"collectionByActivityType"];
}

- (HKWorkoutTrainingLoadCollectionQueryResults)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKWorkoutTrainingLoadCollectionQueryResults;
  id v5 = [(HKWorkoutTrainingLoadCollectionQueryResults *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalTrainingLoadCollection"];
    totalTrainingLoadCollection = v5->_totalTrainingLoadCollection;
    v5->_totalTrainingLoadCollection = (HKWorkoutTrainingLoadCollection *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"collectionByActivityType"];
    collectionByActivityType = v5->_collectionByActivityType;
    v5->_collectionByActivityType = (NSDictionary *)v12;
  }
  return v5;
}

- (HKWorkoutTrainingLoadCollection)totalTrainingLoadCollection
{
  return (HKWorkoutTrainingLoadCollection *)objc_getProperty(self, a2, 8, 1);
}

- (NSDictionary)collectionByActivityType
{
  return self->_collectionByActivityType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionByActivityType, 0);

  objc_storeStrong((id *)&self->_totalTrainingLoadCollection, 0);
}

@end