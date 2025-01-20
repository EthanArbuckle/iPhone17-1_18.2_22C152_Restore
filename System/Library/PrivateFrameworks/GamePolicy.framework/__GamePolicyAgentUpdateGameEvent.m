@interface __GamePolicyAgentUpdateGameEvent
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSString)description;
- (__GamePolicyAgentUpdateGameEvent)init;
- (__GamePolicyAgentUpdateGameEvent)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation __GamePolicyAgentUpdateGameEvent

- (NSString)description
{
  return (NSString *)sub_24F93312C(self, (uint64_t)a2, (void (*)(void))GamePolicyAgentUpdate.GameEvent.description.getter);
}

+ (BOOL)supportsSecureCoding
{
  return static GamePolicyAgentUpdate.GameEvent.supportsSecureCoding;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static GamePolicyAgentUpdate.GameEvent.supportsSecureCoding = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  GamePolicyAgentUpdate.GameEvent.encode(with:)((NSCoder)v4);
}

- (__GamePolicyAgentUpdateGameEvent)initWithCoder:(id)a3
{
  return (__GamePolicyAgentUpdateGameEvent *)GamePolicyAgentUpdate.GameEvent.init(coder:)(a3);
}

- (__GamePolicyAgentUpdateGameEvent)init
{
  result = (__GamePolicyAgentUpdateGameEvent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR_____GamePolicyAgentUpdateGameEvent_date);
}

@end