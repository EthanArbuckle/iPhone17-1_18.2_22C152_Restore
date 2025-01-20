@interface NSValue(GEOPlaceDataComponentKey)
+ (id)_geo_valueWithGEOPlaceDataComponentKey:()GEOPlaceDataComponentKey;
- (uint64_t)_geo_GEOPlaceDataComponentKeyValue;
@end

@implementation NSValue(GEOPlaceDataComponentKey)

+ (id)_geo_valueWithGEOPlaceDataComponentKey:()GEOPlaceDataComponentKey
{
  v6[0] = a3;
  v6[1] = a4;
  v4 = [MEMORY[0x1E4F29238] value:v6 withObjCType:"(_GEOPlaceDataComponentKey={?=QSSI}{?=IIII})"];

  return v4;
}

- (uint64_t)_geo_GEOPlaceDataComponentKeyValue
{
  v2[0] = 0;
  v2[1] = 0;
  [a1 getValue:v2 size:16];
  return v2[0];
}

@end