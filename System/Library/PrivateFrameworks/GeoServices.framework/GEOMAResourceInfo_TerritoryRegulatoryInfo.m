@interface GEOMAResourceInfo_TerritoryRegulatoryInfo
+ (id)_defaultQueryParameters;
+ (id)_defaultQueryType;
+ (id)allExisitngInfos;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldPrefetchResource:(id)a3;
- (GEOMAResourceInfo_TerritoryRegulatoryInfo)init;
- (MADownloadOptions)downloadOptions;
- (double)timeToLive;
- (unint64_t)hash;
- (unint64_t)policy;
@end

@implementation GEOMAResourceInfo_TerritoryRegulatoryInfo

- (GEOMAResourceInfo_TerritoryRegulatoryInfo)init
{
  v3.receiver = self;
  v3.super_class = (Class)GEOMAResourceInfo_TerritoryRegulatoryInfo;
  return [(GEOMAResourceInfo *)&v3 initWithType:1 overrides:0];
}

+ (id)_defaultQueryParameters
{
  v4[0] = @"Type";
  v4[1] = @"_CompatibilityVersion";
  v5[0] = @"Territories";
  v5[1] = &off_100077C90;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];

  return v2;
}

- (unint64_t)policy
{
  unint64_t result = GEOConfigGetUInteger();
  if (result - 1 >= 3) {
    return 1;
  }
  return result;
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
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_100036874;
  v10 = sub_100036884;
  id v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  void v5[2] = sub_10003688C;
  v5[3] = &unk_1000716A0;
  v5[4] = &v6;
  v5[5] = a1;
  +[GEOMAResource onFileAccessQueueSync:v5];
  v2 = (void *)v7[5];
  if (!v2) {
    v2 = &__NSArray0__struct;
  }
  id v3 = v2;
  _Block_object_dispose(&v6, 8);

  return v3;
}

+ (id)_defaultQueryType
{
  return @"com.apple.MobileAsset.GeoPolygonDataAssets";
}

- (MADownloadOptions)downloadOptions
{
  v4.receiver = self;
  v4.super_class = (Class)GEOMAResourceInfo_TerritoryRegulatoryInfo;
  v2 = [(GEOMAResourceInfo *)&v4 _backgroundDownloadOptions];

  return (MADownloadOptions *)v2;
}

- (BOOL)shouldPrefetchResource:(id)a3
{
  return 1;
}

- (unint64_t)hash
{
  return self->super._type;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3 = objc_opt_class();
  return v3 == objc_opt_class();
}

@end