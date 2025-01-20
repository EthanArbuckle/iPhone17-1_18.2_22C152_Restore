@interface UIFont(MRUDefaults)
+ (id)mru_ambientSubtitleFont;
+ (id)mru_ambientTimeFont;
+ (id)mru_ambientTitleFont;
+ (id)mru_buttonFont;
+ (id)mru_controlCenterLargeSubtitleFontWithScale:()MRUDefaults;
+ (id)mru_controlCenterLargeTitleFontWithScale:()MRUDefaults;
+ (id)mru_controlCenterMediumSubtitleFontWithScale:()MRUDefaults;
+ (id)mru_controlCenterMediumTitleFontWithScale:()MRUDefaults;
+ (id)mru_controlCenterMoreButtonTitleFontWithScale:()MRUDefaults;
+ (id)mru_controlCenterRouteButtonFontWithScale:()MRUDefaults;
+ (id)mru_controlCenterTitleFont;
+ (id)mru_expandedRouteFont;
+ (id)mru_routeFont;
+ (id)mru_routingHeaderFont;
+ (id)mru_smallSubtitleFont;
+ (id)mru_smallTitleFont;
+ (id)mru_suggestionsTitleFont;
+ (id)mru_timeFontWithScale:()MRUDefaults;
+ (id)mru_titleFont;
+ (id)mru_volumeButtonTitleFont;
+ (uint64_t)mru_controlCenterLargeSubtitleFont;
+ (uint64_t)mru_controlCenterLargeTitleFont;
+ (uint64_t)mru_controlCenterMediumSubtitleFont;
+ (uint64_t)mru_controlCenterMediumTitleFont;
+ (uint64_t)mru_controlCenterMoreButtonBadgeFont;
+ (uint64_t)mru_controlCenterMoreButtonTitleFont;
+ (uint64_t)mru_controlCenterRouteButtonFont;
+ (uint64_t)mru_controlCenterSubtitleFont;
+ (uint64_t)mru_expandedSubtitleFont;
+ (uint64_t)mru_expandedTitleFont;
+ (uint64_t)mru_routingSubtitleFont;
+ (uint64_t)mru_routingTitleFont;
+ (uint64_t)mru_subtitleFont;
+ (uint64_t)mru_suggestedRouteActivitySubtitleFont;
+ (uint64_t)mru_suggestedRouteActivityTitleFont;
+ (uint64_t)mru_suggestedRouteBannerSubtitleFont;
+ (uint64_t)mru_suggestedRouteBannerTitleFont;
+ (uint64_t)mru_suggestionsSubtitleFont;
+ (uint64_t)mru_timeFont;
+ (uint64_t)mru_volumeButtonSubtitleFont;
+ (uint64_t)mru_volumeTitleFont;
@end

@implementation UIFont(MRUDefaults)

+ (uint64_t)mru_volumeTitleFont
{
  return [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2908] maximumContentSizeCategory:*MEMORY[0x1E4FB27B8]];
}

+ (uint64_t)mru_volumeButtonSubtitleFont
{
  return [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28D8] maximumContentSizeCategory:*MEMORY[0x1E4FB27B8]];
}

+ (id)mru_titleFont
{
  v0 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2908] maximumContentSizeCategory:*MEMORY[0x1E4FB2798]];
  v1 = (void *)MEMORY[0x1E4FB08E0];
  [v0 pointSize];
  v2 = objc_msgSend(v1, "systemFontOfSize:weight:");

  return v2;
}

+ (uint64_t)mru_subtitleFont
{
  return [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28C8] maximumContentSizeCategory:*MEMORY[0x1E4FB2798]];
}

+ (id)mru_routeFont
{
  v0 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28D8] maximumContentSizeCategory:*MEMORY[0x1E4FB2798]];
  v1 = (void *)MEMORY[0x1E4FB08E0];
  [v0 pointSize];
  v2 = objc_msgSend(v1, "boldSystemFontOfSize:");

  return v2;
}

+ (id)mru_smallTitleFont
{
  v0 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2950] maximumContentSizeCategory:*MEMORY[0x1E4FB27C0]];
  v1 = (void *)MEMORY[0x1E4FB08E0];
  [v0 pointSize];
  v2 = objc_msgSend(v1, "systemFontOfSize:weight:");

  return v2;
}

+ (id)mru_smallSubtitleFont
{
  v0 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28D0] maximumContentSizeCategory:*MEMORY[0x1E4FB27C0]];
  v1 = (void *)MEMORY[0x1E4FB08E0];
  [v0 pointSize];
  v2 = objc_msgSend(v1, "systemFontOfSize:weight:");

  return v2;
}

+ (uint64_t)mru_expandedTitleFont
{
  return [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2908] maximumContentSizeCategory:*MEMORY[0x1E4FB27C0]];
}

