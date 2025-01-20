@interface TimeTriggerValue
- (NSString)description;
- (_TtC22HomeAutomationInternal16TimeTriggerValue)initWithCoder:(id)a3;
- (_TtC22HomeAutomationInternal16TimeTriggerValue)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5;
@end

@implementation TimeTriggerValue

- (_TtC22HomeAutomationInternal16TimeTriggerValue)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC22HomeAutomationInternal16TimeTriggerValue_recurringDate;
  uint64_t v5 = sub_22E6CC1B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);

  result = (_TtC22HomeAutomationInternal16TimeTriggerValue *)sub_22E6D0CC0();
  __break(1u);
  return result;
}

- (_TtC22HomeAutomationInternal16TimeTriggerValue)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  result = (_TtC22HomeAutomationInternal16TimeTriggerValue *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC22HomeAutomationInternal16TimeTriggerValue_triggerDate;
  uint64_t v4 = sub_22E6CBF50();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_22E1587F8((uint64_t)self + OBJC_IVAR____TtC22HomeAutomationInternal16TimeTriggerValue_recurringDate, &qword_2685DA020);
}

- (NSString)description
{
  return (NSString *)sub_22E697894(self, (uint64_t)a2, (void (*)(void))TimeTriggerValue.description.getter);
}

@end