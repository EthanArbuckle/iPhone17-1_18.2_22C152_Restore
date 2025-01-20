@interface DDSAssetQuery
+ (BOOL)supportsSecureCoding;
- (BOOL)cachedOnly;
- (BOOL)installedOnly;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAssetQuery:(id)a3;
- (BOOL)latestOnly;
- (BOOL)localOnly;
- (DDSAssetQuery)init;
- (DDSAssetQuery)initWithAssetType:(id)a3 filter:(id)a4;
- (DDSAssetQuery)initWithAssetType:(id)a3 filter:(id)a4 localOnly:(BOOL)a5 installedOnly:(BOOL)a6 latestOnly:(BOOL)a7 cachedOnly:(BOOL)a8;
- (DDSAssetQuery)initWithCoder:(id)a3;
- (DDSAttributeFilter)filter;
- (NSString)assetType;
- (NSString)cacheKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dumpDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCachedOnly:(BOOL)a3;
- (void)setInstalledOnly:(BOOL)a3;
- (void)setLatestOnly:(BOOL)a3;
- (void)setLocalOnly:(BOOL)a3;
@end

@implementation DDSAssetQuery

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetType, 0);
  objc_storeStrong((id *)&self->_filter, 0);
}

- (DDSAssetQuery)initWithAssetType:(id)a3 filter:(id)a4
{
  return [(DDSAssetQuery *)self initWithAssetType:a3 filter:a4 localOnly:1 installedOnly:1 latestOnly:1 cachedOnly:0];
}

- (DDSAssetQuery)initWithAssetType:(id)a3 filter:(id)a4 localOnly:(BOOL)a5 installedOnly:(BOOL)a6 latestOnly:(BOOL)a7 cachedOnly:(BOOL)a8
{
  id v15 = a3;
  id v16 = a4;
  v20.receiver = self;
  v20.super_class = (Class)DDSAssetQuery;
  v17 = [(DDSAssetQuery *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_assetType, a3);
    objc_storeStrong((id *)&v18->_filter, a4);
    v18->_localOnly = a5;
    v18->_latestOnly = a7;
    v18->_installedOnly = a6;
    v18->_cachedOnly = a8;
  }

  return v18;
}

- (void)setCachedOnly:(BOOL)a3
{
  self->_cachedOnly = a3;
}

- (id)description
{
  v3 = NSString;
  v4 = [(DDSAssetQuery *)self assetType];
  BOOL v5 = [(DDSAssetQuery *)self localOnly];
  BOOL v6 = [(DDSAssetQuery *)self installedOnly];
  BOOL v7 = [(DDSAssetQuery *)self latestOnly];
  BOOL v8 = [(DDSAssetQuery *)self cachedOnly];
  v9 = [(DDSAssetQuery *)self filter];
  v10 = [v3 stringWithFormat:@"<query: %@, locO: %d, iO: %d, latO: %d, cO: %d, %@>", v4, v5, v6, v7, v8, v9];

  return v10;
}

- (BOOL)cachedOnly
{
  return self->_cachedOnly;
}

- (NSString)cacheKey
{
  v3 = NSString;
  v4 = [(DDSAssetQuery *)self assetType];
  BOOL v5 = [(DDSAssetQuery *)self installedOnly];
  BOOL v6 = [(DDSAssetQuery *)self latestOnly];
  BOOL v7 = [(DDSAssetQuery *)self localOnly];
  BOOL v8 = NSNumber;
  v9 = [(DDSAssetQuery *)self filter];
  v10 = objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "hash"));
  v11 = [v10 stringValue];
  v12 = [v3 stringWithFormat:@"%@-%d-%d-%d-%@", v4, v5, v6, v7, v11];

  return (NSString *)v12;
}

- (NSString)assetType
{
  return self->_assetType;
}

- (DDSAttributeFilter)filter
{
  return self->_filter;
}

- (BOOL)latestOnly
{
  return self->_latestOnly;
}

- (BOOL)installedOnly
{
  return self->_installedOnly;
}

- (BOOL)localOnly
{
  return self->_localOnly;
}

- (void)setLocalOnly:(BOOL)a3
{
  self->_localOnly = a3;
}

- (void)setInstalledOnly:(BOOL)a3
{
  self->_installedOnly = a3;
}

- (DDSAssetQuery)init
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(DDSAssetQuery *)self assetType];
  BOOL v6 = NSStringFromSelector(sel_assetType);
  [v4 encodeObject:v5 forKey:v6];

  BOOL v7 = [(DDSAssetQuery *)self filter];
  BOOL v8 = NSStringFromSelector(sel_filter);
  [v4 encodeObject:v7 forKey:v8];

  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[DDSAssetQuery localOnly](self, "localOnly"));
  v10 = NSStringFromSelector(sel_localOnly);
  [v4 encodeObject:v9 forKey:v10];

  v11 = objc_msgSend(NSNumber, "numberWithBool:", -[DDSAssetQuery installedOnly](self, "installedOnly"));
  v12 = NSStringFromSelector(sel_installedOnly);
  [v4 encodeObject:v11 forKey:v12];

  v13 = objc_msgSend(NSNumber, "numberWithBool:", -[DDSAssetQuery latestOnly](self, "latestOnly"));
  v14 = NSStringFromSelector(sel_latestOnly);
  [v4 encodeObject:v13 forKey:v14];

  objc_msgSend(NSNumber, "numberWithBool:", -[DDSAssetQuery cachedOnly](self, "cachedOnly"));
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  id v15 = NSStringFromSelector(sel_cachedOnly);
  [v4 encodeObject:v16 forKey:v15];
}

