@interface EMMessageIDRandomizer
+ (OS_os_log)log;
+ (id)_createRandomizedStringForMessageID:(int64_t)a3;
+ (id)_findExistingStringError:(id *)a3 messageID:(int64_t)a4;
+ (id)_findOrCreateRandomizedStringForMessageID:(int64_t)a3;
+ (id)_queryKeychainError:(id *)a3 messageID:(int64_t)a4;
+ (id)randomizedStringForGlobalMessageID:(int64_t)a3;
+ (void)_deleteExpiredStringForMessageID:(int64_t)a3;
- (EMMessageIDRandomizer)init;
@end

@implementation EMMessageIDRandomizer

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__EMMessageIDRandomizer_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_24 != -1) {
    dispatch_once(&log_onceToken_24, block);
  }
  v2 = (void *)log_log_24;
  return (OS_os_log *)v2;
}

void __28__EMMessageIDRandomizer_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_24;
  log_log_24 = (uint64_t)v1;
}

- (EMMessageIDRandomizer)init
{
  v3.receiver = self;
  v3.super_class = (Class)EMMessageIDRandomizer;
  return [(EMMessageIDRandomizer *)&v3 init];
}

+ (id)randomizedStringForGlobalMessageID:(int64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  lock._os_unfair_lock_opaque = 0;
  os_unfair_lock_lock(&lock);
  v5 = [a1 _findOrCreateRandomizedStringForMessageID:a3];
  os_unfair_lock_unlock(&lock);
  if (!v5)
  {
    v6 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      char v7 = EFDeviceUnlockedSinceBoot();
      +[EMMessageIDRandomizer randomizedStringForGlobalMessageID:v6];
    }
  }
  return v5;
}

+ (id)_findOrCreateRandomizedStringForMessageID:(int64_t)a3
{
  id v10 = 0;
  v5 = [a1 _findExistingStringError:&v10 messageID:a3];
  id v6 = v10;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [a1 _createRandomizedStringForMessageID:a3];
  }
  v8 = v7;

  return v8;
}

+ (id)_queryKeychainError:(id *)a3 messageID:(int64_t)a4
{
  v24[5] = *MEMORY[0x1E4F143B8];
  v24[0] = *MEMORY[0x1E4F3B988];
  uint64_t v5 = *MEMORY[0x1E4F3B850];
  v23[0] = *MEMORY[0x1E4F3B978];
  v23[1] = v5;
  id v6 = [NSNumber numberWithLongLong:a4];
  v24[1] = v6;
  uint64_t v7 = *MEMORY[0x1E4F3BC68];
  v23[2] = *MEMORY[0x1E4F3BC70];
  v23[3] = v7;
  v24[2] = MEMORY[0x1E4F1CC38];
  v24[3] = MEMORY[0x1E4F1CC38];
  v23[4] = *MEMORY[0x1E4F3BB80];
  v24[4] = &unk_1F1A61E78;
  CFDictionaryRef v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:5];

  CFTypeRef result = 0;
  uint64_t v9 = SecItemCopyMatching(v8, &result);
  uint64_t v10 = v9;
  if (v9)
  {
    if (v9 == -25300)
    {
      uint64_t v11 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_1BEFDB000, v11, OS_LOG_TYPE_DEFAULT, "No randomized string found", v21, 2u);
      }
    }
    else
    {
      v13 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        +[EMMessageIDRandomizer _queryKeychainError:messageID:](v10, v13, v14, v15, v16, v17, v18, v19);
      }

      if (a3)
      {
        [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:(int)v10 userInfo:0];
        v12 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
    }
  }
  else if (result)
  {
    CFAutorelease(result);
    v12 = (id)result;
    goto LABEL_13;
  }
  v12 = 0;
LABEL_13:

  return v12;
}

