@interface _PHPickerCollectionConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsEditingCollection;
- (BOOL)isEqual:(id)a3;
- (NSArray)_identifiers;
- (NSArray)assetsToAddIdentifiers;
- (NSArray)disabledIdentifiers;
- (NSArray)preselectedIdentifiers;
- (NSArray)suggestedIdentifiers;
- (NSString)purpose;
- (_PHPickerCollectionConfiguration)init;
- (_PHPickerCollectionConfiguration)initWithCoder:(id)a3;
- (_PHPickerCollectionConfiguration)initWithIdentifiers:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowsEditingCollection:(BOOL)a3;
- (void)setAssetsToAddIdentifiers:(id)a3;
- (void)setDisabledIdentifiers:(id)a3;
- (void)setPreselectedIdentifiers:(id)a3;
- (void)setPurpose:(id)a3;
- (void)setSuggestedIdentifiers:(id)a3;
@end

@implementation _PHPickerCollectionConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__identifiers, 0);
  objc_storeStrong((id *)&self->_purpose, 0);
  objc_storeStrong((id *)&self->_disabledIdentifiers, 0);
  objc_storeStrong((id *)&self->_assetsToAddIdentifiers, 0);
  objc_storeStrong((id *)&self->_preselectedIdentifiers, 0);

  objc_storeStrong((id *)&self->_suggestedIdentifiers, 0);
}

- (NSArray)_identifiers
{
  return self->__identifiers;
}

- (void)setAllowsEditingCollection:(BOOL)a3
{
  self->_allowsEditingCollection = a3;
}

- (BOOL)allowsEditingCollection
{
  return self->_allowsEditingCollection;
}

- (void)setPurpose:(id)a3
{
}

- (NSString)purpose
{
  return self->_purpose;
}

- (void)setDisabledIdentifiers:(id)a3
{
}

- (NSArray)disabledIdentifiers
{
  return self->_disabledIdentifiers;
}

- (void)setAssetsToAddIdentifiers:(id)a3
{
}

- (NSArray)assetsToAddIdentifiers
{
  return self->_assetsToAddIdentifiers;
}

- (void)setPreselectedIdentifiers:(id)a3
{
}

- (NSArray)preselectedIdentifiers
{
  return self->_preselectedIdentifiers;
}

- (void)setSuggestedIdentifiers:(id)a3
{
}

- (NSArray)suggestedIdentifiers
{
  return self->_suggestedIdentifiers;
}

- (void)encodeWithCoder:(id)a3
{
  identifiers = self->__identifiers;
  id v5 = a3;
  [v5 encodeObject:identifiers forKey:@"PHPickerCollectionConfigurationCoderIdentifiersKey"];
  [v5 encodeObject:self->_suggestedIdentifiers forKey:@"PHPickerCollectionConfigurationCoderSuggestedIdentifiersKey"];
  [v5 encodeObject:self->_preselectedIdentifiers forKey:@"PHPickerCollectionConfigurationCoderPreselectedIdentifiersKey"];
  [v5 encodeObject:self->_assetsToAddIdentifiers forKey:@"PHPickerCollectionConfigurationCoderAssetsToAddIdentifiersKey"];
  [v5 encodeObject:self->_disabledIdentifiers forKey:@"PHPickerCollectionConfigurationCoderDisabledIdentifiersKey"];
  [v5 encodeObject:self->_purpose forKey:@"PHPickerCollectionConfigurationCoderPurposeKey"];
  [v5 encodeBool:self->_allowsEditingCollection forKey:@"PHPickerCollectionConfigurationCoderAllowsEditingCollectionKey"];
}

