@interface NSError(GEODirectionsError)
+ (id)_geo_errorWithDirectionsError:()GEODirectionsError;
- (id)_geo_directionsErrorInfo;
@end

@implementation NSError(GEODirectionsError)

+ (id)_geo_errorWithDirectionsError:()GEODirectionsError
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = +[GEODirectionsError key];
  v8 = v4;
  v9[0] = v3;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];

  v6 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-10 userInfo:v5];

  return v6;
}

- (id)_geo_directionsErrorInfo
{
  v1 = [a1 userInfo];
  v2 = +[GEODirectionsError key];
  id v3 = [v1 objectForKeyedSubscript:v2];

  return v3;
}

@end