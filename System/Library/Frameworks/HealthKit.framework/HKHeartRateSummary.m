@interface HKHeartRateSummary
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKHeartRateSummary)initWithActivityCacheIndex:(int64_t)a3 heartRateDateInterval:(id)a4 restingHeartRate:(id)a5 walkingAverageHeartRate:(id)a6 allDayStatistics:(id)a7 workoutStatistics:(id)a8 workoutRecoveryStatistics:(id)a9 breatheStatistics:(id)a10;
- (HKHeartRateSummary)initWithCoder:(id)a3;
- (HKHeartRateSummaryStatistics)allDayStatistics;
- (HKQuantity)restingHeartRate;
- (HKQuantity)walkingAverageHeartRate;
- (NSArray)breatheStatistics;
- (NSArray)workoutRecoveryStatistics;
- (NSArray)workoutStatistics;
- (NSDateInterval)heartRateDateInterval;
- (id)deepCopy;
- (id)description;
- (int64_t)activityCacheIndex;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setActivityCacheIndex:(int64_t)a3;
- (void)setAllDayStatistics:(id)a3;
- (void)setBreatheStatistics:(id)a3;
- (void)setHeartRateDateInterval:(id)a3;
- (void)setRestingHeartRate:(id)a3;
- (void)setWalkingAverageHeartRate:(id)a3;
- (void)setWorkoutRecoveryStatistics:(id)a3;
- (void)setWorkoutStatistics:(id)a3;
@end

@implementation HKHeartRateSummary

- (int64_t)activityCacheIndex
{
  return self->_activityCacheIndex;
}

