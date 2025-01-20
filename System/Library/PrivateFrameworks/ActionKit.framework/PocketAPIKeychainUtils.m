@interface PocketAPIKeychainUtils
+ (BOOL)deleteItemForUsername:(id)a3 andServiceName:(id)a4 error:(id *)a5;
+ (BOOL)storeUsername:(id)a3 andPassword:(id)a4 forServiceName:(id)a5 updateExisting:(BOOL)a6 error:(id *)a7;
+ (id)getPasswordForUsername:(id)a3 andServiceName:(id)a4 error:(id *)a5;
@end

@implementation PocketAPIKeychainUtils

+ (BOOL)deleteItemForUsername:(id)a3 andServiceName:(id)a4 error:(id *)a5
{
  if (a3 && a4)
  {
    if (a5) {
      *a5 = 0;
    }
    id v8 = objc_alloc(MEMORY[0x263EFF8C0]);
    id v9 = (id)objc_msgSend(v8, "initWithObjects:", *MEMORY[0x263F171B8], *MEMORY[0x263F16ED8], *MEMORY[0x263F17090], *MEMORY[0x263F17518], 0);
    id v10 = objc_alloc(MEMORY[0x263EFF8C0]);
    id v11 = (id)objc_msgSend(v10, "initWithObjects:", *MEMORY[0x263F171C8], a3, a4, *MEMORY[0x263EFFB40], 0);
    OSStatus v12 = SecItemDelete((CFDictionaryRef)(id)[objc_alloc(NSDictionary) initWithObjects:v11 forKeys:v9]);
    BOOL result = v12 == 0;
    if (a5 && v12)
    {
      v14 = (void *)MEMORY[0x263F087E8];
      uint64_t v15 = v12;
LABEL_10:
      v16 = (void *)[v14 errorWithDomain:@"PocketAPIKeychainUtilsErrorDomain" code:v15 userInfo:0];
      BOOL result = 0;
      *a5 = v16;
    }
  }
  else
  {
    if (a5)
    {
      v14 = (void *)MEMORY[0x263F087E8];
      uint64_t v15 = -2000;
      goto LABEL_10;
    }
    return 0;
  }
  return result;
}

+ (BOOL)storeUsername:(id)a3 andPassword:(id)a4 forServiceName:(id)a5 updateExisting:(BOOL)a6 error:(id *)a7
{
  if (!a3 || !a4 || !a5)
  {
    if (!a7) {
      return 0;
    }
    uint64_t v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v16 = -2000;
LABEL_11:
    id v14 = (id)objc_msgSend(v15, "errorWithDomain:code:userInfo:", @"PocketAPIKeychainUtilsErrorDomain", v16, 0, a6);
    goto LABEL_12;
  }
  BOOL v10 = a6;
  id v32 = 0;
  id v13 = +[PocketAPIKeychainUtils getPasswordForUsername:andServiceName:error:](PocketAPIKeychainUtils, "getPasswordForUsername:andServiceName:error:");
  if ([0 code] == -1999)
  {
    id v32 = 0;
    [a1 deleteItemForUsername:a3 andServiceName:a5 error:&v32];
  }
  if ([v32 code])
  {
    if (a7)
    {
      id v14 = v32;
LABEL_12:
      BOOL result = 0;
      *a7 = v14;
      return result;
    }
    return 0;
  }
  if (a7) {
    *a7 = 0;
  }
  if (v13)
  {
    char v18 = [v13 isEqualToString:a4];
    BOOL result = 1;
    if ((v18 & 1) != 0 || !v10) {
      return result;
    }
    id v19 = objc_alloc(MEMORY[0x263EFF8C0]);
    id v20 = (id)objc_msgSend(v19, "initWithObjects:", *MEMORY[0x263F171B8], *MEMORY[0x263F17090], *MEMORY[0x263F17000], *MEMORY[0x263F16ED8], 0);
    id v21 = objc_alloc(MEMORY[0x263EFF8C0]);
    id v22 = (id)objc_msgSend(v21, "initWithObjects:", *MEMORY[0x263F171C8], a5, a5, a3, 0);
    CFDictionaryRef v23 = (const __CFDictionary *)(id)[objc_alloc(NSDictionary) initWithObjects:v22 forKeys:v20];
    v24 = NSDictionary;
    uint64_t v25 = [a4 dataUsingEncoding:4];
    OSStatus v26 = SecItemUpdate(v23, (CFDictionaryRef)[v24 dictionaryWithObject:v25 forKey:*MEMORY[0x263F175A8]]);
  }
  else
  {
    id v27 = objc_alloc(MEMORY[0x263EFF8C0]);
    id v28 = (id)objc_msgSend(v27, "initWithObjects:", *MEMORY[0x263F171B8], *MEMORY[0x263F17090], *MEMORY[0x263F17000], *MEMORY[0x263F16ED8], *MEMORY[0x263F175A8], 0);
    id v29 = objc_alloc(MEMORY[0x263EFF8C0]);
    id v30 = (id)objc_msgSend(v29, "initWithObjects:", *MEMORY[0x263F171C8], a5, a5, a3, objc_msgSend(a4, "dataUsingEncoding:", 4), 0);
    OSStatus v26 = SecItemAdd((CFDictionaryRef)(id)[objc_alloc(NSDictionary) initWithObjects:v30 forKeys:v28], 0);
  }
  OSStatus v31 = v26;
  BOOL result = v26 == 0;
  if (a7 && v31)
  {
    uint64_t v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v16 = v31;
    goto LABEL_11;
  }
  return result;
}

