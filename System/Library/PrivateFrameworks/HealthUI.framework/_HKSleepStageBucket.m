@interface _HKSleepStageBucket
+ (id)bucketsWithSize:(double)a3 startOfSleep:(id)a4 maxSleepDuration:(double)a5 numberOfDays:(int64_t)a6;
- (BOOL)hasSleepStagesData;
- (NSDate)startOfSleep;
- (NSMutableDictionary)sleepStageCounts;
- (_HKSleepStageBucket)initWithBucketSize:(double)a3 distanceFromStart:(double)a4 startOfSleep:(id)a5 numberOfDays:(int64_t)a6;
- (double)bucketSize;
- (double)distanceFromStart;
- (id)probableSleepPeriodSegment;
- (int64_t)_probableSleepStage;
- (int64_t)numberOfDays;
- (void)setHasSleepStagesData:(BOOL)a3;
- (void)setSleepStageCounts:(id)a3;
- (void)updateWithSegment:(id)a3;
@end

@implementation _HKSleepStageBucket

- (_HKSleepStageBucket)initWithBucketSize:(double)a3 distanceFromStart:(double)a4 startOfSleep:(id)a5 numberOfDays:(int64_t)a6
{
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_HKSleepStageBucket;
  v12 = [(_HKSleepStageBucket *)&v17 init];
  v13 = v12;
  if (v12)
  {
    v12->_bucketSize = a3;
    v12->_distanceFromStart = a4;
    objc_storeStrong((id *)&v12->_startOfSleep, a5);
    v13->_numberOfDays = a6;
    v13->_hasSleepStagesData = 0;
    uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
    sleepStageCounts = v13->_sleepStageCounts;
    v13->_sleepStageCounts = (NSMutableDictionary *)v14;
  }
  return v13;
}

+ (id)bucketsWithSize:(double)a3 startOfSleep:(id)a4 maxSleepDuration:(double)a5 numberOfDays:(int64_t)a6
{
  id v9 = a4;
  if (v9)
  {
    v10 = [MEMORY[0x1E4F1CA48] array];
    if (a5 > 0.0)
    {
      double v11 = 0.0;
      do
      {
        v12 = [[_HKSleepStageBucket alloc] initWithBucketSize:v9 distanceFromStart:a6 startOfSleep:a3 numberOfDays:v11];
        [v10 addObject:v12];

        double v11 = v11 + a3;
      }
      while (v11 < a5);
    }
    v13 = (void *)[v10 copy];
  }
  else
  {
    v13 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v13;
}

- (void)updateWithSegment:(id)a3
{
  id v10 = a3;
  if ((unint64_t)([v10 category] - 1) <= 4)
  {
    [(_HKSleepStageBucket *)self setHasSleepStagesData:1];
    v4 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "category"));
    v5 = [(_HKSleepStageBucket *)self sleepStageCounts];
    v6 = [v5 objectForKey:v4];
    uint64_t v7 = [v6 integerValue];

    v8 = [(_HKSleepStageBucket *)self sleepStageCounts];
    id v9 = [NSNumber numberWithInteger:v7 + 1];
    [v8 setObject:v9 forKey:v4];
  }
}

- (id)probableSleepPeriodSegment
{
  if ((unint64_t)([(_HKSleepStageBucket *)self _probableSleepStage] - 1) > 4)
  {
    uint64_t v7 = 0;
  }
  else
  {
    v3 = [(_HKSleepStageBucket *)self startOfSleep];
    [(_HKSleepStageBucket *)self distanceFromStart];
    v4 = objc_msgSend(v3, "dateByAddingTimeInterval:");

    id v5 = objc_alloc(MEMORY[0x1E4F28C18]);
    [(_HKSleepStageBucket *)self bucketSize];
    v6 = objc_msgSend(v5, "initWithStartDate:duration:", v4);
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F2B548], "sleepPeriodSegmentWithDateInterval:category:", v6, -[_HKSleepStageBucket _probableSleepStage](self, "_probableSleepStage"));
  }
  return v7;
}

- (int64_t)_probableSleepStage
{
  v2 = [(_HKSleepStageBucket *)self sleepStageCounts];
  v3 = [v2 keysSortedByValueUsingComparator:&__block_literal_global_29];
  v4 = [v3 firstObject];

  int64_t v5 = [v4 integerValue];
  return v5;
}

- (double)bucketSize
{
  return self->_bucketSize;
}

- (double)distanceFromStart
{
  return self->_distanceFromStart;
}

- (NSDate)startOfSleep
{
  return self->_startOfSleep;
}

- (int64_t)numberOfDays
{
  return self->_numberOfDays;
}

- (BOOL)hasSleepStagesData
{
  return self->_hasSleepStagesData;
}

- (void)setHasSleepStagesData:(BOOL)a3
{
  self->_hasSleepStagesData = a3;
}

- (NSMutableDictionary)sleepStageCounts
{
  return self->_sleepStageCounts;
}

- (void)setSleepStageCounts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepStageCounts, 0);
  objc_storeStrong((id *)&self->_startOfSleep, 0);
}

@end