- (HKHeartRateSummary)initWithActivityCacheIndex:(int64_t)a3 heartRateDateInterval:(id)a4 restingHeartRate:(id)a5 walkingAverageHeartRate:(id)a6 allDayStatistics:(id)a7 workoutStatistics:(id)a8 workoutRecoveryStatistics:(id)a9 breatheStatistics:(id)a10
{
  id v32 = a4;
  id v31 = a5;
  id v30 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  v33.receiver = self;
  v33.super_class = (Class)HKHeartRateSummary;
  v21 = [(HKHeartRateSummary *)&v33 init];
  v22 = v21;
  if (v21)
  {
    v21->_activityCacheIndex = a3;
    objc_storeStrong((id *)&v21->_heartRateDateInterval, a4);
    objc_storeStrong((id *)&v22->_restingHeartRate, a5);
    objc_storeStrong((id *)&v22->_walkingAverageHeartRate, a6);
    objc_storeStrong((id *)&v22->_allDayStatistics, a7);
    uint64_t v23 = [v18 copy];
    workoutStatistics = v22->_workoutStatistics;
    v22->_workoutStatistics = (NSArray *)v23;

    uint64_t v25 = [v19 copy];
    workoutRecoveryStatistics = v22->_workoutRecoveryStatistics;
    v22->_workoutRecoveryStatistics = (NSArray *)v25;

    uint64_t v27 = [v20 copy];
    breatheStatistics = v22->_breatheStatistics;
    v22->_breatheStatistics = (NSArray *)v27;
  }
  return v22;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (HKHeartRateSummary *)a3;
  if (self == v6)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v7 = [(HKHeartRateSummary *)self activityCacheIndex];
      if (v7 == [(HKHeartRateSummary *)v6 activityCacheIndex])
      {
        v8 = [(HKHeartRateSummary *)self heartRateDateInterval];
        uint64_t v9 = [(HKHeartRateSummary *)v6 heartRateDateInterval];
        BOOL v10 = v8 != (void *)v9;
        if (v8 != (void *)v9)
        {
          v3 = [(HKHeartRateSummary *)v6 heartRateDateInterval];
          if (!v3)
          {
            char v13 = 0;
LABEL_83:

            goto LABEL_84;
          }
          v11 = [(HKHeartRateSummary *)self heartRateDateInterval];
          v12 = [(HKHeartRateSummary *)v6 heartRateDateInterval];
          if (![v11 isEqual:v12])
          {
            char v13 = 0;
LABEL_41:

            goto LABEL_83;
          }
          v84 = v12;
          v85 = v11;
        }
        v14 = [(HKHeartRateSummary *)self restingHeartRate];
        v15 = [(HKHeartRateSummary *)v6 restingHeartRate];
        if (v14 == v15)
        {
          BOOL v80 = 0;
        }
        else
        {
          uint64_t v16 = [(HKHeartRateSummary *)v6 restingHeartRate];
          if (!v16)
          {

            char v13 = 0;
            if (v8 == (void *)v9)
            {
              BOOL v10 = 0;
              goto LABEL_82;
            }
            BOOL v10 = 1;
LABEL_81:

LABEL_82:
            if (v10) {
              goto LABEL_83;
            }
LABEL_84:
            v52 = (void *)v9;
LABEL_85:

            goto LABEL_86;
          }
          v82 = (void *)v16;
          v4 = [(HKHeartRateSummary *)self restingHeartRate];
          v83 = [(HKHeartRateSummary *)v6 restingHeartRate];
          if (!objc_msgSend(v4, "isEqual:"))
          {
            char v13 = 0;
LABEL_40:

            v12 = v84;
            v11 = v85;
            if (v8 == (void *)v9) {
              goto LABEL_84;
            }
            goto LABEL_41;
          }
          BOOL v80 = v14 != v15;
        }
        uint64_t v17 = [(HKHeartRateSummary *)self walkingAverageHeartRate];
        [(HKHeartRateSummary *)v6 walkingAverageHeartRate];
        v87 = v86 = (void *)v17;
        BOOL v18 = v17 == (void)v87;
        BOOL v19 = v17 != (void)v87;
        if (v18)
        {
          BOOL v75 = v19;
          v77 = v4;
        }
        else
        {
          uint64_t v20 = [(HKHeartRateSummary *)v6 walkingAverageHeartRate];
          if (!v20)
          {

            char v13 = 0;
            if (v14 != v15)
            {
              LOBYTE(v29) = 1;
              goto LABEL_78;
            }
            BOOL v29 = 0;
LABEL_87:
            if (!v29)
            {
LABEL_80:

              if (v8 == (void *)v9) {
                goto LABEL_82;
              }
              goto LABEL_81;
            }
LABEL_79:

            goto LABEL_80;
          }
          BOOL v75 = v19;
          v72 = (void *)v20;
          v21 = [(HKHeartRateSummary *)self walkingAverageHeartRate];
          v73 = [(HKHeartRateSummary *)v6 walkingAverageHeartRate];
          v74 = v21;
          if (!objc_msgSend(v21, "isEqual:"))
          {
            v78 = v15;
            char v13 = 0;
            v28 = v86;
LABEL_39:

            v15 = v78;
            if (v14 == v78) {
              goto LABEL_80;
            }
            goto LABEL_40;
          }
          v77 = v4;
        }
        v22 = [(HKHeartRateSummary *)self allDayStatistics];
        v79 = [(HKHeartRateSummary *)v6 allDayStatistics];
        BOOL v23 = v22 != v79;
        if (v22 == v79)
        {
          v70 = v14;
          uint64_t v25 = v3;
          BOOL v26 = v8 != (void *)v9;
        }
        else
        {
          uint64_t v24 = [(HKHeartRateSummary *)v6 allDayStatistics];
          if (!v24)
          {

            char v13 = 0;
            v28 = v86;
            v4 = v77;
            v78 = v15;
            if (v86 != v87)
            {
              LOBYTE(v34) = 1;
              goto LABEL_75;
            }
            BOOL v34 = 0;
LABEL_89:
            if (!v34)
            {
LABEL_77:

              v15 = v78;
              BOOL v29 = v80;
              if (v14 != v78)
              {
LABEL_78:

                if (!v29) {
                  goto LABEL_80;
                }
                goto LABEL_79;
              }
              goto LABEL_87;
            }
LABEL_76:

            goto LABEL_77;
          }
          v70 = v14;
          uint64_t v25 = v3;
          BOOL v26 = v8 != (void *)v9;
          v65 = (void *)v24;
          uint64_t v27 = [(HKHeartRateSummary *)self allDayStatistics];
          v66 = [(HKHeartRateSummary *)v6 allDayStatistics];
          v67 = v27;
          if (!objc_msgSend(v27, "isEqual:"))
          {
            v78 = v15;
            v76 = v22;
            char v13 = 0;
            v28 = v86;
            BOOL v10 = v8 != (void *)v9;
            v3 = v25;
            v14 = v70;
            goto LABEL_28;
          }
        }
        uint64_t v30 = [(HKHeartRateSummary *)self workoutStatistics];
        v68 = [(HKHeartRateSummary *)v6 workoutStatistics];
        v69 = (void *)v30;
        v76 = v22;
        if ((void *)v30 == v68)
        {
          BOOL v10 = v26;
          v3 = v25;
        }
        else
        {
          uint64_t v31 = [(HKHeartRateSummary *)v6 workoutStatistics];
          BOOL v10 = v26;
          if (!v31)
          {
            v78 = v15;

            v41 = v22;
            char v13 = 0;
            v28 = v86;
            v3 = v25;
            v14 = v70;
            if (v41 != v79) {
              goto LABEL_69;
            }
            goto LABEL_72;
          }
          v63 = (void *)v31;
          id v32 = [(HKHeartRateSummary *)self workoutStatistics];
          v61 = [(HKHeartRateSummary *)v6 workoutStatistics];
          v3 = v25;
          v62 = v32;
          if (!objc_msgSend(v32, "isEqual:"))
          {
            char v13 = 0;
            v28 = v86;
            v14 = v70;
            objc_super v33 = v68;
LABEL_67:

            v78 = v15;
            if (v76 != v79)
            {
              LOBYTE(v23) = 1;
LABEL_69:

              if (!v23) {
                goto LABEL_74;
              }
LABEL_73:

              goto LABEL_74;
            }
            BOOL v23 = 0;
LABEL_72:
            if (!v23) {
              goto LABEL_74;
            }
            goto LABEL_73;
          }
        }
        v35 = [(HKHeartRateSummary *)self workoutRecoveryStatistics];
        v64 = [(HKHeartRateSummary *)v6 workoutRecoveryStatistics];
        if (v35 == v64)
        {
          v14 = v70;
          [(HKHeartRateSummary *)self breatheStatistics];
        }
        else
        {
          uint64_t v36 = [(HKHeartRateSummary *)v6 workoutRecoveryStatistics];
          v14 = v70;
          if (!v36)
          {
            char v13 = 0;
            goto LABEL_66;
          }
          v60 = (void *)v36;
          v57 = v35;
          uint64_t v37 = [(HKHeartRateSummary *)self workoutRecoveryStatistics];
          uint64_t v38 = [(HKHeartRateSummary *)v6 workoutRecoveryStatistics];
          v59 = (void *)v37;
          v39 = (void *)v37;
          v40 = (void *)v38;
          if (([v39 isEqual:v38] & 1) == 0)
          {

            char v13 = 0;
            v49 = v68;
            v50 = v69;
            v51 = v87;
            if (v69 != v68)
            {
LABEL_96:
            }
LABEL_97:

            if (v76 != v79)
            {
            }
            if (v86 != v51)
            {
            }
            if (v14 != v15)
            {
            }
            v52 = v8;
            v12 = v84;
            v11 = v85;
            if (v8 == (void *)v9) {
              goto LABEL_85;
            }
            goto LABEL_41;
          }
          v55 = v40;
          v35 = v57;
          [(HKHeartRateSummary *)self breatheStatistics];
        uint64_t v42 = };
        uint64_t v43 = [(HKHeartRateSummary *)v6 breatheStatistics];
        v44 = (void *)v42;
        char v13 = v42 == v43;
        if (v13)
        {
          v48 = v44;
        }
        else
        {
          v58 = (void *)v43;
          v71 = v44;
          uint64_t v45 = [(HKHeartRateSummary *)v6 breatheStatistics];
          if (v45)
          {
            v81 = (void *)v45;
            v46 = [(HKHeartRateSummary *)self breatheStatistics];
            v47 = [(HKHeartRateSummary *)v6 breatheStatistics];
            char v13 = [v46 isEqual:v47];

            if (v35 == v64)
            {
            }
            else
            {
            }
            v49 = v68;
            v50 = v69;
            v51 = v87;
            if (v69 != v68) {
              goto LABEL_96;
            }
            goto LABEL_97;
          }
        }
        if (v35 == v64)
        {

          objc_super v33 = v68;
          v28 = v86;
          if (v69 != v68) {
            goto LABEL_67;
          }
          goto LABEL_92;
        }

LABEL_66:
        v28 = v86;

        objc_super v33 = v68;
        if (v69 != v68) {
          goto LABEL_67;
        }
LABEL_92:
        v78 = v15;

        if (v76 != v79)
        {
LABEL_28:

          v4 = v77;
          if (v28 == v87) {
            goto LABEL_77;
          }
          goto LABEL_39;
        }
LABEL_74:

        v4 = v77;
        BOOL v34 = v75;
        if (v28 != v87)
        {
LABEL_75:

          if (!v34) {
            goto LABEL_77;
          }
          goto LABEL_76;
        }
        goto LABEL_89;
      }
    }
    char v13 = 0;
  }
