@interface _NCWidgetViewControllerView
- (BOOL)_canScrollX;
- (BOOL)_canScrollY;
- (BOOL)delaysContentTouches;
- (BOOL)touchesShouldBegin:(id)a3 withEvent:(id)a4 inContentView:(id)a5;
- (double)_scrollHysteresis;
- (double)_touchDelayForScrollDetection;
- (void)didMoveToWindow;
@end

@implementation _NCWidgetViewControllerView

- (void)didMoveToWindow
{
  v2.receiver = self;
  v2.super_class = (Class)_NCWidgetViewControllerView;
  [(_NCWidgetViewControllerView *)&v2 didMoveToWindow];
}

- (BOOL)delaysContentTouches
{
  return 1;
}

- (double)_touchDelayForScrollDetection
{
  return 0.15;
}

- (double)_scrollHysteresis
{
  return 10.0;
}

- (BOOL)_canScrollX
{
  return 1;
}

- (BOOL)_canScrollY
{
  return 1;
}

- (BOOL)touchesShouldBegin:(id)a3 withEvent:(id)a4 inContentView:(id)a5
{
  return 1;
}

@end