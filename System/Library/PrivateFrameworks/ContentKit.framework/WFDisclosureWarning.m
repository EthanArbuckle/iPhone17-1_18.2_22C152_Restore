@interface WFDisclosureWarning
+ (BOOL)supportsSecureCoding;
+ (NSSet)allDisclosureWarningClasses;
- (BOOL)isEqual:(id)a3;
- (NSString)localizedMessage;
- (unint64_t)hash;
@end

@implementation WFDisclosureWarning

- (unint64_t)hash
{
  v2 = [(WFDisclosureWarning *)self localizedMessage];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WFDisclosureWarning *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7 = [(WFDisclosureWarning *)self localizedMessage];
      v8 = [(WFDisclosureWarning *)v6 localizedMessage];
      char v9 = [v7 isEqualToString:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (NSString)localizedMessage
{
  result = (NSString *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"+[WFDisclosureWarning localizedMessage] must be overridden"];
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NSSet)allDisclosureWarningClasses
{
  v6[4] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  v6[2] = objc_opt_class();
  v6[3] = objc_opt_class();
  unint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

@end