+ (id)getPasswordForUsername:(id)a3 andServiceName:(id)a4 error:(id *)a5
{
  if (!a3 || !a4)
  {
    if (a5)
    {
      v17 = (void *)MEMORY[0x263F087E8];
      uint64_t v18 = -2000;
      goto LABEL_11;
    }
    return 0;
  }
  if (a5) {
    *a5 = 0;
  }
  id v8 = objc_alloc(MEMORY[0x263EFF8C0]);
  id v9 = (id)objc_msgSend(v8, "initWithObjects:", *MEMORY[0x263F171B8], *MEMORY[0x263F16ED8], *MEMORY[0x263F17090], 0);
  id v10 = objc_alloc(MEMORY[0x263EFF8C0]);
  id v11 = (id)objc_msgSend(v10, "initWithObjects:", *MEMORY[0x263F171C8], a3, a4, 0);
  id v12 = (id)[objc_alloc(MEMORY[0x263EFF9A0]) initWithObjects:v11 forKeys:v9];
  CFTypeRef result = 0;
  id v13 = (void *)[v12 mutableCopy];
  uint64_t v14 = *MEMORY[0x263EFFB40];
  [v13 setObject:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F17518]];
  OSStatus v15 = SecItemCopyMatching((CFDictionaryRef)v13, &result);

  if (!v15)
  {
    CFTypeRef v26 = 0;
    id v20 = (void *)[v12 mutableCopy];
    [v20 setObject:v14 forKey:*MEMORY[0x263F17520]];
    OSStatus v21 = SecItemCopyMatching((CFDictionaryRef)v20, &v26);
    CFTypeRef v22 = (id)v26;

    if (!v21)
    {
      if (v26)
      {
        id v23 = [NSString alloc];
        v24 = (void *)[v23 initWithData:v26 encoding:4];
      }
      else if (a5)
      {
        uint64_t v25 = (void *)[MEMORY[0x263F087E8] errorWithDomain:@"PocketAPIKeychainUtilsErrorDomain" code:-1999 userInfo:0];
        v24 = 0;
        *a5 = v25;
      }
      else
      {
        v24 = 0;
      }
      return v24;
    }
    if (v21 == -25300)
    {
      if (a5)
      {
        v17 = (void *)MEMORY[0x263F087E8];
        uint64_t v18 = -1999;
        goto LABEL_11;
      }
    }
    else if (a5)
    {
      v17 = (void *)MEMORY[0x263F087E8];
      uint64_t v18 = v21;
      goto LABEL_11;
    }
    return 0;
  }
  id v16 = 0;
  if (a5 && v15 != -25300)
  {
    v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v18 = v15;
LABEL_11:
    id v19 = (void *)[v17 errorWithDomain:@"PocketAPIKeychainUtilsErrorDomain" code:v18 userInfo:0];
    id v16 = 0;
    *a5 = v19;
  }
  return v16;
}

@end