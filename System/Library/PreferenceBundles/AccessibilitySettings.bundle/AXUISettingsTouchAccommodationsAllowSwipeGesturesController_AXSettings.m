@interface AXUISettingsTouchAccommodationsAllowSwipeGesturesController_AXSettings
- (BOOL)touchAccommodationsAllowsSwipeGesturesToBypass;
- (double)touchAccommodationsSwipeGestureMinimumDistance;
- (void)setTouchAccommodationsAllowsSwipeGesturesToBypass:(BOOL)a3;
- (void)setTouchAccommodationsSwipeGestureMinimumDistance:(double)a3;
@end

@implementation AXUISettingsTouchAccommodationsAllowSwipeGesturesController_AXSettings

- (BOOL)touchAccommodationsAllowsSwipeGesturesToBypass
{
  v2 = +[AXSettings sharedInstance];
  unsigned __int8 v3 = [v2 touchAccommodationsAllowsSwipeGesturesToBypass];

  return v3;
}

- (void)setTouchAccommodationsAllowsSwipeGesturesToBypass:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[AXSettings sharedInstance];
  [v4 setTouchAccommodationsAllowsSwipeGesturesToBypass:v3];
}

- (double)touchAccommodationsSwipeGestureMinimumDistance
{
  v2 = +[AXSettings sharedInstance];
  [v2 touchAccommodationsSwipeGestureMinimumDistance];
  double v4 = v3;

  return v4;
}

- (void)setTouchAccommodationsSwipeGestureMinimumDistance:(double)a3
{
  id v4 = +[AXSettings sharedInstance];
  [v4 setTouchAccommodationsSwipeGestureMinimumDistance:a3];
}

@end