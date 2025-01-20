@interface HKWorkoutActivity
+ (BOOL)supportsSecureCoding;
- (BOOL)_filterAndSetWorkoutEvents:(id)a3;
- (BOOL)_startsPaused;
- (BOOL)acceptsAssociationWithObject:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)unitTest_isEqualToActivity:(id)a3 includingStatistics:(BOOL)a4;
- (HKStatistics)statisticsForType:(HKQuantityType *)quantityType;
- (HKWorkoutActivity)initWithCoder:(id)a3;
- (HKWorkoutActivity)initWithWorkoutConfiguration:(HKWorkoutConfiguration *)workoutConfiguration startDate:(NSDate *)startDate endDate:(NSDate *)endDate metadata:(NSDictionary *)metadata;
- (HKWorkoutConfiguration)workoutConfiguration;
- (NSArray)workoutEvents;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSDictionary)allStatistics;
- (NSDictionary)metadata;
- (NSString)description;
- (NSTimeInterval)duration;
- (NSUUID)UUID;
- (id)_deepCopy;
- (id)_initWithUUID:(id)a3 workoutConfiguration:(id)a4 startDate:(id)a5 endDate:(id)a6 workoutEvents:(id)a7 startsPaused:(BOOL)a8 duration:(double)a9 metadata:(id)a10 statisticsPerType:(id)a11;
- (id)_statisticsPerType;
- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)_enumerateActiveTimePeriods:(id)a3;
- (void)_setAllStatistics:(id)a3;
- (void)_setDuration:(double)a3;
- (void)_setEndDate:(id)a3;
- (void)_setMetadata:(id)a3;
- (void)_setStatistics:(id)a3 forType:(id)a4;
- (void)_setUUID:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKWorkoutActivity

- (HKWorkoutActivity)initWithWorkoutConfiguration:(HKWorkoutConfiguration *)workoutConfiguration startDate:(NSDate *)startDate endDate:(NSDate *)endDate metadata:(NSDictionary *)metadata
{
  v10 = metadata;
  v11 = endDate;
  v12 = startDate;
  v13 = workoutConfiguration;
  v14 = [(HKWorkoutConfiguration *)v13 suggestedActivityUUID];
  v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    id v16 = [MEMORY[0x1E4F29128] UUID];
  }
  v17 = v16;

  [(NSDate *)v11 timeIntervalSinceDate:v12];
  id v18 = -[HKWorkoutActivity _initWithUUID:workoutConfiguration:startDate:endDate:workoutEvents:startsPaused:duration:metadata:statisticsPerType:](self, "_initWithUUID:workoutConfiguration:startDate:endDate:workoutEvents:startsPaused:duration:metadata:statisticsPerType:", v17, v13, v12, v11, MEMORY[0x1E4F1CBF0], 0, v10, 0);

  v19 = (HKWorkoutActivity *)v18;
  uint64_t v20 = HKDefaultObjectValidationConfiguration();
  v22 = -[HKWorkoutActivity _validateWithConfiguration:](v19, "_validateWithConfiguration:", v20, v21);
  v23 = v22;
  if (v22)
  {
    v24 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v25 = *MEMORY[0x1E4F1C3C8];
    v26 = [v22 localizedDescription];
    [v24 raise:v25, @"%@", v26 format];
  }
  return v19;
}