LABEL_86:

  return v13;
}

- (NSDateInterval)heartRateDateInterval
{
  return self->_heartRateDateInterval;
}

- (HKQuantity)restingHeartRate
{
  return self->_restingHeartRate;
}

- (HKQuantity)walkingAverageHeartRate
{
  return self->_walkingAverageHeartRate;
}

- (HKHeartRateSummaryStatistics)allDayStatistics
{
  return self->_allDayStatistics;
}

- (NSArray)workoutStatistics
{
  return self->_workoutStatistics;
}

- (NSArray)workoutRecoveryStatistics
{
  return self->_workoutRecoveryStatistics;
}

- (NSArray)breatheStatistics
{
  return self->_breatheStatistics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_breatheStatistics, 0);
  objc_storeStrong((id *)&self->_workoutRecoveryStatistics, 0);
  objc_storeStrong((id *)&self->_workoutStatistics, 0);
  objc_storeStrong((id *)&self->_allDayStatistics, 0);
  objc_storeStrong((id *)&self->_walkingAverageHeartRate, 0);
  objc_storeStrong((id *)&self->_restingHeartRate, 0);

  objc_storeStrong((id *)&self->_heartRateDateInterval, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t activityCacheIndex = self->_activityCacheIndex;
  id v5 = a3;
  [v5 encodeInt64:activityCacheIndex forKey:@"ActivityCacheIndex"];
  [v5 encodeObject:self->_heartRateDateInterval forKey:@"HeartRateDateInterval"];
  [v5 encodeObject:self->_restingHeartRate forKey:@"RestingHeartRate"];
  [v5 encodeObject:self->_walkingAverageHeartRate forKey:@"WalkingAverageHeartRate"];
  [v5 encodeObject:self->_allDayStatistics forKey:@"AllDayStatistics"];
  [v5 encodeObject:self->_workoutStatistics forKey:@"WorkoutStatistics"];
  [v5 encodeObject:self->_workoutRecoveryStatistics forKey:@"RecoveryStatistics"];
  [v5 encodeObject:self->_breatheStatistics forKey:@"BreatheStatistics"];
}

