@interface HMMTRYearDaySchedule
- (BOOL)isEqual:(id)a3;
- (HMMTRYearDaySchedule)initWithMTRSchedule:(id)a3;
- (HMMTRYearDaySchedule)initWithStartTime:(id)a3 endTime:(id)a4;
- (HMMTRYearDaySchedule)initWithStartTime:(id)a3 endTime:(id)a4 status:(id)a5;
- (NSNumber)endTime;
- (NSNumber)startTime;
- (NSNumber)status;
- (id)convertToMTRScheduleAtScheduleIndex:(int64_t)a3 forUserAtUserIndex:(int64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)setEndTime:(id)a3;
- (void)setStartTime:(id)a3;
- (void)setStatus:(id)a3;
@end

@implementation HMMTRYearDaySchedule

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
}

- (void)setStatus:(id)a3
{
}

- (NSNumber)status
{
  return self->_status;
}

- (void)setEndTime:(id)a3
{
}

- (NSNumber)endTime
{
  return self->_endTime;
}

- (void)setStartTime:(id)a3
{
}

- (NSNumber)startTime
{
  return self->_startTime;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F08790]);
  [v3 setDateFormat:@"yyyy-MM-dd_HH-mm-ss"];
  v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = +[HMMTRUtilities matterEpochToDate:self->_startTime];
  v8 = [v3 stringFromDate:v7];
  v9 = +[HMMTRUtilities matterEpochToDate:self->_endTime];
  v10 = [v3 stringFromDate:v9];
  v11 = [v4 stringWithFormat:@"<%@: From %@ to %@>", v6, v8, v10];

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(HMMTRYearDaySchedule);
  v5 = [(HMMTRYearDaySchedule *)self startTime];
  [(HMMTRYearDaySchedule *)v4 setStartTime:v5];

  v6 = [(HMMTRYearDaySchedule *)self endTime];
  [(HMMTRYearDaySchedule *)v4 setEndTime:v6];

  v7 = [(HMMTRYearDaySchedule *)self status];
  [(HMMTRYearDaySchedule *)v4 setStatus:v7];

  return v4;
}

- (unint64_t)hash
{
  id v3 = [(HMMTRYearDaySchedule *)self startTime];
  uint64_t v4 = [v3 hash];
  v5 = [(HMMTRYearDaySchedule *)self endTime];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if (v6
    && ([(HMMTRYearDaySchedule *)self startTime],
        v7 = objc_claimAutoreleasedReturnValue(),
        [v6 startTime],
        v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = HMFEqualObjects(),
        v8,
        v7,
        v9))
  {
    v10 = [(HMMTRYearDaySchedule *)self endTime];
    v11 = [v6 endTime];
    char v12 = HMFEqualObjects();
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (id)convertToMTRScheduleAtScheduleIndex:(int64_t)a3 forUserAtUserIndex:(int64_t)a4
{
  id v7 = objc_alloc_init(MEMORY[0x263F10E90]);
  v8 = [NSNumber numberWithInteger:a3];
  [v7 setYearDayIndex:v8];

  int v9 = [NSNumber numberWithInteger:a4];
  [v7 setUserIndex:v9];

  v10 = [(HMMTRYearDaySchedule *)self startTime];
  [v7 setLocalStartTime:v10];

  v11 = [(HMMTRYearDaySchedule *)self endTime];
  [v7 setLocalEndTime:v11];

  return v7;
}

- (HMMTRYearDaySchedule)initWithMTRSchedule:(id)a3
{
  id v4 = a3;
  v5 = [v4 localStartTime];
  id v6 = [v4 localEndTime];
  id v7 = [v4 status];

  v8 = [(HMMTRYearDaySchedule *)self initWithStartTime:v5 endTime:v6 status:v7];
  return v8;
}

- (HMMTRYearDaySchedule)initWithStartTime:(id)a3 endTime:(id)a4
{
  id v6 = a4;
  id v7 = +[HMMTRUtilities dateToMatterEpoch:a3];
  v8 = +[HMMTRUtilities dateToMatterEpoch:v6];

  int v9 = [(HMMTRYearDaySchedule *)self initWithStartTime:v7 endTime:v8 status:0];
  return v9;
}

- (HMMTRYearDaySchedule)initWithStartTime:(id)a3 endTime:(id)a4 status:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMMTRYearDaySchedule;
  char v12 = [(HMMTRYearDaySchedule *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_startTime, a3);
    objc_storeStrong((id *)&v13->_endTime, a4);
    objc_storeStrong((id *)&v13->_status, a5);
  }

  return v13;
}

@end