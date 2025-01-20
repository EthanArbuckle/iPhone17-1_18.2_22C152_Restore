@interface _LSApplicationIsInstalledQuery
+ (BOOL)supportsSecureCoding;
+ (id)queryWithBundleIdentifier:(id)a3;
- (BOOL)_requiresDatabaseMappingEntitlement;
- (NSString)bundleIdentifier;
- (_LSApplicationIsInstalledQuery)initWithCoder:(id)a3;
- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _LSApplicationIsInstalledQuery

- (BOOL)_requiresDatabaseMappingEntitlement
{
  return 1;
}

+ (id)queryWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    v7 = (void *)v5[2];
    v5[2] = v6;
  }

  return v5;
}

- (void).cxx_destruct
{
}

- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  v8 = [(_LSApplicationIsInstalledQuery *)self bundleIdentifier];

  if (!v8)
  {
    v14 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -54, (uint64_t)"-[_LSApplicationIsInstalledQuery _enumerateWithXPCConnection:block:]", 60, 0);
    v7[2](v7, 0, v14);

    goto LABEL_17;
  }
  id v28 = 0;
  v25 = 0;
  id v26 = 0;
  char v27 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v9 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v25, v9, 0);

  if (v10)
  {
    int v24 = 0;
    uint64_t v23 = 0;
    v11 = [(_LSApplicationIsInstalledQuery *)self bundleIdentifier];
    memset(v30, 0, sizeof(v30));
    if (_LSBundleFindWithInfo(v10, 0, v11, 0, v30, 2, 0, &v24, &v23))
    {
      v12 = [(_LSApplicationIsInstalledQuery *)self bundleIdentifier];
      memset(v29, 0, sizeof(v29));
      BOOL v13 = _LSBundleFindWithInfo(v10, 0, v12, 0, v29, 2, 1024, &v24, &v23) == 0;

      if (!v13) {
        goto LABEL_13;
      }
    }
    else
    {
    }
    v18 = [_LSQueryResultWithPropertyList alloc];
    v19 = [NSNumber numberWithBool:v23 != 0];
    v20 = [(_LSQueryResultWithPropertyList *)v18 initWithPropertyList:v19];

    ((void (**)(id, _LSQueryResultWithPropertyList *, void *))v7)[2](v7, v20, 0);
  }
  else
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    v15 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v25, v15, 0);

    if (v16) {
      id v17 = 0;
    }
    else {
      id v17 = v28;
    }
    v7[2](v7, 0, v17);
  }
LABEL_13:
  if (v25 && v27) {
    _LSContextDestroy(v25);
  }
  id v21 = v26;
  v25 = 0;
  id v26 = 0;

  char v27 = 0;
  id v22 = v28;
  id v28 = 0;

LABEL_17:
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_LSApplicationIsInstalledQuery;
  [(_LSQuery *)&v5 encodeWithCoder:v4];
  [v4 encodeObject:self->_bundleIdentifier forKey:@"bundleIdentifier"];
}

- (_LSApplicationIsInstalledQuery)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_LSApplicationIsInstalledQuery;
  objc_super v5 = [(_LSQuery *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"bundleIdentifier");
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;
  }
  return v5;
}

@end