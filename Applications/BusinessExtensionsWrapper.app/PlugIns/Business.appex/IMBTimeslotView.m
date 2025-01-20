@interface IMBTimeslotView
- (UILabel)timeLabel;
- (_TtC8Business15IMBTimeslotView)initWithCoder:(id)a3;
- (_TtC8Business15IMBTimeslotView)initWithFrame:(CGRect)a3;
- (void)timeViewTappedWithGestureRecognizer:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation IMBTimeslotView

- (UILabel)timeLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC8Business15IMBTimeslotView_timeLabel));
}

- (_TtC8Business15IMBTimeslotView)initWithCoder:(id)a3
{
  *(void *)&self->timeslot[OBJC_IVAR____TtC8Business15IMBTimeslotView_timeSelectionDelegate] = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Business15IMBTimeslotView_widthLayoutConstraint) = 0;
  uint64_t v5 = OBJC_IVAR____TtC8Business15IMBTimeslotView_timeLabel;
  id v6 = objc_allocWithZone((Class)UILabel);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Business15IMBTimeslotView_isSelected) = 0;

  result = (_TtC8Business15IMBTimeslotView *)sub_1000BC0B8();
  __break(1u);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100086228();
}

- (void)timeViewTappedWithGestureRecognizer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100086300();
}

- (_TtC8Business15IMBTimeslotView)initWithFrame:(CGRect)a3
{
  result = (_TtC8Business15IMBTimeslotView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_100010D28((uint64_t)self + OBJC_IVAR____TtC8Business15IMBTimeslotView_timeSelectionDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business15IMBTimeslotView_widthLayoutConstraint));
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Business15IMBTimeslotView_timeLabel);
}

@end