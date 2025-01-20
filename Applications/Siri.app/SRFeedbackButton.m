@interface SRFeedbackButton
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC4Siri16SRFeedbackButton)initWithCoder:(id)a3;
- (_TtC4Siri16SRFeedbackButton)initWithFrame:(CGRect)a3;
@end

@implementation SRFeedbackButton

- (_TtC4Siri16SRFeedbackButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC4Siri16SRFeedbackButton_diameter) = (Class)0x4049000000000000;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for SRFeedbackButton();
  v7 = -[SRFeedbackButton initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
  sub_1000A6FD8();

  return v7;
}

- (_TtC4Siri16SRFeedbackButton)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC4Siri16SRFeedbackButton_diameter) = (Class)0x4049000000000000;
  id v4 = a3;

  result = (_TtC4Siri16SRFeedbackButton *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = 50.0;
  double v4 = 50.0;
  result.double height = v4;
  result.double width = v3;
  return result;
}

@end