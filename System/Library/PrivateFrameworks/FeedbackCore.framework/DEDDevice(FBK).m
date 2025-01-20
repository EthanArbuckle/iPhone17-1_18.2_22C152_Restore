@interface DEDDevice(FBK)
+ (id)FBKKnownDevices;
+ (id)deviceDefaults;
+ (id)devicesData;
+ (id)inspectFBKPairing;
+ (id)jsonWithObject:()FBK;
- (BOOL)isFBKPaired;
- (__CFString)displayType;
- (id)FBKKey;
- (id)addressFBKKey;
- (id)debugDetails;
- (id)displayName;
- (uint64_t)deviceDefaults;
- (uint64_t)isVisibleToDED;
- (void)pairToFBK;
- (void)removeFBKPairing;
- (void)updateStoredCopyIfNeeded;
@end

@implementation DEDDevice(FBK)

- (id)displayName
{
  v2 = [a1 name];
  if (FBKIsEmptyString(v2)) {
    [a1 displayType];
  }
  else {
  v3 = [a1 name];
  }

  return v3;
}

- (__CFString)displayType
{
  v2 = [a1 model];
  BOOL v3 = FBKIsEmptyString(v2);

  if (v3)
  {
    v4 = [a1 productType];
    BOOL v5 = FBKIsEmptyString(v4);

    if (v5)
    {
      v6 = [a1 deviceClass];
      BOOL v7 = FBKIsEmptyString(v6);

      if (v7)
      {
        v8 = 0;
        goto LABEL_9;
      }
      uint64_t v9 = [a1 deviceClass];
    }
    else
    {
      uint64_t v9 = [a1 productType];
    }
  }
  else
  {
    uint64_t v9 = [a1 model];
  }
  v8 = (__CFString *)v9;
LABEL_9:
  if (v8) {
    v10 = v8;
  }
  else {
    v10 = @"Unknown";
  }
  v11 = v10;

  return v11;
}

- (BOOL)isFBKPaired
{
  v2 = [a1 deviceDefaults];
  BOOL v3 = [a1 addressFBKKey];
  v4 = [v2 objectForKey:v3];

  if (v4)
  {
    BOOL v5 = [a1 deviceDefaults];
    v6 = [a1 addressFBKKey];
    [v5 removeObjectForKey:v6];

    [a1 pairToFBK];
  }
  BOOL v7 = [a1 deviceDefaults];
  v8 = [a1 FBKKey];
  uint64_t v9 = [v7 objectForKey:v8];
  BOOL v10 = v9 != 0;

  return v10;
}

- (void)pairToFBK
{
  id v4 = [a1 deviceDefaults];
  v2 = [a1 serialize];
  BOOL v3 = [a1 FBKKey];
  [v4 setObject:v2 forKey:v3];
}

- (void)removeFBKPairing
{
  id v3 = [a1 deviceDefaults];
  v2 = [a1 FBKKey];
  [v3 removeObjectForKey:v2];
}

- (uint64_t)isVisibleToDED
{
  v2 = [MEMORY[0x263F3A150] sharedInstance];
  uint64_t v3 = [v2 hasDevice:a1];

  return v3;
}

+ (id)FBKKnownDevices
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v1 = [a1 devicesData];
  v2 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v1, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v18;
    uint64_t v8 = *MEMORY[0x263F3A0D0];
    *(void *)&long long v5 = 138543362;
    long long v16 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v3);
        }
        BOOL v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "objectForKeyedSubscript:", v8, v16, (void)v17);
        v12 = [MEMORY[0x263F3A140] deviceWithDictionary:v10];
        if (v12)
        {
          [v2 addObject:v12];
        }
        else
        {
          v13 = +[FBKLog ded];
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v16;
            v22 = v11;
            _os_log_error_impl(&dword_22A36D000, v13, OS_LOG_TYPE_ERROR, "Could not build device from [%{public}@]", buf, 0xCu);
          }
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v6);
  }

  v14 = [MEMORY[0x263EFF8C0] arrayWithArray:v2];

  return v14;
}

- (void)updateStoredCopyIfNeeded
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = [a1 publicLogDescription];
  int v4 = 138543362;
  long long v5 = v3;
  _os_log_debug_impl(&dword_22A36D000, a2, OS_LOG_TYPE_DEBUG, "Device [%{public}@] has not changed", (uint8_t *)&v4, 0xCu);
}

- (id)debugDetails
{
  id v2 = objc_alloc_init(MEMORY[0x263F089D8]);
  [v2 appendFormat:@"\n\nSERIALIZED:\n"];
  id v3 = (void *)MEMORY[0x263F3A140];
  int v4 = [a1 serialize];
  long long v5 = [v3 jsonWithObject:v4];
  [v2 appendString:v5];

  [v2 appendFormat:@"\n\nDESCRIPTION:\n"];
  uint64_t v6 = [a1 description];
  [v2 appendString:v6];

  uint64_t v7 = [NSString stringWithString:v2];

  return v7;
}

+ (id)jsonWithObject:()FBK
{
  id v8 = 0;
  id v3 = [MEMORY[0x263F08900] dataWithJSONObject:a3 options:1 error:&v8];
  id v4 = v8;
  if (v3)
  {
    uint64_t v5 = [[NSString alloc] initWithData:v3 encoding:4];
  }
  else
  {
    uint64_t v5 = [NSString stringWithFormat:@"Got an error: %@", v4];
  }
  uint64_t v6 = (void *)v5;

  return v6;
}

+ (id)devicesData
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v1 = [a1 deviceDefaults];
  id v2 = [v1 dictionaryRepresentation];

  id v3 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:10];
  id v4 = [v2 allKeys];
  uint64_t v5 = [MEMORY[0x263F08A98] predicateWithFormat:@"SELF BEGINSWITH %@", @"fba-device"];
  uint64_t v6 = [v4 filteredArrayUsingPredicate:v5];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = [v2 objectForKey:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        if (v12) {
          [v3 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  v13 = [MEMORY[0x263EFF980] arrayWithArray:v3];

  return v13;
}

+ (id)inspectFBKPairing
{
  id v2 = [a1 devicesData];
  id v3 = [a1 jsonWithObject:v2];

  return v3;
}

- (id)FBKKey
{
  id v2 = NSString;
  id v3 = [a1 identifier];
  id v4 = [v2 stringWithFormat:@"%@-%@-%li", @"fba-device", v3, objc_msgSend(a1, "remoteTransport")];

  return v4;
}

- (id)addressFBKKey
{
  v1 = NSString;
  id v2 = [a1 address];
  id v3 = [v1 stringWithFormat:@"%@-%@", @"fba-device", v2];

  return v3;
}

- (uint64_t)deviceDefaults
{
  v0 = objc_opt_class();

  return [v0 deviceDefaults];
}

+ (id)deviceDefaults
{
  v0 = (void *)_FBKDEDDeviceDefaults;
  if (!_FBKDEDDeviceDefaults)
  {
    uint64_t v1 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.fba.devices"];
    id v2 = (void *)_FBKDEDDeviceDefaults;
    _FBKDEDDeviceDefaults = v1;

    v0 = (void *)_FBKDEDDeviceDefaults;
  }

  return v0;
}

@end