@interface UIColor(CUIKPlatforms)
+ (id)cuik_nonTodayTimelineColor;
+ (id)cuik_timelineHourColor;
+ (uint64_t)cuik_todayTimelineColor;
- (double)cuik_alphaComponent;
- (uint64_t)cuik_colorWithAlphaScaled:()CUIKPlatforms;
@end

@implementation UIColor(CUIKPlatforms)

- (uint64_t)cuik_colorWithAlphaScaled:()CUIKPlatforms
{
  objc_msgSend(a1, "cuik_alphaComponent");
  double v5 = v4 * a2;

  return [a1 colorWithAlphaComponent:v5];
}

- (double)cuik_alphaComponent
{
  v1 = (CGColor *)[a1 CGColor];

  return CGColorGetAlpha(v1);
}

+ (id)cuik_timelineHourColor
{
  v0 = (void *)MEMORY[0x1E4FB1618];
  v1 = CUIKBundle();
  v2 = [v0 colorNamed:@"timelineHourColor" inBundle:v1 compatibleWithTraitCollection:0];

  return v2;
}

+ (uint64_t)cuik_todayTimelineColor
{
  return [MEMORY[0x1E4FB1618] systemRedColor];
}

+ (id)cuik_nonTodayTimelineColor
{
  v1 = objc_msgSend(a1, "cuik_todayTimelineColor");
  v2 = [v1 colorWithAlphaComponent:0.1];

  return v2;
}

@end