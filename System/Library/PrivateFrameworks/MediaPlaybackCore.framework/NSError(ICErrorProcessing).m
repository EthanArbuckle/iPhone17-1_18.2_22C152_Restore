@interface NSError(ICErrorProcessing)
+ (BOOL)_isAgeVerificationError:()ICErrorProcessing;
+ (id)errorForICError:()ICErrorProcessing response:;
@end

@implementation NSError(ICErrorProcessing)

+ (BOOL)_isAgeVerificationError:()ICErrorProcessing
{
  id v3 = a3;
  v4 = [v3 domain];
  v5 = (void *)*MEMORY[0x263F89028];

  BOOL v6 = [v3 code] == 3770 || objc_msgSend(v3, "code") == 3771 || objc_msgSend(v3, "code") == 3772;
  BOOL v7 = v4 == v5 && v6;

  return v7;
}

+ (id)errorForICError:()ICErrorProcessing response:
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v7 conformsToProtocol:&unk_26CC77428])
  {
    v8 = [v7 serverError];
    v9 = v8;
    if (v8)
    {
      v10 = [v8 domain];
      uint64_t v11 = [v9 code];
      v12 = [v6 userInfo];
      v13 = (void *)[v12 mutableCopy];
      v14 = v13;
      if (v13) {
        id v15 = v13;
      }
      else {
        id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      }
      v17 = v15;

      v18 = [v7 dialog];
      v19 = [v18 responseDictionary];

      if ([v19 count]) {
        [v17 setObject:v19 forKey:@"MPCErrorUserInfoKeyStoreDialogDictionary"];
      }
      if ([a1 _isAgeVerificationError:v9])
      {
        v20 = @"MPCError";

        [v17 removeObjectForKey:@"MPCErrorUserInfoKeyStoreDialogDictionary"];
        v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          uint64_t v22 = [v19 objectForKeyedSubscript:*MEMORY[0x263F88FD0]];
          v23 = (void *)v22;
          v24 = @"Unspecified explanation";
          if (v22) {
            v24 = (__CFString *)v22;
          }
          int v26 = 138543362;
          v27 = v24;
          _os_log_impl(&dword_21BB87000, v21, OS_LOG_TYPE_ERROR, "Playback failed due to age verification requirement: %{public}@", (uint8_t *)&v26, 0xCu);
        }
        v10 = @"MPCError";
        uint64_t v11 = 40;
      }
      id v16 = [MEMORY[0x263F087E8] errorWithDomain:v10 code:v11 userInfo:v17];
    }
    else
    {
      id v16 = v6;
    }
  }
  else
  {
    id v16 = v6;
  }

  return v16;
}

@end