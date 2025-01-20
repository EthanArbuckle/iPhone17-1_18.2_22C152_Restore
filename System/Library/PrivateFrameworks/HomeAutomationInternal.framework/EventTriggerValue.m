@interface EventTriggerValue
- (_TtC22HomeAutomationInternal17EventTriggerValue)initWithCoder:(id)a3;
- (_TtC22HomeAutomationInternal17EventTriggerValue)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5;
@end

@implementation EventTriggerValue

- (_TtC22HomeAutomationInternal17EventTriggerValue)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC22HomeAutomationInternal17EventTriggerValue_offset;
  uint64_t v5 = sub_22E6CBF50();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  v6 = (char *)self + OBJC_IVAR____TtC22HomeAutomationInternal17EventTriggerValue_recurringDate;
  uint64_t v7 = sub_22E6CC1B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);

  result = (_TtC22HomeAutomationInternal17EventTriggerValue *)sub_22E6D0CC0();
  __break(1u);
  return result;
}

- (_TtC22HomeAutomationInternal17EventTriggerValue)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  result = (_TtC22HomeAutomationInternal17EventTriggerValue *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end