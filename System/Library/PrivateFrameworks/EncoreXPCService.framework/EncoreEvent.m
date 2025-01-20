@interface EncoreEvent
+ (BOOL)supportsSecureCoding;
- (EncoreEvent)init;
- (EncoreEvent)initWithCoder:(id)a3;
- (NSString)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EncoreEvent

+ (BOOL)supportsSecureCoding
{
  return byte_26985AC80;
}

- (NSString)description
{
  v2 = self;
  sub_24D1A5EE8();

  v3 = (void *)sub_24D1B2150();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24D1A639C(v4);
}

- (EncoreEvent)initWithCoder:(id)a3
{
  return (EncoreEvent *)EncoreEvent.init(coder:)(a3);
}

- (EncoreEvent)init
{
  result = (EncoreEvent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_24D1A82A0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___EncoreEvent_data), *(void *)&self->id[OBJC_IVAR___EncoreEvent_data]);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

@end