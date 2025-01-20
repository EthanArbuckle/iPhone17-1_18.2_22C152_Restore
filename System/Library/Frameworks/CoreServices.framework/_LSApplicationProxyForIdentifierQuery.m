@interface _LSApplicationProxyForIdentifierQuery
+ (BOOL)supportsSecureCoding;
+ (NSSet)alwaysAllowedBundleIdentifiers;
+ (id)queryWithIdentifier:(id)a3;
- (BOOL)_requiresDatabaseMappingEntitlement;
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (_LSApplicationProxyForIdentifierQuery)initWithCoder:(id)a3;
- (unint64_t)hash;
- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _LSApplicationProxyForIdentifierQuery

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_LSApplicationProxyForIdentifierQuery;
  if ([(_LSQuery *)&v12 isEqual:v4] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    v6 = [v5 identifier];
    if (v6)
    {
      v7 = [(_LSApplicationProxyForIdentifierQuery *)self identifier];
      if (v7)
      {
        v8 = [v5 identifier];
        v9 = [(_LSApplicationProxyForIdentifierQuery *)self identifier];
        char v10 = [v8 isEqual:v9];
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

+ (id)queryWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) _init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    v7 = (void *)v5[2];
    v5[2] = v6;
  }

  return v5;
}

+ (NSSet)alwaysAllowedBundleIdentifiers
{
  if (+[_LSApplicationProxyForIdentifierQuery alwaysAllowedBundleIdentifiers]::once != -1) {
    dispatch_once(&+[_LSApplicationProxyForIdentifierQuery alwaysAllowedBundleIdentifiers]::once, &__block_literal_global_17);
  }
  v2 = (void *)+[_LSApplicationProxyForIdentifierQuery alwaysAllowedBundleIdentifiers]::result;

  return (NSSet *)v2;
}

- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void *, void))a4;
  v8 = [(_LSApplicationProxyForIdentifierQuery *)self identifier];

  if (v8)
  {
    id v22 = 0;
    v19 = 0;
    id v20 = 0;
    char v21 = 0;
    +[_LSDServiceDomain defaultServiceDomain]();
    v9 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v19, v9, 0);

    if (v10)
    {
      id v11 = [(_LSApplicationProxyForIdentifierQuery *)self identifier];
      objc_super v12 = +[LSApplicationProxy applicationProxyForIdentifier:v11 withContext:v10];
      v7[2](v7, v12, 0);
    }
    else
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      v15 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      uint64_t v16 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v19, v15, 0);

      if (v16) {
        id v11 = 0;
      }
      else {
        id v11 = v22;
      }
      ((void (**)(id, void *, id))v7)[2](v7, 0, v11);
    }

    if (v19 && v21) {
      _LSContextDestroy(v19);
    }
    id v17 = v20;
    v19 = 0;
    id v20 = 0;

    char v21 = 0;
    id v18 = v22;
    id v22 = 0;
  }
  else
  {
    uint64_t v23 = *MEMORY[0x1E4F28228];
    v24[0] = @"invalid input parameters";
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    v14 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[_LSApplicationProxyForIdentifierQuery _enumerateWithXPCConnection:block:]", 582, v13);
    ((void (**)(id, void *, void *))v7)[2](v7, 0, v14);
  }
}

- (BOOL)_requiresDatabaseMappingEntitlement
{
  v3 = [(_LSApplicationProxyForIdentifierQuery *)self identifier];
  if (v3)
  {
    id v4 = [(id)objc_opt_class() alwaysAllowedBundleIdentifiers];
    id v5 = [(_LSApplicationProxyForIdentifierQuery *)self identifier];
    int v6 = [v4 containsObject:v5] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  v3 = [(_LSApplicationProxyForIdentifierQuery *)self identifier];
  uint64_t v4 = [v3 hash];
  v7.receiver = self;
  v7.super_class = (Class)_LSApplicationProxyForIdentifierQuery;
  unint64_t v5 = [(_LSQuery *)&v7 hash] ^ v4;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_LSApplicationProxyForIdentifierQuery;
  [(_LSQuery *)&v6 encodeWithCoder:v4];
  unint64_t v5 = [(_LSApplicationProxyForIdentifierQuery *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];
}

- (_LSApplicationProxyForIdentifierQuery)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_LSApplicationProxyForIdentifierQuery;
  unint64_t v5 = [(_LSQuery *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"identifier");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;
  }
  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

@end