- (id)_initWithUUID:(id)a3 workoutConfiguration:(id)a4 startDate:(id)a5 endDate:(id)a6 workoutEvents:(id)a7 startsPaused:(BOOL)a8 duration:(double)a9 metadata:(id)a10 statisticsPerType:(id)a11
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = a10;
  id v24 = a11;
  v42.receiver = self;
  v42.super_class = (Class)HKWorkoutActivity;
  uint64_t v25 = [(HKWorkoutActivity *)&v42 init];
  v26 = v25;
  if (v25)
  {
    v25->_lock._os_unfair_lock_opaque = 0;
    uint64_t v27 = [v18 copy];
    UUID = v26->_UUID;
    v26->_UUID = (NSUUID *)v27;

    uint64_t v29 = [v19 copy];
    workoutConfiguration = v26->_workoutConfiguration;
    v26->_workoutConfiguration = (HKWorkoutConfiguration *)v29;

    uint64_t v31 = [v20 copy];
    startDate = v26->_startDate;
    v26->_startDate = (NSDate *)v31;

    uint64_t v33 = [v21 copy];
    endDate = v26->_endDate;
    v26->_endDate = (NSDate *)v33;

    uint64_t v35 = [v22 copy];
    workoutEvents = v26->_workoutEvents;
    v26->_workoutEvents = (NSArray *)v35;

    v26->_startsPaused = a8;
    v26->_duration = a9;
    uint64_t v37 = [v23 copy];
    metadata = v26->_metadata;
    v26->_metadata = (NSDictionary *)v37;

    uint64_t v39 = [v24 mutableCopy];
    statisticsPerType = v26->_statisticsPerType;
    v26->_statisticsPerType = (NSMutableDictionary *)v39;
  }
  return v26;
}

- (id)_deepCopy
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithUUID:self->_UUID workoutConfiguration:self->_workoutConfiguration startDate:self->_startDate endDate:self->_endDate workoutEvents:self->_workoutEvents startsPaused:self->_startsPaused duration:self->_duration metadata:self->_metadata statisticsPerType:self->_statisticsPerType];

  return v2;
}

- (void)_setEndDate:(id)a3
{
  id v7 = a3;
  os_unfair_lock_lock(&self->_lock);
  v4 = (NSDate *)[v7 copy];
  endDate = self->_endDate;
  self->_endDate = v4;

  if (self->_duration == 0.0)
  {
    [v7 timeIntervalSinceDate:self->_startDate];
    self->_duration = v6;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSDictionary)allStatistics
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = [(NSMutableDictionary *)self->_statisticsPerType copy];
  v5 = (void *)v4;
  double v6 = (void *)MEMORY[0x1E4F1CC08];
  if (v4) {
    double v6 = (void *)v4;
  }
  id v7 = v6;

  os_unfair_lock_unlock(p_lock);

  return (NSDictionary *)v7;
}

- (HKStatistics)statisticsForType:(HKQuantityType *)quantityType
{
  p_lock = &self->_lock;
  v5 = quantityType;
  os_unfair_lock_lock(p_lock);
  double v6 = [(NSMutableDictionary *)self->_statisticsPerType objectForKeyedSubscript:v5];

  os_unfair_lock_unlock(p_lock);

  return (HKStatistics *)v6;
}

- (void)_setDuration:(double)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_duration = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)_setMetadata:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  double v6 = (NSDictionary *)[v5 copy];

  metadata = self->_metadata;
  self->_metadata = v6;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)_filterAndSetWorkoutEvents:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__HKWorkoutActivity__filterAndSetWorkoutEvents___block_invoke;
  v10[3] = &unk_1E58BF2F8;
  v10[4] = self;
  v10[5] = &v15;
  v10[6] = &v11;
  id v5 = objc_msgSend(v4, "hk_filter:", v10);
  if (!*((unsigned char *)v16 + 24)) {
    self->_startsPaused = *((unsigned char *)v12 + 24);
  }
  workoutEvents = self->_workoutEvents;
  p_workoutEvents = &self->_workoutEvents;
  char v8 = [(NSArray *)workoutEvents isEqual:v5];
  if ((v8 & 1) == 0) {
    objc_storeStrong((id *)p_workoutEvents, v5);
  }

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);

  return v8 ^ 1;
}

uint64_t __48__HKWorkoutActivity__filterAndSetWorkoutEvents___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 dateInterval];
  id v5 = [v4 startDate];

  double v6 = [v3 dateInterval];
  id v7 = [v6 endDate];

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    char v8 = [*(id *)(a1 + 32) startDate];
    int v9 = objc_msgSend(v5, "hk_isAfterDate:", v8);

    if (v9)
    {
      *(unsigned char *)(*(void *)(a1 + 32) + 20) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      v10 = [*(id *)(a1 + 32) startDate];
      int v11 = objc_msgSend(v5, "hk_isBeforeOrEqualToDate:", v10);

      if (v11)
      {
        if ([v3 workoutEventType] == 1)
        {
          char v12 = 1;
        }
        else
        {
          if ([v3 workoutEventType] != 2) {
            goto LABEL_11;
          }
          char v12 = 0;
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v12;
      }
    }
  }
