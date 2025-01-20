@interface AUGenericViewBoolParameterCell
- (BOOL)accessibilityActivate;
- (UIColor)tintColor;
- (UISwitch)valueSwitch;
- (_TtC12CoreAudioKit30AUGenericViewBoolParameterCell)initWithCoder:(id)a3;
- (void)setTintColor:(id)a3;
- (void)setValueSwitch:(id)a3;
- (void)switchValueChangedWithSender:(id)a3;
@end

@implementation AUGenericViewBoolParameterCell

- (UISwitch)valueSwitch
{
  v2 = (void *)MEMORY[0x223C2B6C0]((char *)self + OBJC_IVAR____TtC12CoreAudioKit30AUGenericViewBoolParameterCell_valueSwitch, a2);

  return (UISwitch *)v2;
}

- (void)setValueSwitch:(id)a3
{
}

- (UIColor)tintColor
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AUGenericViewBoolParameterCell();
  v2 = [(AUGenericViewParameterCellBase *)&v4 tintColor];

  return v2;
}

- (void)setTintColor:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AUGenericViewBoolParameterCell();
  id v4 = a3;
  id v5 = v6.receiver;
  [(AUGenericViewParameterCellBase *)&v6 setTintColor:v4];
  sub_21E593A10();
}

- (BOOL)accessibilityActivate
{
  v2 = self;
  sub_21E593B80();

  return 1;
}

- (void)switchValueChangedWithSender:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_21E5941F4();
}

- (_TtC12CoreAudioKit30AUGenericViewBoolParameterCell)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AUGenericViewBoolParameterCell();
  return [(AUGenericViewParameterCellBase *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end