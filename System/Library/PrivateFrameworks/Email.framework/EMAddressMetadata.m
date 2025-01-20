@interface EMAddressMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)supportsEncryptedSubject;
- (EMAddressMetadata)initWithCapabilities:(id)a3 date:(id)a4;
- (EMAddressMetadata)initWithCoder:(id)a3;
- (EMAddressMetadata)initWithDictionary:(id)a3;
- (NSArray)capabilities;
- (NSDate)date;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCapabilities:(id)a3;
- (void)setDate:(id)a3;
- (void)setSupportsEncryptedSubject:(BOOL)a3;
@end

@implementation EMAddressMetadata

- (EMAddressMetadata)initWithCapabilities:(id)a3 date:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)EMAddressMetadata;
  v9 = [(EMAddressMetadata *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_date, a4);
    objc_storeStrong((id *)&v10->_capabilities, a3);
    v10->_supportsEncryptedSubject = objc_msgSend(v7, "ef_any:", &__block_literal_global_0);
  }

  return v10;
}

uint64_t __47__EMAddressMetadata_initWithCapabilities_date___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [MEMORY[0x1E4F607E0] oidStringForEncryptedSubject];
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

- (EMAddressMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = v4;
  v6 = (void *)MEMORY[0x1E4F1CBF0];
  if (v4)
  {
    id v7 = [v4 objectForKeyedSubscript:@"smime_capabilities"];
    id v8 = [v5 objectForKeyedSubscript:@"smime_capabilities_date"];
    v9 = [v7 dataUsingEncoding:4];
    uint64_t v15 = 0;
    v10 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v9 options:1 error:&v15];

    if (v10) {
      v6 = v10;
    }
    if (v8)
    {
      int v11 = 0;
      objc_super v12 = v8;
      goto LABEL_8;
    }
  }
  else
  {
    v10 = 0;
  }
  objc_super v12 = [MEMORY[0x1E4F1C9C8] distantPast];
  id v8 = 0;
  int v11 = 1;
LABEL_8:
  v13 = [(EMAddressMetadata *)self initWithCapabilities:v6 date:v12];
  if (v11) {

  }
  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMAddressMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_capabilities"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_date"];
  id v7 = [(EMAddressMetadata *)self initWithCapabilities:v5 date:v6];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(EMAddressMetadata *)self capabilities];
  [v6 encodeObject:v4 forKey:@"EFPropertyKey_capabilities"];

  v5 = [(EMAddressMetadata *)self date];
  [v6 encodeObject:v5 forKey:@"EFPropertyKey_date"];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"[EMAddressMetadata: date=%@, capabilities=%@]", self->_date, self->_capabilities];
}

- (NSArray)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (BOOL)supportsEncryptedSubject
{
  return self->_supportsEncryptedSubject;
}

- (void)setSupportsEncryptedSubject:(BOOL)a3
{
  self->_supportsEncryptedSubject = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
}

@end