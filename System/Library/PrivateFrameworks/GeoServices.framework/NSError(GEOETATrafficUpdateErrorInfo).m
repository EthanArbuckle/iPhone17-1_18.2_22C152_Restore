@interface NSError(GEOETATrafficUpdateErrorInfo)
- (id)_geo_etaTrafficUpdateErrorInfo;
@end

@implementation NSError(GEOETATrafficUpdateErrorInfo)

- (id)_geo_etaTrafficUpdateErrorInfo
{
  v1 = [a1 userInfo];
  v2 = +[GEOETATrafficUpdateErrorInfo key];
  v3 = [v1 objectForKeyedSubscript:v2];

  return v3;
}

@end