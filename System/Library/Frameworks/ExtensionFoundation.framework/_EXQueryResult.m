@interface _EXQueryResult
+ (BOOL)supportsSecureCoding;
- (NSSet)identities;
- (_EXExtensionAvailablility)availablility;
- (_EXQueryResult)init;
- (_EXQueryResult)initWithAvailablility:(id)a3;
- (_EXQueryResult)initWithCoder:(id)a3;
- (_EXQueryResult)initWithIdentities:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _EXQueryResult

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXQueryResult_availablility);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_EXQueryResult)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXQueryResult_identities) = (Class)MEMORY[0x1E4FBC870];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXQueryResult_availablility) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for _EXQueryResult();
  return [(_EXQueryResult *)&v3 init];
}

- (_EXQueryResult)initWithIdentities:(id)a3
{
  sub_191F442A4(0, (unint64_t *)&qword_1EB27BCB0);
  sub_191F3B0F4();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXQueryResult_identities) = (Class)sub_191FB9FB8();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXQueryResult_availablility) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for _EXQueryResult();
  return [(_EXQueryResult *)&v5 init];
}

- (_EXQueryResult)initWithAvailablility:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXQueryResult_identities) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXQueryResult_availablility) = (Class)a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for _EXQueryResult();
  id v4 = a3;
  return [(_EXQueryResult *)&v6 init];
}

- (_EXQueryResult)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_EXQueryResult *)sub_191F9C3EC();

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_191F9B5F0(v4);
}

- (NSSet)identities
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____EXQueryResult_identities))
  {
    sub_191F442A4(0, (unint64_t *)&qword_1EB27BCB0);
    sub_191F3B0F4();
    swift_bridgeObjectRetain();
    v2 = (void *)sub_191FB9FA8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }

  return (NSSet *)v2;
}

- (_EXExtensionAvailablility)availablility
{
  return (_EXExtensionAvailablility *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                              + OBJC_IVAR____EXQueryResult_availablility));
}

@end