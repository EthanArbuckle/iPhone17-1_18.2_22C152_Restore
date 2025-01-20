@interface AUGenericViewParameterCellBase
- (NSLayoutConstraint)parameterWidthConstraint;
- (NSLayoutConstraint)valueStackWidthConstraint;
- (UIColor)tintColor;
- (UILabel)parameterName;
- (UILabel)valueLabel;
- (_TtC12CoreAudioKit30AUGenericViewParameterCellBase)initWithCoder:(id)a3;
- (_TtC12CoreAudioKit30AUGenericViewParameterCellBase)initWithFrame:(CGRect)a3;
- (void)setParameterName:(id)a3;
- (void)setParameterWidthConstraint:(id)a3;
- (void)setTintColor:(id)a3;
- (void)setValueLabel:(id)a3;
- (void)setValueStackWidthConstraint:(id)a3;
@end

@implementation AUGenericViewParameterCellBase

- (UILabel)parameterName
{
  v2 = (void *)MEMORY[0x223C2B6C0]((char *)self + OBJC_IVAR____TtC12CoreAudioKit30AUGenericViewParameterCellBase_parameterName, a2);

  return (UILabel *)v2;
}

- (void)setParameterName:(id)a3
{
}

- (UILabel)valueLabel
{
  v2 = (void *)MEMORY[0x223C2B6C0]((char *)self + OBJC_IVAR____TtC12CoreAudioKit30AUGenericViewParameterCellBase_valueLabel, a2);

  return (UILabel *)v2;
}

- (void)setValueLabel:(id)a3
{
}

- (NSLayoutConstraint)parameterWidthConstraint
{
  v2 = (void *)MEMORY[0x223C2B6C0]((char *)self + OBJC_IVAR____TtC12CoreAudioKit30AUGenericViewParameterCellBase_parameterWidthConstraint, a2);

  return (NSLayoutConstraint *)v2;
}

- (void)setParameterWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)valueStackWidthConstraint
{
  v2 = (void *)MEMORY[0x223C2B6C0]((char *)self + OBJC_IVAR____TtC12CoreAudioKit30AUGenericViewParameterCellBase_valueStackWidthConstraint, a2);

  return (NSLayoutConstraint *)v2;
}

- (void)setValueStackWidthConstraint:(id)a3
{
}

- (UIColor)tintColor
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AUGenericViewParameterCellBase();
  v2 = [(AUGenericViewParameterCellBase *)&v4 tintColor];

  return v2;
}

- (void)setTintColor:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AUGenericViewParameterCellBase();
  id v4 = a3;
  id v5 = v6.receiver;
  [(AUGenericViewParameterCellBase *)&v6 setTintColor:v4];
  sub_21E5773A0();
}

- (_TtC12CoreAudioKit30AUGenericViewParameterCellBase)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit30AUGenericViewParameterCellBase *)sub_21E5774B4(a3);
}

- (_TtC12CoreAudioKit30AUGenericViewParameterCellBase)initWithFrame:(CGRect)a3
{
  result = (_TtC12CoreAudioKit30AUGenericViewParameterCellBase *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  sub_21E577E5C((uint64_t)self + OBJC_IVAR____TtC12CoreAudioKit30AUGenericViewParameterCellBase_owner);
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC12CoreAudioKit30AUGenericViewParameterCellBase_param);
}

@end