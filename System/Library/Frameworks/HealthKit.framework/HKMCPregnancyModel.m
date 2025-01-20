@interface HKMCPregnancyModel
+ (BOOL)supportsSecureCoding;
+ (id)descriptionFromState:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (HKCategorySample)sample;
- (HKMCPregnancyModel)initWithCoder:(id)a3;
- (HKMCPregnancyModel)initWithState:(int64_t)a3 pregnancyStartDate:(id)a4 pregnancyEndDate:(id)a5 estimatedDueDate:(id)a6 pregnancyDuration:(id)a7 physiologicalWashoutEndDate:(id)a8 behavioralWashoutEndDate:(id)a9 trimesters:(id)a10 sample:(id)a11 educationalStepsCompletedDate:(id)a12;
- (NSArray)trimesters;
- (NSDate)behavioralWashoutEndDate;
- (NSDate)educationalStepsCompletedDate;
- (NSDate)estimatedDueDate;
- (NSDate)physiologicalWashoutEndDate;
- (NSDate)pregnancyEndDate;
- (NSDate)pregnancyStartDate;
- (NSDateInterval)pregnancyDuration;
- (NSString)hk_redactedDescription;
- (id)description;
- (int64_t)state;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKMCPregnancyModel

- (HKMCPregnancyModel)initWithState:(int64_t)a3 pregnancyStartDate:(id)a4 pregnancyEndDate:(id)a5 estimatedDueDate:(id)a6 pregnancyDuration:(id)a7 physiologicalWashoutEndDate:(id)a8 behavioralWashoutEndDate:(id)a9 trimesters:(id)a10 sample:(id)a11 educationalStepsCompletedDate:(id)a12
{
  id v45 = a4;
  id v44 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  id v24 = a12;
  v46.receiver = self;
  v46.super_class = (Class)HKMCPregnancyModel;
  v25 = [(HKMCPregnancyModel *)&v46 init];
  v26 = v25;
  if (v25)
  {
    v25->_state = a3;
    uint64_t v27 = [v45 copy];
    pregnancyStartDate = v26->_pregnancyStartDate;
    v26->_pregnancyStartDate = (NSDate *)v27;

    uint64_t v29 = [v44 copy];
    pregnancyEndDate = v26->_pregnancyEndDate;
    v26->_pregnancyEndDate = (NSDate *)v29;

    uint64_t v31 = [v18 copy];
    estimatedDueDate = v26->_estimatedDueDate;
    v26->_estimatedDueDate = (NSDate *)v31;

    uint64_t v33 = [v19 copy];
    pregnancyDuration = v26->_pregnancyDuration;
    v26->_pregnancyDuration = (NSDateInterval *)v33;

    uint64_t v35 = [v20 copy];
    physiologicalWashoutEndDate = v26->_physiologicalWashoutEndDate;
    v26->_physiologicalWashoutEndDate = (NSDate *)v35;

    uint64_t v37 = [v21 copy];
    behavioralWashoutEndDate = v26->_behavioralWashoutEndDate;
    v26->_behavioralWashoutEndDate = (NSDate *)v37;

    uint64_t v39 = [v22 copy];
    trimesters = v26->_trimesters;
    v26->_trimesters = (NSArray *)v39;

    uint64_t v41 = [v23 copy];
    sample = v26->_sample;
    v26->_sample = (HKCategorySample *)v41;

    objc_storeStrong((id *)&v26->_educationalStepsCompletedDate, a12);
  }

  return v26;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t state = self->_state;
  id v5 = a3;
  [v5 encodeInteger:state forKey:@"State"];
  [v5 encodeObject:self->_pregnancyStartDate forKey:@"PregnancyStartDate"];
  [v5 encodeObject:self->_pregnancyEndDate forKey:@"PregnancyEndDate"];
  [v5 encodeObject:self->_estimatedDueDate forKey:@"EstimatedDueDate"];
  [v5 encodeObject:self->_pregnancyDuration forKey:@"PregnancyDuration"];
  [v5 encodeObject:self->_physiologicalWashoutEndDate forKey:@"PhysiologicalWashoutEnd"];
  [v5 encodeObject:self->_behavioralWashoutEndDate forKey:@"BehavioralWashoutEnd"];
  [v5 encodeObject:self->_trimesters forKey:@"Trimesters"];
  [v5 encodeObject:self->_sample forKey:@"Sample"];
  [v5 encodeObject:self->_educationalStepsCompletedDate forKey:@"EducationalStepsCompletedDate"];
}

