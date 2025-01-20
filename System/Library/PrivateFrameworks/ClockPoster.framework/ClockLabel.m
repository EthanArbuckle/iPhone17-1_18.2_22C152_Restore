@interface ClockLabel
- (_TtC11ClockPoster10ClockLabel)initWithCoder:(id)a3;
- (_TtC11ClockPoster10ClockLabel)initWithFrame:(CGRect)a3;
- (_TtC11ClockPoster10ClockLabel)initWithTimeLabelOptions:(unint64_t)a3;
- (_TtC11ClockPoster10ClockLabel)initWithTimeLabelOptions:(unint64_t)a3 forDevice:(id)a4;
- (_TtC11ClockPoster10ClockLabel)initWithTimeLabelOptions:(unint64_t)a3 forDevice:(id)a4 clockTimer:(id)a5;
- (void)layoutSubviews;
@end

@implementation ClockLabel

- (void)layoutSubviews
{
  v2 = self;
  sub_249F8394C();
}

- (_TtC11ClockPoster10ClockLabel)initWithTimeLabelOptions:(unint64_t)a3
{
  return (_TtC11ClockPoster10ClockLabel *)sub_249F843F8(self, (uint64_t)a2, a3, (SEL *)&selRef_initWithTimeLabelOptions_);
}

- (_TtC11ClockPoster10ClockLabel)initWithTimeLabelOptions:(unint64_t)a3 forDevice:(id)a4
{
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC11ClockPoster10ClockLabel_observingOverrideDate) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ClockLabel();
  return [(CLKUITimeLabel *)&v7 initWithTimeLabelOptions:a3 forDevice:a4];
}

- (_TtC11ClockPoster10ClockLabel)initWithTimeLabelOptions:(unint64_t)a3 forDevice:(id)a4 clockTimer:(id)a5
{
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC11ClockPoster10ClockLabel_observingOverrideDate) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ClockLabel();
  return [(CLKUITimeLabel *)&v9 initWithTimeLabelOptions:a3 forDevice:a4 clockTimer:a5];
}

- (_TtC11ClockPoster10ClockLabel)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC11ClockPoster10ClockLabel_observingOverrideDate) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ClockLabel();
  return -[CLKUITimeLabel initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC11ClockPoster10ClockLabel)initWithCoder:(id)a3
{
  return (_TtC11ClockPoster10ClockLabel *)sub_249F843F8(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

@end