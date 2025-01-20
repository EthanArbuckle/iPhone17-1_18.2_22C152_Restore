@interface AnimatingPackageView
- (CGSize)intrinsicContentSize;
- (_TtC21ControlCenterSettings20AnimatingPackageView)initWithCoder:(id)a3;
- (_TtC21ControlCenterSettings20AnimatingPackageView)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
@end

@implementation AnimatingPackageView

- (_TtC21ControlCenterSettings20AnimatingPackageView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  sub_9F50();
  sub_9F40();
  sub_9F30();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v7 = (_TtC21ControlCenterSettings20AnimatingPackageView *)sub_2C18(x, y, width, height);
  swift_release();
  return v7;
}

- (_TtC21ControlCenterSettings20AnimatingPackageView)initWithCoder:(id)a3
{
  sub_9F50();
  sub_9F40();
  sub_9F30();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v4 = a3;
  v5 = (_TtC21ControlCenterSettings20AnimatingPackageView *)sub_4364();
  swift_release();
  return v5;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  sub_9F50();
  sub_9F40();
  sub_9F30();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v8 = self;
  sub_38E0(x, y, width, height);
  swift_release();
}

- (CGSize)intrinsicContentSize
{
  sub_9F50();
  sub_9F40();
  sub_9F30();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v3 = self;
  double v4 = sub_3C84();
  double v6 = v5;
  swift_release();

  double v7 = v4;
  double v8 = v6;
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21ControlCenterSettings20AnimatingPackageView_package));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC21ControlCenterSettings20AnimatingPackageView_packageLayer);
}

@end