- (HKMCPregnancyModel)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)HKMCPregnancyModel;
  id v5 = [(HKMCPregnancyModel *)&v26 init];
  if (v5)
  {
    v5->_int64_t state = [v4 decodeIntegerForKey:@"State"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PregnancyStartDate"];
    pregnancyStartDate = v5->_pregnancyStartDate;
    v5->_pregnancyStartDate = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PregnancyEndDate"];
    pregnancyEndDate = v5->_pregnancyEndDate;
    v5->_pregnancyEndDate = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EstimatedDueDate"];
    estimatedDueDate = v5->_estimatedDueDate;
    v5->_estimatedDueDate = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PregnancyDuration"];
    pregnancyDuration = v5->_pregnancyDuration;
    v5->_pregnancyDuration = (NSDateInterval *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PhysiologicalWashoutEnd"];
    physiologicalWashoutEndDate = v5->_physiologicalWashoutEndDate;
    v5->_physiologicalWashoutEndDate = (NSDate *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BehavioralWashoutEnd"];
    behavioralWashoutEndDate = v5->_behavioralWashoutEndDate;
    v5->_behavioralWashoutEndDate = (NSDate *)v16;

    id v18 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"Trimesters"];
    trimesters = v5->_trimesters;
    v5->_trimesters = (NSArray *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Sample"];
    sample = v5->_sample;
    v5->_sample = (HKCategorySample *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EducationalStepsCompletedDate"];
    educationalStepsCompletedDate = v5->_educationalStepsCompletedDate;
    v5->_educationalStepsCompletedDate = (NSDate *)v23;
  }
  return v5;
}

- (id)description
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (HKShowSensitiveLogItems())
  {
    v3 = +[HKMCPregnancyModel descriptionFromState:self->_state];
    id v4 = [MEMORY[0x1E4F28E78] stringWithString:&stru_1EEC60288];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v5 = [(HKMCPregnancyModel *)self trimesters];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [*(id *)(*((void *)&v21 + 1) + 8 * i) description];
          [v4 appendFormat:@"%@, ", v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v7);
    }

    v11 = NSString;
    uint64_t v12 = objc_opt_class();
    long long v19 = *(_OWORD *)&self->_estimatedDueDate;
    long long v20 = *(_OWORD *)&self->_pregnancyStartDate;
    physiologicalWashoutEndDate = self->_physiologicalWashoutEndDate;
    behavioralWashoutEndDate = self->_behavioralWashoutEndDate;
    educationalStepsCompletedDate = self->_educationalStepsCompletedDate;
    uint64_t v16 = [(HKSample *)self->_sample description];
    v17 = [v11 stringWithFormat:@"<%@:%p state:%@ | startDate:%@ | endDate:%@ | estimatedDueDate:%@ | duration:%@ | physiologicalWashoutEndDate:%@ | behavioralWashoutEndDate:%@ | trimesters:%@ | educationalStepsCompletedDate:%@ | sample:%@ ", v12, self, v3, v20, v19, physiologicalWashoutEndDate, behavioralWashoutEndDate, v4, educationalStepsCompletedDate, v16];
  }
  else
  {
    v17 = [NSString stringWithFormat:@"<%@:%p>", objc_opt_class(), self];
  }

  return v17;
}

+ (id)descriptionFromState:(int64_t)a3
{
  v3 = @"none";
  if (a3 == 1) {
    v3 = @"ongoing";
  }
  if (a3 == 2) {
    return @"post-pregnancy";
  }
  else {
    return v3;
  }
}

- (NSString)hk_redactedDescription
{
  return (NSString *)[NSString stringWithFormat:@"<%@:%p>", objc_opt_class(), self];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HKMCPregnancyModel *)a3;
  if (self == v4)
  {
    char v28 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      int64_t v6 = [(HKMCPregnancyModel *)self state];
      if (v6 != [(HKMCPregnancyModel *)v5 state]) {
        goto LABEL_33;
      }
      pregnancyStartDate = self->_pregnancyStartDate;
      uint64_t v8 = v5->_pregnancyStartDate;
      if (pregnancyStartDate != v8 && (!v8 || !-[NSDate isEqualToDate:](pregnancyStartDate, "isEqualToDate:"))) {
        goto LABEL_33;
      }
      pregnancyEndDate = self->_pregnancyEndDate;
      uint64_t v10 = v5->_pregnancyEndDate;
      if (pregnancyEndDate != v10 && (!v10 || !-[NSDate isEqualToDate:](pregnancyEndDate, "isEqualToDate:"))) {
        goto LABEL_33;
      }
      estimatedDueDate = self->_estimatedDueDate;
      uint64_t v12 = v5->_estimatedDueDate;
      if (estimatedDueDate != v12 && (!v12 || !-[NSDate isEqualToDate:](estimatedDueDate, "isEqualToDate:"))) {
        goto LABEL_33;
      }
      pregnancyDuration = self->_pregnancyDuration;
      uint64_t v14 = v5->_pregnancyDuration;
      if (pregnancyDuration != v14
        && (!v14 || !-[NSDateInterval isEqualToDateInterval:](pregnancyDuration, "isEqualToDateInterval:")))
      {
        goto LABEL_33;
      }
      if (((physiologicalWashoutEndDate = self->_physiologicalWashoutEndDate,
             uint64_t v16 = v5->_physiologicalWashoutEndDate,
             physiologicalWashoutEndDate == v16)
         || v16 && -[NSDate isEqualToDate:](physiologicalWashoutEndDate, "isEqualToDate:"))
        && ((behavioralWashoutEndDate = self->_behavioralWashoutEndDate,
             id v18 = v5->_behavioralWashoutEndDate,
             behavioralWashoutEndDate == v18)
         || v18 && -[NSDate isEqualToDate:](behavioralWashoutEndDate, "isEqualToDate:"))
        && ((trimesters = self->_trimesters, long long v20 = v5->_trimesters, trimesters == v20)
         || v20 && -[NSArray isEqualToArray:](trimesters, "isEqualToArray:")))
      {
        long long v21 = [(HKObject *)self->_sample UUID];
        long long v22 = [(HKObject *)v5->_sample UUID];
        if (v21 == v22)
        {
          educationalStepsCompletedDate = self->_educationalStepsCompletedDate;
          uint64_t v31 = v5->_educationalStepsCompletedDate;
          char v28 = educationalStepsCompletedDate == v31;
          if (educationalStepsCompletedDate != v31 && v31) {
            char v28 = -[NSDate isEqualToDate:](educationalStepsCompletedDate, "isEqualToDate:");
          }
        }
        else
        {
          long long v23 = [(HKObject *)v5->_sample UUID];
          if (v23)
          {
            long long v24 = [(HKObject *)self->_sample UUID];
            v25 = [(HKObject *)v5->_sample UUID];
            if ([v24 isEqual:v25])
            {
              uint64_t v26 = self->_educationalStepsCompletedDate;
              uint64_t v27 = v5->_educationalStepsCompletedDate;
              char v28 = v26 == v27;
              if (v26 != v27 && v27) {
                char v28 = -[NSDate isEqualToDate:](v26, "isEqualToDate:");
              }
            }
            else
            {
              char v28 = 0;
            }
          }
          else
          {
            char v28 = 0;
          }
        }
      }
      else
      {
LABEL_33:
        char v28 = 0;
      }
    }
    else
    {
      char v28 = 0;
    }
  }

  return v28;
}

