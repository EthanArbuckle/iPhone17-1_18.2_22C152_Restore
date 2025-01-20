@interface ControlDragWindow.ControlDragViewController
- (_TtCC15ControlCenterUI17ControlDragWindowP33_DBABBCE4349E03AF86A0E6B1A7346F4125ControlDragViewController)initWithCoder:(id)a3;
- (_TtCC15ControlCenterUI17ControlDragWindowP33_DBABBCE4349E03AF86A0E6B1A7346F4125ControlDragViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
@end

@implementation ControlDragWindow.ControlDragViewController

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (_TtCC15ControlCenterUI17ControlDragWindowP33_DBABBCE4349E03AF86A0E6B1A7346F4125ControlDragViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_1D7BB7258();
    id v6 = a4;
    v7 = (void *)sub_1D7BB7228();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for ControlDragWindow.ControlDragViewController();
  v9 = [(ControlDragWindow.ControlDragViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtCC15ControlCenterUI17ControlDragWindowP33_DBABBCE4349E03AF86A0E6B1A7346F4125ControlDragViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ControlDragWindow.ControlDragViewController();
  return [(ControlDragWindow.ControlDragViewController *)&v5 initWithCoder:a3];
}

@end