@interface HKMCHeartRateDailySampleCollection
+ (id)heartRateDailySampleCollectionOnSleepDayMorningIndex:(int64_t)a3 gregorianCalendar:(id)a4 sleepStart:(double)a5 sleepDuration:(double)a6 sleepHeartRateSampleCount:(int64_t)a7 sleepHeartRatePercentile:(float)a8 awakeHeartRateSampleCount:(int64_t)a9 awakeHeartRatePercentile:(float)a10;
- (HKCategorySample)asleepSample;
- (HKMCHeartRateDailySampleCollection)initWithSleepDayMorningIndex:(int64_t)a3 asleepSample:(id)a4 asleepHeartRateSamples:(id)a5 awakeHeartRateSamples:(id)a6;
- (NSArray)asleepHeartRateSamples;
- (NSArray)awakeHeartRateSamples;
- (int64_t)sleepDayMorningIndex;
@end

@implementation HKMCHeartRateDailySampleCollection

- (HKMCHeartRateDailySampleCollection)initWithSleepDayMorningIndex:(int64_t)a3 asleepSample:(id)a4 asleepHeartRateSamples:(id)a5 awakeHeartRateSamples:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)HKMCHeartRateDailySampleCollection;
  v14 = [(HKMCHeartRateDailySampleCollection *)&v21 init];
  v15 = v14;
  if (v14)
  {
    v14->_sleepDayMorningIndex = a3;
    objc_storeStrong((id *)&v14->_asleepSample, a4);
    uint64_t v16 = [v12 copy];
    asleepHeartRateSamples = v15->_asleepHeartRateSamples;
    v15->_asleepHeartRateSamples = (NSArray *)v16;

    uint64_t v18 = [v13 copy];
    awakeHeartRateSamples = v15->_awakeHeartRateSamples;
    v15->_awakeHeartRateSamples = (NSArray *)v18;
  }
  return v15;
}

+ (id)heartRateDailySampleCollectionOnSleepDayMorningIndex:(int64_t)a3 gregorianCalendar:(id)a4 sleepStart:(double)a5 sleepDuration:(double)a6 sleepHeartRateSampleCount:(int64_t)a7 sleepHeartRatePercentile:(float)a8 awakeHeartRateSampleCount:(int64_t)a9 awakeHeartRatePercentile:(float)a10
{
  v17 = (objc_class *)MEMORY[0x263F08798];
  id v18 = a4;
  id v19 = [v17 alloc];
  v20 = objc_msgSend(MEMORY[0x263EFF910], "hk_sleepDayStartForMorningIndex:calendar:", a3, v18);
  objc_super v21 = objc_msgSend(MEMORY[0x263EFF910], "hk_sleepDayStartForMorningIndex:calendar:", a3 + 1, v18);

  v22 = (void *)[v19 initWithStartDate:v20 endDate:v21];
  v23 = [v22 startDate];
  v24 = 0;
  if (a7 < 1 || a8 <= 0.0)
  {
    v34 = 0;
  }
  else
  {
    v25 = (void *)MEMORY[0x263EFF910];
    v26 = [v22 startDate];
    v27 = [v25 dateWithTimeInterval:v26 sinceDate:a5 * 3600.0];

    double v28 = a6 * 3600.0;
    if (a6 <= 0.0) {
      double v28 = 28800.0;
    }
    v29 = [MEMORY[0x263EFF910] dateWithTimeInterval:v27 sinceDate:v28];
    uint64_t v30 = [MEMORY[0x263EFF910] dateWithTimeInterval:v29 sinceDate:300.0];

    v31 = (void *)MEMORY[0x263F0A150];
    v32 = [MEMORY[0x263F0A158] _typeWithIdentifier:*MEMORY[0x263F09410]];
    v24 = [v31 categorySampleWithType:v32 value:1 startDate:v27 endDate:v29];

    v33 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v27 endDate:v29];
    v34 = HKMCGenerateHeartRateSamplesMatchingTenthPercentile(v33, a7, a8);

    v23 = (void *)v30;
  }
  v35 = 0;
  if (a9 >= 1 && a10 > 0.0)
  {
    id v36 = objc_alloc(MEMORY[0x263F08798]);
    v37 = [v22 endDate];
    v38 = (void *)[v36 initWithStartDate:v23 endDate:v37];
    v35 = HKMCGenerateHeartRateSamplesMatchingTenthPercentile(v38, a9, a10);
  }
  id v39 = objc_alloc((Class)objc_opt_class());
  if (v34) {
    v40 = v34;
  }
  else {
    v40 = (void *)MEMORY[0x263EFFA68];
  }
  if (v35) {
    v41 = v35;
  }
  else {
    v41 = (void *)MEMORY[0x263EFFA68];
  }
  v42 = (void *)[v39 initWithSleepDayMorningIndex:a3 asleepSample:v24 asleepHeartRateSamples:v40 awakeHeartRateSamples:v41];

  return v42;
}

- (int64_t)sleepDayMorningIndex
{
  return self->_sleepDayMorningIndex;
}

- (HKCategorySample)asleepSample
{
  return self->_asleepSample;
}

- (NSArray)asleepHeartRateSamples
{
  return self->_asleepHeartRateSamples;
}

- (NSArray)awakeHeartRateSamples
{
  return self->_awakeHeartRateSamples;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_awakeHeartRateSamples, 0);
  objc_storeStrong((id *)&self->_asleepHeartRateSamples, 0);
  objc_storeStrong((id *)&self->_asleepSample, 0);
}

@end