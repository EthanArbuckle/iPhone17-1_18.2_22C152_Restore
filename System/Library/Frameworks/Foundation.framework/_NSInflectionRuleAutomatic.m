@interface _NSInflectionRuleAutomatic
+ (BOOL)supportsSecureCoding;
- (_NSInflectionRuleAutomatic)initWithCoder:(id)a3;
- (id)description;
@end

@implementation _NSInflectionRuleAutomatic

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_NSInflectionRuleAutomatic)initWithCoder:(id)a3
{
  v3 = +[NSInflectionRule automaticRule];

  return (_NSInflectionRuleAutomatic *)v3;
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)_NSInflectionRuleAutomatic;
  return +[NSString stringWithFormat:@"%@ (automatic inflection rule)", [(_NSInflectionRuleAutomatic *)&v3 description]];
}

@end