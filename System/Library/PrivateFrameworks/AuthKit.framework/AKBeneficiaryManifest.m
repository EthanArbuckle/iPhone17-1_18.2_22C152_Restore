@interface AKBeneficiaryManifest
+ (BOOL)supportsSecureCoding;
- (AKBeneficiaryManifest)initWithBundleInformation:(id)a3 manifestOptions:(int64_t)a4;
- (AKBeneficiaryManifest)initWithCoder:(id)a3;
- (BOOL)_isAllOptionsSelected;
- (NSArray)accessibleBundleInformation;
- (NSDictionary)parsableRepresentation;
- (id)_bundleTypeFrom:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)manifestOptions;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AKBeneficiaryManifest

- (AKBeneficiaryManifest)initWithBundleInformation:(id)a3 manifestOptions:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AKBeneficiaryManifest;
  v8 = [(AKBeneficiaryManifest *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_accessibleBundleInformation, a3);
    v9->_manifestOptions = a4;
  }

  return v9;
}

- (NSDictionary)parsableRepresentation
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v18 = [MEMORY[0x1E4F1CA60] dictionary];
  v3 = [(AKBeneficiaryManifest *)self accessibleBundleInformation];
  v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v10 = [MEMORY[0x1E4F1CA60] dictionary];
        objc_super v11 = [v9 bundleIdentifier];
        [v10 setObject:v11 forKeyedSubscript:@"identifier"];

        v12 = [v9 bundleName];
        [v10 setObject:v12 forKeyedSubscript:@"name"];

        v13 = -[AKBeneficiaryManifest _bundleTypeFrom:](self, "_bundleTypeFrom:", [v9 bundleType]);
        [v10 setObject:v13 forKeyedSubscript:@"type"];

        v14 = [v9 bundleDescription];
        [v10 setObject:v14 forKeyedSubscript:@"description"];

        [v4 addObject:v10];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v6);
  }

  [v18 setObject:v4 forKeyedSubscript:@"items"];
  v15 = objc_msgSend(NSNumber, "numberWithBool:", -[AKBeneficiaryManifest _isAllOptionsSelected](self, "_isAllOptionsSelected"));
  [v18 setObject:v15 forKeyedSubscript:@"all"];

  v16 = (void *)[v18 copy];

  return (NSDictionary *)v16;
}

- (id)_bundleTypeFrom:(unint64_t)a3
{
  if (a3) {
    return &unk_1EE43E968;
  }
  else {
    return &unk_1EE43E950;
  }
}

- (BOOL)_isAllOptionsSelected
{
  return [(AKBeneficiaryManifest *)self manifestOptions] == 1;
}

- (void)encodeWithCoder:(id)a3
{
  accessibleBundleInformation = self->_accessibleBundleInformation;
  id v5 = a3;
  [v5 encodeObject:accessibleBundleInformation forKey:@"_accessibleBundleInformation"];
  id v6 = [NSNumber numberWithInteger:self->_manifestOptions];
  [v5 encodeObject:v6 forKey:@"_manifestOptions"];
}

- (AKBeneficiaryManifest)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(AKBeneficiaryManifest *)self init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_accessibleBundleInformation"];
    accessibleBundleInformation = v5->_accessibleBundleInformation;
    v5->_accessibleBundleInformation = (NSArray *)v9;

    objc_super v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_manifestOptions"];
    v5->_manifestOptions = [v11 integerValue];
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(AKBeneficiaryManifest);
  uint64_t v5 = [(NSArray *)self->_accessibleBundleInformation copy];
  accessibleBundleInformation = v4->_accessibleBundleInformation;
  v4->_accessibleBundleInformation = (NSArray *)v5;

  v4->_manifestOptions = self->_manifestOptions;
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)accessibleBundleInformation
{
  return self->_accessibleBundleInformation;
}

- (int64_t)manifestOptions
{
  return self->_manifestOptions;
}

- (void).cxx_destruct
{
}

@end