- (unint64_t)hash
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v3 = self->_trimesters;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    uint64_t v7 = 1;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        v7 ^= objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "hash", (void)v18);
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v7 = 1;
  }

  int64_t state = self->_state;
  uint64_t v10 = [(NSDate *)self->_pregnancyStartDate hash];
  uint64_t v11 = [(NSDate *)self->_pregnancyEndDate hash];
  uint64_t v12 = [(NSDate *)self->_estimatedDueDate hash];
  uint64_t v13 = [(NSDateInterval *)self->_pregnancyDuration hash];
  uint64_t v14 = [(NSDate *)self->_physiologicalWashoutEndDate hash];
  uint64_t v15 = [(NSDate *)self->_behavioralWashoutEndDate hash];
  unint64_t v16 = [(HKObject *)self->_sample hash];
  return state ^ v7 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ [(NSDate *)self->_educationalStepsCompletedDate hash];
}

- (int64_t)state
{
  return self->_state;
}

- (NSDate)pregnancyStartDate
{
  return self->_pregnancyStartDate;
}

- (NSDate)pregnancyEndDate
{
  return self->_pregnancyEndDate;
}

- (NSDate)estimatedDueDate
{
  return self->_estimatedDueDate;
}

- (NSDateInterval)pregnancyDuration
{
  return self->_pregnancyDuration;
}

- (NSArray)trimesters
{
  return self->_trimesters;
}

- (NSDate)physiologicalWashoutEndDate
{
  return self->_physiologicalWashoutEndDate;
}

- (NSDate)behavioralWashoutEndDate
{
  return self->_behavioralWashoutEndDate;
}

- (HKCategorySample)sample
{
  return self->_sample;
}

- (NSDate)educationalStepsCompletedDate
{
  return self->_educationalStepsCompletedDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_educationalStepsCompletedDate, 0);
  objc_storeStrong((id *)&self->_sample, 0);
  objc_storeStrong((id *)&self->_behavioralWashoutEndDate, 0);
  objc_storeStrong((id *)&self->_physiologicalWashoutEndDate, 0);
  objc_storeStrong((id *)&self->_trimesters, 0);
  objc_storeStrong((id *)&self->_pregnancyDuration, 0);
  objc_storeStrong((id *)&self->_estimatedDueDate, 0);
  objc_storeStrong((id *)&self->_pregnancyEndDate, 0);

  objc_storeStrong((id *)&self->_pregnancyStartDate, 0);
}

@end