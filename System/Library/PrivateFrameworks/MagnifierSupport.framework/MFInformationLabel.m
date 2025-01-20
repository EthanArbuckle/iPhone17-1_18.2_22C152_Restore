@interface MFInformationLabel
- (_TtC16MagnifierSupport18MFInformationLabel)init;
- (_TtC16MagnifierSupport18MFInformationLabel)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport18MFInformationLabel)initWithFrame:(CGRect)a3;
- (void)setNeedsLayout;
@end

@implementation MFInformationLabel

- (_TtC16MagnifierSupport18MFInformationLabel)init
{
  return (_TtC16MagnifierSupport18MFInformationLabel *)sub_23577BDE0();
}

- (void)setNeedsLayout
{
  v2 = self;
  sub_23577C014();
}

- (_TtC16MagnifierSupport18MFInformationLabel)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC16MagnifierSupport18MFInformationLabel_constraintAboveCard) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC16MagnifierSupport18MFInformationLabel_constraintBelowCard) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC16MagnifierSupport18MFInformationLabel_centerConstraintX) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC16MagnifierSupport18MFInformationLabel_centerConstraintY) = 0;
  id v4 = a3;

  result = (_TtC16MagnifierSupport18MFInformationLabel *)sub_23594A968();
  __break(1u);
  return result;
}

- (_TtC16MagnifierSupport18MFInformationLabel)initWithFrame:(CGRect)a3
{
  result = (_TtC16MagnifierSupport18MFInformationLabel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport18MFInformationLabel_constraintAboveCard));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport18MFInformationLabel_constraintBelowCard));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport18MFInformationLabel_centerConstraintX));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC16MagnifierSupport18MFInformationLabel_centerConstraintY);
}

@end