@interface TipUICollectionViewCell
- (UIColor)backgroundColor;
- (_TtC6TipKit23TipUICollectionViewCell)initWithCoder:(id)a3;
- (_TtC6TipKit23TipUICollectionViewCell)initWithFrame:(CGRect)a3;
- (void)setBackgroundColor:(id)a3;
@end

@implementation TipUICollectionViewCell

- (UIColor)backgroundColor
{
  sub_2463870F0();
  sub_2463870E0();
  sub_2463870D0();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v3 = self;
  v4 = (void *)TipUICollectionViewCell.backgroundColor.getter();
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
  TipUICollectionViewCell.backgroundColor.setter();
  swift_release();
}

- (_TtC6TipKit23TipUICollectionViewCell)initWithFrame:(CGRect)a3
{
  sub_2463870F0();
  sub_2463870E0();
  sub_2463870D0();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v3 = (_TtC6TipKit23TipUICollectionViewCell *)TipUICollectionViewCell.init(frame:)();
  swift_release();
  return v3;
}

- (_TtC6TipKit23TipUICollectionViewCell)initWithCoder:(id)a3
{
  sub_2463870F0();
  sub_2463870E0();
  sub_2463870D0();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v4 = (_TtC6TipKit23TipUICollectionViewCell *)TipUICollectionViewCell.init(coder:)(a3);
  swift_release();
  return v4;
}

- (void).cxx_destruct
{
}

@end