LABEL_11:
  uint64_t v13 = [*(id *)(a1 + 32) endDate];
  if (objc_msgSend(v5, "hk_isBeforeDate:", v13))
  {
    char v14 = [*(id *)(a1 + 32) startDate];
    char v15 = objc_msgSend(v7, "hk_isAfterDate:", v14);

    if (v15)
    {
      uint64_t v16 = 1;
      goto LABEL_21;
    }
  }
  else
  {
  }
  uint64_t v17 = [v3 dateInterval];
  [v17 duration];
  double v19 = v18;

  if (v19 == 0.0)
  {
    id v20 = [*(id *)(a1 + 32) startDate];
    if ([v5 isEqualToDate:v20])
    {
      uint64_t v16 = 1;
    }
    else
    {
      id v21 = [*(id *)(a1 + 32) endDate];
      uint64_t v16 = [v5 isEqualToDate:v21];
    }
  }
  else
  {
    uint64_t v16 = 0;
  }
LABEL_21:

  return v16;
}

- (void)_enumerateActiveTimePeriods:(id)a3
{
}

- (NSString)description
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = NSString;
  id v5 = (objc_class *)objc_opt_class();
  double v6 = NSStringFromClass(v5);
  id v7 = [v4 stringWithFormat:@"<%@ %@ %@ %@ %@>", v6, self->_UUID, self->_workoutConfiguration, self->_startDate, self->_endDate];

  os_unfair_lock_unlock(p_lock);

  return (NSString *)v7;
}

- (unint64_t)hash
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = [(NSUUID *)self->_UUID hash];
  unint64_t v5 = [(HKWorkoutConfiguration *)self->_workoutConfiguration hash] ^ v4;
  uint64_t v6 = [(NSDate *)self->_startDate hash];
  unint64_t v7 = v5 ^ v6 ^ [(NSDate *)self->_endDate hash];
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_18;
  }
  unint64_t v5 = (NSUUID *)*((void *)v4 + 3);
  UUID = self->_UUID;
  if (v5 != UUID && (!UUID || !-[NSUUID isEqual:](v5, "isEqual:"))) {
    goto LABEL_18;
  }
  unint64_t v7 = (HKWorkoutConfiguration *)*((void *)v4 + 4);
  workoutConfiguration = self->_workoutConfiguration;
  if (v7 != workoutConfiguration && (!workoutConfiguration || !-[HKWorkoutConfiguration isEqual:](v7, "isEqual:"))) {
    goto LABEL_18;
  }
  int v9 = (NSDate *)*((void *)v4 + 5);
  startDate = self->_startDate;
  if (v9 != startDate && (!startDate || !-[NSDate isEqualToDate:](v9, "isEqualToDate:"))) {
    goto LABEL_18;
  }
  int v11 = (NSDate *)*((void *)v4 + 6);
  endDate = self->_endDate;
  if (v11 != endDate && (!endDate || !-[NSDate isEqualToDate:](v11, "isEqualToDate:"))) {
    goto LABEL_18;
  }
  if (vabdd_f64(*((double *)v4 + 8), self->_duration) >= 2.22044605e-16) {
    goto LABEL_18;
  }
  uint64_t v13 = (NSDictionary *)*((void *)v4 + 7);
  metadata = self->_metadata;
  if (v13 == metadata)
  {
    char v15 = 1;
    goto LABEL_19;
  }
  if (metadata) {
    char v15 = -[NSDictionary isEqual:](v13, "isEqual:");
  }
  else {
LABEL_18:
  }
    char v15 = 0;
