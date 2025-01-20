@interface AlarmComplicationCurvedTextView
- (_TtC11ClockPoster31AlarmComplicationCurvedTextView)initWithCoder:(id)a3;
- (_TtC11ClockPoster31AlarmComplicationCurvedTextView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation AlarmComplicationCurvedTextView

- (_TtC11ClockPoster31AlarmComplicationCurvedTextView)initWithFrame:(CGRect)a3
{
  return (_TtC11ClockPoster31AlarmComplicationCurvedTextView *)sub_249F7B798(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11ClockPoster31AlarmComplicationCurvedTextView)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC11ClockPoster31AlarmComplicationCurvedTextView_pathProvider;
  *(void *)v5 = 0x4036000000000000;
  v5[8] = 0;
  uint64_t v6 = OBJC_IVAR____TtC11ClockPoster31AlarmComplicationCurvedTextView_timeFormatter;
  id v7 = objc_allocWithZone(MEMORY[0x263EFD220]);
  id v8 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v6) = (Class)objc_msgSend(v7, sel_init);
  uint64_t v9 = OBJC_IVAR____TtC11ClockPoster31AlarmComplicationCurvedTextView_alarmIconLayer;
  *(Class *)((char *)&self->super.super.super.isa + v9) = (Class)sub_249F7BF1C();
  uint64_t v10 = OBJC_IVAR____TtC11ClockPoster31AlarmComplicationCurvedTextView_alarmTextLayer;
  *(Class *)((char *)&self->super.super.super.isa + v10) = (Class)sub_249F7C23C();

  result = (_TtC11ClockPoster31AlarmComplicationCurvedTextView *)sub_24A057BC8();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_249F7B9A8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ClockPoster31AlarmComplicationCurvedTextView_timeFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ClockPoster31AlarmComplicationCurvedTextView_alarmIconLayer));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11ClockPoster31AlarmComplicationCurvedTextView_alarmTextLayer);
}

@end