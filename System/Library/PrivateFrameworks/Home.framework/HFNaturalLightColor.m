@interface HFNaturalLightColor
+ (NAIdentity)na_identity;
- (BOOL)isEqual:(id)a3;
- (HFNaturalLightColor)init;
- (NSString)description;
- (unint64_t)hash;
@end

@implementation HFNaturalLightColor

- (HFNaturalLightColor)init
{
  v3.receiver = self;
  v3.super_class = (Class)HFNaturalLightColor;
  return [(HFNaturalLightColor *)&v3 init];
}

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_301 != -1) {
    dispatch_once(&_MergedGlobals_301, &__block_literal_global_3_27);
  }
  v2 = (void *)qword_26AB2FB78;
  return (NAIdentity *)v2;
}

void __34__HFNaturalLightColor_na_identity__block_invoke_2()
{
  v0 = [MEMORY[0x263F58198] builder];
  uint64_t v1 = [v0 build];

  v2 = (void *)qword_26AB2FB78;
  qword_26AB2FB78 = v1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

- (unint64_t)hash
{
  objc_super v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

- (NSString)description
{
  v2 = NSString;
  v6.receiver = self;
  v6.super_class = (Class)HFNaturalLightColor;
  objc_super v3 = [(HFNaturalLightColor *)&v6 description];
  unint64_t v4 = [v2 stringWithFormat:@"%@ Natural Light Color", v3];

  return (NSString *)v4;
}

@end