- (DDSAssetQuery)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  BOOL v6 = NSStringFromSelector(sel_assetType);
  BOOL v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  uint64_t v8 = objc_opt_class();
  v9 = NSStringFromSelector(sel_filter);
  v10 = [v4 decodeObjectOfClass:v8 forKey:v9];

  uint64_t v11 = objc_opt_class();
  v12 = NSStringFromSelector(sel_localOnly);
  v13 = [v4 decodeObjectOfClass:v11 forKey:v12];
  uint64_t v14 = [v13 BOOLValue];

  uint64_t v15 = objc_opt_class();
  id v16 = NSStringFromSelector(sel_installedOnly);
  v17 = [v4 decodeObjectOfClass:v15 forKey:v16];
  uint64_t v18 = [v17 BOOLValue];

  uint64_t v19 = objc_opt_class();
  objc_super v20 = NSStringFromSelector(sel_latestOnly);
  v21 = [v4 decodeObjectOfClass:v19 forKey:v20];
  uint64_t v22 = [v21 BOOLValue];

  uint64_t v23 = objc_opt_class();
  v24 = NSStringFromSelector(sel_cachedOnly);
  v25 = [v4 decodeObjectOfClass:v23 forKey:v24];

  uint64_t v26 = [v25 BOOLValue];
  v27 = [(DDSAssetQuery *)self initWithAssetType:v7 filter:v10 localOnly:v14 installedOnly:v18 latestOnly:v22 cachedOnly:v26];

  return v27;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)dumpDescription
{
  if (DDS_IS_INTERNAL_INSTALL())
  {
    v3 = NSString;
    id v4 = [(DDSAssetQuery *)self filter];
    uint64_t v5 = [v4 dumpDescription];
    BOOL v6 = [(DDSAssetQuery *)self assetType];
    BOOL v7 = [v3 stringWithFormat:@"%@\n(%@, localOnly: %d, installedOnly: %d, latestOnly: %d, cacheOnly: %d)>", v5, v6, -[DDSAssetQuery localOnly](self, "localOnly"), -[DDSAssetQuery installedOnly](self, "installedOnly"), -[DDSAssetQuery latestOnly](self, "latestOnly"), -[DDSAssetQuery cachedOnly](self, "cachedOnly")];
  }
  else
  {
    BOOL v7 = &stru_1F3FA8828;
  }
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(DDSAssetQuery *)self isEqualToAssetQuery:v4];

  return v5;
}

- (BOOL)isEqualToAssetQuery:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(DDSAssetQuery *)self assetType];
  BOOL v6 = [v4 assetType];
  if (DDSObjectsAreEqualOrNil((unint64_t)v5, (uint64_t)v6))
  {
    BOOL v7 = [(DDSAssetQuery *)self filter];
    uint64_t v8 = [v4 filter];
    if (DDSObjectsAreEqualOrNil((unint64_t)v7, (uint64_t)v8)
      && (int v9 = -[DDSAssetQuery localOnly](self, "localOnly"), v9 == [v4 localOnly])
      && (int v10 = [(DDSAssetQuery *)self installedOnly],
          v10 == [v4 installedOnly])
      && (int v11 = -[DDSAssetQuery latestOnly](self, "latestOnly"), v11 == [v4 latestOnly]))
    {
      BOOL v14 = [(DDSAssetQuery *)self cachedOnly];
      int v12 = v14 ^ [v4 cachedOnly] ^ 1;
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  v3 = [(DDSAssetQuery *)self assetType];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [(DDSAssetQuery *)self filter];
  uint64_t v6 = [v5 hash] ^ v4;
  if ([(DDSAssetQuery *)self localOnly]) {
    uint64_t v7 = 1231;
  }
  else {
    uint64_t v7 = 1237;
  }
  uint64_t v8 = v6 ^ v7;
  if ([(DDSAssetQuery *)self installedOnly]) {
    uint64_t v9 = 1231;
  }
  else {
    uint64_t v9 = 1237;
  }
  if ([(DDSAssetQuery *)self latestOnly]) {
    uint64_t v10 = 1231;
  }
  else {
    uint64_t v10 = 1237;
  }
  uint64_t v11 = v8 ^ v9 ^ v10;
  if ([(DDSAssetQuery *)self cachedOnly]) {
    uint64_t v12 = 1231;
  }
  else {
    uint64_t v12 = 1237;
  }
  unint64_t v13 = v11 ^ v12;

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [DDSAssetQuery alloc];
  BOOL v5 = [(DDSAssetQuery *)self assetType];
  uint64_t v6 = [(DDSAssetQuery *)self filter];
  uint64_t v7 = [(DDSAssetQuery *)v4 initWithAssetType:v5 filter:v6];

  [(DDSAssetQuery *)v7 setInstalledOnly:[(DDSAssetQuery *)self installedOnly]];
  [(DDSAssetQuery *)v7 setLocalOnly:[(DDSAssetQuery *)self localOnly]];
  [(DDSAssetQuery *)v7 setLatestOnly:[(DDSAssetQuery *)self latestOnly]];
  [(DDSAssetQuery *)v7 setCachedOnly:[(DDSAssetQuery *)self cachedOnly]];
  return v7;
}

- (void)setLatestOnly:(BOOL)a3
{
  self->_latestOnly = a3;
}

@end