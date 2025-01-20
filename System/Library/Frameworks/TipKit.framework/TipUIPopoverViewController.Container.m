@interface TipUIPopoverViewController.Container
- (UIEdgeInsets)safeAreaInsets;
- (_TtCC6TipKit26TipUIPopoverViewController9Container)initWithCoder:(id)a3;
- (_TtCC6TipKit26TipUIPopoverViewController9Container)initWithFrame:(CGRect)a3;
@end

@implementation TipUIPopoverViewController.Container

- (UIEdgeInsets)safeAreaInsets
{
  sub_2463870F0();
  sub_2463870E0();
  sub_2463870D0();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v3 = self;
  double v4 = sub_24637D75C();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  swift_release();

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (_TtCC6TipKit26TipUIPopoverViewController9Container)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  sub_2463870F0();
  sub_2463870E0();
  sub_2463870D0();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  double v7 = (_TtCC6TipKit26TipUIPopoverViewController9Container *)sub_24637D9D8(x, y, width, height);
  swift_release();
  return v7;
}

- (_TtCC6TipKit26TipUIPopoverViewController9Container)initWithCoder:(id)a3
{
  sub_24637DB94();
  return result;
}

@end