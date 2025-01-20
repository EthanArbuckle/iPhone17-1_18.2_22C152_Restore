@interface NSDateInterval(HeadphoneSevenDayDose)
- (id)hk_hearingSevenDayDoseDateIntervalClampedToMaxDuration;
@end

@implementation NSDateInterval(HeadphoneSevenDayDose)

- (id)hk_hearingSevenDayDoseDateIntervalClampedToMaxDuration
{
  v2 = HKHeadphoneAudioExposureEventType();
  [v2 maximumAllowedDuration];
  double v4 = v3;

  [a1 duration];
  if (v5 <= v4)
  {
    id v8 = a1;
  }
  else
  {
    v6 = [a1 endDate];
    v7 = [v6 dateByAddingTimeInterval:-v4];

    id v8 = (id)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v7 duration:v4];
  }
  return v8;
}

@end