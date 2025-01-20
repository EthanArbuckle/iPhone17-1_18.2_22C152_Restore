@interface HMIVideoTimelineProfiler
- (HMIVideoTimelineProfiler)initWithMaxCapacity:(int64_t)a3;
- (double)averageTime;
- (void)endedAtTime:(id *)a3;
- (void)startedAtTime:(id *)a3;
@end

@implementation HMIVideoTimelineProfiler

- (HMIVideoTimelineProfiler)initWithMaxCapacity:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)HMIVideoTimelineProfiler;
  v4 = [(HMIVideoTimelineProfiler *)&v10 init];
  if (v4)
  {
    v5 = [[HMIVideoTimeline alloc] initWithMaxCapacity:a3];
    timeline = v4->_timeline;
    v4->_timeline = v5;

    v7 = [[HMITimeIntervalAverage alloc] initWithMaxCapacity:32];
    average = v4->_average;
    v4->_average = v7;
  }
  return v4;
}

- (void)startedAtTime:(id *)a3
{
  timeline = self->_timeline;
  v5 = [MEMORY[0x263EFF910] now];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a3;
  [(HMIVideoTimeline *)timeline addDate:v5 atTime:&v6];
}

- (void)endedAtTime:(id *)a3
{
  timeline = self->_timeline;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a3;
  v5 = [(HMIVideoTimeline *)timeline dateAtTime:&v8];
  average = self->_average;
  v7 = [MEMORY[0x263EFF910] date];
  [v7 timeIntervalSinceDate:v5];
  -[HMITimeIntervalAverage addValue:](average, "addValue:");
}

- (double)averageTime
{
  [(HMITimeIntervalAverage *)self->_average value];
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_average, 0);
  objc_storeStrong((id *)&self->_timeline, 0);
}

@end