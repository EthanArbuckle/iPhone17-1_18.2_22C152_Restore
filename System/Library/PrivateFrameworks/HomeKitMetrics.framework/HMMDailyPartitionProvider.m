@interface HMMDailyPartitionProvider
+ (id)sharedInstance;
- (HMMDailyPartitionProvider)initWithDateProvider:(id)a3;
- (HMMDateProvider)dateProvider;
- (NSDate)currentDatePartition;
- (id)datePartitionContainingDate:(id)a3;
- (id)datePartitionWithOffset:(int64_t)a3 fromDatePartition:(id)a4;
- (id)datePartitionWithOffsetFromNow:(int64_t)a3;
@end

@implementation HMMDailyPartitionProvider

- (void).cxx_destruct
{
}

- (HMMDateProvider)dateProvider
{
  return self->_dateProvider;
}

- (id)datePartitionWithOffset:(int64_t)a3 fromDatePartition:(id)a4
{
  return +[HMMDateProvider startOfDateByAddingDayCount:a3 toDate:a4];
}

- (id)datePartitionContainingDate:(id)a3
{
  return +[HMMDateProvider startOfDayForDate:a3];
}

- (id)datePartitionWithOffsetFromNow:(int64_t)a3
{
  v4 = [(HMMDailyPartitionProvider *)self dateProvider];
  v5 = [v4 startOfDayByAddingDayCount:a3];

  return v5;
}

- (NSDate)currentDatePartition
{
  v2 = [(HMMDailyPartitionProvider *)self dateProvider];
  v3 = [v2 startOfCurrentDay];

  return (NSDate *)v3;
}

- (HMMDailyPartitionProvider)initWithDateProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMMDailyPartitionProvider;
  v6 = [(HMMDailyPartitionProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dateProvider, a3);
  }

  return v7;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__HMMDailyPartitionProvider_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__hmf_once_t0_382 != -1) {
    dispatch_once(&sharedInstance__hmf_once_t0_382, block);
  }
  v2 = (void *)sharedInstance__hmf_once_v1_383;
  return v2;
}

void __43__HMMDailyPartitionProvider_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc(*(Class *)(a1 + 32));
  id v4 = +[HMMDateProvider sharedInstance];
  uint64_t v2 = [v1 initWithDateProvider:v4];
  v3 = (void *)sharedInstance__hmf_once_v1_383;
  sharedInstance__hmf_once_v1_383 = v2;
}

@end