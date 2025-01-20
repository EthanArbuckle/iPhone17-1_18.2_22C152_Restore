@interface VSAccountApplicationProvider
+ (BOOL)supportsSecureCoding;
+ (VSAccountApplicationProvider)new;
- (BOOL)isEqual:(id)a3;
- (NSString)displayName;
- (NSString)identifier;
- (NSString)localizedDisplayName;
- (VSAccountApplicationProvider)init;
- (VSAccountApplicationProvider)initWithCoder:(id)a3;
- (VSAccountApplicationProvider)initWithLocalizedDisplayName:(NSString *)localizedDisplayName identifier:(NSString *)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation VSAccountApplicationProvider

- (VSAccountApplicationProvider)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

+ (VSAccountApplicationProvider)new
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  uint64_t v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"The %@ initializer is not available.", v4 format];

  return 0;
}

- (VSAccountApplicationProvider)initWithLocalizedDisplayName:(NSString *)localizedDisplayName identifier:(NSString *)identifier
{
  v6 = localizedDisplayName;
  v7 = identifier;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v9 = *MEMORY[0x1E4F1C3C8];
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      [v8 raise:v9, @"Unexpectedly, localizedDisplayName was %@, instead of NSString.", v11 format];
    }
    if ([(NSString *)v6 length])
    {
      if (v7) {
        goto LABEL_6;
      }
LABEL_13:
      v16 = @"The identifier parameter must not be nil.";
      goto LABEL_14;
    }
    v17 = @"The localizedDisplayName parameter must not be empty.";
  }
  else
  {
    v17 = @"The localizedDisplayName parameter must not be nil.";
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:v17];
  if (!v7) {
    goto LABEL_13;
  }
LABEL_6:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3C8];
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    [v12 raise:v13, @"Unexpectedly, identifier was %@, instead of NSString.", v15 format];
  }
  if (![(NSString *)v7 length])
  {
    v16 = @"The identifier parameter must not be empty.";
LABEL_14:
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:v16];
  }
  v24.receiver = self;
  v24.super_class = (Class)VSAccountApplicationProvider;
  v18 = [(VSAccountApplicationProvider *)&v24 init];
  if (v18)
  {
    uint64_t v19 = [(NSString *)v6 copy];
    v20 = v18->_localizedDisplayName;
    v18->_localizedDisplayName = (NSString *)v19;

    uint64_t v21 = [(NSString *)v7 copy];
    v22 = v18->_identifier;
    v18->_identifier = (NSString *)v21;
  }
  return v18;
}

- (VSAccountApplicationProvider)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VSAccountApplicationProvider;
  v5 = [(VSAccountApplicationProvider *)&v8 init];
  if (v5)
  {
    v6 = VSAccountApplicationProviderValueType();
    VSValueTypeInitWithCoder(v6, v5, v4);
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  VSAccountApplicationProviderValueType();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  VSValueTypeEncodeWithCoder(v5, self, v4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = VSAccountApplicationProviderValueType();
  v6 = VSValueTypeCopyWithZone(v5, self, (uint64_t)a3);

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = VSAccountApplicationProviderValueType();
  unint64_t v4 = VSValueTypeHash(v3, self);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = VSAccountApplicationProviderValueType();
  LOBYTE(self) = VSValueTypeIsEqual(v5, self, v4);

  return (char)self;
}

- (id)description
{
  uint64_t v3 = VSAccountApplicationProviderValueType();
  id v4 = VSValueTypeDescription(v3, self);

  return v4;
}

- (NSString)localizedDisplayName
{
  return self->_localizedDisplayName;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
}

@end