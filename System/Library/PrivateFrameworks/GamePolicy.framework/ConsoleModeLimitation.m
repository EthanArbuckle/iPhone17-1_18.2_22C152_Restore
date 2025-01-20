@interface ConsoleModeLimitation
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (_TtC10GamePolicy21ConsoleModeLimitation)init;
- (_TtC10GamePolicy21ConsoleModeLimitation)initWithCoder:(id)a3;
@end

@implementation ConsoleModeLimitation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC10GamePolicy21ConsoleModeLimitation)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for GamePolicyAssertion.Attribute();
  return [(GamePolicyAssertion.Limitation *)&v4 init];
}

- (_TtC10GamePolicy21ConsoleModeLimitation)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ConsoleModeLimitation();
  return [(GamePolicyAssertion.Limitation *)&v3 init];
}

- (NSString)description
{
  v2 = (void *)sub_24F93C958();
  return (NSString *)v2;
}

@end