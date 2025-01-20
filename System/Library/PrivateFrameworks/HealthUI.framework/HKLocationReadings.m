@interface HKLocationReadings
+ (BOOL)supportsSecureCoding;
- (BOOL)isSmoothed;
- (HKLocationReadings)initWithCoder:(id)a3;
- (HKLocationReadings)initWithLocation:(id)a3 workout:(id)a4;
- (HKLocationReadings)initWithLocations:(id)a3 workout:(id)a4 isSmoothed:(BOOL)a5;
- (HKWorkout)workout;
- (NSArray)allValidLocations;
- (NSArray)inOrderLocationArrays;
- (double)averageSpeed;
- (double)bottomSpeed;
- (double)topSpeed;
- (id)debugDescription;
- (id)description;
- (id)firstObject;
- (id)lastObject;
- (int64_t)count;
- (void)_calculateSpeeds;
- (void)_filterLocationsByActiveTimePeriod:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKLocationReadings

- (HKLocationReadings)initWithLocations:(id)a3 workout:(id)a4 isSmoothed:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HKLocationReadings;
  v10 = [(HKLocationReadings *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_workout, a4);
    v11->_isSmoothed = a5;
    [(HKLocationReadings *)v11 _filterLocationsByActiveTimePeriod:v8];
    [(HKLocationReadings *)v11 _calculateSpeeds];
  }

  return v11;
}

- (HKLocationReadings)initWithLocation:(id)a3 workout:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKLocationReadings;
  id v8 = [(HKLocationReadings *)&v12 init];
  if (v8)
  {
    v13[0] = v6;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    allValidLocations = v8->_allValidLocations;
    v8->_allValidLocations = (NSArray *)v9;

    objc_storeStrong((id *)&v8->_workout, a4);
  }

  return v8;
}

- (id)debugDescription
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28E78] string];
  objc_msgSend(v3, "appendFormat:", @"Locations count: %zd.", -[HKLocationReadings count](self, "count"));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = [(HKLocationReadings *)self inOrderLocationArrays];
  uint64_t v21 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v21)
  {
    uint64_t v4 = 0;
    uint64_t v20 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v24 != v20) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        [v3 appendFormat:@"---- paused."];
        if ([v6 count])
        {
          uint64_t v22 = i;
          unint64_t v7 = 0;
          do
          {
            id v8 = [v6 objectAtIndexedSubscript:v7];
            uint64_t v9 = [(HKLocationReadings *)self allValidLocations];
            v10 = [v9 objectAtIndexedSubscript:v4 + v7];

            [v8 coordinate];
            uint64_t v12 = v11;
            [v8 coordinate];
            uint64_t v14 = v13;
            [v10 coordinate];
            uint64_t v16 = v15;
            [v10 coordinate];
            objc_msgSend(v3, "appendFormat:", @"%zd. %zd. from (%f,%f) vs (%f,%f).", v7, v4 + v7, v12, v14, v16, v17);

            ++v7;
          }
          while (v7 < [v6 count]);
          v4 += v7;
          uint64_t i = v22;
        }
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v21);
  }

  return v3;
}

- (id)description
{
  v3 = NSString;
  NSUInteger v4 = [(NSArray *)self->_allValidLocations count];
  if ([(HKLocationReadings *)self isSmoothed]) {
    v5 = @"smoothed ";
  }
  else {
    v5 = &stru_1F3B9CF20;
  }
  v9.receiver = self;
  v9.super_class = (Class)HKLocationReadings;
  id v6 = [(HKLocationReadings *)&v9 description];
  unint64_t v7 = [v3 stringWithFormat:@"(%zd %@locations) %@", v4, v5, v6];

  return v7;
}

- (void)_calculateSpeeds
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)&self->_topSpeed = xmmword_1E0F05450;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v3 = self->_allValidLocations;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v4)
  {

LABEL_17:
    double v17 = 0.0;
    goto LABEL_18;
  }
  uint64_t v5 = v4;
  uint64_t v6 = 0;
  uint64_t v7 = *(void *)v19;
  double v8 = 0.0;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v19 != v7) {
        objc_enumerationMutation(v3);
      }
      v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
      objc_msgSend(v10, "speed", (void)v18);
      if (v11 >= 0.0)
      {
        [v10 speed];
        if (v12 > self->_topSpeed)
        {
          [v10 speed];
          self->_topSpeed = v13;
        }
        [v10 speed];
        if (v14 < self->_bottomSpeed)
        {
          [v10 speed];
          self->_bottomSpeed = v15;
        }
        [v10 speed];
        double v8 = v8 + v16;
        ++v6;
      }
    }
    uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  }
  while (v5);

  if (v6 < 1) {
    goto LABEL_17;
  }
  double v17 = v8 / (double)v6;
LABEL_18:
  self->_averageSpeed = v17;
}

- (void)_filterLocationsByActiveTimePeriod:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  workout = self->_workout;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __57__HKLocationReadings__filterLocationsByActiveTimePeriod___block_invoke;
  v15[3] = &unk_1E6D519E0;
  long long v20 = &v21;
  id v8 = v4;
  id v16 = v8;
  id v9 = v6;
  id v17 = v9;
  id v10 = v5;
  id v18 = v10;
  long long v19 = self;
  [(HKWorkout *)workout _enumerateActiveTimePeriods:v15];
  objc_storeStrong((id *)&self->_inOrderLocationArrays, v6);
  objc_storeStrong((id *)&self->_allValidLocations, v5);
  _HKInitializeLogging();
  double v11 = (id)*MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v12 = [(HKLocationReadings *)self count];
    uint64_t v13 = v22[3];
    double v14 = [(HKWorkout *)self->_workout UUID];
    *(_DWORD *)buf = 134218498;
    int64_t v26 = v12;
    __int16 v27 = 2048;
    uint64_t v28 = v13;
    __int16 v29 = 2112;
    v30 = v14;
    _os_log_impl(&dword_1E0B26000, v11, OS_LOG_TYPE_DEFAULT, "[routes] HKLocationReadings: %ld locations are within the %ld active periods for workout ID %@", buf, 0x20u);
  }
  _Block_object_dispose(&v21, 8);
}

