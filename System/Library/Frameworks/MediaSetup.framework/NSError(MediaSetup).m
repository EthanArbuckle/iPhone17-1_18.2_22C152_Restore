@interface NSError(MediaSetup)
- (id)translateCKErrorToMSError;
- (uint64_t)CKErrorHasErrorCode:()MediaSetup;
- (uint64_t)CKErrorHasUnderlyingErrorCode:()MediaSetup;
- (uint64_t)isErrorFatal;
@end

@implementation NSError(MediaSetup)

- (id)translateCKErrorToMSError
{
  v44[1] = *MEMORY[0x263EF8340];
  if (!a1) {
    goto LABEL_14;
  }
  v2 = [a1 domain];
  char v3 = [v2 isEqualToString:*MEMORY[0x263EFD498]];

  if ((v3 & 1) == 0) {
    goto LABEL_14;
  }
  uint64_t v4 = [a1 code];
  if (v4 <= 20)
  {
    switch(v4)
    {
      case 1:
        v5 = (void *)MEMORY[0x263F087E8];
        v29 = @"MSUserInfoErrorStringKey";
        v30 = @"Cannot recover from CKInternalError, Please file a radar";
        v6 = [NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
        v7 = v5;
        uint64_t v8 = 8;
        goto LABEL_22;
      case 2:
        v17 = [a1 userInfo];
        v13 = [v17 objectForKey:*MEMORY[0x263EFD4C8]];

        v18 = objc_msgSend(NSString, "stringWithFormat:", @"CloudKit Partial Failure Error for %lu records", objc_msgSend(v13, "count"));
        v19 = (void *)MEMORY[0x263F087E8];
        v41 = @"MSUserInfoErrorStringKey";
        v42 = v18;
        v20 = [NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
        id v16 = [v19 errorWithDomain:@"com.apple.mediasetup.cloudkit.errorDomain" code:2 userInfo:v20];

        goto LABEL_16;
      case 6:
      case 7:
        goto LABEL_13;
      case 11:
        v21 = (void *)MEMORY[0x263F087E8];
        v43 = @"MSUserInfoErrorStringKey";
        v44[0] = @"CloudKit Unknown Item";
        v6 = [NSDictionary dictionaryWithObjects:v44 forKeys:&v43 count:1];
        v7 = v21;
        uint64_t v8 = 1;
        goto LABEL_22;
      case 14:
        v22 = (void *)MEMORY[0x263F087E8];
        v39 = @"MSUserInfoErrorStringKey";
        v40 = @"CloudKit Server Record Changed";
        v6 = [NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
        v7 = v22;
        uint64_t v8 = 3;
        goto LABEL_22;
      default:
        goto LABEL_14;
    }
  }
  if (v4 > 109)
  {
    switch(v4)
    {
      case 'n':
        v23 = (void *)MEMORY[0x263F087E8];
        v37 = @"MSUserInfoErrorStringKey";
        v38 = @"CloudKit Manatee Unavailable";
        v6 = [NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
        v7 = v23;
        uint64_t v8 = 4;
        goto LABEL_22;
      case 'o':
        v24 = (void *)MEMORY[0x263F087E8];
        v27 = @"MSUserInfoErrorStringKey";
        v28 = @"CloudKit Unsynched Keychain error, Please try again after a while";
        v6 = [NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
        v7 = v24;
        uint64_t v8 = 9;
        goto LABEL_22;
      case 'p':
        v9 = (void *)MEMORY[0x263F087E8];
        v35 = @"MSUserInfoErrorStringKey";
        v36 = @"CloudKit Manatee Missing Identity";
        v6 = [NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
        v7 = v9;
        uint64_t v8 = 5;
LABEL_22:
        id v16 = [v7 errorWithDomain:@"com.apple.mediasetup.cloudkit.errorDomain" code:v8 userInfo:v6];

        goto LABEL_23;
    }
LABEL_14:
    id v16 = a1;
    goto LABEL_23;
  }
  if (v4 == 21)
  {
    v25 = (void *)MEMORY[0x263F087E8];
    v31 = @"MSUserInfoErrorStringKey";
    v32 = @"CloudKit Change Token Expired";
    v6 = [NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    v7 = v25;
    uint64_t v8 = 7;
    goto LABEL_22;
  }
  if (v4 != 23) {
    goto LABEL_14;
  }
LABEL_13:
  v10 = NSString;
  v11 = [a1 userInfo];
  v12 = [v11 objectForKey:*MEMORY[0x263EFD4A0]];
  v13 = [v10 stringWithFormat:@"CloudKit Throttled Error: Retry after - %@", v12];

  v14 = (void *)MEMORY[0x263F087E8];
  v33 = @"MSUserInfoErrorStringKey";
  v34 = v13;
  v15 = [NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
  id v16 = [v14 errorWithDomain:@"com.apple.mediasetup.cloudkit.errorDomain" code:6 userInfo:v15];

LABEL_16:
LABEL_23:

  return v16;
}

- (uint64_t)CKErrorHasErrorCode:()MediaSetup
{
  if (CKErrorIsCode())
  {
    return [a1 CKErrorHasUnderlyingErrorCode:a3];
  }
  else
  {
    v6 = [a1 domain];
    if ([v6 isEqualToString:*MEMORY[0x263EFD498]])
    {
      uint64_t v7 = [a1 code];

      if (v7 == a3) {
        return 1;
      }
    }
    else
    {
    }
    return 0;
  }
}

- (uint64_t)CKErrorHasUnderlyingErrorCode:()MediaSetup
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (!a1 || !CKErrorIsCode()) {
    return 0;
  }
  v5 = [a1 userInfo];
  v6 = [v5 objectForKey:*MEMORY[0x263EFD4C8]];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = objc_msgSend(v6, "allValues", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    uint64_t v11 = *MEMORY[0x263EFD498];
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v14 = [v13 domain];
        if ([v14 isEqualToString:v11])
        {
          uint64_t v15 = [v13 code];

          if (v15 == a3)
          {
            uint64_t v16 = 1;
            goto LABEL_16;
          }
        }
        else
        {
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }
  uint64_t v16 = 0;
LABEL_16:

  return v16;
}

- (uint64_t)isErrorFatal
{
  v2 = [a1 domain];
  int v3 = [v2 isEqualToString:@"com.apple.mediasetup.cloudkit.errorDomain"];

  if (v3 && [a1 code] == 10) {
    return 1;
  }
  uint64_t v4 = [a1 domain];
  int v5 = [v4 isEqualToString:*MEMORY[0x263F07F70]];

  if (v5)
  {
    unint64_t v6 = [a1 code] - 4097;
    if (v6 <= 4 && ((1 << v6) & 0x15) != 0) {
      return 1;
    }
  }
  uint64_t v8 = [a1 domain];
  int v9 = [v8 isEqualToString:*MEMORY[0x263EFD498]];

  if (!v9) {
    return 0;
  }
  unint64_t v10 = [a1 code];
  uint64_t result = 1;
  if ((v10 > 0x17 || ((1 << v10) & 0x80C0C0) == 0) && v10 - 110 >= 3) {
    return 0;
  }
  return result;
}

@end