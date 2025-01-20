@interface PresenceSessionParticipant
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (_TtC14CopresenceCore26PresenceSessionParticipant)init;
- (_TtC14CopresenceCore26PresenceSessionParticipant)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PresenceSessionParticipant

- (NSString)description
{
  v2 = self;
  uint64_t v3 = PresenceSessionParticipant.description.getter();
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
  id v4 = a3;
  uint64_t v5 = self;
  PresenceSessionParticipant.encode(with:)((NSCoder)v4);
}

- (_TtC14CopresenceCore26PresenceSessionParticipant)initWithCoder:(id)a3
{
  return (_TtC14CopresenceCore26PresenceSessionParticipant *)PresenceSessionParticipant.init(coder:)(a3);
}

- (_TtC14CopresenceCore26PresenceSessionParticipant)init
{
  result = (_TtC14CopresenceCore26PresenceSessionParticipant *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14CopresenceCore26PresenceSessionParticipant_handle);
}

@end