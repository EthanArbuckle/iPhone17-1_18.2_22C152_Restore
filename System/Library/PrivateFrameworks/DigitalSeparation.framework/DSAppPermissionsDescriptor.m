@interface DSAppPermissionsDescriptor
+ (id)appsWithPermission:(id)a3 fromAllApps:(id)a4;
+ (id)enumerateAppPermissionPairsFromApps:(id)a3 permissions:(id)a4;
+ (id)localizedDescriptionFromApps:(id)a3 permission:(id)a4;
+ (id)localizedDescriptionFromPermissions:(id)a3;
+ (id)localizedNameForPermission:(id)a3;
+ (id)sortSensorDict:(id)a3;
+ (void)ensureApp:(id)a3 inSensorDict:(id)a4;
- (NSString)localizedDescription;
@end

@implementation DSAppPermissionsDescriptor

+ (id)sortSensorDict:(id)a3
{
  v3 = [a3 allValues];
  v4 = [v3 sortedArrayUsingComparator:&__block_literal_global_2];

  return v4;
}

uint64_t __45__DSAppPermissionsDescriptor_sortSensorDict___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  v6 = +[DSUtilities tccServices];
  v7 = [v5 tccPermission];

  unint64_t v8 = [v6 indexOfObject:v7];
  v9 = [v4 tccPermission];

  if (v8 < [v6 indexOfObject:v9]) {
    uint64_t v10 = -1;
  }
  else {
    uint64_t v10 = 1;
  }

  return v10;
}

+ (void)ensureApp:(id)a3 inSensorDict:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v22 = v5;
  v7 = [v5 permissionsGranted];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        v13 = +[DSAppPermissionsDescriptor localizedNameForPermission:v12];
        v14 = DSLocStringForKey(v13);

        if ([v14 length])
        {
          v15 = objc_alloc_init(DSSensor);
          [(DSSensor *)v15 setLocalizedName:v14];
          [(DSSensor *)v15 setTccPermission:v12];
          [v6 setValue:v15 forKey:v14];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v9);
  }

  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __53__DSAppPermissionsDescriptor_ensureApp_inSensorDict___block_invoke;
  v23[3] = &unk_264C9EB60;
  id v24 = v6;
  id v16 = v6;
  v17 = (void (**)(void, void, void))MEMORY[0x237DFC200](v23);
  if ([v22 hasLocationAccess])
  {
    uint64_t v18 = [v22 locationAuthorization];
    v19 = @"DSLocationWhenInUse";
    if (v18 == 2) {
      v19 = @"DSLocationAlways";
    }
    v20 = v19;
    v21 = DSLocStringForKey(@"LOCATION");
    ((void (**)(void, void *, __CFString *))v17)[2](v17, v21, v20);
  }
}

void __53__DSAppPermissionsDescriptor_ensureApp_inSensorDict___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) valueForKey:v12];
  if (!v6
    || (v7 = (void *)v6,
        char v8 = [v5 isEqualToString:@"DSLocationWhenInUse"],
        v7,
        (v8 & 1) == 0))
  {
    uint64_t v9 = objc_alloc_init(DSSensor);
    [(DSSensor *)v9 setLocalizedName:v12];
    [(DSSensor *)v9 setTccPermission:v5];
    uint64_t v10 = *(void **)(a1 + 32);
    v11 = [(DSSensor *)v9 localizedName];
    [v10 setValue:v9 forKey:v11];
  }
}

+ (id)localizedNameForPermission:(id)a3
{
  uint64_t v3 = localizedNameForPermission__token;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&localizedNameForPermission__token, &__block_literal_global_315);
  }
  id v5 = [(id)localizedNameForPermission__localizedNames objectForKey:v4];

  return v5;
}

uint64_t __57__DSAppPermissionsDescriptor_localizedNameForPermission___block_invoke()
{
  objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", @"DSLocationAlways", @"BLUETOOTH", *MEMORY[0x263F7C500], @"LOCATION", @"DSLocationWhenInUse", @"MICROPHONE", *MEMORY[0x263F7C598], @"CAMERA", *MEMORY[0x263F7C510], @"PHOTOS", *MEMORY[0x263F7C5B8], @"MEDIA_LIBRARY", *MEMORY[0x263F7C590], @"HOMEKIT", *MEMORY[0x263F7C688], @"CALENDAR", *MEMORY[0x263F7C508],
    @"REMINDERS",
    *MEMORY[0x263F7C5C8],
    @"CONTACTS",
    @"DSContacts",
    @"HEALTH",
    @"DSHealth",
    @"LOCAL_NETWORK",
    @"DSLocalNetwork",
    @"NEARBY_INTERACTION",
    *MEMORY[0x263F7C5A8],
    @"SENSORKIT_LOCATION",
    *MEMORY[0x263F7C5F0],
  localizedNameForPermission__localizedNames = 0);
  return MEMORY[0x270F9A758]();
}

+ (id)localizedDescriptionFromPermissions:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v5 = +[DSUtilities tccServices];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if (+[DSApp app:v3 hasPermission:v10])
        {
          v11 = +[DSAppPermissionsDescriptor localizedNameForPermission:v10];
          id v12 = v11;
          if (v11)
          {
            v13 = DSLocStringForKey(v11);
            [v4 addObject:v13];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
  v14 = +[DSUtilities localizedDetailStringWithTruncationFromArray:v4 withType:@"com.apple.DigitalSeparation.Permissions"];

  return v14;
}

+ (id)appsWithPermission:(id)a3 fromAllApps:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        if (+[DSApp app:hasPermissionAcceptingAnyLocationAuthorization:](DSApp, "app:hasPermissionAcceptingAnyLocationAuthorization:", v13, v5, (void)v15))
        {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v7;
}

+ (id)localizedDescriptionFromApps:(id)a3 permission:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [a4 tccPermission];
  id v7 = +[DSAppPermissionsDescriptor appsWithPermission:v6 fromAllApps:v5];

  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "displayName", (void)v17);
        [v8 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  long long v15 = +[DSUtilities localizedDetailStringWithTruncationFromArray:v8 withType:@"com.apple.DigitalSeparation.Apps"];

  return v15;
}

+ (id)enumerateAppPermissionPairsFromApps:(id)a3 permissions:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        v14 = objc_msgSend(v5, "allObjects", (void)v17);
        long long v15 = +[DSAppPermissionsDescriptor appsWithPermission:v13 fromAllApps:v14];

        if ([v15 count]) {
          [v7 setObject:v15 forKey:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  return v7;
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void).cxx_destruct
{
}

@end