+ (uint64_t)mru_expandedSubtitleFont
{
  return [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28C8] maximumContentSizeCategory:*MEMORY[0x1E4FB27C0]];
}

+ (id)mru_expandedRouteFont
{
  v0 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28D8] maximumContentSizeCategory:*MEMORY[0x1E4FB27C0]];
  v1 = (void *)MEMORY[0x1E4FB08E0];
  [v0 pointSize];
  v2 = objc_msgSend(v1, "boldSystemFontOfSize:");

  return v2;
}

+ (uint64_t)mru_timeFont
{
  return objc_msgSend(a1, "mru_timeFontWithScale:", 1.0);
}

+ (id)mru_timeFontWithScale:()MRUDefaults
{
  v2 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28E0] maximumContentSizeCategory:*MEMORY[0x1E4FB2798]];
  v3 = (void *)MEMORY[0x1E4FB08E0];
  [v2 pointSize];
  v5 = [v3 monospacedDigitSystemFontOfSize:v4 * a1 weight:*MEMORY[0x1E4FB09D0]];

  return v5;
}

+ (id)mru_buttonFont
{
  v0 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28D8] maximumContentSizeCategory:*MEMORY[0x1E4FB27B8]];
  v1 = (void *)MEMORY[0x1E4FB08E0];
  [v0 pointSize];
  v2 = objc_msgSend(v1, "boldSystemFontOfSize:");

  return v2;
}

+ (id)mru_controlCenterTitleFont
{
  v0 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28F0] maximumContentSizeCategory:*MEMORY[0x1E4FB2798]];
  v1 = (void *)MEMORY[0x1E4FB08E0];
  [v0 pointSize];
  v2 = objc_msgSend(v1, "systemFontOfSize:weight:");

  return v2;
}

+ (uint64_t)mru_controlCenterSubtitleFont
{
  return [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28F0] maximumContentSizeCategory:*MEMORY[0x1E4FB2798]];
}

+ (uint64_t)mru_controlCenterMediumTitleFont
{
  return objc_msgSend(a1, "mru_controlCenterMediumTitleFontWithScale:", 1.0);
}

+ (id)mru_controlCenterMediumTitleFontWithScale:()MRUDefaults
{
  v2 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2960] maximumContentSizeCategory:*MEMORY[0x1E4FB27B8]];
  v3 = (void *)MEMORY[0x1E4FB08E0];
  [v2 pointSize];
  v5 = [v3 systemFontOfSize:v4 * a1 weight:*MEMORY[0x1E4FB09E0]];

  return v5;
}

+ (uint64_t)mru_controlCenterMediumSubtitleFont
{
  return objc_msgSend(a1, "mru_controlCenterMediumSubtitleFontWithScale:", 1.0);
}

+ (id)mru_controlCenterMediumSubtitleFontWithScale:()MRUDefaults
{
  v2 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2960] maximumContentSizeCategory:*MEMORY[0x1E4FB27B8]];
  v3 = v2;
  if (fabs(a1 + -1.0) > 2.22044605e-16)
  {
    double v4 = (void *)MEMORY[0x1E4FB08E0];
    [v2 pointSize];
    uint64_t v6 = [v4 systemFontOfSize:v5 * a1];

    v3 = (void *)v6;
  }

  return v3;
}

+ (uint64_t)mru_controlCenterLargeTitleFont
{
  return objc_msgSend(a1, "mru_controlCenterLargeTitleFontWithScale:", 1.0);
}

+ (id)mru_controlCenterLargeTitleFontWithScale:()MRUDefaults
{
  v2 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2950] maximumContentSizeCategory:*MEMORY[0x1E4FB2798]];
  v3 = (void *)MEMORY[0x1E4FB08E0];
  [v2 pointSize];
  double v5 = [v3 systemFontOfSize:v4 * a1 weight:*MEMORY[0x1E4FB09E0]];

  return v5;
}

+ (uint64_t)mru_controlCenterLargeSubtitleFont
{
  return objc_msgSend(a1, "mru_controlCenterLargeSubtitleFontWithScale:", 1.0);
}

+ (id)mru_controlCenterLargeSubtitleFontWithScale:()MRUDefaults
{
  v2 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2950] maximumContentSizeCategory:*MEMORY[0x1E4FB2798]];
  v3 = v2;
  if (fabs(a1 + -1.0) > 2.22044605e-16)
  {
    double v4 = (void *)MEMORY[0x1E4FB08E0];
    [v2 pointSize];
    uint64_t v6 = [v4 systemFontOfSize:v5 * a1];

    v3 = (void *)v6;
  }

  return v3;
}

+ (uint64_t)mru_controlCenterRouteButtonFont
{
  return objc_msgSend(a1, "mru_controlCenterRouteButtonFontWithScale:", 1.0);
}

