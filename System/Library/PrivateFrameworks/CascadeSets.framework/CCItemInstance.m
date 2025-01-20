@interface CCItemInstance
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToItemInstance:(id)a3;
- (CCItemInstance)init;
- (CCItemInstance)initWithCoder:(id)a3;
- (CCItemInstance)initWithContent:(id)a3 metaContent:(id)a4 error:(id *)a5;
- (CCItemInstance)initWithSharedIdentifier:(id)a3 instanceIdentifier:(id)a4 content:(id)a5 metaContent:(id)a6;
- (CCItemMetaContent)metaContent;
- (NSNumber)instanceIdentifier;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CCItemInstance

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metaContent, 0);

  objc_storeStrong((id *)&self->_instanceIdentifier, 0);
}

- (CCItemInstance)initWithContent:(id)a3 metaContent:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (CCValidateNonNilField(@"metaContent", (uint64_t)v9, a5)
    && (v10 = (objc_class *)objc_opt_class(),
        CCValidateIsInstanceOfExpectedClass(@"metaContent", v9, v10, a5)))
  {
    v15.receiver = self;
    v15.super_class = (Class)CCItemInstance;
    v11 = [(CCSharedItem *)&v15 initWithContent:v8 error:a5];
    v12 = v11;
    if (v11) {
      objc_storeStrong((id *)&v11->_metaContent, a4);
    }
    self = v12;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (NSNumber)instanceIdentifier
{
  instanceIdentifier = self->_instanceIdentifier;
  if (!instanceIdentifier)
  {
    v4 = [(CCSharedItem *)self content];
    v5 = [v4 data];

    v6 = [(CCItemInstance *)self metaContent];
    v7 = [v6 data];

    id v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF990]), "initWithCapacity:", objc_msgSend(v7, "length") + objc_msgSend(v5, "length"));
    [v8 appendData:v5];
    [v8 appendData:v7];
    CCHash64(v8);
    id v9 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v10 = self->_instanceIdentifier;
    self->_instanceIdentifier = v9;

    instanceIdentifier = self->_instanceIdentifier;
  }

  return instanceIdentifier;
}

- (CCItemMetaContent)metaContent
{
  return self->_metaContent;
}

- (CCItemInstance)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"init unsupported" userInfo:MEMORY[0x263EFFA78]];
  objc_exception_throw(v2);
}

- (CCItemInstance)initWithSharedIdentifier:(id)a3 instanceIdentifier:(id)a4 content:(id)a5 metaContent:(id)a6
{
  id v11 = a4;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)CCItemInstance;
  v13 = [(CCSharedItem *)&v16 initWithSharedIdentifier:a3 content:a5];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_metaContent, a6);
    objc_storeStrong((id *)&v14->_instanceIdentifier, a4);
  }

  return v14;
}

- (id)description
{
  id v3 = [NSString alloc];
  v9.receiver = self;
  v9.super_class = (Class)CCItemInstance;
  v4 = [(CCSharedItem *)&v9 description];
  v5 = [(CCItemInstance *)self instanceIdentifier];
  v6 = [(CCItemInstance *)self metaContent];
  v7 = (void *)[v3 initWithFormat:@"%@ instanceIdentifier: %@ metaContent: %@", v4, v5, v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CCItemInstance *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CCItemInstance *)self isEqualToItemInstance:v5];

  return v6;
}

- (BOOL)isEqualToItemInstance:(id)a3
{
  id v4 = a3;
  v5 = [(CCItemInstance *)self instanceIdentifier];
  BOOL v6 = [v4 instanceIdentifier];

  LOBYTE(v4) = [v5 isEqual:v6];
  return (char)v4;
}

- (unint64_t)hash
{
  id v2 = [(CCItemInstance *)self instanceIdentifier];
  unint64_t v3 = [v2 unsignedLongLongValue];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CCItemInstance;
  [(CCSharedItem *)&v8 encodeWithCoder:v4];
  metaContent = self->_metaContent;
  if (metaContent)
  {
    BOOL v6 = [(CCItemMetaContent *)metaContent data];
    [v4 encodeObject:v6 forKey:@"m"];
  }
  instanceIdentifier = self->_instanceIdentifier;
  if (instanceIdentifier) {
    [v4 encodeObject:instanceIdentifier forKey:@"i"];
  }
}

- (CCItemInstance)initWithCoder:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CCItemInstance;
  v5 = [(CCSharedItem *)&v21 initWithCoder:v4];
  if (v5)
  {
    BOOL v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"m"];
    if (v6)
    {
      v7 = [(CCSharedItem *)v5 content];

      if (v7)
      {
        objc_super v8 = [(CCSharedItem *)v5 content];
        uint64_t v9 = [(id)objc_opt_class() itemType];

        id v20 = 0;
        uint64_t v10 = +[CCItemMessage metaContentMessageForItemType:v9 data:v6 error:&v20];
        id v11 = v20;
        metaContent = v5->_metaContent;
        v5->_metaContent = (CCItemMetaContent *)v10;

        if (!v5->_metaContent)
        {
          objc_super v16 = __biome_log_for_category();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            v18 = CCTypeIdentifierRegistryBridge();
            v19 = [v18 descriptionForTypeIdentifier:v9];
            *(_DWORD *)buf = 138412802;
            v23 = v6;
            __int16 v24 = 2112;
            v25 = v19;
            __int16 v26 = 2112;
            v27 = v11;
            _os_log_error_impl(&dword_249B92000, v16, OS_LOG_TYPE_ERROR, "Failed to decode metacontent from data: %@ itemType: %@ error: %@", buf, 0x20u);
          }
          goto LABEL_15;
        }
      }
    }
    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"i"];
    instanceIdentifier = v5->_instanceIdentifier;
    v5->_instanceIdentifier = (NSNumber *)v13;

    if (v5->_metaContent || v5->_instanceIdentifier)
    {
      objc_super v15 = v5;
LABEL_16:

      goto LABEL_17;
    }
    id v11 = __biome_log_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CCItemInstance initWithCoder:](v11);
    }
LABEL_15:

    objc_super v15 = 0;
    goto LABEL_16;
  }
  objc_super v15 = 0;
LABEL_17:

  return v15;
}

- (void)initWithCoder:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_249B92000, log, OS_LOG_TYPE_ERROR, "Neither metacontent nor instanceIdentifier were decoded", v1, 2u);
}

@end