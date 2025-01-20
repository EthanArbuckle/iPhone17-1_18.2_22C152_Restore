@interface NTKWorldClockRichComplicationHandsViewOnlySeconds
+ (BOOL)showsSecondHand;
- (id)createHourHandView;
- (id)createMinuteHandView;
- (id)secondHandConfiguration;
@end

@implementation NTKWorldClockRichComplicationHandsViewOnlySeconds

+ (BOOL)showsSecondHand
{
  return 1;
}

- (id)createHourHandView
{
  return 0;
}

- (id)createMinuteHandView
{
  return 0;
}

- (id)secondHandConfiguration
{
  v4.receiver = self;
  v4.super_class = (Class)NTKWorldClockRichComplicationHandsViewOnlySeconds;
  v2 = [(NTKWorldClockRichComplicationHandsViewOnlySeconds *)&v4 secondHandConfiguration];
  [v2 setExcludeSecondTail:1];

  return v2;
}

@end