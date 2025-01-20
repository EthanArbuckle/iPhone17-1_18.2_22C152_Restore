@interface AccessibleFloatingTabBarControl
- (CGPoint)menuAttachmentPointForConfiguration:(id)a3;
- (_TtC13FitnessCoreUI31AccessibleFloatingTabBarControl)initWithCoder:(id)a3;
- (_TtC13FitnessCoreUI31AccessibleFloatingTabBarControl)initWithFrame:(CGRect)a3;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
@end

@implementation AccessibleFloatingTabBarControl

- (_TtC13FitnessCoreUI31AccessibleFloatingTabBarControl)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v7 = sub_24EE9F138(x, y, width, height);
  swift_release();
  return (_TtC13FitnessCoreUI31AccessibleFloatingTabBarControl *)v7;
}

- (_TtC13FitnessCoreUI31AccessibleFloatingTabBarControl)initWithCoder:(id)a3
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v4 = a3;
  v5 = (_TtC13FitnessCoreUI31AccessibleFloatingTabBarControl *)sub_24EEA2044();
  swift_release();
  return v5;
}

- (CGPoint)menuAttachmentPointForConfiguration:(id)a3
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v5 = a3;
  v6 = self;
  double v7 = sub_24EEA21C8();
  double v9 = v8;
  swift_release();

  double v10 = v7;
  double v11 = v9;
  result.double y = v11;
  result.double x = v10;
  return result;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v6 = a3;
  double v7 = self;
  id v8 = sub_24EEA241C();
  swift_release();

  return v8;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
}

- (void).cxx_destruct
{
  sub_24EE96F54((uint64_t)self + OBJC_IVAR____TtC13FitnessCoreUI31AccessibleFloatingTabBarControl_delegate);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FitnessCoreUI31AccessibleFloatingTabBarControl_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FitnessCoreUI31AccessibleFloatingTabBarControl_titleLabel));
  swift_bridgeObjectRelease();
}

@end