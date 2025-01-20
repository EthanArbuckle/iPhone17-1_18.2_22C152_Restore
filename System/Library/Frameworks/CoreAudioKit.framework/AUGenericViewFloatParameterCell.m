@interface AUGenericViewFloatParameterCell
- (UIColor)tintColor;
- (UILabel)unitLabel;
- (UISlider)valueSlider;
- (_TtC12CoreAudioKit31AUGenericViewFloatParameterCell)initWithCoder:(id)a3;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)setTintColor:(id)a3;
- (void)setUnitLabel:(id)a3;
- (void)setValueSlider:(id)a3;
- (void)sliderReleasedWithSender:(id)a3;
- (void)sliderTouchedWithSender:(id)a3;
- (void)sliderValueChangedWithSender:(id)a3;
@end

@implementation AUGenericViewFloatParameterCell

- (UISlider)valueSlider
{
  v2 = (void *)MEMORY[0x223C2B6C0]((char *)self + OBJC_IVAR____TtC12CoreAudioKit31AUGenericViewFloatParameterCell_valueSlider, a2);

  return (UISlider *)v2;
}

- (void)setValueSlider:(id)a3
{
}

- (UILabel)unitLabel
{
  v2 = (void *)MEMORY[0x223C2B6C0]((char *)self + OBJC_IVAR____TtC12CoreAudioKit31AUGenericViewFloatParameterCell_unitLabel, a2);

  return (UILabel *)v2;
}

- (void)setUnitLabel:(id)a3
{
}

- (void)sliderValueChangedWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_21E563970();
}

- (void)accessibilityIncrement
{
  v2 = self;
  sub_21E562978();
}

- (void)accessibilityDecrement
{
  v2 = self;
  sub_21E562B1C();
}

- (void)sliderTouchedWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_21E562CC0(v4);
}

- (void)sliderReleasedWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_21E562D4C(v4);
}

- (UIColor)tintColor
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AUGenericViewFloatParameterCell();
  v2 = [(AUGenericViewParameterCellBase *)&v4 tintColor];

  return v2;
}

- (void)setTintColor:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_21E563E4C((uint64_t)a3);
}

- (_TtC12CoreAudioKit31AUGenericViewFloatParameterCell)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AUGenericViewFloatParameterCell();
  return [(AUGenericViewParameterCellBase *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();

  swift_unknownObjectWeakDestroy();
}

@end