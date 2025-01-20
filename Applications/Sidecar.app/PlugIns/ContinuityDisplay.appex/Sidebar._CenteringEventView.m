@interface Sidebar._CenteringEventView
- (_TtCO17ContinuityDisplay7SidebarP33_17941A61753FE3CA8E84101B4CCC5D9519_CenteringEventView)initWithCoder:(id)a3;
- (_TtCO17ContinuityDisplay7SidebarP33_17941A61753FE3CA8E84101B4CCC5D9519_CenteringEventView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation Sidebar._CenteringEventView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v8 = a4;
  v9 = self;
  id v10 = sub_10001D3D0((uint64_t)a4, x, y);

  return v10;
}

- (_TtCO17ContinuityDisplay7SidebarP33_17941A61753FE3CA8E84101B4CCC5D9519_CenteringEventView)initWithFrame:(CGRect)a3
{
  return (_TtCO17ContinuityDisplay7SidebarP33_17941A61753FE3CA8E84101B4CCC5D9519_CenteringEventView *)sub_10001D57C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCO17ContinuityDisplay7SidebarP33_17941A61753FE3CA8E84101B4CCC5D9519_CenteringEventView)initWithCoder:(id)a3
{
  return (_TtCO17ContinuityDisplay7SidebarP33_17941A61753FE3CA8E84101B4CCC5D9519_CenteringEventView *)sub_10001D608(a3);
}

@end