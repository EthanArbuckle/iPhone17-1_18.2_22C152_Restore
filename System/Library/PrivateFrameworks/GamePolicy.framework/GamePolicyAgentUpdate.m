@interface GamePolicyAgentUpdate
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSString)description;
- (_TtC10GamePolicy21GamePolicyAgentUpdate)init;
- (_TtC10GamePolicy21GamePolicyAgentUpdate)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GamePolicyAgentUpdate

- (NSString)description
{
  return (NSString *)sub_24F93312C(self, (uint64_t)a2, (void (*)(void))GamePolicyAgentUpdate.description.getter);
}

+ (BOOL)supportsSecureCoding
{
  return static GamePolicyAgentUpdate.supportsSecureCoding;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static GamePolicyAgentUpdate.supportsSecureCoding = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  GamePolicyAgentUpdate.encode(with:)((NSCoder)v4);
}

- (_TtC10GamePolicy21GamePolicyAgentUpdate)initWithCoder:(id)a3
{
  return (_TtC10GamePolicy21GamePolicyAgentUpdate *)GamePolicyAgentUpdate.init(coder:)(a3);
}

- (_TtC10GamePolicy21GamePolicyAgentUpdate)init
{
  result = (_TtC10GamePolicy21GamePolicyAgentUpdate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end