LABEL_19:

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = (NSUUID *)[(NSUUID *)self->_UUID copy];
  UUID = self->_UUID;
  self->_UUID = v3;

  unint64_t v5 = (HKWorkoutConfiguration *)[(HKWorkoutConfiguration *)self->_workoutConfiguration copy];
  workoutConfiguration = self->_workoutConfiguration;
  self->_workoutConfiguration = v5;

  unint64_t v7 = (NSDate *)[(NSDate *)self->_startDate copy];
  startDate = self->_startDate;
  self->_startDate = v7;

  int v9 = (NSDate *)[(NSDate *)self->_endDate copy];
  endDate = self->_endDate;
  self->_endDate = v9;

  int v11 = (NSArray *)[(NSArray *)self->_workoutEvents copy];
  workoutEvents = self->_workoutEvents;
  self->_workoutEvents = v11;

  uint64_t v13 = (NSDictionary *)[(NSDictionary *)self->_metadata copy];
  metadata = self->_metadata;
  self->_metadata = v13;

  char v15 = (NSMutableDictionary *)[(NSMutableDictionary *)self->_statisticsPerType mutableCopy];
  statisticsPerType = self->_statisticsPerType;
  self->_statisticsPerType = v15;

  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  UUID = self->_UUID;
  id v5 = a3;
  [v5 encodeObject:UUID forKey:@"uuid"];
  [v5 encodeObject:self->_workoutConfiguration forKey:@"configuration"];
  [v5 encodeObject:self->_startDate forKey:@"start_date"];
  [v5 encodeObject:self->_endDate forKey:@"end_date"];
  [v5 encodeObject:self->_workoutEvents forKey:@"events"];
  [v5 encodeDouble:@"duration" forKey:self->_duration];
  [v5 encodeObject:self->_metadata forKey:@"metadata"];
  [v5 encodeObject:self->_statisticsPerType forKey:@"statistics"];
  [v5 encodeBool:self->_startsPaused forKey:@"startsPaused"];
}

- (HKWorkoutActivity)initWithCoder:(id)a3
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
  id v23 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"configuration"];
  id v22 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"start_date"];
  id v21 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"end_date"];
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  v26[0] = objc_opt_class();
  v26[1] = objc_opt_class();
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  id v20 = [v5 setWithArray:v6];

  unint64_t v7 = [v3 decodeObjectOfClasses:v20 forKey:@"events"];
  [v3 decodeDoubleForKey:@"duration"];
  double v9 = v8;
  v10 = objc_msgSend(MEMORY[0x1E4F1C9E8], "hk_secureCodingClasses");
  int v11 = [v3 decodeObjectOfClasses:v10 forKey:@"metadata"];
  char v12 = objc_msgSend(v11, "hk_replaceKeysFromSharedStringCache");

  uint64_t v13 = (void *)MEMORY[0x1E4F1CAD0];
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  v25[2] = objc_opt_class();
  char v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:3];
  char v15 = [v13 setWithArray:v14];

  uint64_t v16 = [v3 decodeObjectOfClasses:v15 forKey:@"statistics"];
  uint64_t v17 = [v3 decodeBoolForKey:@"startsPaused"];

  double v18 = [(HKWorkoutActivity *)self _initWithUUID:v4 workoutConfiguration:v23 startDate:v22 endDate:v21 workoutEvents:v7 startsPaused:v17 duration:v9 metadata:v12 statisticsPerType:v16];
  return v18;
}

