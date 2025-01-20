@interface ATXPrivacyPreservingLocationHash
+ (id)randomData;
+ (id)readDeviceSpecificSalt;
+ (id)setSaltToUserDefaults:(id)a3 scheme:(id)a4;
+ (int64_t)dropLastTenBitsOfSHA256Hash:(int64_t)a3;
+ (int64_t)geohashCollidesWithKnownLocationTypeForGeohash:(int64_t)a3;
+ (int64_t)preservePrivacyForGeoHash:(int64_t)a3;
+ (int64_t)privacyPreservingCoarseGeohashForLocation:(id)a3 locationEnabled:(BOOL)a4;
+ (int64_t)privacyPreservingGeohashForLocation:(id)a3 locationEnabled:(BOOL)a4;
+ (int64_t)privacyPreservingGeohashForLocation:(id)a3 locationHashLevel:(int)a4 locationEnabled:(BOOL)a5;
+ (int64_t)privacyPreservingZoom7GeohashForLocation:(id)a3 locationEnabled:(BOOL)a4;
+ (int64_t)sha256HashForGeohash:(int64_t)a3 salt:(id)a4;
@end

@implementation ATXPrivacyPreservingLocationHash

+ (int64_t)privacyPreservingGeohashForLocation:(id)a3 locationEnabled:(BOOL)a4
{
  return +[ATXPrivacyPreservingLocationHash privacyPreservingGeohashForLocation:a3 locationHashLevel:16 locationEnabled:a4];
}

+ (int64_t)privacyPreservingCoarseGeohashForLocation:(id)a3 locationEnabled:(BOOL)a4
{
  return +[ATXPrivacyPreservingLocationHash privacyPreservingGeohashForLocation:a3 locationHashLevel:13 locationEnabled:a4];
}

+ (int64_t)privacyPreservingZoom7GeohashForLocation:(id)a3 locationEnabled:(BOOL)a4
{
  return +[ATXPrivacyPreservingLocationHash privacyPreservingGeohashForLocation:a3 locationHashLevel:7 locationEnabled:a4];
}

+ (int64_t)privacyPreservingGeohashForLocation:(id)a3 locationHashLevel:(int)a4 locationEnabled:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  v8 = v7;
  if (v5)
  {
    if (v7)
    {
      uint64_t v9 = objc_msgSend(v7, "atx_locationHashWithLevel:", v6);
      if (+[ATXPrivacyPreservingLocationHash geohashCollidesWithKnownLocationTypeForGeohash:v9])
      {
        uint64_t v10 = 0;
      }
      else
      {
        uint64_t v10 = v9;
      }
      int64_t v11 = +[ATXPrivacyPreservingLocationHash preservePrivacyForGeoHash:v10];
    }
    else
    {
      int64_t v11 = -2;
    }
  }
  else
  {
    int64_t v11 = -1;
  }

  return v11;
}

+ (int64_t)geohashCollidesWithKnownLocationTypeForGeohash:(int64_t)a3
{
  return (unint64_t)a3 > 0xFFFFFFFFFFFFFFFDLL;
}

+ (int64_t)preservePrivacyForGeoHash:(int64_t)a3
{
  v4 = +[ATXPrivacyPreservingLocationHash readDeviceSpecificSalt];
  int64_t v5 = +[ATXPrivacyPreservingLocationHash dropLastTenBitsOfSHA256Hash:](ATXPrivacyPreservingLocationHash, "dropLastTenBitsOfSHA256Hash:", +[ATXPrivacyPreservingLocationHash sha256HashForGeohash:a3 salt:v4]);

  return v5;
}

+ (id)readDeviceSpecificSalt
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CB18]);
  v3 = (void *)[v2 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  v4 = [v3 dataForKey:@"ATXPrivacyPreservingLocationHashDeviceSpecificSalt"];
  if (!v4)
  {
    v4 = +[ATXPrivacyPreservingLocationHash setSaltToUserDefaults:v3 scheme:@"ATXPrivacyPreservingLocationHashDeviceSpecificSalt"];
    int64_t v5 = __atxlog_handle_default();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_INFO, "ATXPrivacyPreservingLocationHash: Created a new salt for privacy preservation.", v7, 2u);
    }
  }
  return v4;
}

+ (id)setSaltToUserDefaults:(id)a3 scheme:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[ATXPrivacyPreservingLocationHash randomData];
  if (v7)
  {
    [v5 setObject:v7 forKey:v6];
    id v8 = v7;
  }
  else
  {
    uint64_t v9 = __atxlog_handle_default();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      +[ATXPrivacyPreservingLocationHash setSaltToUserDefaults:scheme:](v9);
    }
  }
  return v7;
}

+ (id)randomData
{
  id v2 = [MEMORY[0x1E4F1CA58] dataWithLength:8];
  v3 = (const __SecRandom *)*MEMORY[0x1E4F3BC60];
  id v4 = v2;
  if (SecRandomCopyBytes(v3, 8uLL, (void *)[v4 mutableBytes]))
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1C9B8] dataWithData:v4];
  }

  return v5;
}

+ (int64_t)sha256HashForGeohash:(int64_t)a3 salt:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int64_t v9 = a3;
  id v4 = a4;
  id v5 = objc_opt_new();
  [v5 appendBytes:&v9 length:8];
  if (v4) {
    [v5 appendData:v4];
  }
  *(_OWORD *)md = 0u;
  long long v11 = 0u;
  id v6 = v5;
  CC_SHA256((const void *)[v6 bytes], objc_msgSend(v6, "length"), md);
  int64_t v7 = *(void *)md;

  return v7;
}

+ (int64_t)dropLastTenBitsOfSHA256Hash:(int64_t)a3
{
  return a3 & 0xFFFFFFFFFFFFFC00;
}

+ (void)setSaltToUserDefaults:(os_log_t)log scheme:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "ATXPrivacyPreservingLocationHash: Tried to generate a salt for privacy preservation, but got back an empty NSData object", v1, 2u);
}

@end