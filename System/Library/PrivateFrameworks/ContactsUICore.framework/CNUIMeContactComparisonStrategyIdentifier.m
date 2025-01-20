@interface CNUIMeContactComparisonStrategyIdentifier
- (BOOL)isMeContact:(id)a3;
- (NSString)meContactIdentifierFound;
- (id)meContactIdentifiers;
- (void)meContactChangedInStore:(id)a3;
- (void)setMeContactIdentifierFound:(id)a3;
@end

@implementation CNUIMeContactComparisonStrategyIdentifier

- (void)meContactChangedInStore:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  v10[0] = *MEMORY[0x263EFDFE0];
  v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:v10 count:1];
  uint64_t v9 = 0;
  v7 = [v5 _crossPlatformUnifiedMeContactWithKeysToFetch:v6 error:&v9];

  v8 = [v7 identifier];
  [(CNUIMeContactComparisonStrategyIdentifier *)self setMeContactIdentifierFound:v8];
}

- (BOOL)isMeContact:(id)a3
{
  id v4 = a3;
  id v5 = [(CNUIMeContactComparisonStrategyIdentifier *)self meContactIdentifierFound];
  v6 = [v4 identifier];

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

- (id)meContactIdentifiers
{
  v8[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F334E0];
  id v4 = [(CNUIMeContactComparisonStrategyIdentifier *)self meContactIdentifierFound];
  if ((*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v4))
  {
    id v5 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    v6 = [(CNUIMeContactComparisonStrategyIdentifier *)self meContactIdentifierFound];
    v8[0] = v6;
    id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  }
  return v5;
}

- (NSString)meContactIdentifierFound
{
  return self->_meContactIdentifierFound;
}

- (void)setMeContactIdentifierFound:(id)a3
{
}

- (void).cxx_destruct
{
}

@end