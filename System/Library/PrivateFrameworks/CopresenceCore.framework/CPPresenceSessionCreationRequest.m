@interface CPPresenceSessionCreationRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CPPresenceSessionCreationRequest)init;
- (CPPresenceSessionCreationRequest)initWithCoder:(id)a3;
- (NSString)description;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CPPresenceSessionCreationRequest

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = PresenceSessionCreationRequest.isEqual(_:)((uint64_t)v8);

  outlined destroy of UUID?((uint64_t)v8, (uint64_t *)&demangling cache variable for type metadata for Any?);
  return v6 & 1;
}

- (int64_t)hash
{
  Hasher.init()();
  v3 = self;
  Swift::UInt v4 = UUID.hashValue.getter();
  Hasher._combine(_:)(v4);
  Hasher._combine(_:)(*((unsigned char *)&v3->super.isa + OBJC_IVAR___CPPresenceSessionCreationRequest_isCrossAccount));
  Swift::Int v5 = Hasher.finalize()();

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPPresenceSessionCreationRequest)initWithCoder:(id)a3
{
  return (CPPresenceSessionCreationRequest *)PresenceSessionCreationRequest.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  Swift::Int v5 = self;
  Class isa = UUID._bridgeToObjectiveC()().super.isa;
  v7 = (void *)MEMORY[0x1B3EA1B00](25705, 0xE200000000000000);
  objc_msgSend(v4, sel_encodeObject_forKey_, isa, v7);

  uint64_t v8 = *((unsigned __int8 *)&v5->super.isa + OBJC_IVAR___CPPresenceSessionCreationRequest_isCrossAccount);
  id v9 = (id)MEMORY[0x1B3EA1B00](0x4173736F72437369, 0xEE00746E756F6363);
  objc_msgSend(v4, sel_encodeBool_forKey_, v8, v9);
}

- (NSString)description
{
  v2 = self;
  uint64_t v3 = PresenceSessionCreationRequest.description.getter();
  uint64_t v5 = v4;

  char v6 = (void *)MEMORY[0x1B3EA1B00](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (CPPresenceSessionCreationRequest)init
{
  result = (CPPresenceSessionCreationRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR___CPPresenceSessionCreationRequest_id;
  uint64_t v3 = type metadata accessor for UUID();
  uint64_t v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);
  v4(v2, v3);
}

@end