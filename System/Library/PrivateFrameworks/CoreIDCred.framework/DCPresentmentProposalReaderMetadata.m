@interface DCPresentmentProposalReaderMetadata
+ (BOOL)supportsSecureCoding;
- (DCPresentmentProposalReaderMetadata)initWithCoder:(id)a3;
- (DCPresentmentProposalReaderMetadata)initWithIdentifier:(id)a3 organization:(id)a4 organizationalUnit:(id)a5 iconData:(id)a6 iconURL:(id)a7 iconMediaType:(id)a8 privacyPolicyURL:(id)a9 merchantCategoryCode:(id)a10;
- (NSData)iconData;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)merchantCategoryCode;
- (NSString)iconMediaType;
- (NSString)identifier;
- (NSString)organization;
- (NSString)organizationalUnit;
- (NSURL)iconURL;
- (NSURL)privacyPolicyURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DCPresentmentProposalReaderMetadata

- (DCPresentmentProposalReaderMetadata)initWithIdentifier:(id)a3 organization:(id)a4 organizationalUnit:(id)a5 iconData:(id)a6 iconURL:(id)a7 iconMediaType:(id)a8 privacyPolicyURL:(id)a9 merchantCategoryCode:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  v42.receiver = self;
  v42.super_class = (Class)DCPresentmentProposalReaderMetadata;
  v24 = [(DCPresentmentProposalReaderMetadata *)&v42 init];
  if (v24)
  {
    uint64_t v25 = [v16 copy];
    identifier = v24->_identifier;
    v24->_identifier = (NSString *)v25;

    uint64_t v27 = [v17 copy];
    organization = v24->_organization;
    v24->_organization = (NSString *)v27;

    uint64_t v29 = [v18 copy];
    organizationalUnit = v24->_organizationalUnit;
    v24->_organizationalUnit = (NSString *)v29;

    uint64_t v31 = [v19 copy];
    iconData = v24->_iconData;
    v24->_iconData = (NSData *)v31;

    uint64_t v33 = [v20 copy];
    iconURL = v24->_iconURL;
    v24->_iconURL = (NSURL *)v33;

    uint64_t v35 = [v21 copy];
    iconMediaType = v24->_iconMediaType;
    v24->_iconMediaType = (NSString *)v35;

    uint64_t v37 = [v22 copy];
    privacyPolicyURL = v24->_privacyPolicyURL;
    v24->_privacyPolicyURL = (NSURL *)v37;

    uint64_t v39 = [v23 copy];
    merchantCategoryCode = v24->_merchantCategoryCode;
    v24->_merchantCategoryCode = (NSNumber *)v39;
  }
  return v24;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DCPresentmentProposalReaderMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)DCPresentmentProposalReaderMetadata;
  v5 = [(DCPresentmentProposalReaderMetadata *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B140];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B960];
    organization = v5->_organization;
    v5->_organization = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B980];
    organizationalUnit = v5->_organizationalUnit;
    v5->_organizationalUnit = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B9A0];
    iconData = v5->_iconData;
    v5->_iconData = (NSData *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B9C0];
    iconURL = v5->_iconURL;
    v5->_iconURL = (NSURL *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B9E0];
    iconMediaType = v5->_iconMediaType;
    v5->_iconMediaType = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59BA00];
    privacyPolicyURL = v5->_privacyPolicyURL;
    v5->_privacyPolicyURL = (NSURL *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59BA20];
    merchantCategoryCode = v5->_merchantCategoryCode;
    v5->_merchantCategoryCode = (NSNumber *)v20;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:0x26C59B140];
  [v5 encodeObject:self->_organization forKey:0x26C59B960];
  [v5 encodeObject:self->_organizationalUnit forKey:0x26C59B980];
  [v5 encodeObject:self->_iconData forKey:0x26C59B9A0];
  [v5 encodeObject:self->_iconURL forKey:0x26C59B9C0];
  [v5 encodeObject:self->_iconMediaType forKey:0x26C59B9E0];
  [v5 encodeObject:self->_privacyPolicyURL forKey:0x26C59BA00];
  [v5 encodeObject:self->_merchantCategoryCode forKey:0x26C59BA20];
}

- (id)description
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F089D8];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p; ", v5, self];

  v7 = [(DCPresentmentProposalReaderMetadata *)self dictionaryRepresentation];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v8 = [v7 allKeys];
  v9 = [v8 sortedArrayUsingSelector:sel_compare_];

  id obj = v9;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v15 = [v7 objectForKeyedSubscript:v14];
        uint64_t v16 = [MEMORY[0x263EFF9D0] null];
        if ([v15 isEqual:v16]) {
          id v17 = 0;
        }
        else {
          id v17 = v15;
        }
        [v6 appendFormat:@"%@ = %@; ", v14, v17];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }

  objc_msgSend(v6, "deleteCharactersInRange:", objc_msgSend(v6, "length") - 2, 2);
  [v6 appendString:@">"];

  return v6;
}

- (NSDictionary)dictionaryRepresentation
{
  v14[8] = *MEMORY[0x263EF8340];
  v3 = NSStringFromSelector(sel_identifier);
  v14[0] = v3;
  id v4 = NSStringFromSelector(sel_organization);
  v14[1] = v4;
  id v5 = NSStringFromSelector(sel_organizationalUnit);
  v14[2] = v5;
  uint64_t v6 = NSStringFromSelector(sel_iconData);
  v14[3] = v6;
  v7 = NSStringFromSelector(sel_iconURL);
  v14[4] = v7;
  uint64_t v8 = NSStringFromSelector(sel_iconMediaType);
  v14[5] = v8;
  v9 = NSStringFromSelector(sel_privacyPolicyURL);
  v14[6] = v9;
  uint64_t v10 = NSStringFromSelector(sel_merchantCategoryCode);
  v14[7] = v10;
  uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:8];

  uint64_t v12 = [(DCPresentmentProposalReaderMetadata *)self dictionaryWithValuesForKeys:v11];

  return (NSDictionary *)v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return [[DCPresentmentProposalReaderMetadata alloc] initWithIdentifier:self->_identifier organization:self->_organization organizationalUnit:self->_organizationalUnit iconData:self->_iconData iconURL:self->_iconURL iconMediaType:self->_iconMediaType privacyPolicyURL:self->_privacyPolicyURL merchantCategoryCode:self->_merchantCategoryCode];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)organization
{
  return self->_organization;
}

- (NSString)organizationalUnit
{
  return self->_organizationalUnit;
}

- (NSData)iconData
{
  return self->_iconData;
}

- (NSURL)iconURL
{
  return self->_iconURL;
}

- (NSString)iconMediaType
{
  return self->_iconMediaType;
}

- (NSURL)privacyPolicyURL
{
  return self->_privacyPolicyURL;
}

- (NSNumber)merchantCategoryCode
{
  return self->_merchantCategoryCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_merchantCategoryCode, 0);
  objc_storeStrong((id *)&self->_privacyPolicyURL, 0);
  objc_storeStrong((id *)&self->_iconMediaType, 0);
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_storeStrong((id *)&self->_iconData, 0);
  objc_storeStrong((id *)&self->_organizationalUnit, 0);
  objc_storeStrong((id *)&self->_organization, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end