- (_PHPickerCollectionConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_PHPickerCollectionConfiguration;
  id v5 = [(_PHPickerCollectionConfiguration *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"PHPickerCollectionConfigurationCoderIdentifiersKey"];
    identifiers = v5->__identifiers;
    v5->__identifiers = (NSArray *)v6;

    uint64_t v8 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"PHPickerCollectionConfigurationCoderSuggestedIdentifiersKey"];
    suggestedIdentifiers = v5->_suggestedIdentifiers;
    v5->_suggestedIdentifiers = (NSArray *)v8;

    uint64_t v10 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"PHPickerCollectionConfigurationCoderPreselectedIdentifiersKey"];
    preselectedIdentifiers = v5->_preselectedIdentifiers;
    v5->_preselectedIdentifiers = (NSArray *)v10;

    uint64_t v12 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"PHPickerCollectionConfigurationCoderAssetsToAddIdentifiersKey"];
    assetsToAddIdentifiers = v5->_assetsToAddIdentifiers;
    v5->_assetsToAddIdentifiers = (NSArray *)v12;

    uint64_t v14 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"PHPickerCollectionConfigurationCoderDisabledIdentifiersKey"];
    disabledIdentifiers = v5->_disabledIdentifiers;
    v5->_disabledIdentifiers = (NSArray *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PHPickerCollectionConfigurationCoderPurposeKey"];
    purpose = v5->_purpose;
    v5->_purpose = (NSString *)v16;

    v5->_allowsEditingCollection = [v4 decodeBoolForKey:@"PHPickerCollectionConfigurationCoderAllowsEditingCollectionKey"];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (self->__identifiers) {
    id v4 = [[_PHPickerCollectionConfiguration alloc] initWithIdentifiers:self->__identifiers];
  }
  else {
    id v4 = objc_alloc_init(_PHPickerCollectionConfiguration);
  }
  id v5 = v4;
  uint64_t v6 = [(NSArray *)self->_suggestedIdentifiers copy];
  suggestedIdentifiers = v5->_suggestedIdentifiers;
  v5->_suggestedIdentifiers = (NSArray *)v6;

  uint64_t v8 = [(NSArray *)self->_preselectedIdentifiers copy];
  preselectedIdentifiers = v5->_preselectedIdentifiers;
  v5->_preselectedIdentifiers = (NSArray *)v8;

  uint64_t v10 = [(NSArray *)self->_assetsToAddIdentifiers copy];
  assetsToAddIdentifiers = v5->_assetsToAddIdentifiers;
  v5->_assetsToAddIdentifiers = (NSArray *)v10;

  uint64_t v12 = [(NSArray *)self->_disabledIdentifiers copy];
  disabledIdentifiers = v5->_disabledIdentifiers;
  v5->_disabledIdentifiers = (NSArray *)v12;

  uint64_t v14 = [(NSString *)self->_purpose copy];
  purpose = v5->_purpose;
  v5->_purpose = (NSString *)v14;

  v5->_allowsEditingCollection = self->_allowsEditingCollection;
  return v5;
}

- (_PHPickerCollectionConfiguration)init
{
  v14.receiver = self;
  v14.super_class = (Class)_PHPickerCollectionConfiguration;
  v2 = [(_PHPickerCollectionConfiguration *)&v14 init];
  if (!v2) {
    return v2;
  }
  if ([(_PHPickerCollectionConfiguration *)v2 isMemberOfClass:objc_opt_class()])
  {
    identifiers = v2->__identifiers;
    v2->__identifiers = 0;

    suggestedIdentifiers = v2->_suggestedIdentifiers;
    id v5 = (NSArray *)MEMORY[0x263EFFA68];
    v2->_suggestedIdentifiers = (NSArray *)MEMORY[0x263EFFA68];

    preselectedIdentifiers = v2->_preselectedIdentifiers;
    v2->_preselectedIdentifiers = v5;

    assetsToAddIdentifiers = v2->_assetsToAddIdentifiers;
    v2->_assetsToAddIdentifiers = v5;

    disabledIdentifiers = v2->_disabledIdentifiers;
    v2->_disabledIdentifiers = v5;

    purpose = v2->_purpose;
    v2->_purpose = (NSString *)&stru_26C82F0F0;

    return v2;
  }
  v11 = (_PHPickerCollectionConfiguration *)_PFAssertFailHandler();
  return [(_PHPickerCollectionConfiguration *)v11 initWithIdentifiers:v13];
}

