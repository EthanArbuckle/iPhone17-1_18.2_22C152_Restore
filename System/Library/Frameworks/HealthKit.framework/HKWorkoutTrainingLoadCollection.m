@interface HKWorkoutTrainingLoadCollection
+ (BOOL)supportsSecureCoding;
- (HKWorkoutTrainingLoadCollection)initWithCoder:(id)a3;
- (HKWorkoutTrainingLoadCollection)initWithTotalTrainingLoads:(id)a3;
- (NSArray)trainingLoads;
- (id)_init;
- (id)trainingLoad;
- (id)trainingLoadForDate:(id)a3;
- (void)addTrainingLoad:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setTrainingLoads:(id)a3;
@end

@implementation HKWorkoutTrainingLoadCollection

- (HKWorkoutTrainingLoadCollection)initWithTotalTrainingLoads:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKWorkoutTrainingLoadCollection;
  v5 = [(HKWorkoutTrainingLoadCollection *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    trainingLoads = v5->_trainingLoads;
    v5->_trainingLoads = (NSMutableArray *)v6;
  }
  return v5;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)HKWorkoutTrainingLoadCollection;
  return [(HKWorkoutTrainingLoadCollection *)&v3 init];
}

- (void)addTrainingLoad:(id)a3
{
  id v4 = a3;
  trainingLoads = self->_trainingLoads;
  id v13 = v4;
  if (trainingLoads)
  {
    uint64_t v6 = [(NSMutableArray *)trainingLoads lastObject];
    v7 = [v6 dateInterval];
    v8 = [v7 startDate];

    objc_super v9 = [v13 dateInterval];
    v10 = [v9 startDate];
    int v11 = [v10 isEqualToDate:v8];

    if (v11) {
      [(NSMutableArray *)self->_trainingLoads removeObject:v6];
    }
  }
  else
  {
    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v6 = self->_trainingLoads;
    self->_trainingLoads = v12;
  }

  [(NSMutableArray *)self->_trainingLoads addObject:v13];
}

- (id)trainingLoad
{
  v2 = (void *)[(NSMutableArray *)self->_trainingLoads copy];

  return v2;
}

- (id)trainingLoadForDate:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = self->_trainingLoads;
  id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_super v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "dateInterval", (void)v13);
        char v11 = [v10 containsDate:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (HKWorkoutTrainingLoadCollection)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKWorkoutTrainingLoadCollection;
  v5 = [(HKWorkoutTrainingLoadCollection *)&v12 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"trainingLoads"];
    trainingLoads = v5->_trainingLoads;
    v5->_trainingLoads = (NSMutableArray *)v9;
  }
  return v5;
}

- (NSArray)trainingLoads
{
  return &self->_trainingLoads->super;
}

- (void)setTrainingLoads:(id)a3
{
}

- (void).cxx_destruct
{
}

@end