@interface CPActivitySessionEvent
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CPActivitySessionEvent)init;
- (CPActivitySessionEvent)initWithCoder:(id)a3;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CPActivitySessionEvent

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
  char v6 = ActivitySessionEvent.isEqual(_:)((uint64_t)v8);

  outlined destroy of UUID?((uint64_t)v8, (uint64_t *)&demangling cache variable for type metadata for Any?);
  return v6 & 1;
}

- (int64_t)hash
{
  v2 = self;
  Swift::Int v3 = ActivitySessionEvent.hash.getter();

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPActivitySessionEvent)initWithCoder:(id)a3
{
  return (CPActivitySessionEvent *)ActivitySessionEvent.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  ActivitySessionEvent.encode(with:)((NSCoder)v4);
}

- (CPActivitySessionEvent)init
{
  result = (CPActivitySessionEvent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  Swift::Int v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CPActivitySessionEvent_url);
}

@end