- (_PHPickerCollectionConfiguration)initWithIdentifiers:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    v18.receiver = self;
    v18.super_class = (Class)_PHPickerCollectionConfiguration;
    uint64_t v6 = [(_PHPickerCollectionConfiguration *)&v18 init];
    if (!v6)
    {
LABEL_5:

      return v6;
    }
    if ([(_PHPickerCollectionConfiguration *)v6 isMemberOfClass:objc_opt_class()])
    {
      uint64_t v7 = [v5 copy];
      identifiers = v6->__identifiers;
      v6->__identifiers = (NSArray *)v7;

      suggestedIdentifiers = v6->_suggestedIdentifiers;
      uint64_t v10 = (NSArray *)MEMORY[0x263EFFA68];
      v6->_suggestedIdentifiers = (NSArray *)MEMORY[0x263EFFA68];

      preselectedIdentifiers = v6->_preselectedIdentifiers;
      v6->_preselectedIdentifiers = v10;

      assetsToAddIdentifiers = v6->_assetsToAddIdentifiers;
      v6->_assetsToAddIdentifiers = v10;

      disabledIdentifiers = v6->_disabledIdentifiers;
      v6->_disabledIdentifiers = v10;

      purpose = v6->_purpose;
      v6->_purpose = (NSString *)&stru_26C82F0F0;

      goto LABEL_5;
    }
  }
  else
  {
    _PFAssertFailHandler();
  }
  uint64_t v16 = (_PHPickerCollectionConfiguration *)_PFAssertFailHandler();
  return (_PHPickerCollectionConfiguration *)[(_PHPickerCollectionConfiguration *)v16 hash];
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->__identifiers hash];
  uint64_t v4 = [(NSArray *)self->_suggestedIdentifiers hash] - v3 + 32 * v3;
  uint64_t v5 = [(NSArray *)self->_preselectedIdentifiers hash] - v4 + 32 * v4;
  uint64_t v6 = [(NSArray *)self->_assetsToAddIdentifiers hash] - v5 + 32 * v5;
  uint64_t v7 = [(NSArray *)self->_disabledIdentifiers hash] - v6 + 32 * v6;
  NSUInteger v8 = [(NSString *)self->_purpose hash];
  return self->_allowsEditingCollection - (v8 - v7 + 32 * v7) + 32 * (v8 - v7 + 32 * v7) + 0x667E12CDFLL;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (_PHPickerCollectionConfiguration *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
LABEL_16:

    return v7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v7 = 0;
    goto LABEL_16;
  }
  uint64_t v5 = v4;
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v5)
  {
    if (objc_opt_isKindOfClass())
    {
      BOOL v7 = [(NSArray *)self->__identifiers isEqual:v5->__identifiers]
        && [(NSArray *)self->_suggestedIdentifiers isEqual:v5->_suggestedIdentifiers]
        && [(NSArray *)self->_preselectedIdentifiers isEqual:v5->_preselectedIdentifiers]
        && [(NSArray *)self->_assetsToAddIdentifiers isEqual:v5->_assetsToAddIdentifiers]
        && [(NSArray *)self->_disabledIdentifiers isEqual:v5->_disabledIdentifiers]
        && [(NSString *)self->_purpose isEqualToString:v5->_purpose]
        && self->_allowsEditingCollection == v5->_allowsEditingCollection;

      goto LABEL_16;
    }
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    objc_claimAutoreleasedReturnValue();
    uint64_t v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    objc_claimAutoreleasedReturnValue();
  }
  else
  {
    NSStringFromClass(v6);
    objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)_PFAssertFailHandler();
  return +[_PHPickerCollectionConfiguration supportsSecureCoding];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end