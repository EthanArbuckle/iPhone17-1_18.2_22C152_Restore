@interface AllergyReactionFormatter
- (_TtC15HealthRecordsUI24AllergyReactionFormatter)init;
- (id)displayItemsFromReaction:(id)a3 country:(id)a4;
@end

@implementation AllergyReactionFormatter

- (id)displayItemsFromReaction:(id)a3 country:(id)a4
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15HealthRecordsUI24AllergyReactionFormatter_context) >= (Class)2)
  {
    id v9 = a3;
    v10 = self;
    id result = (id)sub_1C25508E0();
    __break(1u);
  }
  else
  {
    id v5 = a3;
    v6 = self;
    sub_1C23D1984(v5);

    sub_1C224F52C();
    v7 = (void *)sub_1C254F700();
    swift_bridgeObjectRelease();
    return v7;
  }
  return result;
}

- (_TtC15HealthRecordsUI24AllergyReactionFormatter)init
{
  id result = (_TtC15HealthRecordsUI24AllergyReactionFormatter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end