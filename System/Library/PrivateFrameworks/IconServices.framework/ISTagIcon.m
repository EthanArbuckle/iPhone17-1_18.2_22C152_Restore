@interface ISTagIcon
+ (BOOL)supportsSecureCoding;
- (ISTagIcon)initWithCoder:(id)a3;
- (ISTagIcon)initWithFileExtension:(id)a3;
- (ISTagIcon)initWithFileExtension:(id)a3 baseType:(id)a4;
- (ISTagIcon)initWithMIMEType:(id)a3;
- (ISTagIcon)initWithModelCode:(id)a3;
- (ISTagIcon)initWithTag:(id)a3 tagClass:(id)a4 baseType:(id)a5;
- (ISTagIcon)initWithTypeCode:(unsigned int)a3;
- (NSString)baseType;
- (NSString)tag;
- (NSString)tagClass;
- (id)_fallbackKey;
- (id)description;
- (id)makeResourceProvider;
- (void)encodeWithCoder:(id)a3;
- (void)makeResourceProvider;
@end

@implementation ISTagIcon

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ISTagIcon)initWithTag:(id)a3 tagClass:(id)a4 baseType:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = &stru_1F06391F0;
  if (a3) {
    v10 = (__CFString *)a3;
  }
  v11 = v10;
  v12 = (void *)MEMORY[0x1E4F29128];
  v13 = [(__CFString *)v11 stringByAppendingString:v8];
  v14 = v13;
  if (v9)
  {
    v15 = [v13 stringByAppendingString:v9];
    v16 = objc_msgSend(v12, "_IF_UUIDWithString:", v15);
  }
  else
  {
    v16 = objc_msgSend(v12, "_IF_UUIDWithString:", v13);
  }

  v25.receiver = self;
  v25.super_class = (Class)ISTagIcon;
  v17 = [(ISConcreteIcon *)&v25 initWithDigest:v16];
  if (v17)
  {
    uint64_t v18 = [(__CFString *)v11 copy];
    tag = v17->_tag;
    v17->_tag = (NSString *)v18;

    uint64_t v20 = [v8 copy];
    tagClass = v17->_tagClass;
    v17->_tagClass = (NSString *)v20;

    uint64_t v22 = [v9 copy];
    baseType = v17->_baseType;
    v17->_baseType = (NSString *)v22;
  }
  return v17;
}

- (ISTagIcon)initWithFileExtension:(id)a3
{
  return [(ISTagIcon *)self initWithTag:a3 tagClass:*MEMORY[0x1E4F224F8] baseType:*MEMORY[0x1E4F22608]];
}

- (ISTagIcon)initWithFileExtension:(id)a3 baseType:(id)a4
{
  return [(ISTagIcon *)self initWithTag:a3 tagClass:*MEMORY[0x1E4F224F8] baseType:a4];
}

- (ISTagIcon)initWithTypeCode:(unsigned int)a3
{
  return 0;
}

- (ISTagIcon)initWithMIMEType:(id)a3
{
  return [(ISTagIcon *)self initWithTag:a3 tagClass:*MEMORY[0x1E4F22500] baseType:0];
}

- (ISTagIcon)initWithModelCode:(id)a3
{
  return [(ISTagIcon *)self initWithTag:a3 tagClass:*MEMORY[0x1E4F224F0] baseType:0];
}

- (ISTagIcon)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ISTagIcon;
  v5 = [(ISConcreteIcon *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tag"];
    tag = v5->_tag;
    v5->_tag = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tagClass"];
    tagClass = v5->_tagClass;
    v5->_tagClass = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"baseType"];
    baseType = v5->_baseType;
    v5->_baseType = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ISTagIcon;
  id v4 = a3;
  [(ISConcreteIcon *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_tag, @"tag", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_tagClass forKey:@"tagClass"];
  [v4 encodeObject:self->_baseType forKey:@"baseType"];
}

- (id)makeResourceProvider
{
  v3 = [MEMORY[0x1E4F22490] typeRecordWithTag:self->_tag ofClass:self->_tagClass conformingToIdentifier:self->_baseType];
  id v4 = [v3 identifier];
  if ([(NSString *)self->_tagClass isEqualToString:*MEMORY[0x1E4F224F0]]
    || ([v3 conformsToTypeIdentifier:*MEMORY[0x1E4F225C8]] & 1) != 0
    || ([v3 conformsToTypeIdentifier:@"com.apple.sidebar-document-type"] & 1) != 0)
  {
    objc_super v5 = 0;
  }
  else
  {
    objc_super v13 = (void *)[objc_alloc(MEMORY[0x1E4F22410]) initWithTypeIdentifier:v4];
    [v13 setBundleClassMask:2052];
    id v16 = 0;
    objc_super v5 = (void *)[objc_alloc(MEMORY[0x1E4F22408]) initWithConfiguration:v13 error:&v16];
    id v14 = v16;
    if (!v5)
    {
      v15 = _ISDefaultLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        [(ISTagIcon *)(uint64_t)v14 makeResourceProvider];
      }
    }
  }
  if ([(NSString *)self->_tagClass isEqualToString:*MEMORY[0x1E4F224F8]])
  {
    uint64_t v6 = self->_tag;
  }
  else
  {
    objc_msgSend(v3, "_IS_primaryFilenameExtension");
    uint64_t v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  uint64_t v8 = [(ISBindableIcon *)self resourceProviderWithClaim:v5 typeRecord:v3 fileExtension:v6];
  id v9 = v8;
  if (v5 && ([v8 isDocumentBadge] & 1) == 0)
  {
    uint64_t v10 = +[ISIcon templateTypeForTag:self->_tag tagClass:self->_tagClass];
  }
  else
  {
    uint64_t v10 = +[ISIcon templateTypeForTag:self->_tag tagClass:self->_tagClass];
    if (!v10)
    {
      v11 = [v3 identifier];
      uint64_t v10 = +[ISIcon templateTypeForType:v11];
    }
  }
  [v9 setTemplateType:v10];

  return v9;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)ISTagIcon;
  id v4 = [(ISTagIcon *)&v7 description];
  objc_super v5 = [v3 stringWithFormat:@"%@ Tag: %@, Class: %@, Base type: %@", v4, self->_tag, self->_tagClass, self->_baseType];

  return v5;
}

- (id)_fallbackKey
{
  v3 = [(ISTagIcon *)self tag];

  if (v3)
  {
    id v4 = [(ISTagIcon *)self tag];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)ISTagIcon;
    id v4 = [(ISConcreteIcon *)&v6 _fallbackKey];
  }
  return v4;
}

- (NSString)tag
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)tagClass
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)baseType
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseType, 0);
  objc_storeStrong((id *)&self->_tagClass, 0);
  objc_storeStrong((id *)&self->_tag, 0);
}

- (void)makeResourceProvider
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1AE771000, a2, OS_LOG_TYPE_DEBUG, "Claim not found with error: %@", (uint8_t *)&v2, 0xCu);
}

@end