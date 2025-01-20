@interface ISTypeIcon
+ (BOOL)supportsSecureCoding;
- (ISTypeIcon)initWithCoder:(id)a3;
- (ISTypeIcon)initWithType:(id)a3;
- (NSString)type;
- (id)_fallbackKey;
- (id)description;
- (id)makeResourceProvider;
- (id)symbol;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ISTypeIcon

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)ISTypeIcon;
  v4 = [(ISTypeIcon *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@,Type: %@", v4, self->_type];

  return v5;
}

- (void).cxx_destruct
{
}

- (ISTypeIcon)initWithType:(id)a3
{
  id v5 = a3;
  v6 = objc_msgSend(MEMORY[0x1E4F29128], "_IF_UUIDWithString:", v5);
  v10.receiver = self;
  v10.super_class = (Class)ISTypeIcon;
  objc_super v7 = [(ISConcreteIcon *)&v10 initWithDigest:v6];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_type, a3);
  }

  return v8;
}

- (id)symbol
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = [(ISTypeIcon *)self type];
  v4 = +[ISSymbol symbolForTypeIdentifier:v3 withResolutionStrategy:0 variantOptions:1 error:0];

  if (!v4)
  {
    id v5 = _ISDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = [(ISTypeIcon *)self type];
      *(_DWORD *)buf = 138412290;
      objc_super v10 = v6;
    }
    v8.receiver = self;
    v8.super_class = (Class)ISTypeIcon;
    v4 = [(ISConcreteIcon *)&v8 symbol];
  }
  return v4;
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ISTypeIcon)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ISTypeIcon;
  id v5 = [(ISConcreteIcon *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    type = v5->_type;
    v5->_type = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ISTypeIcon;
  id v4 = a3;
  [(ISConcreteIcon *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_type, @"type", v5.receiver, v5.super_class);
}

- (id)makeResourceProvider
{
  if (!self->_type
    || (objc_msgSend(MEMORY[0x1E4F22490], "typeRecordWithIdentifier:"),
        (v3 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v3 = [MEMORY[0x1E4F22490] typeRecordWithIdentifier:*MEMORY[0x1E4F22608]];
  }
  if (([v3 conformsToTypeIdentifier:*MEMORY[0x1E4F225C8]] & 1) != 0
    || ([v3 conformsToTypeIdentifier:@"com.apple.sidebar-document-type"] & 1) != 0)
  {
    id v4 = 0;
  }
  else
  {
    objc_super v5 = (void *)[objc_alloc(MEMORY[0x1E4F22410]) initWithTypeIdentifier:self->_type];
    [v5 setBundleClassMask:2052];
    id v12 = 0;
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F22408]) initWithConfiguration:v5 error:&v12];
    id v6 = v12;
    if (!v4)
    {
      objc_super v7 = _ISDefaultLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        [(ISTagIcon *)(uint64_t)v6 makeResourceProvider];
      }
    }
  }
  objc_super v8 = objc_msgSend(v3, "_IS_primaryFilenameExtension");
  objc_super v9 = [(ISBindableIcon *)self resourceProviderWithClaim:v4 typeRecord:v3 fileExtension:v8];
  objc_super v10 = +[ISIcon templateTypeForType:self->_type];
  [v9 setTemplateType:v10];

  return v9;
}

- (id)_fallbackKey
{
  v3 = [(ISTypeIcon *)self type];

  if (v3)
  {
    id v4 = [(ISTypeIcon *)self type];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)ISTypeIcon;
    id v4 = [(ISConcreteIcon *)&v6 _fallbackKey];
  }
  return v4;
}

@end