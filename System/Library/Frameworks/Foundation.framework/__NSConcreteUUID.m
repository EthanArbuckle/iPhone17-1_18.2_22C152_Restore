@interface __NSConcreteUUID
+ (BOOL)supportsSecureCoding;
- (Class)classForCoder;
- (NSString)UUIDString;
- (NSString)debugDescription;
- (NSString)description;
- (__NSConcreteUUID)init;
- (__NSConcreteUUID)initWithCoder:(id)a3;
- (__NSConcreteUUID)initWithUUIDBytes:(const char *)a3;
- (__NSConcreteUUID)initWithUUIDString:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)getUUIDBytes:(char *)a3;
@end

@implementation __NSConcreteUUID

- (void)getUUIDBytes:(char *)a3
{
  v4[1] = *MEMORY[0x1E4F143B8];
  long long v3 = *(_OWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR_____NSConcreteUUID__storage);
  if (&v3 < (long long *)a3 + 1 && v4 > (void *)a3)
  {
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    *(_OWORD *)a3 = v3;
  }
}

- (__NSConcreteUUID)initWithCoder:(id)a3
{
  return (__NSConcreteUUID *)__NSConcreteUUID.init(coder:)(a3);
}

- (__NSConcreteUUID)initWithUUIDString:(id)a3
{
  return (__NSConcreteUUID *)__NSConcreteUUID.init(uuidString:)();
}

- (__NSConcreteUUID)init
{
  return (__NSConcreteUUID *)__NSConcreteUUID.init()();
}

- (__NSConcreteUUID)initWithUUIDBytes:(const char *)a3
{
  return (__NSConcreteUUID *)__NSConcreteUUID.init(uuidBytes:)((long long *)a3);
}

- (Class)classForCoder
{
  type metadata accessor for NSUUID();

  return (Class)swift_getObjCClassFromMetadata();
}

- (NSString)description
{
  v2 = self;
  long long v3 = [(__NSConcreteUUID *)v2 UUIDString];
  static String._unconditionallyBridgeFromObjectiveC(_:)(v3);

  v4 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();

  return (NSString *)v4;
}

- (NSString)UUIDString
{
  UUID.uuidString.getter();
  v2 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  long long v8 = *(_OWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR_____NSConcreteUUID__storage);
  uint64_t v5 = String._bridgeToObjectiveCImpl()();
  id v6 = a3;
  v7 = self;
  objc_msgSend(v6, sel_encodeBytes_length_forKey_, &v8, 16, v5);

  swift_unknownObjectRelease();
}

- (NSString)debugDescription
{
  v6[2] = *MEMORY[0x1E4F143B8];
  swift_getObjectType();
  long long v3 = self;
  closure #1 in __NSConcreteUUID.debugDescription.getter(v3, v6);

  v4 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();

  return (NSString *)v4;
}

@end