void __57__HKLocationReadings__filterLocationsByActiveTimePeriod___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  uint64_t v7 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  uint64_t v21 = __57__HKLocationReadings__filterLocationsByActiveTimePeriod___block_invoke_2;
  uint64_t v22 = &unk_1E6D519B8;
  id v8 = v5;
  id v23 = v8;
  id v9 = v6;
  id v24 = v9;
  id v10 = [v7 predicateWithBlock:&v19];
  double v11 = objc_msgSend(*(id *)(a1 + 32), "filteredArrayUsingPredicate:", v10, v19, v20, v21, v22);
  if ([v11 count])
  {
    [*(id *)(a1 + 40) addObject:v11];
    [*(id *)(a1 + 48) addObjectsFromArray:v11];
  }
  uint64_t v12 = [*(id *)(a1 + 32) count];
  uint64_t v13 = v12 - [v11 count];
  if (v13 >= 1)
  {
    _HKInitializeLogging();
    double v14 = (void *)*MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      id v16 = *(void **)(*(void *)(a1 + 56) + 16);
      id v17 = v14;
      id v18 = [v16 UUID];
      *(_DWORD *)buf = 134219010;
      uint64_t v26 = v13;
      __int16 v27 = 2048;
      uint64_t v28 = v15;
      __int16 v29 = 2112;
      id v30 = v8;
      __int16 v31 = 2112;
      id v32 = v9;
      __int16 v33 = 2112;
      v34 = v18;
      _os_log_impl(&dword_1E0B26000, v17, OS_LOG_TYPE_DEFAULT, "[routes] HKLocationReadings: %ld locations are out of range for active workout period %ld (%@ - %@) and have been filtered out for workout ID %@", buf, 0x34u);
    }
  }
}

BOOL __57__HKLocationReadings__filterLocationsByActiveTimePeriod___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 timestamp];
  [v3 timeIntervalSinceReferenceDate];
  double v5 = v4;

  [*(id *)(a1 + 32) timeIntervalSinceReferenceDate];
  if (v5 < v6) {
    return 0;
  }
  [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
  return v5 <= v8;
}

- (int64_t)count
{
  return [(NSArray *)self->_allValidLocations count];
}

- (id)firstObject
{
  return [(NSArray *)self->_allValidLocations firstObject];
}

- (id)lastObject
{
  return [(NSArray *)self->_allValidLocations lastObject];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL isSmoothed = self->_isSmoothed;
  id v5 = a3;
  [v5 encodeBool:isSmoothed forKey:@"isSmoothed"];
  [v5 encodeObject:self->_workout forKey:@"workout"];
  [v5 encodeObject:self->_allValidLocations forKey:@"allValidLocations"];
  [v5 encodeObject:self->_inOrderLocationArrays forKey:@"inOrderLocationArrays"];
  [v5 encodeDouble:@"averageSpeed" forKey:self->_averageSpeed];
  [v5 encodeDouble:@"topSpeed" forKey:self->_topSpeed];
  [v5 encodeDouble:@"bottomSpeed" forKey:self->_bottomSpeed];
}

- (HKLocationReadings)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)HKLocationReadings;
  id v5 = [(HKLocationReadings *)&v23 init];
  if (v5)
  {
    v5->_BOOL isSmoothed = [v4 decodeBoolForKey:@"isSmoothed"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"workout"];
    workout = v5->_workout;
    v5->_workout = (HKWorkout *)v6;

    double v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    id v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"allValidLocations"];
    allValidLocations = v5->_allValidLocations;
    v5->_allValidLocations = (NSArray *)v11;

    uint64_t v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    id v16 = objc_msgSend(v13, "setWithObjects:", v14, v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"inOrderLocationArrays"];
    inOrderLocationArrays = v5->_inOrderLocationArrays;
    v5->_inOrderLocationArrays = (NSArray *)v17;

    [v4 decodeDoubleForKey:@"averageSpeed"];
    v5->_averageSpeed = v19;
    [v4 decodeDoubleForKey:@"topSpeed"];
    v5->_topSpeed = v20;
    [v4 decodeDoubleForKey:@"bottomSpeed"];
    v5->_bottomSpeed = v21;
  }

  return v5;
}

- (BOOL)isSmoothed
{
  return self->_isSmoothed;
}

- (HKWorkout)workout
{
  return self->_workout;
}

- (NSArray)allValidLocations
{
  return self->_allValidLocations;
}

- (NSArray)inOrderLocationArrays
{
  return self->_inOrderLocationArrays;
}

- (double)averageSpeed
{
  return self->_averageSpeed;
}

- (double)topSpeed
{
  return self->_topSpeed;
}

- (double)bottomSpeed
{
  return self->_bottomSpeed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inOrderLocationArrays, 0);
  objc_storeStrong((id *)&self->_allValidLocations, 0);
  objc_storeStrong((id *)&self->_workout, 0);
}

@end