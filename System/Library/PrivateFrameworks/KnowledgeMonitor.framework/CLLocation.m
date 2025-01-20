@interface CLLocation
- (id)randomData;
- (id)readDeviceSpecificSalt;
- (id)setSaltToUserDefaults:(void *)a3 scheme:;
- (uint64_t)sha256HashForGeohash:(void *)a3 salt:;
- (unint64_t)preservePrivacyForGeoHash:(void *)a1;
@end

@implementation CLLocation

- (unint64_t)preservePrivacyForGeoHash:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v4 = -[CLLocation readDeviceSpecificSalt](a1);
  unint64_t v5 = -[CLLocation sha256HashForGeohash:salt:]((uint64_t)a1, a2, v4) & 0xFFFFFFFFFFFFFC00;

  return v5;
}

- (uint64_t)sha256HashForGeohash:(void *)a3 salt:
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v8 = a2;
  id v4 = a3;
  if (a1)
  {
    unint64_t v5 = objc_opt_new();
    [v5 appendBytes:&v8 length:8];
    if (v4) {
      [v5 appendData:v4];
    }
    *(_OWORD *)md = 0u;
    long long v10 = 0u;
    id v6 = v5;
    CC_SHA256((const void *)[v6 bytes], objc_msgSend(v6, "length"), md);
    a1 = *(void *)md;
  }
  return a1;
}

- (id)readDeviceSpecificSalt
{
  if (a1)
  {
    v2 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.CoreDuet"];
    v3 = [v2 dataForKey:@"CDPrivacyPreservingLocationHashDeviceSpecificSalt"];
    if (!v3)
    {
      v3 = -[CLLocation setSaltToUserDefaults:scheme:](a1, v2, @"CDPrivacyPreservingLocationHashDeviceSpecificSalt");
      id v4 = [MEMORY[0x263F34FB8] knowledgeChannel];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v6 = 0;
        _os_log_impl(&dword_225002000, v4, OS_LOG_TYPE_INFO, "PrivacyPreservingLocationHash: Created a new salt for privacy preservation.", v6, 2u);
      }
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)setSaltToUserDefaults:(void *)a3 scheme:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    a1 = -[CLLocation randomData]((uint64_t)a1);
    if (a1)
    {
      [v5 setObject:a1 forKey:v6];
      id v7 = a1;
    }
    else
    {
      uint64_t v8 = [MEMORY[0x263F34FB8] knowledgeChannel];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        -[CLLocation setSaltToUserDefaults:scheme:](v8);
      }
    }
  }

  return a1;
}

- (id)randomData
{
  if (a1)
  {
    v1 = [MEMORY[0x263EFF990] dataWithLength:8];
    v2 = (const __SecRandom *)*MEMORY[0x263F17510];
    id v3 = v1;
    if (SecRandomCopyBytes(v2, 8uLL, (void *)[v3 mutableBytes]))
    {
      id v4 = 0;
    }
    else
    {
      id v4 = [MEMORY[0x263EFF8F8] dataWithData:v3];
    }
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (void)setSaltToUserDefaults:(os_log_t)log scheme:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_225002000, log, OS_LOG_TYPE_FAULT, "PrivacyPreservingLocationHash: Tried to generate a salt for privacy preservation, but got back an empty NSData object", v1, 2u);
}

@end