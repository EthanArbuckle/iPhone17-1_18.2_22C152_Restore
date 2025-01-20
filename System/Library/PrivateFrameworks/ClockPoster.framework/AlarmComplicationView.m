@interface AlarmComplicationView
- (UIColor)tintColor;
- (_TtC11ClockPoster21AlarmComplicationView)initWithCoder:(id)a3;
- (_TtC11ClockPoster21AlarmComplicationView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setTintColor:(id)a3;
@end

@implementation AlarmComplicationView

- (_TtC11ClockPoster21AlarmComplicationView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11ClockPoster21AlarmComplicationView_alarmTimeLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11ClockPoster21AlarmComplicationView_alarmIcon) = 0;
  id v4 = a3;

  result = (_TtC11ClockPoster21AlarmComplicationView *)sub_24A057BC8();
  __break(1u);
  return result;
}

- (UIColor)tintColor
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AlarmComplicationView();
  v2 = [(AlarmComplicationView *)&v4 tintColor];

  return v2;
}

- (void)setTintColor:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for AlarmComplicationView();
  objc_super v4 = (char *)v9.receiver;
  id v5 = a3;
  [(AlarmComplicationView *)&v9 setTintColor:v5];
  v6 = *(void **)&v4[OBJC_IVAR____TtC11ClockPoster21AlarmComplicationView_alarmIcon];
  if (v6)
  {
    id v7 = v6;
    v8 = (char *)objc_msgSend(v4, sel_tintColor, v9.receiver, v9.super_class);
    objc_msgSend(v7, sel_setTintColor_, v8);

    objc_super v4 = v8;
    id v5 = v7;
  }
}

- (void)layoutSubviews
{
  v2 = self;
  sub_24A054378();
}

- (_TtC11ClockPoster21AlarmComplicationView)initWithFrame:(CGRect)a3
{
  result = (_TtC11ClockPoster21AlarmComplicationView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC11ClockPoster21AlarmComplicationView_fireDate;
  uint64_t v4 = sub_24A056238();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ClockPoster21AlarmComplicationView_alarmTimeLabel));
  id v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11ClockPoster21AlarmComplicationView_alarmIcon);
}

@end