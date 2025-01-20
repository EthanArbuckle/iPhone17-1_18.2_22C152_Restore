@interface DCCryptoUtilities
+ (id)identityCertificateOptions;
+ (unsigned)generateTTL;
+ (void)identityCertificateOptions;
@end

@implementation DCCryptoUtilities

+ (id)identityCertificateOptions
{
  v17[6] = *MEMORY[0x263EF8340];
  uint64_t v2 = +[DCCryptoUtilities generateTTL];
  v3 = _DCLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    +[DCCryptoUtilities identityCertificateOptions];
  }

  v4 = (void *)MEMORY[0x263EFF9A0];
  v16[0] = *MEMORY[0x263F399E0];
  v5 = [NSNumber numberWithUnsignedInt:v2];
  uint64_t v6 = *MEMORY[0x263F399D0];
  v17[0] = v5;
  v17[1] = MEMORY[0x263EFFA80];
  uint64_t v7 = *MEMORY[0x263F39930];
  v16[1] = v6;
  v16[2] = v7;
  uint64_t v8 = *MEMORY[0x263F39928];
  v17[2] = @"2bit-identity";
  v17[3] = @"2bit-identity";
  uint64_t v9 = *MEMORY[0x263F39920];
  v16[3] = v8;
  v16[4] = v9;
  v17[4] = MEMORY[0x263EFFA80];
  v16[5] = *MEMORY[0x263F399B0];
  uint64_t v15 = *MEMORY[0x263F399B8];
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v15 count:1];
  v17[5] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:6];
  v12 = [v4 dictionaryWithDictionary:v11];

  if (os_variant_allows_internal_security_policies())
  {
    v13 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.DeviceCheck"];
    if ([v13 BOOLForKey:@"DCIgnoreExistingKeychainItems"]) {
      [v12 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v9];
    }
  }
  if ((MEMORY[0x237DB73E0]() & 1) == 0) {
    [v12 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v6];
  }
  [v12 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F399C8]];

  return v12;
}

+ (unsigned)generateTTL
{
  return arc4random_uniform(0x40561u) + 262080;
}

+ (void)identityCertificateOptions
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2[0] = 67109632;
  v2[1] = 262080;
  __int16 v3 = 1024;
  int v4 = a1;
  __int16 v5 = 1024;
  int v6 = 525600;
  _os_log_debug_impl(&dword_2330E6000, a2, OS_LOG_TYPE_DEBUG, "Attempting to generate certificate data... (%dh/%dh/%dh)", (uint8_t *)v2, 0x14u);
}

@end