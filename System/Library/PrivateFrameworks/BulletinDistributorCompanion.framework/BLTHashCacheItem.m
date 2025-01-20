@interface BLTHashCacheItem
+ (id)hashCacheItemWithData:(id)a3 URL:(id)a4 identifier:(id)a5;
- (BLTHashCacheItem)initWithURL:(id)a3 data:(id)a4 identifier:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToItem:(id)a3;
- (NSData)data;
- (NSString)identifier;
- (NSURL)url;
- (id)MD5;
- (unint64_t)hash;
- (void)MD5;
- (void)setData:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation BLTHashCacheItem

- (BLTHashCacheItem)initWithURL:(id)a3 data:(id)a4 identifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)BLTHashCacheItem;
  v12 = [(BLTHashCacheItem *)&v17 init];
  v13 = v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_data, a4);
    objc_storeStrong((id *)&v13->_url, a3);
    uint64_t v14 = [v11 copy];
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v14;
  }
  return v13;
}

+ (id)hashCacheItemWithData:(id)a3 URL:(id)a4 identifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) initWithURL:v9 data:v10 identifier:v8];

  return v11;
}

- (BOOL)isEqualToItem:(id)a3
{
  id v5 = a3;
  v6 = [(BLTHashCacheItem *)self data];
  if (!v6)
  {
    v3 = [v5 data];
    if (!v3)
    {
      char v9 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  v7 = [(BLTHashCacheItem *)self data];
  id v8 = [v5 data];
  char v9 = [v7 isEqualToData:v8];

  if (!v6) {
    goto LABEL_6;
  }
LABEL_7:

  id v10 = [(BLTHashCacheItem *)self url];
  if (v10 || ([v5 url], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v11 = [(BLTHashCacheItem *)self url];
    v12 = [v11 absoluteString];
    v13 = [v5 url];
    uint64_t v14 = [v13 absoluteString];
    char v15 = [v12 isEqualToString:v14];

    if (v10) {
      goto LABEL_13;
    }
  }
  else
  {
    char v15 = 1;
  }

LABEL_13:
  if (v5) {
    char v16 = v9;
  }
  else {
    char v16 = 0;
  }
  char v17 = v16 & v15;

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (BLTHashCacheItem *)a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v6 = [(BLTHashCacheItem *)self isEqualToItem:v4];
      os_unfair_lock_unlock(p_lock);
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (id)MD5
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  MD5 = self->_MD5;
  if (!MD5)
  {
    v4 = [(BLTHashCacheItem *)self data];

    if (v4)
    {
      id v5 = [(BLTHashCacheItem *)self data];
      [v5 MD5:v12];
    }
    else
    {
      char v9 = [(BLTHashCacheItem *)self url];

      if (!v9) {
        goto LABEL_6;
      }
      id v10 = [(BLTHashCacheItem *)self url];
      char v11 = [v10 MD5:v12];

      if ((v11 & 1) == 0)
      {
        p_super = blt_general_log();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
          [(BLTHashCacheItem *)self MD5];
        }
        goto LABEL_5;
      }
    }
    BOOL v6 = [MEMORY[0x263EFF8F8] dataWithBytes:v12 length:16];
    p_super = &self->_MD5->super;
    self->_MD5 = v6;
LABEL_5:

LABEL_6:
    MD5 = self->_MD5;
  }
  return MD5;
}

- (unint64_t)hash
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v6 = 0;
  v4 = [(BLTHashCacheItem *)self MD5];
  [v4 getBytes:&v6 length:8];

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_MD5, 0);
}

- (void)MD5
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = [a1 url];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_222F4C000, a2, OS_LOG_TYPE_ERROR, "Unable to MD5 item: %@", (uint8_t *)&v4, 0xCu);
}

@end