- (BOOL)unitTest_isEqualToActivity:(id)a3 includingStatistics:(BOOL)a4
{
  BOOL v8 = a4;
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  v81 = (id *)a3;
  BOOL v10 = -[HKWorkoutActivity isEqual:](self, "isEqual:");
  if (v10 && v8)
  {
    int v11 = (void *)[(NSMutableDictionary *)self->_statisticsPerType count];
    char v12 = [v81 _statisticsPerType];
    uint64_t v13 = [v12 count];

    if (v11 == (void *)v13)
    {
      long long v87 = 0u;
      long long v88 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      obj = self->_statisticsPerType;
      uint64_t v79 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v85 objects:v89 count:16];
      if (v79)
      {
        uint64_t v78 = *(void *)v86;
        v69 = self;
LABEL_6:
        uint64_t v14 = 0;
        while (1)
        {
          char v15 = v4;
          uint64_t v16 = v11;
          if (*(void *)v86 != v78) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void *)(*((void *)&v85 + 1) + 8 * v14);
          double v18 = [(NSMutableDictionary *)self->_statisticsPerType objectForKeyedSubscript:v17];
          double v19 = [v81[1] objectForKeyedSubscript:v17];
          v84 = v18;
          uint64_t v20 = [v18 startDate];
          [v19 startDate];
          v82 = id v21 = (void *)v20;
          if (v20 != v82)
          {
            id v5 = [v19 startDate];
            if (!v5)
            {
              LOBYTE(v83) = 1;
              int v11 = v16;
              id v4 = v15;
              v26 = v21;
              uint64_t v31 = (void *)v82;
              goto LABEL_73;
            }
            id v22 = [v84 startDate];
            v76 = [v19 startDate];
            v77 = v22;
            if (!objc_msgSend(v22, "isEqualToDate:"))
            {
              LOBYTE(v83) = 1;
              int v11 = v16;
              id v4 = v15;
              v26 = v21;
              uint64_t v31 = (void *)v82;
LABEL_72:

              goto LABEL_73;
            }
          }
          v80 = v5;
          int v11 = v16;
          id v23 = [v84 endDate];
          uint64_t v24 = [v19 endDate];
          uint64_t v25 = (void *)v24;
          id v4 = v15;
          if (v23 == (void *)v24)
          {
            uint64_t v27 = v11;
            v28 = (void *)v24;
            uint64_t v29 = v23;
            v30 = v4;
            v71 = v21;
          }
          else
          {
            v73 = [v19 endDate];
            if (!v73)
            {

              v73 = 0;
              LOBYTE(v83) = 1;
              v26 = v21;
LABEL_31:
              uint64_t v31 = (void *)v82;
              goto LABEL_71;
            }
            int v11 = [v84 endDate];
            unint64_t v7 = [v19 endDate];
            v26 = v21;
            if (([v11 isEqualToDate:v7] & 1) == 0)
            {

              LOBYTE(v83) = 1;
              goto LABEL_31;
            }
            v71 = v21;
            uint64_t v27 = v11;
            v28 = v25;
            uint64_t v29 = v23;
            v30 = v4;
          }
          uint64_t v32 = [v84 sumQuantity];
          v74 = [v19 sumQuantity];
          v75 = (void *)v32;
          if ((void *)v32 == v74)
          {
            id v4 = v30;
          }
          else
          {
            v67 = [v19 sumQuantity];
            if (!v67)
            {
              id v4 = v30;
              v67 = 0;
              LOBYTE(v83) = 1;
              uint64_t v31 = (void *)v82;
              v34 = v29;
              v36 = v28;
              int v11 = v27;
              v26 = v71;
              goto LABEL_67;
            }
            id v4 = [v84 sumQuantity];
            uint64_t v6 = [v19 sumQuantity];
            if (([v4 isEqual:v6] & 1) == 0)
            {

              if (v29 == v28)
              {

                LOBYTE(v83) = 1;
                uint64_t v31 = (void *)v82;
                BOOL v33 = v71 == (void *)v82;
                self = v69;
                id v5 = v80;
                int v11 = v27;
                v26 = v71;
              }
              else
              {

                int v11 = v27;
                LOBYTE(v83) = 1;
                uint64_t v31 = (void *)v82;
                v26 = v71;
                BOOL v33 = v71 == (void *)v82;
                self = v69;
                id v5 = v80;
              }
              if (v33) {
                goto LABEL_73;
              }
              goto LABEL_72;
            }
          }
          v34 = v29;
          uint64_t v35 = [v84 minimumQuantity];
          [v19 minimumQuantity];
          v66 = v68 = (void *)v35;
          if ((void *)v35 == v66)
          {
            v36 = v28;
            int v11 = v27;
            v26 = v71;
          }
          else
          {
            v61 = [v19 minimumQuantity];
            v36 = v28;
            if (!v61)
            {
              v61 = 0;
              LOBYTE(v83) = 1;
              uint64_t v31 = (void *)v82;
              int v11 = v27;
              v26 = v71;
              goto LABEL_57;
            }
            v64 = v28;
            uint64_t v37 = v7;
            v38 = [v84 minimumQuantity];
            v58 = [v19 minimumQuantity];
            v59 = v38;
            int v11 = v27;
            if (!objc_msgSend(v38, "isEqual:"))
            {
              LOBYTE(v83) = 1;
              unint64_t v7 = v37;
              v26 = v21;
              uint64_t v31 = (void *)v82;
              goto LABEL_62;
            }
            unint64_t v7 = v37;
            v26 = v21;
            v36 = v64;
          }
          uint64_t v39 = [v84 maximumQuantity];
          v62 = [v19 maximumQuantity];
          v63 = (void *)v39;
          BOOL v33 = v39 == (void)v62;
          uint64_t v31 = (void *)v82;
          if (v33)
          {
            v64 = v36;
            v65 = v6;
            v72 = v26;
          }
          else
          {
            v57 = [v19 maximumQuantity];
            if (!v57)
            {
              v60 = v34;

              v57 = 0;
              LOBYTE(v83) = 1;
              v50 = v68;
              v51 = v66;
              if (v68 != v66) {
                goto LABEL_56;
              }
LABEL_65:

              v34 = v60;
              if (v75 == v74) {
                goto LABEL_67;
              }
              goto LABEL_66;
            }
            v64 = v36;
            v65 = v6;
            v72 = v26;
            v40 = [v84 maximumQuantity];
            v53 = [v19 maximumQuantity];
            v54 = v40;
            if (!objc_msgSend(v40, "isEqual:"))
            {
              v60 = v34;
              LOBYTE(v83) = 1;
LABEL_55:
              uint64_t v6 = v65;

              v50 = v68;
              v51 = v66;
              v26 = v72;
              v36 = v64;
              if (v68 == v66) {
                goto LABEL_65;
              }
LABEL_56:

              v34 = v60;
LABEL_57:

              if (v75 == v74)
              {
LABEL_67:

                goto LABEL_68;
              }
LABEL_66:

              goto LABEL_67;
            }
          }
          v55 = v11;
          v56 = v7;
          v41 = v4;
          objc_super v42 = [v84 averageQuantity];
          uint64_t v43 = [v19 averageQuantity];
          v44 = v68;
          if (v42 == (void *)v43) {
            break;
          }
          v45 = (void *)v43;
          uint64_t v46 = [v19 averageQuantity];
          if (!v46)
          {

            LOBYTE(v83) = 1;
            goto LABEL_53;
          }
          v47 = (void *)v46;
          v48 = [v84 averageQuantity];
          v49 = [v19 averageQuantity];
          int v83 = [v48 isEqual:v49] ^ 1;

          if (v63 != v62) {
            goto LABEL_54;
          }
          int v11 = v55;
          id v4 = v41;
          v44 = v68;
LABEL_60:

          v51 = v66;
          unint64_t v7 = v56;
          if (v44 == v66)
          {
            v60 = v34;
            v36 = v64;
            uint64_t v6 = v65;
            v26 = v72;
            v50 = v68;
            goto LABEL_65;
          }
          uint64_t v6 = v65;
          v26 = v72;
LABEL_62:

          v36 = v64;
          if (v75 != v74) {
            goto LABEL_66;
          }

          v36 = v64;
LABEL_68:
          if (v34 != v36)
          {
          }
LABEL_71:
          self = v69;
          id v5 = v80;
          if (v26 != v31) {
            goto LABEL_72;
          }
LABEL_73:

          if (v83)
          {
            LOBYTE(v10) = 0;
            goto LABEL_79;
          }
          if (v79 == ++v14)
          {
            uint64_t v79 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v85 objects:v89 count:16];
            if (v79) {
              goto LABEL_6;
            }
            goto LABEL_76;
          }
        }

        LOBYTE(v83) = 0;
LABEL_53:
        if (v63 != v62)
        {
LABEL_54:
          v60 = v34;
          id v4 = v41;
          int v11 = v55;
          unint64_t v7 = v56;
          goto LABEL_55;
        }
        int v11 = v55;
        id v4 = v41;
        goto LABEL_60;
      }
