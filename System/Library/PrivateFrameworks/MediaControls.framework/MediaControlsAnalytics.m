@interface MediaControlsAnalytics
+ (void)coreAnalyticsPostAnalyticKind:(int64_t)a3;
+ (void)postAnalyticKind:(int64_t)a3;
@end

@implementation MediaControlsAnalytics

+ (void)coreAnalyticsPostAnalyticKind:(int64_t)a3
{
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 9:
      AnalyticsSendEventLazy();
      break;
    default:
      return;
  }
}

void *__56__MediaControlsAnalytics_coreAnalyticsPostAnalyticKind___block_invoke()
{
  return &unk_1F069F428;
}

void *__56__MediaControlsAnalytics_coreAnalyticsPostAnalyticKind___block_invoke_2()
{
  return &unk_1F069F450;
}

void *__56__MediaControlsAnalytics_coreAnalyticsPostAnalyticKind___block_invoke_3()
{
  return &unk_1F069F478;
}

void *__56__MediaControlsAnalytics_coreAnalyticsPostAnalyticKind___block_invoke_4()
{
  return &unk_1F069F4A0;
}

void *__56__MediaControlsAnalytics_coreAnalyticsPostAnalyticKind___block_invoke_5()
{
  return &unk_1F069F4C8;
}

void *__56__MediaControlsAnalytics_coreAnalyticsPostAnalyticKind___block_invoke_6()
{
  return &unk_1F069F4F0;
}

void *__56__MediaControlsAnalytics_coreAnalyticsPostAnalyticKind___block_invoke_7()
{
  return &unk_1F069F518;
}

void *__56__MediaControlsAnalytics_coreAnalyticsPostAnalyticKind___block_invoke_8()
{
  return &unk_1F069F540;
}

+ (void)postAnalyticKind:(int64_t)a3
{
  +[MediaControlsAnalytics coreAnalyticsPostAnalyticKind:](MediaControlsAnalytics, "coreAnalyticsPostAnalyticKind:");
  if ((unint64_t)a3 > 9) {
    v4 = 0;
  }
  else {
    v4 = off_1E5F0E740[a3];
  }
  if ([(__CFString *)v4 length])
  {
    MEMORY[0x1F41071E0](v4, 1);
  }
}

@end