@interface ConsoleModeUserDisabled
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (_TtC10GamePolicy23ConsoleModeUserDisabled)init;
- (_TtC10GamePolicy23ConsoleModeUserDisabled)initWithCoder:(id)a3;
@end

@implementation ConsoleModeUserDisabled

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC10GamePolicy23ConsoleModeUserDisabled)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for GamePolicyAssertion.Attribute();
  return [(GamePolicyAssertion.Grant *)&v4 init];
}

- (_TtC10GamePolicy23ConsoleModeUserDisabled)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ConsoleModeUserDisabled();
  return [(GamePolicyAssertion.Grant *)&v3 init];
}

- (NSString)description
{
  v2 = (void *)sub_24F93C958();
  return (NSString *)v2;
}

@end