LABEL_76:
      LOBYTE(v10) = 1;
LABEL_79:
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }

  return v10;
}

- (BOOL)acceptsAssociationWithObject:(id)a3
{
  id v3 = a3;
  id v4 = +[HKObjectType quantityTypeForIdentifier:@"HKQuantityTypeIdentifierWorkoutEffortScore"];
  id v5 = +[HKObjectType quantityTypeForIdentifier:@"HKQuantityTypeIdentifierEstimatedWorkoutEffortScore"];
  uint64_t v6 = [v3 sampleType];
  if ([v6 isEqual:v4])
  {
    char v7 = 1;
  }
  else
  {
    BOOL v8 = [v3 sampleType];
    char v7 = [v8 isEqual:v5];
  }
  return v7;
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  char var0 = a3.var0;
  if (-[NSDate hk_isBeforeDate:](self->_endDate, "hk_isBeforeDate:", self->_startDate, a3.var1))
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 3, @"startDate (%@) cannot occur after endDate (%@)", self->_startDate, self->_endDate);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    workoutConfiguration = self->_workoutConfiguration;
    id v18 = 0;
    BOOL v7 = [(HKWorkoutConfiguration *)workoutConfiguration validateIgnoringDeviceSupport:1 error:&v18];
    id v8 = v18;
    double v9 = v8;
    if (v7)
    {
      id v5 = 0;
      if (self->_metadata)
      {
        if ((var0 & 8) == 0)
        {
          uint64_t v10 = HKApplicationSDKVersionToken();
          int v11 = +[_HKEntitlements entitlementsForCurrentTaskWithError:0];
          uint64_t v12 = [v11 hasPrivateMetadataAccess];

          metadata = self->_metadata;
          id v17 = 0;
          BOOL v14 = [(NSDictionary *)metadata hk_validateMetadataKeysAndValuesAllowingPrivateMetadataKeys:v12 applicationSDKVersionToken:v10 error:&v17];
          id v15 = v17;
          id v5 = v15;
          if (v14)
          {

            id v5 = 0;
          }
        }
      }
    }
    else
    {
      id v5 = v8;
    }
  }

  return v5;
}

