@interface BPSIconCachePrivacyHelper
+ (id)_naiveHashForString:(id)a3;
+ (id)_perDeviceSalt;
+ (id)saltedHashForString:(id)a3;
+ (void)setCachePath:(id)a3;
@end

@implementation BPSIconCachePrivacyHelper

+ (id)saltedHashForString:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() _perDeviceSalt];
  v6 = [v4 stringByAppendingString:v5];

  v7 = [a1 _naiveHashForString:v6];

  return v7;
}

+ (id)_naiveHashForString:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = [a3 dataUsingEncoding:4];
  CC_SHA1((const void *)[v3 bytes], objc_msgSend(v3, "length"), md);
  id v4 = [MEMORY[0x263F089D8] stringWithCapacity:40];
  for (uint64_t i = 0; i != 20; ++i)
    objc_msgSend(v4, "appendFormat:", @"%02x", md[i]);

  return v4;
}

+ (id)_perDeviceSalt
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__BPSIconCachePrivacyHelper__perDeviceSalt__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_perDeviceSalt_onceToken != -1) {
    dispatch_once(&_perDeviceSalt_onceToken, block);
  }
  v2 = (void *)_perDeviceSalt_saltString;
  return v2;
}

+ (void)setCachePath:(id)a3
{
}

void __43__BPSIconCachePrivacyHelper__perDeviceSalt__block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v2 = (id)_cacheDirectoryPath;
  if (!v2)
  {
    id v3 = bps_utility_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C513000, v3, OS_LOG_TYPE_DEFAULT, "ERROR!! cacheDir was not set!", buf, 2u);
    }
  }
  id v4 = (void *)MGCopyAnswer();
  v5 = *(void **)(a1 + 32);
  v6 = NSString;
  v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v7);
  v9 = [v6 stringWithFormat:@"%@%@", v8, v4];
  v10 = [v5 _naiveHashForString:v9];
  v11 = [v2 stringByAppendingString:v10];

  id v34 = 0;
  uint64_t v12 = [NSString stringWithContentsOfFile:v11 encoding:4 error:&v34];
  id v13 = v34;
  v14 = (void *)_perDeviceSalt_saltString;
  _perDeviceSalt_saltString = v12;

  if (v13)
  {
    v28 = v4;
    v15 = bps_utility_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v37 = v13;
      _os_log_impl(&dword_21C513000, v15, OS_LOG_TYPE_DEFAULT, "Read Error (let's clear the cache). Error %@", buf, 0xCu);
    }

    v16 = [MEMORY[0x263F08850] defaultManager];
    v17 = [v16 contentsOfDirectoryAtPath:v2 error:0];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v31 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = [v2 stringByAppendingString:*(void *)(*((void *)&v30 + 1) + 8 * i)];
          [v16 removeItemAtPath:v22 error:0];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v19);
    }

    id v4 = v28;
  }
  if (![(id)_perDeviceSalt_saltString length])
  {
    id v23 = objc_alloc_init(MEMORY[0x263F08C38]);
    uint64_t v24 = [v23 UUIDString];
    v25 = (void *)_perDeviceSalt_saltString;
    _perDeviceSalt_saltString = v24;

    id v29 = 0;
    [(id)_perDeviceSalt_saltString writeToFile:v11 atomically:1 encoding:4 error:&v29];
    id v26 = v29;
    if (v26)
    {
      v27 = bps_utility_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v37 = v26;
        _os_log_impl(&dword_21C513000, v27, OS_LOG_TYPE_DEFAULT, "Write Error: %@", buf, 0xCu);
      }
    }
  }
}

@end