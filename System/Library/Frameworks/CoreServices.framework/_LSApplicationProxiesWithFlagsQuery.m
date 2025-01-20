@interface _LSApplicationProxiesWithFlagsQuery
+ (BOOL)supportsSecureCoding;
+ (id)queryWithPlistFlags:(unsigned int)a3 bundleFlags:(unint64_t)a4;
- (BOOL)_requiresDatabaseMappingEntitlement;
- (BOOL)isEqual:(id)a3;
- (_LSApplicationProxiesWithFlagsQuery)initWithCoder:(id)a3;
- (unint64_t)bundleFlags;
- (unint64_t)hash;
- (unsigned)plistFlags;
- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _LSApplicationProxiesWithFlagsQuery

+ (id)queryWithPlistFlags:(unsigned int)a3 bundleFlags:(unint64_t)a4
{
  uint64_t v6 = [objc_alloc((Class)a1) _init];
  if (v6)
  {
    *(_DWORD *)(v6 + 12) = a3;
    *(void *)(v6 + 16) = a4;
  }

  return (id)v6;
}

- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4
{
  id v5 = a4;
  unsigned int v6 = [(_LSApplicationProxiesWithFlagsQuery *)self plistFlags];
  unint64_t v7 = [(_LSApplicationProxiesWithFlagsQuery *)self bundleFlags];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73___LSApplicationProxiesWithFlagsQuery__enumerateWithXPCConnection_block___block_invoke;
  v8[3] = &__block_descriptor_44_e372_B28__0___LSDatabase_8I16r__LSBundleData__LSBundleBaseData_IIIIIIi_LSVersionNumber__32C___LSVersionNumber__32C__IIIIIIIIIIIIIICCISI_LSBundleBaseFlags_b1b1b1b1b1b1b1__IQIIC_LSBundleMoreFlags_b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1_IiI_LSVersionNumber__32C___LSVersionNumber__32C__IQQQIIIIIIIIIIQIIQQQQIQQIIIQIQIIIIIIIIIIIIIIIIIICCCI_1I_II_LSAppClipFields_I_iIIIIII_20l;
  unsigned int v9 = v6;
  v8[4] = v7;
  yieldAppsMatchingSearch(v5, v8);
}

- (BOOL)_requiresDatabaseMappingEntitlement
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_LSApplicationProxiesWithFlagsQuery;
  if ([(_LSQuery *)&v10 isEqual:v4] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    int v6 = [v5 plistFlags];
    if (v6 == [(_LSApplicationProxiesWithFlagsQuery *)self plistFlags])
    {
      uint64_t v7 = [v5 bundleFlags];
      BOOL v8 = v7 == [(_LSApplicationProxiesWithFlagsQuery *)self bundleFlags];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(_LSApplicationProxiesWithFlagsQuery *)self plistFlags];
  unint64_t v4 = [(_LSApplicationProxiesWithFlagsQuery *)self bundleFlags] ^ (v3 << 32);
  v6.receiver = self;
  v6.super_class = (Class)_LSApplicationProxiesWithFlagsQuery;
  return v4 ^ [(_LSQuery *)&v6 hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_LSApplicationProxiesWithFlagsQuery;
  [(_LSQuery *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", -[_LSApplicationProxiesWithFlagsQuery plistFlags](self, "plistFlags"), @"plistFlags");
  objc_msgSend(v4, "encodeInt64:forKey:", -[_LSApplicationProxiesWithFlagsQuery bundleFlags](self, "bundleFlags"), @"bundleFlags");
}

- (_LSApplicationProxiesWithFlagsQuery)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_LSApplicationProxiesWithFlagsQuery;
  objc_super v5 = [(_LSQuery *)&v7 initWithCoder:v4];
  if (v5)
  {
    *((_DWORD *)&v5->super.super._legacy + 1) = [v4 decodeInt64ForKey:@"plistFlags"];
    *(void *)&v5->_plistFlags = [v4 decodeInt64ForKey:@"bundleFlags"];
  }

  return v5;
}

- (unsigned)plistFlags
{
  return *((_DWORD *)&self->super.super._legacy + 1);
}

- (unint64_t)bundleFlags
{
  return *(void *)&self->_plistFlags;
}

@end