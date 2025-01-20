@interface DIAttributeFooter
+ (BOOL)supportsSecureCoding;
- (DIAttributeFooter)init;
- (DIAttributeFooter)initWithCoder:(id)a3;
- (id)defaultValue;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDefaultValue:(id)a3;
@end

@implementation DIAttributeFooter

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)DIAttributeFooter;
  [(DIAttributeLabel *)&v3 encodeWithCoder:a3];
}

- (DIAttributeFooter)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DIAttributeFooter;
  return [(DIAttributeLabel *)&v4 initWithCoder:a3];
}

- (DIAttributeFooter)init
{
  v5.receiver = self;
  v5.super_class = (Class)DIAttributeFooter;
  v2 = [(DIAttributeLabel *)&v5 init];
  objc_super v3 = v2;
  if (v2) {
    [(DIAttribute *)v2 setAttributeType:7];
  }
  return v3;
}

- (void)setDefaultValue:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)DIAttributeFooter;
  [(DIAttributeLabel *)&v3 setDefaultValue:a3];
}

- (id)defaultValue
{
  v4.receiver = self;
  v4.super_class = (Class)DIAttributeFooter;
  v2 = [(DIAttributeLabel *)&v4 defaultValue];
  return v2;
}

- (id)description
{
  objc_super v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  objc_super v4 = [(DIAttributeFooter *)self defaultValue];
  [v3 appendFormat:@"defaultValue: '%@'; ", v4];

  [v3 appendFormat:@">"];
  return v3;
}

@end