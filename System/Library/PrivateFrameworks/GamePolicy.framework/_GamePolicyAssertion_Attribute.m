@interface _GamePolicyAssertion_Attribute
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (_GamePolicyAssertion_Attribute)init;
- (_GamePolicyAssertion_Attribute)initWithCoder:(id)a3;
@end

@implementation _GamePolicyAssertion_Attribute

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_GamePolicyAssertion_Attribute)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for GamePolicyAssertion.Attribute();
  return [(_GamePolicyAssertion_Attribute *)&v4 init];
}

- (_GamePolicyAssertion_Attribute)init
{
  return (_GamePolicyAssertion_Attribute *)sub_24F92A6CC(self, (uint64_t)a2, type metadata accessor for GamePolicyAssertion.Attribute);
}

- (NSString)description
{
  v2 = (void *)sub_24F93C958();

  return (NSString *)v2;
}

@end