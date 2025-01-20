@interface GEOMAResourceInfo_MetroRegion
+ (id)_defaultQueryParameters;
+ (id)_defaultQueryType;
+ (id)allExisitngInfos;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldPrefetchResource:(id)a3;
- (GEOMAResourceInfo_MetroRegion)initWithOverrides:(id)a3;
- (MADownloadOptions)downloadOptions;
- (NSURL)baseURL;
- (double)timeToLive;
- (unint64_t)hash;
- (unint64_t)policy;
@end

@implementation GEOMAResourceInfo_MetroRegion

- (GEOMAResourceInfo_MetroRegion)initWithOverrides:(id)a3
{
  return 0;
}

- (NSURL)baseURL
{
  v6.receiver = self;
  v6.super_class = (Class)GEOMAResourceInfo_MetroRegion;
  v3 = [(GEOMAResourceInfo *)&v6 baseURL];
  v4 = [v3 URLByAppendingPathComponent:self->_countryCode isDirectory:1];

  return (NSURL *)v4;
}

- (unint64_t)policy
{
  if (GEOConfigGetBOOL()
    && (+[GEOCountryConfiguration sharedConfiguration],
        v3 = objc_claimAutoreleasedReturnValue(),
        [v3 countryCode],
        v4 = objc_claimAutoreleasedReturnValue(),
        v3,
        unsigned __int8 v5 = [(NSString *)self->_countryCode isEqualToString:v4],
        v4,
        (v5 & 1) != 0))
  {
    return 2;
  }
  else
  {
    return 3;
  }
}

- (double)timeToLive
{
  double result = (double)(unint64_t)GEOConfigGetUInteger();
  if (result < 86400.0) {
    double result = 86400.0;
  }
  if (result > 7776000.0) {
    return 7776000.0;
  }
  return result;
}

+ (id)allExisitngInfos
{
  +[NSMutableArray array];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100036C48;
  v5[3] = &unk_100071BA0;
  id v7 = a1;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = v3;
  +[GEOMAResource onFileAccessQueueSync:v5];

  return v3;
}

+ (id)_defaultQueryType
{
  return @"com.apple.MobileAsset.GeoPolygonDataAssets";
}

+ (id)_defaultQueryParameters
{
  v2 = +[GEOCountryConfiguration sharedConfiguration];
  id v3 = [v2 countryCode];

  v7[0] = @"Type";
  v7[1] = @"_CompatibilityVersion";
  v8[0] = @"Metro";
  v8[1] = @"1";
  v7[2] = GEOMetroRegionCountryCodeKey;
  if (v3) {
    CFStringRef v4 = v3;
  }
  else {
    CFStringRef v4 = @"_UNK_";
  }
  v8[2] = v4;
  unsigned __int8 v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

- (MADownloadOptions)downloadOptions
{
  v4.receiver = self;
  v4.super_class = (Class)GEOMAResourceInfo_MetroRegion;
  v2 = [(GEOMAResourceInfo *)&v4 _backgroundDownloadOptions];

  return (MADownloadOptions *)v2;
}

- (BOOL)shouldPrefetchResource:(id)a3
{
  id v4 = a3;
  if ((id)[(GEOMAResourceInfo_MetroRegion *)self policy] == (id)2)
  {
    unsigned __int8 v5 = +[GEOCountryConfiguration sharedConfiguration];
    id v6 = [v5 countryCode];

    id v7 = [v4 attributes];
    v8 = [v7 objectForKeyedSubscript:GEOMetroRegionCountryCodeKey];
    unsigned __int8 v9 = [v8 isEqual:v6];
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t type = self->super._type;
  return [(NSString *)self->_countryCode hash] ^ (type << 24);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class()) {
    BOOL v6 = [(NSString *)self->_countryCode isEqualToString:v4[3]];
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
}

@end