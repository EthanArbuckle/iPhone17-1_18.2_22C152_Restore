@interface NTKTimerRichComplicationCircularView
+ (BOOL)supportsComplicationFamily:(int64_t)a3;
- (NTKTimerRichComplicationCircularView)init;
- (int64_t)_backgroundFilterStyle;
- (int64_t)_foregroundFilterStyle;
@end

@implementation NTKTimerRichComplicationCircularView

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 10;
}

- (NTKTimerRichComplicationCircularView)init
{
  v3.receiver = self;
  v3.super_class = (Class)NTKTimerRichComplicationCircularView;
  return [(NTKTimerRichComplicationBaseCircularView *)&v3 initWithFamily:10];
}

- (int64_t)_backgroundFilterStyle
{
  v2 = [(NTKTimerRichComplicationCircularView *)self device];
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
  v2 = [(NTKTimerRichComplicationCircularView *)self device];
  int v3 = NTKShowGossamerUI();

  if (v3) {
    return 0;
  }
  else {
    return 2;
  }
}

@end