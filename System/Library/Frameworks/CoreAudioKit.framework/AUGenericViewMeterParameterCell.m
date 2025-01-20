@interface AUGenericViewMeterParameterCell
- (NSLayoutConstraint)minWidthConstraint;
- (UIColor)tintColor;
- (UILabel)maxLabel;
- (UILabel)minLabel;
- (UILabel)unitLabel;
- (_TtC12CoreAudioKit11AUMeterView)meter;
- (_TtC12CoreAudioKit31AUGenericViewMeterParameterCell)initWithCoder:(id)a3;
- (void)setMaxLabel:(id)a3;
- (void)setMeter:(id)a3;
- (void)setMinLabel:(id)a3;
- (void)setMinWidthConstraint:(id)a3;
- (void)setTintColor:(id)a3;
- (void)setUnitLabel:(id)a3;
@end

@implementation AUGenericViewMeterParameterCell

- (_TtC12CoreAudioKit11AUMeterView)meter
{
  v2 = (void *)MEMORY[0x223C2B6C0]((char *)self + OBJC_IVAR____TtC12CoreAudioKit31AUGenericViewMeterParameterCell_meter, a2);

  return (_TtC12CoreAudioKit11AUMeterView *)v2;
}

- (void)setMeter:(id)a3
{
}

- (UILabel)unitLabel
{
  v2 = (void *)MEMORY[0x223C2B6C0]((char *)self + OBJC_IVAR____TtC12CoreAudioKit31AUGenericViewMeterParameterCell_unitLabel, a2);

  return (UILabel *)v2;
}

- (void)setUnitLabel:(id)a3
{
}

- (UILabel)minLabel
{
  v2 = (void *)MEMORY[0x223C2B6C0]((char *)self + OBJC_IVAR____TtC12CoreAudioKit31AUGenericViewMeterParameterCell_minLabel, a2);

  return (UILabel *)v2;
}

- (void)setMinLabel:(id)a3
{
}

- (UILabel)maxLabel
{
  v2 = (void *)MEMORY[0x223C2B6C0]((char *)self + OBJC_IVAR____TtC12CoreAudioKit31AUGenericViewMeterParameterCell_maxLabel, a2);

  return (UILabel *)v2;
}

- (void)setMaxLabel:(id)a3
{
}

- (NSLayoutConstraint)minWidthConstraint
{
  v2 = (void *)MEMORY[0x223C2B6C0]((char *)self + OBJC_IVAR____TtC12CoreAudioKit31AUGenericViewMeterParameterCell_minWidthConstraint, a2);

  return (NSLayoutConstraint *)v2;
}

- (void)setMinWidthConstraint:(id)a3
{
}

- (UIColor)tintColor
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AUGenericViewMeterParameterCell();
  v2 = [(AUGenericViewParameterCellBase *)&v4 tintColor];

  return v2;
}

- (void)setTintColor:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AUGenericViewMeterParameterCell();
  id v4 = a3;
  id v5 = v6.receiver;
  [(AUGenericViewParameterCellBase *)&v6 setTintColor:v4];
  sub_21E56D6B8();
}

- (_TtC12CoreAudioKit31AUGenericViewMeterParameterCell)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit31AUGenericViewMeterParameterCell *)sub_21E56D900(a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();

  swift_unknownObjectWeakDestroy();
}

@end