@interface WFKeychain
- (BOOL)setData:(id)a3 forKey:(id)a4;
- (NSString)accessGroup;
- (NSString)service;
- (WFKeychain)initWithService:(id)a3;
- (WFKeychain)initWithService:(id)a3 accessGroup:(id)a4;
- (id)dataForKey:(id)a3;
- (id)items;
- (unint64_t)numberOfItems;
@end

@implementation WFKeychain

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessGroup, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

- (NSString)accessGroup
{
  return self->_accessGroup;
}

- (NSString)service
{
  return self->_service;
}

- (id)dataForKey:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v4 = *MEMORY[0x263F171B8];
  v19[0] = *MEMORY[0x263F171C8];
  uint64_t v5 = *MEMORY[0x263F17090];
  v18[0] = v4;
  v18[1] = v5;
  id v6 = a3;
  v7 = [(WFKeychain *)self service];
  v19[1] = v7;
  v18[2] = *MEMORY[0x263F16E80];
  v8 = [(WFKeychain *)self accessGroup];
  uint64_t v9 = *MEMORY[0x263F16ED8];
  v19[2] = v8;
  v19[3] = v6;
  uint64_t v10 = *MEMORY[0x263F17520];
  v18[3] = v9;
  v18[4] = v10;
  uint64_t v11 = *MEMORY[0x263F17400];
  uint64_t v12 = *MEMORY[0x263F17410];
  uint64_t v20 = *MEMORY[0x263EFFB40];
  uint64_t v21 = v12;
  uint64_t v13 = *MEMORY[0x263F17580];
  v18[5] = v11;
  v18[6] = v13;
  uint64_t v22 = v20;
  CFDictionaryRef v14 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:7];

  CFTypeRef v17 = 0;
  if (SecItemCopyMatching(v14, &v17)) {
    v15 = 0;
  }
  else {
    v15 = (void *)v17;
  }

  return v15;
}

- (BOOL)setData:(id)a3 forKey:(id)a4
{
  v25[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x263F171B8];
  v25[0] = *MEMORY[0x263F171C8];
  uint64_t v9 = *MEMORY[0x263F17090];
  v24[0] = v8;
  v24[1] = v9;
  uint64_t v10 = [(WFKeychain *)self service];
  v25[1] = v10;
  v24[2] = *MEMORY[0x263F16E80];
  uint64_t v11 = [(WFKeychain *)self accessGroup];
  v24[3] = *MEMORY[0x263F16ED8];
  v25[2] = v11;
  v25[3] = v7;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:4];

  if (v6)
  {
    uint64_t v13 = *MEMORY[0x263F16E90];
    v22[0] = *MEMORY[0x263F175A8];
    v22[1] = v13;
    uint64_t v14 = *MEMORY[0x263F16E98];
    v23[0] = v6;
    v23[1] = v14;
    uint64_t v15 = *MEMORY[0x263EFFB38];
    uint64_t v16 = *MEMORY[0x263F17580];
    v22[2] = *MEMORY[0x263F170B0];
    v22[3] = v16;
    uint64_t v17 = *MEMORY[0x263EFFB40];
    v23[2] = v15;
    v23[3] = v17;
    CFDictionaryRef v18 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:4];
    v19 = (void *)[v12 mutableCopy];
    [v19 addEntriesFromDictionary:v18];
    OSStatus v20 = SecItemAdd((CFDictionaryRef)v19, 0);
    if (v20 == -25299) {
      OSStatus v20 = SecItemUpdate((CFDictionaryRef)v12, v18);
    }
  }
  else
  {
    OSStatus v20 = SecItemDelete((CFDictionaryRef)v12);
  }

  return v20 == 0;
}