+ (id)mru_controlCenterRouteButtonFontWithScale:()MRUDefaults
{
  v2 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28F0] maximumContentSizeCategory:*MEMORY[0x1E4FB2798]];
  v3 = v2;
  if (fabs(a1 + -1.0) > 2.22044605e-16)
  {
    double v4 = (void *)MEMORY[0x1E4FB08E0];
    [v2 pointSize];
    uint64_t v6 = [v4 systemFontOfSize:v5 * a1];

    v3 = (void *)v6;
  }

  return v3;
}

+ (uint64_t)mru_controlCenterMoreButtonTitleFont
{
  return [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28E0] maximumContentSizeCategory:*MEMORY[0x1E4FB2798]];
}

+ (id)mru_controlCenterMoreButtonTitleFontWithScale:()MRUDefaults
{
  v2 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28E0] maximumContentSizeCategory:*MEMORY[0x1E4FB2798]];
  v3 = v2;
  if (fabs(a1 + -1.0) > 2.22044605e-16)
  {
    double v4 = (void *)MEMORY[0x1E4FB08E0];
    [v2 pointSize];
    uint64_t v6 = [v4 systemFontOfSize:v5 * a1];

    v3 = (void *)v6;
  }

  return v3;
}

+ (uint64_t)mru_controlCenterMoreButtonBadgeFont
{
  return [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28D8] maximumContentSizeCategory:*MEMORY[0x1E4FB2798]];
}

+ (id)mru_suggestionsTitleFont
{
  v0 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28E0] maximumContentSizeCategory:*MEMORY[0x1E4FB27D0]];
  v1 = (void *)MEMORY[0x1E4FB08E0];
  [v0 pointSize];
  v2 = objc_msgSend(v1, "boldSystemFontOfSize:");

  return v2;
}

+ (uint64_t)mru_suggestionsSubtitleFont
{
  return [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28E0] maximumContentSizeCategory:*MEMORY[0x1E4FB27D0]];
}

+ (id)mru_routingHeaderFont
{
  v0 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  v1 = (void *)MEMORY[0x1E4FB08E0];
  [v0 pointSize];
  v2 = objc_msgSend(v1, "boldSystemFontOfSize:");

  return v2;
}

+ (uint64_t)mru_routingTitleFont
{
  return [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
}

+ (uint64_t)mru_routingSubtitleFont
{
  return [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28E0]];
}

+ (id)mru_volumeButtonTitleFont
{
  v1 = objc_msgSend(a1, "mru_volumeButtonSubtitleFont");
  v2 = (void *)MEMORY[0x1E4FB08E0];
  [v1 pointSize];
  v3 = objc_msgSend(v2, "boldSystemFontOfSize:");

  return v3;
}

+ (id)mru_ambientTitleFont
{
  uint64_t v0 = *MEMORY[0x1E4FB2928];
  v1 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2928] maximumContentSizeCategory:*MEMORY[0x1E4FB27C0]];
  v2 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:v0 weight:*MEMORY[0x1E4FB09B8]];
  [v1 pointSize];
  v3 = objc_msgSend(v2, "fontWithSize:");

  return v3;
}

+ (id)mru_ambientSubtitleFont
{
  uint64_t v0 = *MEMORY[0x1E4FB2990];
  v1 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2990] maximumContentSizeCategory:*MEMORY[0x1E4FB27C0]];
  v2 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:v0 weight:*MEMORY[0x1E4FB09E0]];
  [v1 pointSize];
  v3 = objc_msgSend(v2, "fontWithSize:");

  return v3;
}

+ (id)mru_ambientTimeFont
{
  uint64_t v0 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2908] maximumContentSizeCategory:*MEMORY[0x1E4FB27C0]];
  v1 = (void *)MEMORY[0x1E4FB08E0];
  [v0 pointSize];
  v2 = objc_msgSend(v1, "monospacedDigitSystemFontOfSize:weight:");

  return v2;
}

+ (uint64_t)mru_suggestedRouteActivityTitleFont
{
  return [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28C8] variant:1280 maximumContentSizeCategory:*MEMORY[0x1E4FB27D8]];
}

+ (uint64_t)mru_suggestedRouteActivitySubtitleFont
{
  return [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28F0] variant:1280 maximumContentSizeCategory:*MEMORY[0x1E4FB27D8]];
}

+ (uint64_t)mru_suggestedRouteBannerTitleFont
{
  return [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28C8] variant:1280 maximumContentSizeCategory:*MEMORY[0x1E4FB27B0]];
}

+ (uint64_t)mru_suggestedRouteBannerSubtitleFont
{
  return [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28F0] variant:1280 maximumContentSizeCategory:*MEMORY[0x1E4FB27B0]];
}

@end