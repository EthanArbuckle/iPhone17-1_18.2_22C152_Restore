@interface TipUIView
- (UIColor)backgroundColor;
- (_TtC6TipKit9TipUIView)initWithCoder:(id)a3;
- (_TtC6TipKit9TipUIView)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)setBackgroundColor:(id)a3;
@end

@implementation TipUIView

- (UIColor)backgroundColor
{
  sub_2463870F0();
  sub_2463870E0();
  sub_2463870D0();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v3 = self;
  v4 = (void *)TipUIView.backgroundColor.getter();
  swift_release();

  return (UIColor *)v4;
}

- (void)setBackgroundColor:(id)a3
{
  sub_2463870F0();
  sub_2463870E0();
  sub_2463870D0();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v5 = a3;
  v6 = self;
  TipUIView.backgroundColor.setter();
  swift_release();
}

- (_TtC6TipKit9TipUIView)initWithCoder:(id)a3
{
  sub_2463870F0();
  sub_2463870E0();
  sub_2463870D0();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v4 = a3;
  TipUIView.init(coder:)();
  sub_24638145C();
  return result;
}

- (void)dealloc
{
  v2 = self;
  TipUIView.__deallocating_deinit();
}

- (void).cxx_destruct
{
}

- (_TtC6TipKit9TipUIView)initWithFrame:(CGRect)a3
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  TipUIView.init(frame:)();
}

@end