@interface GEOPreflight
+ (NSArray)queryItems;
+ (id)queryStringForPreflightOptions:(unsigned int)a3;
@end

@implementation GEOPreflight

+ (id)queryStringForPreflightOptions:(unsigned int)a3
{
  if (a3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"preflight=%u", *(void *)&a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_1ED51F370;
  }
  return v4;
}

+ (NSArray)queryItems
{
  v8[1] = *MEMORY[0x1E4F143B8];
  int BOOL = GEOConfigGetBOOL(GeoServicesConfig_VenuesPreflightEnabled, (uint64_t)off_1E91147E8);
  uint64_t v3 = 2;
  if (BOOL) {
    uint64_t v3 = 3;
  }
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"%u", v3);
  v5 = [MEMORY[0x1E4F290C8] queryItemWithName:@"preflight" value:v4];
  v8[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return (NSArray *)v6;
}

@end