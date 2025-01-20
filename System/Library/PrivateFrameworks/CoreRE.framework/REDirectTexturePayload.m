@interface REDirectTexturePayload
+ (BOOL)supportsSecureCoding;
- (DRTexture)directTexture;
- (REDirectTexturePayload)initWithCoder:(id)a3;
- (REDirectTexturePayload)initWithDirectTexture:(id)a3;
- (const)identifier;
- (void)encodeWithCoder:(id)a3;
- (void)setDirectTexture:(id)a3;
@end

@implementation REDirectTexturePayload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (const)identifier
{
  return (const unsigned __int8 (*)[16])self->_identifier;
}

- (REDirectTexturePayload)initWithDirectTexture:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REDirectTexturePayload;
  v5 = [(RESharedResourcePayload *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(REDirectTexturePayload *)v5 setDirectTexture:v4];
    v7 = DRTextureAsResource();
    DRResourceGetIdentifier();
  }
  return v6;
}

- (REDirectTexturePayload)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)REDirectTexturePayload;
  v5 = [(RESharedResourcePayload *)&v14 initWithCoder:v4];
  if (!v5) {
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    v11 = {;
  }
    [v4 failWithError:v11];

LABEL_8:
    v10 = 0;
    goto LABEL_9;
  }
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  objc_super v9 = v7;
  if (!v7) {
    v12 = {;
  }
    [v4 failWithError:v12];

    goto LABEL_8;
  }
  [v7 getUUIDBytes:v5->_identifier];

LABEL_5:
  v10 = v5;
LABEL_9:

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  uint64_t isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:self->_identifier];
    [v4 encodeObject:v6 forKey:@"identifier"];
  }
  else
  {
    v7 = *re::assetTypesLogObjects((re *)isKindOfClass);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_fault_impl(&dword_233120000, v7, OS_LOG_TYPE_FAULT, "REDirectTexturePayload requires an NSXPCCoder", v8, 2u);
    }
  }
}

- (DRTexture)directTexture
{
  return self->_directTexture;
}

- (void)setDirectTexture:(id)a3
{
}

- (void).cxx_destruct
{
}

@end