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
  return (NSString *)sub_10013EC38(self, (uint64_t)a2, (void (*)(void))sub_10013E8F8);
}

- (NSUUID)messageUUID
{
  uint64_t v2 = sub_10011EB3C(&qword_100321178);
  __chkstk_darwin(v2 - 8, v3);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10013EB38((uint64_t)v5);
  uint64_t v6 = type metadata accessor for UUID();
  Class isa = 0;
  if (sub_100120F20((uint64_t)v5, 1, v6) != 1)
  {
    Class isa = UUID._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }

  return (NSUUID *)isa;
}

- (NSString)description
{
  return (NSString *)sub_10013EC38(self, (uint64_t)a2, (void (*)(void))sub_10013ECA8);
}

- (MPMessageID)initWithValue:(unint64_t)a3
{
  return (MPMessageID *)sub_10013ECAC(a3);
}

- (MPMessageID)initWithUuid:(id)a3
{
  uint64_t v3 = type metadata accessor for UUID();
  __chkstk_darwin(v3 - 8, v4);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  return (MPMessageID *)sub_10013ED4C((uint64_t)v6);
}

- (MPMessageID)init
{
}

- (void).cxx_destruct
{
}

- (int64_t)hash
{
  uint64_t v2 = self;
  Swift::Int v3 = sub_10013F2D4();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  char v6 = sub_10013F320((uint64_t)v8);

  sub_10013FAFC((uint64_t)v8, (uint64_t *)&unk_100321630);
  return v6 & 1;
}

@end