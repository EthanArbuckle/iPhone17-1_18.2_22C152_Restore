@interface CHUISControlPickerOption
- (CHUISControlPickerOption)init;
- (NSString)actionHint;
- (NSString)status;
- (NSString)value;
- (UIColor)tint;
- (UIImage)icon;
- (void)setActionHint:(id)a3;
- (void)setIcon:(id)a3;
- (void)setStatus:(id)a3;
- (void)setTint:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation CHUISControlPickerOption

- (NSString)value
{
  return (NSString *)sub_1BC434798((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CHUISControlPickerOption_value);
}

- (void)setValue:(id)a3
{
}

- (UIImage)icon
{
  return (UIImage *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR___CHUISControlPickerOption_icon));
}

- (void)setIcon:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHUISControlPickerOption_icon);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHUISControlPickerOption_icon) = (Class)a3;
  id v3 = a3;
}

- (UIColor)tint
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR___CHUISControlPickerOption_tint));
}

- (void)setTint:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHUISControlPickerOption_tint);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHUISControlPickerOption_tint) = (Class)a3;
  id v3 = a3;
}

- (NSString)status
{
  return (NSString *)sub_1BC434798((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CHUISControlPickerOption_status);
}

- (void)setStatus:(id)a3
{
}

- (NSString)actionHint
{
  return (NSString *)sub_1BC434798((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CHUISControlPickerOption_actionHint);
}

- (void)setActionHint:(id)a3
{
}

- (CHUISControlPickerOption)init
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___CHUISControlPickerOption_value);
  void *v2 = 0;
  v2[1] = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHUISControlPickerOption_icon) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHUISControlPickerOption_tint) = 0;
  id v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___CHUISControlPickerOption_status);
  *id v3 = 0;
  v3[1] = 0;
  id v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR___CHUISControlPickerOption_actionHint);
  *id v4 = 0;
  v4[1] = 0;
  v6.receiver = self;
  v6.super_class = (Class)CHUISControlPickerOption;
  return [(CHUISControlPickerOption *)&v6 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end