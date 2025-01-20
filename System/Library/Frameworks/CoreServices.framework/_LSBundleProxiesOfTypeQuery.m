@interface _LSBundleProxiesOfTypeQuery
+ (BOOL)supportsSecureCoding;
+ (id)queryWithType:(unint64_t)a3;
- (BOOL)_requiresDatabaseMappingEntitlement;
- (BOOL)bundleUnitMeetsRequirements:(unsigned int)a3 bundleData:(const LSBundleData *)a4 context:(LSContext *)a5;
- (BOOL)isEqual:(id)a3;
- (_LSBundleProxiesOfTypeQuery)initWithCoder:(id)a3;
- (unint64_t)hash;
- (unint64_t)type;
- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _LSBundleProxiesOfTypeQuery

+ (id)queryWithType:(unint64_t)a3
{
  uint64_t v6 = [objc_alloc((Class)a1) _init];
  v7 = (void *)v6;
  if (a3 != 6)
  {
    if (!v6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v9 = [MEMORY[0x1E4F28B00] currentHandler];
  [v9 handleFailureInMethod:a2, a1, @"LSBundleQuery.mm", 129, @"Invalid parameter not satisfying: %@", @"type != LSBundleTypePlugInKitPlugin" object file lineNumber description];

  if (v7) {
LABEL_3:
  }
    v7[2] = a3;
LABEL_4:

  return v7;
}

- (BOOL)bundleUnitMeetsRequirements:(unsigned int)a3 bundleData:(const LSBundleData *)a4 context:(LSContext *)a5
{
  LOBYTE(v5) = 0;
  if (a3 && a4 && a5)
  {
    v9 = (void *)_CSStringCopyCFString();
    if (v9)
    {
      if ([(_LSBundleProxiesOfTypeQuery *)self type] == 5)
      {
        BOOL v10 = a4->_clas == 13;
        goto LABEL_7;
      }
      if ([(_LSBundleProxiesOfTypeQuery *)self type] != 2)
      {
        unint64_t v12 = [(_LSBundleProxiesOfTypeQuery *)self type];
        unsigned int clas = a4->_clas;
        if (v12 == 7)
        {
          BOOL v10 = clas == 14;
LABEL_7:
          LOBYTE(v5) = v10;
          goto LABEL_12;
        }
        if (clas == 2)
        {
          LOBYTE(v5) = 0;
          switch([(_LSBundleProxiesOfTypeQuery *)self type])
          {
            case 0uLL:
              goto LABEL_24;
            case 1uLL:
              if ((*((unsigned char *)&a4->_clas + 6) & 4) != 0) {
                goto LABEL_11;
              }
              goto LABEL_24;
            case 3uLL:
              if ((*((unsigned char *)&a4->_clas + 6) & 4) == 0) {
                goto LABEL_11;
              }
              goto LABEL_24;
            case 4uLL:
              if ((*((unsigned char *)&a4->_clas + 6) & 4) != 0) {
                goto LABEL_11;
              }
              +[LSApplicationRestrictionsManager sharedInstance]();
              v14 = (id *)objc_claimAutoreleasedReturnValue();
              unsigned __int8 v15 = -[LSApplicationRestrictionsManager isApplicationRestricted:checkFeatureRestrictions:](v14, v9, 1);

              if (v15) {
                goto LABEL_11;
              }
LABEL_24:
              v16 = _LSDatabaseGetNSStringFromString(a5->db);
              v17 = v16;
              if (v16
                && (int v18 = [v16 isEqualToString:@"Hidden"], v17, (v18 & 1) != 0))
              {
                int v5 = v18 ^ 1;
              }
              else
              {
                v19 = _LSDatabaseGetNSStringFromString(a5->db);
                v20 = v19;
                if (v19) {
                  int v5 = [v19 isEqualToString:@"SystemAppPlaceholder"] ^ 1;
                }
                else {
                  int v5 = 1;
                }
              }
              if (!v5) {
                goto LABEL_12;
              }
              if ([(_LSBundleProxiesOfTypeQuery *)self type])
              {
                BOOL v10 = (a4->_bundleFlags & 0x200) == 0;
                goto LABEL_7;
              }
              LOBYTE(v5) = 1;
              break;
            default:
              goto LABEL_12;
          }
          goto LABEL_12;
        }
      }
    }
LABEL_11:
    LOBYTE(v5) = 0;
LABEL_12:
  }
  return v5;
}

- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v24 = 0;
  v21 = 0;
  id v22 = 0;
  char v23 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v8 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v21, v8, 0);

  if (v9)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __65___LSBundleProxiesOfTypeQuery__enumerateWithXPCConnection_block___block_invoke;
    v18[3] = &unk_1E522D930;
    v18[4] = self;
    v20 = v9;
    id v10 = v7;
    id v19 = v10;
    int v11 = _LSEnumerateViableBundlesOfClass(v9, 0, v18);
    if (v11)
    {
      unint64_t v12 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], v11, (uint64_t)"-[_LSBundleProxiesOfTypeQuery _enumerateWithXPCConnection:block:]", 273, 0);
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v12);
    }
  }
  else
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    v13 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v21, v13, 0);

    if (v14) {
      id v15 = 0;
    }
    else {
      id v15 = v24;
    }
    (*((void (**)(id, void, id))v7 + 2))(v7, 0, v15);
  }
  if (v21 && v23) {
    _LSContextDestroy(v21);
  }
  id v16 = v22;
  v21 = 0;
  id v22 = 0;

  char v23 = 0;
  id v17 = v24;
  id v24 = 0;
}

- (BOOL)_requiresDatabaseMappingEntitlement
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_LSBundleProxiesOfTypeQuery;
  if ([(_LSQuery *)&v10 isEqual:v4] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    uint64_t v6 = [v5 type];
    if (v6 == [(_LSBundleProxiesOfTypeQuery *)self type])
    {
      int v7 = [v5 isLegacy];
      int v8 = v7 ^ [(_LSQuery *)self isLegacy] ^ 1;
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_LSBundleProxiesOfTypeQuery *)self type];
  v5.receiver = self;
  v5.super_class = (Class)_LSBundleProxiesOfTypeQuery;
  return [(_LSQuery *)&v5 hash] ^ (v3 << 16);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_LSBundleProxiesOfTypeQuery;
  [(_LSQuery *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", -[_LSBundleProxiesOfTypeQuery type](self, "type"), @"type");
}

- (_LSBundleProxiesOfTypeQuery)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_LSBundleProxiesOfTypeQuery;
  objc_super v5 = [(_LSQuery *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_type = [v4 decodeIntegerForKey:@"type"];
  }

  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

@end