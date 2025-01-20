@interface PlatterlessNonScalingButton
- (BOOL)canBecomeFocused;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC13FitnessCoreUI27PlatterlessNonScalingButton)initWithCoder:(id)a3;
- (_TtC13FitnessCoreUI27PlatterlessNonScalingButton)initWithFrame:(CGRect)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation PlatterlessNonScalingButton

- (_TtC13FitnessCoreUI27PlatterlessNonScalingButton)initWithFrame:(CGRect)a3
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
  v7 = sub_24EEC4C14(x, y, width, height);
  swift_release();
  return (_TtC13FitnessCoreUI27PlatterlessNonScalingButton *)v7;
}

- (_TtC13FitnessCoreUI27PlatterlessNonScalingButton)initWithCoder:(id)a3
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v4 = a3;
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_release();
  result = (_TtC13FitnessCoreUI27PlatterlessNonScalingButton *)sub_24EEDDCF0();
  __break(1u);
  return result;
}

- (CGSize)intrinsicContentSize
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v3 = self;
  sub_24EEDD9A0();
  sub_24EEDD990();
  uint64_t isCurrentExecutor = swift_task_isCurrentExecutor();
  if ((isCurrentExecutor & 1) == 0) {
    uint64_t isCurrentExecutor = swift_task_reportUnexpectedExecutor();
  }
  CGSizeMake(isCurrentExecutor);
  -[PlatterlessNonScalingButton sizeThatFits:](v3, sel_sizeThatFits_);
  double v6 = v5;
  double v8 = v7;
  swift_release();

  swift_release();
  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  double v6 = self;
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  objc_msgSend(*(id *)((char *)&v6->super.super.super.super.isa+ OBJC_IVAR____TtC13FitnessCoreUI27PlatterlessNonScalingButton_titleLabel), sel_sizeThatFits_, width, height);
  double v8 = v7;
  double v10 = v9;
  swift_release();

  uint64_t v11 = swift_release();
  double v12 = CGSizeMake(v11);
  double v14 = v10 + v13 + v13;
  double v15 = v8 + v12 + v12;
  result.double height = v14;
  result.double width = v15;
  return result;
}

- (void)layoutSubviews
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v3 = self;
  sub_24EEC5280();
  swift_release();
}

- (BOOL)canBecomeFocused
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v3 = self;
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  unsigned __int8 v4 = [(PlatterlessNonScalingButton *)v3 isEnabled];
  swift_release();

  swift_release();
  return v4;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v7 = a3;
  id v8 = a4;
  double v9 = self;
  sub_24EEC5568((uint64_t)v7, v8);
  swift_release();
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FitnessCoreUI27PlatterlessNonScalingButton_titleLabel));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC13FitnessCoreUI27PlatterlessNonScalingButton_floatingContentView);
}

@end