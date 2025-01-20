@interface MPMessageID
- (BOOL)isEqual:(id)a3;
- (MPMessageID)init;
- (MPMessageID)initWithUuid:(id)a3;
- (MPMessageID)initWithValue:(unint64_t)a3;
- (NSString)description;
- (NSString)stringValue;
- (NSUUID)messageUUID;
- (int64_t)hash;
@end

@implementation MPMessageID

- (NSString)stringValue
{
  v2 = self;
  sub_10005CBDC();

  NSString v3 = sub_1000622D0();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (NSUUID)messageUUID
{
  uint64_t v3 = type metadata accessor for MessageID.Value(0);
  __chkstk_darwin(v3);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100035DD8(&qword_1000A1958);
  __chkstk_darwin(v6 - 8);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100045F60((uint64_t)self + OBJC_IVAR___MPMessageID_value, (uint64_t)v5);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t v10 = sub_100061D90();
  uint64_t v11 = *(void *)(v10 - 8);
  if (EnumCaseMultiPayload == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v5, v10);
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v8, v12, 1, v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) == 1)
  {
    Class isa = 0;
  }
  else
  {
    Class isa = sub_100061D40().super.isa;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
  }

  return (NSUUID *)isa;
}

- (NSString)description
{
  v2 = self;
  sub_10005CBDC();

  NSString v3 = sub_1000622D0();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (MPMessageID)initWithValue:(unint64_t)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MPMessageID_value) = (Class)a3;
  type metadata accessor for MessageID.Value(0);
  swift_storeEnumTagMultiPayload();
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(MPMessageID *)&v7 init];
}

- (MPMessageID)initWithUuid:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = sub_100061D90();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100061D70();
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))((char *)self + OBJC_IVAR___MPMessageID_value, v8, v5);
  type metadata accessor for MessageID.Value(0);
  swift_storeEnumTagMultiPayload();
  v11.receiver = self;
  v11.super_class = ObjectType;
  v9 = [(MPMessageID *)&v11 init];
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v9;
}

- (MPMessageID)init
{
  result = (MPMessageID *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (int64_t)hash
{
  v2 = self;
  Swift::Int v3 = sub_10005C59C();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_1000625B0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  char v6 = sub_10005D2CC((uint64_t)v8);

  sub_1000363BC((uint64_t)v8, &qword_1000A1FD8);
  return v6 & 1;
}

@end