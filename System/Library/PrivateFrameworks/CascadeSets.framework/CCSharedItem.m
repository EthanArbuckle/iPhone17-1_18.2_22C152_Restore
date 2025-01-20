@interface CCSharedItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSharedItem:(id)a3;
- (CCItemContent)content;
- (CCSharedItem)init;
- (CCSharedItem)initWithCoder:(id)a3;
- (CCSharedItem)initWithContent:(id)a3 error:(id *)a4;
- (CCSharedItem)initWithSharedIdentifier:(id)a3 content:(id)a4;
- (NSNumber)sharedIdentifier;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CCSharedItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);

  objc_storeStrong((id *)&self->_sharedIdentifier, 0);
}

- (CCSharedItem)initWithContent:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (CCValidateNonNilField(@"content", (uint64_t)v7, a4)
    && (v8 = (objc_class *)objc_opt_class(),
        CCValidateIsInstanceOfExpectedClass(@"content", v7, v8, a4)))
  {
    v13.receiver = self;
    v13.super_class = (Class)CCSharedItem;
    v9 = [(CCSharedItem *)&v13 init];
    v10 = v9;
    if (v9) {
      objc_storeStrong((id *)&v9->_content, a3);
    }
    self = v10;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (CCItemContent)content
{
  return self->_content;
}

- (CCSharedItem)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"init unsupported" userInfo:MEMORY[0x263EFFA78]];
  objc_exception_throw(v2);
}

- (CCSharedItem)initWithSharedIdentifier:(id)a3 content:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CCSharedItem;
  v9 = [(CCSharedItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_content, a4);
    objc_storeStrong((id *)&v10->_sharedIdentifier, a3);
  }

  return v10;
}

- (NSNumber)sharedIdentifier
{
  sharedIdentifier = self->_sharedIdentifier;
  if (!sharedIdentifier)
  {
    v4 = [(CCItemContent *)self->_content data];
    CCHash64(v4);
    v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v6 = self->_sharedIdentifier;
    self->_sharedIdentifier = v5;

    sharedIdentifier = self->_sharedIdentifier;
  }

  return sharedIdentifier;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(CCSharedItem *)self sharedIdentifier];
  id v7 = [(CCSharedItem *)self content];
  id v8 = (void *)[v3 initWithFormat:@"<%@> sharedIdentifier: %@ content: %@", v5, v6, v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CCSharedItem *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CCSharedItem *)self isEqualToSharedItem:v5];

  return v6;
}

- (BOOL)isEqualToSharedItem:(id)a3
{
  id v4 = a3;
  v5 = [(CCSharedItem *)self sharedIdentifier];
  BOOL v6 = [v4 sharedIdentifier];

  LOBYTE(v4) = [v5 isEqual:v6];
  return (char)v4;
}

- (unint64_t)hash
{
  id v2 = [(CCSharedItem *)self sharedIdentifier];
  unint64_t v3 = [v2 unsignedLongLongValue];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  if (self->_content)
  {
    objc_msgSend(v6, "encodeInt32:forKey:", objc_msgSend((id)objc_opt_class(), "itemType"), @"t");
    id v4 = [(CCItemContent *)self->_content data];
    [v6 encodeObject:v4 forKey:@"c"];
  }
  sharedIdentifier = self->_sharedIdentifier;
  if (sharedIdentifier) {
    [v6 encodeObject:sharedIdentifier forKey:@"s"];
  }
}

- (CCSharedItem)initWithCoder:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"c"];
  if (v5)
  {
    unsigned __int16 v6 = [v4 decodeInt32ForKey:@"t"];
    id v20 = 0;
    id v7 = +[CCItemMessage contentMessageForItemType:v6 data:v5 error:&v20];
    id v8 = v20;
    if (!v7)
    {
      id v7 = __biome_log_for_category();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v17 = CCTypeIdentifierRegistryBridge();
        v18 = [v17 descriptionForTypeIdentifier:v6];
        *(_DWORD *)buf = 138412802;
        v22 = v5;
        __int16 v23 = 2112;
        v24 = v18;
        __int16 v25 = 2112;
        id v26 = v8;
        _os_log_error_impl(&dword_249B92000, v7, OS_LOG_TYPE_ERROR, "Failed to decode content from data: %@ itemType: %@ error: %@", buf, 0x20u);
      }
      v9 = 0;
      goto LABEL_16;
    }
  }
  else
  {
    id v7 = 0;
    id v8 = 0;
  }
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"s"];
  if (v10)
  {
    self = [(CCSharedItem *)self initWithSharedIdentifier:v10 content:v7];
  }
  else
  {
    id v19 = v8;
    v11 = [(CCSharedItem *)self initWithContent:v7 error:&v19];
    id v12 = v19;

    objc_super v13 = v11;
    self = v13;
    if (v13)
    {
      v14 = v13;
    }
    else
    {
      v15 = __biome_log_for_category();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[CCSharedItem initWithCoder:]((uint64_t)v12, v15);
      }
    }
    id v8 = v12;
  }

  v9 = self;
LABEL_16:

  return v9;
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_249B92000, a2, OS_LOG_TYPE_ERROR, "Failed to initialize sharedItem: %@", (uint8_t *)&v2, 0xCu);
}

@end