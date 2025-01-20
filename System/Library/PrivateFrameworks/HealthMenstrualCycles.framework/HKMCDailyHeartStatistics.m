@interface HKMCDailyHeartStatistics
+ (BOOL)supportsSecureCoding;
+ (id)dailyHeartStatisticsWithDayIndex:(int64_t)a3 asleepStatistics:(id)a4 awakeStatistics:(id)a5;
- (BOOL)getData:(id *)a3 error:(id *)a4;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (HKMCDailyHeartStatistics)initWithCoder:(id)a3;
- (HKMCDailyHeartStatistics)initWithDayIndex:(int64_t)a3 tenthPercentileAsleepHeartRateStatistics:(id)a4 tenthPercentileAwakeHeartRateStatistics:(id)a5;
- (HKMCHeartStatistics)tenthPercentileAsleepHeartRateStatistics;
- (HKMCHeartStatistics)tenthPercentileAwakeHeartRateStatistics;
- (NSString)description;
- (int64_t)bucketIndexForIntervalComponents:(id)a3 anchorDate:(id)a4;
- (int64_t)dayIndex;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKMCDailyHeartStatistics

- (HKMCHeartStatistics)tenthPercentileAwakeHeartRateStatistics
{
  return self->_tenthPercentileAwakeHeartRateStatistics;
}

- (HKMCHeartStatistics)tenthPercentileAsleepHeartRateStatistics
{
  return self->_tenthPercentileAsleepHeartRateStatistics;
}

