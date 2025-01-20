@interface LevelExtraLargeRichCircularComplicationView
- (id)_fixedBubbleImageName;
- (id)_floatingBubbleImageName;
- (id)_overlayImageName;
- (int64_t)_supportedFamily;
@end

@implementation LevelExtraLargeRichCircularComplicationView

- (int64_t)_supportedFamily
{
  return 12;
}

- (id)_overlayImageName
{
  return @"levelCircularXL-Cross";
}

- (id)_fixedBubbleImageName
{
  return @"levelCircularXL-Circle";
}

- (id)_floatingBubbleImageName
{
  return @"levelCircularXL-CrossedCircle";
}

@end