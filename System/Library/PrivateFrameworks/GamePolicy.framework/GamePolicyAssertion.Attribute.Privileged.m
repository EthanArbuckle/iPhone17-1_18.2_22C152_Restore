@interface GamePolicyAssertion.Attribute.Privileged
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (_TtCCC10GamePolicy19GamePolicyAssertion9Attribute10Privileged)init;
- (id)initWithCoder:(void *)a1;
@end

@implementation GamePolicyAssertion.Attribute.Privileged

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtCCC10GamePolicy19GamePolicyAssertion9Attribute10Privileged)init
{
  return (_TtCCC10GamePolicy19GamePolicyAssertion9Attribute10Privileged *)sub_24F92A6CC(self, (uint64_t)a2, type metadata accessor for GamePolicyAssertion.Attribute.Privileged);
}

- (NSString)description
{
  v2 = (void *)sub_24F93C958();
  return (NSString *)v2;
}

- (id)initWithCoder:(void *)a1
{
  v2.receiver = a1;
  v2.super_class = (Class)type metadata accessor for GamePolicyAssertion.Attribute();
  return objc_msgSendSuper2(&v2, sel_init);
}

@end