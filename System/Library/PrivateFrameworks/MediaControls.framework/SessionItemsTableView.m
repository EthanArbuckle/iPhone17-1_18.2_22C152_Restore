@interface SessionItemsTableView
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (_TtC13MediaControls21SessionItemsTableView)initWithCoder:(id)a3;
- (_TtC13MediaControls21SessionItemsTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4;
@end

@implementation SessionItemsTableView

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  id v9 = [(SessionItemsTableView *)v8 panGestureRecognizer];

  return v9 == v6;
}

- (_TtC13MediaControls21SessionItemsTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for SessionItemsTableView();
  return -[SessionItemsTableView initWithFrame:style:](&v10, sel_initWithFrame_style_, a4, x, y, width, height);
}

- (_TtC13MediaControls21SessionItemsTableView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SessionItemsTableView();
  return [(SessionItemsTableView *)&v5 initWithCoder:a3];
}

@end