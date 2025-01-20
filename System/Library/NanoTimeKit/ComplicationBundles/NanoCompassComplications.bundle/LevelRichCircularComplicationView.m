@interface LevelRichCircularComplicationView
- (id)_fixedBubbleImageName;
- (id)_floatingBubbleImageName;
- (id)_overlayImageName;
- (int64_t)_supportedFamily;
@end

@implementation LevelRichCircularComplicationView

- (int64_t)_supportedFamily
{
  return 10;
}

- (id)_overlayImageName
{
  return @"levelCircular-Cross";
}

- (id)_fixedBubbleImageName
{
  return @"levelCircular-Circle";
}

- (id)_floatingBubbleImageName
{
  return @"levelCircular-CrossedCircle";
}

@end