- (id)_statisticsPerType
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_statisticsPerType;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)_setAllStatistics:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  uint64_t v6 = (NSMutableDictionary *)[v5 mutableCopy];

  statisticsPerType = self->_statisticsPerType;
  self->_statisticsPerType = v6;

  os_unfair_lock_unlock(p_lock);
}

- (void)_setStatistics:(id)a3 forType:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  os_unfair_lock_lock(&self->_lock);
  statisticsPerType = self->_statisticsPerType;
  if (!statisticsPerType)
  {
    id v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    double v9 = self->_statisticsPerType;
    self->_statisticsPerType = v8;

    statisticsPerType = self->_statisticsPerType;
  }
  [(NSMutableDictionary *)statisticsPerType setObject:v10 forKeyedSubscript:v6];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_setUUID:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = (NSUUID *)[v5 copy];

  UUID = self->_UUID;
  self->_UUID = v6;

  os_unfair_lock_unlock(p_lock);
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (HKWorkoutConfiguration)workoutConfiguration
{
  return (HKWorkoutConfiguration *)objc_getProperty(self, a2, 32, 1);
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (NSDate)endDate
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (NSTimeInterval)duration
{
  return self->_duration;
}

- (NSArray)workoutEvents
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (BOOL)_startsPaused
{
  return self->_startsPaused;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutEvents, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_workoutConfiguration, 0);
  objc_storeStrong((id *)&self->_UUID, 0);

  objc_storeStrong((id *)&self->_statisticsPerType, 0);
}

@end