- (int64_t)dayIndex
{
  return self->_dayIndex;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMCDailyHeartStatistics)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKMCDailyHeartStatistics;
  v5 = [(HKMCDailyHeartStatistics *)&v11 init];
  if (v5)
  {
    v5->_dayIndex = [v4 decodeIntegerForKey:@"DayIndex"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TenthPercentileAsleepHeartRateStatistics"];
    tenthPercentileAsleepHeartRateStatistics = v5->_tenthPercentileAsleepHeartRateStatistics;
    v5->_tenthPercentileAsleepHeartRateStatistics = (HKMCHeartStatistics *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TenthPercentileAwakeHeartRateStatistics"];
    tenthPercentileAwakeHeartRateStatistics = v5->_tenthPercentileAwakeHeartRateStatistics;
    v5->_tenthPercentileAwakeHeartRateStatistics = (HKMCHeartStatistics *)v8;
  }
  return v5;
}

- (HKMCDailyHeartStatistics)initWithDayIndex:(int64_t)a3 tenthPercentileAsleepHeartRateStatistics:(id)a4 tenthPercentileAwakeHeartRateStatistics:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HKMCDailyHeartStatistics;
  objc_super v11 = [(HKMCDailyHeartStatistics *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_dayIndex = a3;
    objc_storeStrong((id *)&v11->_tenthPercentileAsleepHeartRateStatistics, a4);
    objc_storeStrong((id *)&v12->_tenthPercentileAwakeHeartRateStatistics, a5);
  }

  return v12;
}

+ (id)dailyHeartStatisticsWithDayIndex:(int64_t)a3 asleepStatistics:(id)a4 awakeStatistics:(id)a5
{
  id v8 = a5;
  id v9 = +[HKMCHeartStatistics heartStatisticsFromStatistics:a4];
  id v10 = +[HKMCHeartStatistics heartStatisticsFromStatistics:v8];

  objc_super v11 = (void *)[objc_alloc((Class)a1) initWithDayIndex:a3 tenthPercentileAsleepHeartRateStatistics:v9 tenthPercentileAwakeHeartRateStatistics:v10];
  return v11;
}

- (BOOL)isEmpty
{
  return !self->_tenthPercentileAwakeHeartRateStatistics && self->_tenthPercentileAsleepHeartRateStatistics == 0;
}

- (BOOL)getData:(id *)a3 error:(id *)a4
{
  id v15 = 0;
  v7 = [MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v15];
  id v8 = v15;
  id v9 = v7;
  *a3 = v9;
  if (v9) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  BOOL v11 = v10;
  if (!v10)
  {
    _HKInitializeLogging();
    v12 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
      -[HKMCDailyHeartStatistics getData:error:](v12, (uint64_t)self, (uint64_t)v8);
    }
    id v13 = v8;
    if (v8)
    {
      if (a4) {
        *a4 = v13;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  return v11;
}

- (int64_t)bucketIndexForIntervalComponents:(id)a3 anchorDate:(id)a4
{
  return self->_dayIndex;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t dayIndex = self->_dayIndex;
  id v5 = a3;
  [v5 encodeInteger:dayIndex forKey:@"DayIndex"];
  [v5 encodeObject:self->_tenthPercentileAsleepHeartRateStatistics forKey:@"TenthPercentileAsleepHeartRateStatistics"];
  [v5 encodeObject:self->_tenthPercentileAwakeHeartRateStatistics forKey:@"TenthPercentileAwakeHeartRateStatistics"];
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [NSNumber numberWithInteger:self->_dayIndex];
  uint64_t v6 = [v3 stringWithFormat:@"<%@:%p dayIndex:%@ tenthPercentileAsleepHeartRateStatistics:%@ tenthPercentileAwakeHeartRateStatistics:%@>", v4, self, v5, self->_tenthPercentileAsleepHeartRateStatistics, self->_tenthPercentileAwakeHeartRateStatistics];

  return (NSString *)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (HKMCDailyHeartStatistics *)a3;
  if (self == v5)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v6 = [(HKMCDailyHeartStatistics *)self dayIndex];
      if (v6 == [(HKMCDailyHeartStatistics *)v5 dayIndex])
      {
        v7 = [(HKMCDailyHeartStatistics *)self tenthPercentileAwakeHeartRateStatistics];
        id v8 = [(HKMCDailyHeartStatistics *)v5 tenthPercentileAwakeHeartRateStatistics];
        if (v7 == v8)
        {
          [(HKMCDailyHeartStatistics *)self tenthPercentileAsleepHeartRateStatistics];
        }
        else
        {
          uint64_t v9 = [(HKMCDailyHeartStatistics *)v5 tenthPercentileAwakeHeartRateStatistics];
          if (!v9)
          {
            char v12 = 0;
LABEL_20:

            goto LABEL_21;
          }
          v3 = (void *)v9;
          BOOL v10 = [(HKMCDailyHeartStatistics *)self tenthPercentileAwakeHeartRateStatistics];
          BOOL v11 = [(HKMCDailyHeartStatistics *)v5 tenthPercentileAwakeHeartRateStatistics];
          if (![v10 isEqual:v11])
          {
            char v12 = 0;
LABEL_19:

            goto LABEL_20;
          }
          [(HKMCDailyHeartStatistics *)self tenthPercentileAsleepHeartRateStatistics];
        id v13 = };
        uint64_t v14 = [(HKMCDailyHeartStatistics *)v5 tenthPercentileAsleepHeartRateStatistics];
        if (v13 == (void *)v14)
        {

          char v12 = 1;
        }
        else
        {
          id v15 = (void *)v14;
          uint64_t v16 = [(HKMCDailyHeartStatistics *)v5 tenthPercentileAsleepHeartRateStatistics];
          if (v16)
          {
            v17 = (void *)v16;
            v18 = [(HKMCDailyHeartStatistics *)self tenthPercentileAsleepHeartRateStatistics];
            v19 = [(HKMCDailyHeartStatistics *)v5 tenthPercentileAsleepHeartRateStatistics];
            char v12 = [v18 isEqual:v19];
          }
          else
          {

            char v12 = 0;
          }
        }
        BOOL v11 = v22;
        BOOL v10 = v24;
        if (v7 == v8) {
          goto LABEL_20;
        }
        goto LABEL_19;
      }
    }
    char v12 = 0;
  }
LABEL_21:

  return v12;
}

- (unint64_t)hash
{
  v3 = [NSNumber numberWithInteger:self->_dayIndex];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(HKMCHeartStatistics *)self->_tenthPercentileAwakeHeartRateStatistics hash];
  unint64_t v6 = v5 ^ [(HKMCHeartStatistics *)self->_tenthPercentileAsleepHeartRateStatistics hash] ^ v4;

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tenthPercentileAwakeHeartRateStatistics, 0);
  objc_storeStrong((id *)&self->_tenthPercentileAsleepHeartRateStatistics, 0);
}

- (void)getData:(uint64_t)a3 error:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = a1;
  int v6 = 138543618;
  id v7 = (id)objc_opt_class();
  __int16 v8 = 2114;
  uint64_t v9 = a3;
  id v5 = v7;
  _os_log_error_impl(&dword_2249E9000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Error archiving data: %{public}@", (uint8_t *)&v6, 0x16u);
}

@end