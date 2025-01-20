@interface HFCategoryAccessoryType
+ (id)na_identity;
- (HFCategoryAccessoryType)initWithCategoryType:(id)a3;
- (NSString)categoryType;
- (id)debugDescription;
- (id)description;
- (id)localizedCategory;
@end

@implementation HFCategoryAccessoryType

uint64_t __38__HFCategoryAccessoryType_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 categoryType];
}

+ (id)na_identity
{
  if (qword_26AB2E9C0 != -1) {
    dispatch_once(&qword_26AB2E9C0, &__block_literal_global_345);
  }
  v2 = (void *)qword_26AB2E9C8;
  return v2;
}

- (NSString)categoryType
{
  return self->_categoryType;
}

- (HFCategoryAccessoryType)initWithCategoryType:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFCategoryAccessoryType;
  v6 = [(HFAccessoryType *)&v9 _init];
  v7 = (HFCategoryAccessoryType *)v6;
  if (v6) {
    objc_storeStrong(v6 + 1, a3);
  }

  return v7;
}

void __38__HFCategoryAccessoryType_na_identity__block_invoke_2()
{
  v0 = [MEMORY[0x263F58198] builder];
  id v1 = (id)[v0 appendCharacteristic:&__block_literal_global_350];
  uint64_t v2 = [v0 build];

  v3 = (void *)qword_26AB2E9C8;
  qword_26AB2E9C8 = v2;
}

- (id)localizedCategory
{
  v3 = [(HFCategoryAccessoryType *)self categoryType];
  char v4 = [v3 isEqualToString:@"9D302CDA-1467-4E19-ABC9-9ED36BE34508"];

  if ((v4 & 1) != 0
    || ([(HFCategoryAccessoryType *)self categoryType],
        id v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 isEqualToString:@"3047A1A5-8BFC-4112-9888-21314F438FF3"],
        v5,
        (v6 & 1) != 0))
  {
    v7 = 0;
  }
  else
  {
    v8 = [(HFCategoryAccessoryType *)self categoryType];
    objc_super v9 = localizationKeyForAccessoryCategoryType();

    v10 = [MEMORY[0x263F0E468] sharedManager];
    v7 = [v10 getLocalizedOrCustomString:v9];
  }
  return v7;
}

- (id)description
{
  v3 = NSString;
  char v4 = (void *)MEMORY[0x263F0DF00];
  id v5 = [(HFCategoryAccessoryType *)self categoryType];
  char v6 = objc_msgSend(v4, "hf_getUserFriendlyDescriptionKey:", v5);
  v7 = [(HFCategoryAccessoryType *)self categoryType];
  v8 = [v3 stringWithFormat:@"categoryType: %@ (%@)", v6, v7];

  return v8;
}

- (id)debugDescription
{
  v3 = [MEMORY[0x263F58188] builderWithObject:self];
  char v4 = (void *)MEMORY[0x263F0DF00];
  id v5 = [(HFCategoryAccessoryType *)self categoryType];
  char v6 = objc_msgSend(v4, "hf_getUserFriendlyDescriptionKey:", v5);

  v7 = [(HFCategoryAccessoryType *)self categoryType];
  v8 = [v6 stringByAppendingFormat:@" (%@)", v7];
  [v3 appendString:v8 withName:@"categoryType"];

  objc_super v9 = [v3 build];

  return v9;
}

- (void).cxx_destruct
{
}

@end