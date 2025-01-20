@interface NTKTimerRichComplicationExtraLargeCircularView
+ (BOOL)supportsComplicationFamily:(int64_t)a3;
- (NTKTimerRichComplicationExtraLargeCircularView)init;
- (int64_t)_backgroundFilterStyle;
- (int64_t)_foregroundFilterStyle;
@end

@implementation NTKTimerRichComplicationExtraLargeCircularView

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 12;
}

- (NTKTimerRichComplicationExtraLargeCircularView)init
{
  v3.receiver = self;
  v3.super_class = (Class)NTKTimerRichComplicationExtraLargeCircularView;
  return [(NTKTimerRichComplicationBaseCircularView *)&v3 initWithFamily:12];
}

- (int64_t)_backgroundFilterStyle
{
  v2 = [(NTKTimerRichComplicationExtraLargeCircularView *)self device];
  int v3 = NTKShowGossamerUI();

  if (v3) {
    return 2;
  }
  else {
    return 0;
  }
}

- (int64_t)_foregroundFilterStyle
{
  v2 = [(NTKTimerRichComplicationExtraLargeCircularView *)self device];
  int v3 = NTKShowGossamerUI();

  if (v3) {
    return 0;
  }
  else {
    return 2;
  }
}

@end