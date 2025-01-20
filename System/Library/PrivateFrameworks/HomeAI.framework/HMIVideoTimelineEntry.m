@interface HMIVideoTimelineEntry
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time;
- (HMIVideoTimelineEntry)initWithTime:(id *)a3 date:(id)a4;
- (NSDate)date;
- (NSString)description;
@end

@implementation HMIVideoTimelineEntry

- (HMIVideoTimelineEntry)initWithTime:(id *)a3 date:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMIVideoTimelineEntry;
  v8 = [(HMIVideoTimelineEntry *)&v12 init];
  v9 = v8;
  if (v8)
  {
    int64_t var3 = a3->var3;
    *(_OWORD *)&v8->_time.value = *(_OWORD *)&a3->var0;
    v8->_time.epoch = var3;
    objc_storeStrong((id *)&v8->_date, a4);
  }

  return v9;
}

- (NSString)description
{
  v3 = NSString;
  $95D729B680665BEAEFA1D6FCA8238556 time = self->_time;
  v4 = HMICMTimeDescription((CMTime *)&time);
  v5 = [v3 stringWithFormat:@"Time: %@, Date: %@", v4, self->_date];

  return (NSString *)v5;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  objc_copyStruct(retstr, &self->_time, 24, 1, 0);
  return result;
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end