+ (id)_findExistingStringError:(id *)a3 messageID:(int64_t)a4
{
  id v6 = objc_msgSend(a1, "_queryKeychainError:messageID:", a3);
  uint64_t v7 = v6;
  if (v6)
  {
    CFDictionaryRef v8 = [v6 firstObject];
    uint64_t v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F3B668]];

    if (objc_msgSend(v9, "ef_isMoreThanTimeIntervalAgo:", 86400.0))
    {
      [a1 _deleteExpiredStringForMessageID:a4];
      uint64_t v10 = 0;
    }
    else
    {
      uint64_t v11 = [v7 firstObject];
      v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F3BD38]];

      uint64_t v10 = (void *)[[NSString alloc] initWithData:v12 encoding:4];
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (id)_createRandomizedStringForMessageID:(int64_t)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v4 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v28 = a3;
    _os_log_impl(&dword_1BEFDB000, v4, OS_LOG_TYPE_DEFAULT, "Will create new randomized string for messageID %lld", buf, 0xCu);
  }

  uint64_t v5 = objc_msgSend(NSString, "ef_UUID");
  id v6 = [v5 dataUsingEncoding:4];
  uint64_t v7 = *MEMORY[0x1E4F3B978];
  v25[0] = *MEMORY[0x1E4F3BD38];
  v25[1] = v7;
  uint64_t v8 = *MEMORY[0x1E4F3B988];
  v26[0] = v6;
  v26[1] = v8;
  v26[2] = @"com.apple.mail.categories";
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithLongLong:", a3, v25[0], v7, *MEMORY[0x1E4F3B550], *MEMORY[0x1E4F3B850]);
  v26[3] = v9;
  v25[4] = *MEMORY[0x1E4F3B698];
  uint64_t v10 = NSNumber;
  uint64_t v11 = [MEMORY[0x1E4F60D58] currentDevice];
  v12 = objc_msgSend(v10, "numberWithInt:", objc_msgSend(v11, "isInternal") ^ 1);
  v25[5] = *MEMORY[0x1E4F3B558];
  uint64_t v13 = *MEMORY[0x1E4F3B570];
  v26[4] = v12;
  v26[5] = v13;
  CFDictionaryRef v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:6];

  uint64_t v15 = SecItemAdd(v14, 0);
  if (v15)
  {
    uint64_t v16 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      +[EMMessageIDRandomizer _createRandomizedStringForMessageID:](v15, v16, v17, v18, v19, v20, v21, v22);
    }

    id v23 = 0;
  }
  else
  {
    id v23 = v5;
  }

  return v23;
}

+ (void)_deleteExpiredStringForMessageID:(int64_t)a3
{
  v19[3] = *MEMORY[0x1E4F143B8];
  v4 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl(&dword_1BEFDB000, v4, OS_LOG_TYPE_DEFAULT, "Will delete expired randomized string", v17, 2u);
  }

  uint64_t v5 = *MEMORY[0x1E4F3B988];
  uint64_t v6 = *MEMORY[0x1E4F3B550];
  v18[0] = *MEMORY[0x1E4F3B978];
  v18[1] = v6;
  v19[0] = v5;
  v19[1] = @"com.apple.mail.categories";
  v18[2] = *MEMORY[0x1E4F3B850];
  uint64_t v7 = [NSNumber numberWithLongLong:a3];
  v19[2] = v7;
  CFDictionaryRef v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];

  uint64_t v9 = SecItemDelete(v8);
  if (v9)
  {
    uint64_t v10 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[EMMessageIDRandomizer _deleteExpiredStringForMessageID:](v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
}

+ (void)randomizedStringForGlobalMessageID:(os_log_t)log .cold.1(char a1, uint8_t *buf, os_log_t log)
{
  objc_super v3 = @"NO";
  if (a1) {
    objc_super v3 = @"YES";
  }
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = v3;
  _os_log_fault_impl(&dword_1BEFDB000, log, OS_LOG_TYPE_FAULT, "Could not generate randomized string. Device unlocked since boot: %@", buf, 0xCu);
}

+ (void)_queryKeychainError:(uint64_t)a3 messageID:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_createRandomizedStringForMessageID:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_deleteExpiredStringForMessageID:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end