- (id)items
{
  v38[7] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F171B8];
  v38[0] = *MEMORY[0x263F171C8];
  uint64_t v4 = *MEMORY[0x263F17090];
  v37[0] = v3;
  v37[1] = v4;
  uint64_t v5 = [(WFKeychain *)self service];
  v38[1] = v5;
  v37[2] = *MEMORY[0x263F16E80];
  id v6 = [(WFKeychain *)self accessGroup];
  uint64_t v7 = *MEMORY[0x263F17520];
  uint64_t v8 = *MEMORY[0x263EFFB40];
  v38[2] = v6;
  v38[3] = v8;
  uint64_t v9 = *MEMORY[0x263F17518];
  v37[3] = v7;
  v37[4] = v9;
  uint64_t v10 = *MEMORY[0x263F17400];
  uint64_t v11 = *MEMORY[0x263F17408];
  v38[4] = v8;
  v38[5] = v11;
  uint64_t v12 = *MEMORY[0x263F17580];
  v37[5] = v10;
  v37[6] = v12;
  v38[6] = v8;
  CFDictionaryRef v13 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:7];

  CFTypeRef result = 0;
  if (SecItemCopyMatching(v13, &result))
  {
    uint64_t v14 = (void *)MEMORY[0x263EFFA78];
  }
  else
  {
    CFDictionaryRef v30 = v13;
    uint64_t v14 = objc_opt_new();
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v15 = (void *)result;
    uint64_t v16 = [(id)result countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v32;
      uint64_t v19 = *MEMORY[0x263F16ED8];
      uint64_t v20 = *MEMORY[0x263F175A8];
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v32 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v22 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          uint64_t v23 = [v22 objectForKeyedSubscript:v19];
          if (v23)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v24 = v23;
            }
            else {
              v24 = 0;
            }
          }
          else
          {
            v24 = 0;
          }
          id v25 = v24;

          v26 = [v22 objectForKeyedSubscript:v20];
          if (v26)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v27 = v26;
            }
            else {
              v27 = 0;
            }
          }
          else
          {
            v27 = 0;
          }
          id v28 = v27;

          if (v25 && v28) {
            [v14 setObject:v28 forKey:v25];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v17);
    }

    CFDictionaryRef v13 = v30;
  }

  return v14;
}

- (unint64_t)numberOfItems
{
  v14[6] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F171B8];
  v14[0] = *MEMORY[0x263F171C8];
  uint64_t v4 = *MEMORY[0x263F17090];
  v13[0] = v3;
  v13[1] = v4;
  uint64_t v5 = [(WFKeychain *)self service];
  v14[1] = v5;
  v13[2] = *MEMORY[0x263F16E80];
  id v6 = [(WFKeychain *)self accessGroup];
  uint64_t v7 = *MEMORY[0x263F17400];
  v13[3] = *MEMORY[0x263F17518];
  v13[4] = v7;
  uint64_t v8 = *MEMORY[0x263EFFB40];
  v13[5] = *MEMORY[0x263F17580];
  v14[2] = v6;
  v14[3] = v8;
  v14[4] = *MEMORY[0x263F17408];
  v14[5] = v8;
  CFDictionaryRef v9 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:6];

  CFArrayRef theArray = 0;
  CFIndex Count = 0;
  if (!SecItemCopyMatching(v9, (CFTypeRef *)&theArray))
  {
    CFIndex Count = CFArrayGetCount(theArray);
    CFRelease(theArray);
  }

  return Count;
}

- (WFKeychain)initWithService:(id)a3 accessGroup:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  CFDictionaryRef v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"WFKeychain.m", 23, @"Invalid parameter not satisfying: %@", @"service" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  uint64_t v18 = [MEMORY[0x263F08690] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"WFKeychain.m", 24, @"Invalid parameter not satisfying: %@", @"accessGroup" object file lineNumber description];

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)WFKeychain;
  uint64_t v10 = [(WFKeychain *)&v19 init];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    service = v10->_service;
    v10->_service = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    accessGroup = v10->_accessGroup;
    v10->_accessGroup = (NSString *)v13;

    uint64_t v15 = v10;
  }

  return v10;
}

- (WFKeychain)initWithService:(id)a3
{
  return [(WFKeychain *)self initWithService:a3 accessGroup:*MEMORY[0x263F33B50]];
}

@end