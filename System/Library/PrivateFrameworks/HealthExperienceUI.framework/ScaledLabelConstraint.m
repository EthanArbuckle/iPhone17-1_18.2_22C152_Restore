@interface ScaledLabelConstraint
- (UILabel)referenceLabel;
- (_TtC18HealthExperienceUI21ScaledLabelConstraint)init;
- (void)awakeFromNib;
- (void)setReferenceLabel:(id)a3;
- (void)textSizeChanged;
@end

@implementation ScaledLabelConstraint

- (UILabel)referenceLabel
{
  v2 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI21ScaledLabelConstraint_referenceLabel;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x1B3E68580](v2);
  return (UILabel *)v3;
}

- (void)setReferenceLabel:(id)a3
{
}

- (void)awakeFromNib
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ScaledLabelConstraint();
  v2 = (char *)v5.receiver;
  [(ScaledLabelConstraint *)&v5 awakeFromNib];
  v3 = &v2[OBJC_IVAR____TtC18HealthExperienceUI21ScaledLabelConstraint_referenceLabel];
  swift_beginAccess();
  v4 = (void *)MEMORY[0x1B3E68580](v3);

  if (v4)
  {
    sub_1AD3275CC();
  }
  else
  {
    sub_1AD7408B0();
    __break(1u);
  }
}

- (void)textSizeChanged
{
  v2 = self;
  sub_1AD327708();
}

- (_TtC18HealthExperienceUI21ScaledLabelConstraint)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18HealthExperienceUI21ScaledLabelConstraint_rawConstant) = 0;
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ScaledLabelConstraint();
  return [(ScaledLabelConstraint *)&v4 init];
}

- (void).cxx_destruct
{
}

@end