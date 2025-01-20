@interface HearingAidTuningValuesSliderCell
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (NSArray)automationElements;
- (NSString)accessibilityHint;
- (NSString)accessibilityLabel;
- (NSString)accessibilityValue;
- (_TtC21HearingModeSettingsUI32HearingAidTuningValuesSliderCell)initWithCoder:(id)a3;
- (_TtC21HearingModeSettingsUI32HearingAidTuningValuesSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (_TtC21HearingModeSettingsUI32HearingAidTuningValuesSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (unint64_t)accessibilityTraits;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation HearingAidTuningValuesSliderCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_251268BF0(a3);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (NSString)accessibilityLabel
{
  sub_251267590(*((unsigned char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidTuningValuesSliderCell_sliderType));
  v2 = (void *)sub_25126C458();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)accessibilityValue
{
  return (NSString *)sub_25126A38C(self, (uint64_t)a2, (SEL *)&selRef_accessibilityValue);
}

- (unint64_t)accessibilityTraits
{
  v2 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.super.super.super.super.isa) + 0x80);
  v3 = self;
  v4 = (void *)v2();
  id v5 = objc_msgSend(v4, sel_accessibilityTraits);

  return (unint64_t)v5;
}

- (NSString)accessibilityHint
{
  return (NSString *)sub_25126A38C(self, (uint64_t)a2, (SEL *)&selRef_accessibilityHint);
}

- (void)accessibilityIncrement
{
}

- (void)accessibilityDecrement
{
}

- (CGPoint)accessibilityActivationPoint
{
  v2 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.super.super.super.super.isa) + 0x80);
  v3 = self;
  v4 = (void *)v2();
  objc_msgSend(v4, sel_accessibilityActivationPoint);
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (NSArray)automationElements
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AF50);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_25126E8C0;
  v4 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.super.super.super.super.isa) + 0x80);
  double v5 = self;
  uint64_t v6 = v4();
  *(void *)(v3 + 56) = sub_25123DFF4(0, &qword_269B2B6E8);
  *(void *)(v3 + 32) = v6;

  double v7 = (void *)sub_25126C528();
  swift_bridgeObjectRelease();
  return (NSArray *)v7;
}

- (_TtC21HearingModeSettingsUI32HearingAidTuningValuesSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  return (_TtC21HearingModeSettingsUI32HearingAidTuningValuesSliderCell *)sub_25126AA6C((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, a5, (uint64_t (*)(uint64_t, uint64_t, uint64_t, void *))sub_25126A95C);
}

- (_TtC21HearingModeSettingsUI32HearingAidTuningValuesSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return (_TtC21HearingModeSettingsUI32HearingAidTuningValuesSliderCell *)sub_25126ABD4((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_25126AAE8);
}

- (_TtC21HearingModeSettingsUI32HearingAidTuningValuesSliderCell)initWithCoder:(id)a3
{
  return (_TtC21HearingModeSettingsUI32HearingAidTuningValuesSliderCell *)sub_25126AC30(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidTuningValuesSliderCell____lazy_storage___slider));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidTuningValuesSliderCell__headphoneDevice));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidTuningValuesSliderCell_bluetoothDevice));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidTuningValuesSliderCell_hms);
}

@end