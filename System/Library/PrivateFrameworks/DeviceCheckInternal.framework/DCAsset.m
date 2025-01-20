@interface DCAsset
+ (id)assetWithMobileAsset:(id)a3;
- (NSData)publicKey;
- (double)publicKeyRefreshInterval;
- (id)description;
- (unint64_t)version;
- (void)setPublicKey:(id)a3;
- (void)setPublicKeyRefreshInterval:(double)a3;
- (void)setVersion:(unint64_t)a3;
@end

@implementation DCAsset

+ (id)assetWithMobileAsset:(id)a3
{
  id v3 = a3;
  v4 = [v3 assetProperty:ASAttributeContentVersion];
  id v5 = [v4 unsignedIntegerValue];

  if (v5 == (id)1)
  {
    uint64_t v6 = [v3 assetProperty:@"com.apple.devicecheck.pubvalue"];
    if (v6)
    {
      v7 = v6;
      v8 = objc_alloc_init(DCAsset);
      [(DCAsset *)v8 setVersion:1];
      v9 = [v3 assetProperty:@"com.apple.devicecheck.refreshtimer"];
      [v9 doubleValue];
      -[DCAsset setPublicKeyRefreshInterval:](v8, "setPublicKeyRefreshInterval:");

      [(DCAsset *)v8 setPublicKey:v7];
      v10 = sub_100003944();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        v13 = v8;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Returning parsed asset: %@", (uint8_t *)&v12, 0xCu);
      }
    }
    else
    {
      v7 = sub_100003944();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100005C5C(v7);
      }
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)description
{
  id v3 = [(id)objc_opt_class() description];
  v4 = +[NSString stringWithFormat:@"<%@: %p - version: %lu, refreshInterval: %f>", v3, self, self->_version, *(void *)&self->_publicKeyRefreshInterval];

  return v4;
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (double)publicKeyRefreshInterval
{
  return self->_publicKeyRefreshInterval;
}

- (void)setPublicKeyRefreshInterval:(double)a3
{
  self->_publicKeyRefreshInterval = a3;
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(id)a3
{
}

- (void).cxx_destruct
{
}

@end