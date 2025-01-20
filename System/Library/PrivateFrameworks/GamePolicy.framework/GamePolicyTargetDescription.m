@interface GamePolicyTargetDescription
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (_TtC10GamePolicy27GamePolicyTargetDescription)init;
- (_TtC10GamePolicy27GamePolicyTargetDescription)initWithCoder:(id)a3;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GamePolicyTargetDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  GamePolicyTargetDescription.encode(with:)((NSCoder)v4);
}

- (_TtC10GamePolicy27GamePolicyTargetDescription)initWithCoder:(id)a3
{
  return (_TtC10GamePolicy27GamePolicyTargetDescription *)GamePolicyTargetDescription.init(coder:)(a3);
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = sub_24F93CA28();

  return v3;
}

- (NSString)description
{
  return (NSString *)sub_24F929D54(self, (uint64_t)a2, (void (*)(void))GamePolicyTargetDescription.description.getter);
}

- (_TtC10GamePolicy27GamePolicyTargetDescription)init
{
  result = (_TtC10GamePolicy27GamePolicyTargetDescription *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end