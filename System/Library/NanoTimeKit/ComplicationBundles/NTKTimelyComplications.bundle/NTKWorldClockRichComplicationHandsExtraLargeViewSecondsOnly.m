@interface NTKWorldClockRichComplicationHandsExtraLargeViewSecondsOnly
+ (BOOL)showsSecondHand;
- (id)createHourHandView;
- (id)createMinuteHandView;
- (id)secondHandConfiguration;
@end

@implementation NTKWorldClockRichComplicationHandsExtraLargeViewSecondsOnly

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
  v7.receiver = self;
  v7.super_class = (Class)NTKWorldClockRichComplicationHandsExtraLargeViewSecondsOnly;
  v2 = [(NTKWorldClockRichComplicationHandsExtraLargeViewSecondsOnly *)&v7 secondHandConfiguration];
  [v2 pegRadius];
  double v4 = v3;
  [v2 pegStrokeWidth];
  [v2 setTailLength:ceil(v4 + v5 + 0.5)];

  return v2;
}

@end