- (HKHeartRateSummary)initWithCoder:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)HKHeartRateSummary;
  id v5 = [(HKHeartRateSummary *)&v30 init];
  if (v5)
  {
    v5->_int64_t activityCacheIndex = [v4 decodeInt64ForKey:@"ActivityCacheIndex"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HeartRateDateInterval"];
    heartRateDateInterval = v5->_heartRateDateInterval;
    v5->_heartRateDateInterval = (NSDateInterval *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RestingHeartRate"];
    restingHeartRate = v5->_restingHeartRate;
    v5->_restingHeartRate = (HKQuantity *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WalkingAverageHeartRate"];
    walkingAverageHeartRate = v5->_walkingAverageHeartRate;
    v5->_walkingAverageHeartRate = (HKQuantity *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AllDayStatistics"];
    allDayStatistics = v5->_allDayStatistics;
    v5->_allDayStatistics = (HKHeartRateSummaryStatistics *)v12;

    v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"WorkoutStatistics"];
    workoutStatistics = v5->_workoutStatistics;
    v5->_workoutStatistics = (NSArray *)v17;

    BOOL v19 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v20 = objc_opt_class();
    v21 = objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"RecoveryStatistics"];
    workoutRecoveryStatistics = v5->_workoutRecoveryStatistics;
    v5->_workoutRecoveryStatistics = (NSArray *)v22;

    uint64_t v24 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v25 = objc_opt_class();
    BOOL v26 = objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
    uint64_t v27 = [v4 decodeObjectOfClasses:v26 forKey:@"BreatheStatistics"];
    breatheStatistics = v5->_breatheStatistics;
    v5->_breatheStatistics = (NSArray *)v27;
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [NSNumber numberWithLongLong:self->_activityCacheIndex];
  restingHeartRate = self->_restingHeartRate;
  int64_t v7 = +[HKUnit _countPerMinuteUnit];
  [(HKQuantity *)restingHeartRate doubleValueForUnit:v7];
  uint64_t v9 = v8;
  walkingAverageHeartRate = self->_walkingAverageHeartRate;
  v11 = +[HKUnit _countPerMinuteUnit];
  [(HKQuantity *)walkingAverageHeartRate doubleValueForUnit:v11];
  char v13 = [v3 stringWithFormat:@"<%@:%p cacheIndex:%@ resting:%.1fbpm walking:%.1fbpm day:%@ workout:%@ recovery:%@ breathe:%@>", v4, self, v5, v9, v12, self->_allDayStatistics, self->_workoutStatistics, self->_workoutRecoveryStatistics, self->_breatheStatistics];

  return v13;
}

- (unint64_t)hash
{
  int64_t activityCacheIndex = self->_activityCacheIndex;
  uint64_t v4 = [(HKHeartRateSummary *)self heartRateDateInterval];
  uint64_t v5 = [v4 hash];
  uint64_t v6 = [(HKHeartRateSummary *)self restingHeartRate];
  uint64_t v7 = v5 ^ [v6 hash];
  uint64_t v8 = [(HKHeartRateSummary *)self walkingAverageHeartRate];
  uint64_t v9 = v7 ^ [v8 hash] ^ activityCacheIndex;
  uint64_t v10 = [(HKHeartRateSummary *)self allDayStatistics];
  uint64_t v11 = [v10 hash];
  uint64_t v12 = [(HKHeartRateSummary *)self workoutStatistics];
  uint64_t v13 = v11 ^ [v12 hash];
  v14 = [(HKHeartRateSummary *)self workoutRecoveryStatistics];
  uint64_t v15 = v13 ^ [v14 hash];
  uint64_t v16 = [(HKHeartRateSummary *)self breatheStatistics];
  unint64_t v17 = v9 ^ v15 ^ [v16 hash];

  return v17;
}

- (id)deepCopy
{
  v3 = [(NSArray *)self->_workoutStatistics hk_map:&__block_literal_global_133];
  uint64_t v4 = [(NSArray *)self->_workoutRecoveryStatistics hk_map:&__block_literal_global_44_2];
  uint64_t v5 = [(NSArray *)self->_breatheStatistics hk_map:&__block_literal_global_47];
  uint64_t v6 = [HKHeartRateSummary alloc];
  int64_t activityCacheIndex = self->_activityCacheIndex;
  heartRateDateInterval = self->_heartRateDateInterval;
  restingHeartRate = self->_restingHeartRate;
  walkingAverageHeartRate = self->_walkingAverageHeartRate;
  uint64_t v11 = (void *)[(HKHeartRateSummaryStatistics *)self->_allDayStatistics copy];
  uint64_t v12 = [(HKHeartRateSummary *)v6 initWithActivityCacheIndex:activityCacheIndex heartRateDateInterval:heartRateDateInterval restingHeartRate:restingHeartRate walkingAverageHeartRate:walkingAverageHeartRate allDayStatistics:v11 workoutStatistics:v3 workoutRecoveryStatistics:v4 breatheStatistics:v5];

  return v12;
}

id __30__HKHeartRateSummary_deepCopy__block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)[a2 copy];

  return v2;
}

id __30__HKHeartRateSummary_deepCopy__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (void *)[a2 copy];

  return v2;
}

id __30__HKHeartRateSummary_deepCopy__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (void *)[a2 copy];

  return v2;
}

- (void)setActivityCacheIndex:(int64_t)a3
{
  self->_int64_t activityCacheIndex = a3;
}

- (void)setHeartRateDateInterval:(id)a3
{
}

- (void)setRestingHeartRate:(id)a3
{
}

- (void)setWalkingAverageHeartRate:(id)a3
{
}

- (void)setAllDayStatistics:(id)a3
{
}

- (void)setWorkoutStatistics:(id)a3
{
}

- (void)setWorkoutRecoveryStatistics:(id)a3
{
}

- (void)setBreatheStatistics:(id)a3
{
}

@end