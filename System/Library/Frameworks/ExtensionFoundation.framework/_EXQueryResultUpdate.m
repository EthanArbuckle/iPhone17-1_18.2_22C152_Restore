@interface _EXQueryResultUpdate
- (NSSet)addedExtensions;
- (NSSet)removedUUIDs;
- (NSString)description;
- (_EXQueryResultUpdate)init;
- (_EXQueryResultUpdate)initWithAddedExtensions:(id)a3 removedUUIDs:(id)a4;
- (_EXQueryResultUpdate)initWithAvailablility:(id)a3;
- (_EXQueryResultUpdate)initWithCoder:(id)a3;
- (_EXQueryResultUpdate)initWithCurrentExtensions:(id)a3 updatedExtensions:(id)a4;
- (_EXQueryResultUpdate)initWithIdentities:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _EXQueryResultUpdate

- (void).cxx_destruct
{
}

- (NSSet)addedExtensions
{
  sub_191F442A4(0, (unint64_t *)&qword_1EB27BCB0);
  sub_191F3B0F4();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_191FB9FA8();
  swift_bridgeObjectRelease();

  return (NSSet *)v2;
}

- (NSSet)removedUUIDs
{
  sub_191FB9C68();
  sub_191F3C474(&qword_1E92FC6E0);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_191FB9FA8();
  swift_bridgeObjectRelease();

  return (NSSet *)v2;
}

- (_EXQueryResultUpdate)initWithCurrentExtensions:(id)a3 updatedExtensions:(id)a4
{
  sub_191F442A4(0, (unint64_t *)&qword_1EB27BCB0);
  sub_191F3B0F4();
  uint64_t v4 = sub_191FB9FB8();
  uint64_t v5 = sub_191FB9FB8();
  sub_191F3E0A8(v4, v5);
  return result;
}

- (_EXQueryResultUpdate)initWithAddedExtensions:(id)a3 removedUUIDs:(id)a4
{
  sub_191F442A4(0, (unint64_t *)&qword_1EB27BCB0);
  sub_191F3B0F4();
  uint64_t v5 = (objc_class *)sub_191FB9FB8();
  sub_191FB9C68();
  sub_191F3C474(&qword_1E92FC6E0);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____EXQueryResultUpdate_removedUUIDs) = (Class)sub_191FB9FB8();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____EXQueryResult_identities) = v5;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____EXQueryResult_availablility) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for _EXQueryResult();
  return [(_EXQueryResult *)&v7 init];
}

- (_EXQueryResultUpdate)initWithAvailablility:(id)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____EXQueryResultUpdate_removedUUIDs) = (Class)MEMORY[0x1E4FBC870];
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____EXQueryResult_identities) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____EXQueryResult_availablility) = (Class)a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for _EXQueryResult();
  id v4 = a3;
  return [(_EXQueryResult *)&v6 init];
}

- (_EXQueryResultUpdate)initWithIdentities:(id)a3
{
  sub_191F442A4(0, (unint64_t *)&qword_1EB27BCB0);
  sub_191F3B0F4();
  id v4 = (objc_class *)sub_191FB9FB8();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____EXQueryResultUpdate_removedUUIDs) = (Class)MEMORY[0x1E4FBC870];
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____EXQueryResult_identities) = v4;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____EXQueryResult_availablility) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for _EXQueryResult();
  return [(_EXQueryResult *)&v6 init];
}

- (_EXQueryResultUpdate)initWithCoder:(id)a3
{
  return (_EXQueryResultUpdate *)sub_191F9BA0C(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v8 = self;
  uint64_t v5 = swift_bridgeObjectRetain();
  sub_191F9BE6C(v5);
  swift_bridgeObjectRelease();
  sub_191FB9C68();
  objc_super v6 = (void *)sub_191FB9EC8();
  swift_release();
  objc_super v7 = (void *)sub_191FB9DA8();
  objc_msgSend(v4, sel_encodeObject_forKey_, v6, v7);

  sub_191F9B5F0(v4);
}

- (NSString)description
{
  v2 = self;
  sub_191F9BC60();

  v3 = (void *)sub_191FB9DA8();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_EXQueryResultUpdate)init
{
  result = (_EXQueryResultUpdate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end