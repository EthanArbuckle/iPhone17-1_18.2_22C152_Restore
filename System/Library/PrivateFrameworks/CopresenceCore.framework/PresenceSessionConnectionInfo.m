@interface PresenceSessionConnectionInfo
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (_TtC14CopresenceCore29PresenceSessionConnectionInfo)init;
- (_TtC14CopresenceCore29PresenceSessionConnectionInfo)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PresenceSessionConnectionInfo

- (NSString)description
{
  v2 = self;
  unint64_t v3 = PresenceSessionConnectionInfo.description.getter();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x1B3EA1B00](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14CopresenceCore29PresenceSessionConnectionInfo_endpoint);
  id v5 = a3;
  v6 = self;
  id v7 = (id)MEMORY[0x1B3EA1B00](0x746E696F70646E65, 0xE800000000000000);
  objc_msgSend(v5, sel_encodeObject_forKey_, v4, v7);
}

- (_TtC14CopresenceCore29PresenceSessionConnectionInfo)initWithCoder:(id)a3
{
  return (_TtC14CopresenceCore29PresenceSessionConnectionInfo *)PresenceSessionConnectionInfo.init(coder:)(a3);
}

- (_TtC14CopresenceCore29PresenceSessionConnectionInfo)init
{
  result = (_TtC14CopresenceCore29PresenceSessionConnectionInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14CopresenceCore29PresenceSessionConnectionInfo_endpoint));
}

@end