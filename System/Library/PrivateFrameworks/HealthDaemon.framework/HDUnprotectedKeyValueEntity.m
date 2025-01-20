@interface HDUnprotectedKeyValueEntity
+ (BOOL)setBadge:(id)a3 forDomain:(int64_t)a4 profile:(id)a5 error:(id *)a6;
+ (__CFString)_keyForNotificationDomain:(uint64_t)a3 error:;
+ (const)_insertStatementKey;
+ (id)badgeForDomain:(int64_t)a3 profile:(id)a4 error:(id *)a5;
+ (id)databaseTable;
+ (int64_t)protectionClass;
@end

@implementation HDUnprotectedKeyValueEntity

+ (int64_t)protectionClass
{
  return 1;
}

+ (id)badgeForDomain:(int64_t)a3 profile:(id)a4 error:(id *)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = +[HDUnprotectedKeyValueEntity _keyForNotificationDomain:error:]((uint64_t)a1, a3, (uint64_t)a5);
  if (v9)
  {
    id v20 = 0;
    v10 = [a1 numberForKey:v9 domain:&stru_1F1728D60 category:2 profile:v8 entity:0 error:&v20];
    id v11 = v20;
    v12 = v11;
    if (v10) {
      BOOL v13 = 1;
    }
    else {
      BOOL v13 = v11 == 0;
    }
    if (v13)
    {
      v14 = [MEMORY[0x1E4F2AC70] badgeFromKeyValueRepresentation:v10];
    }
    else
    {
      _HKInitializeLogging();
      v15 = (void *)*MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
      {
        v18 = v15;
        v19 = NSStringFromHKNotificationDomain();
        *(_DWORD *)buf = 138412546;
        v22 = v19;
        __int16 v23 = 2114;
        v24 = v12;
        _os_log_error_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_ERROR, "Failed to get badge for notification domain %@: %{public}@", buf, 0x16u);
      }
      if (a5)
      {
        v14 = 0;
        *a5 = v12;
      }
      else
      {
        _HKLogDroppedError();
        v14 = 0;
      }
    }
  }
  else
  {
    v14 = [MEMORY[0x1E4F2AC70] badgeFromKeyValueRepresentation:0];
  }

  return v14;
}

+ (__CFString)_keyForNotificationDomain:(uint64_t)a3 error:
{
  if (a2 < 0x10 && ((0xBDF9u >> a2) & 1) != 0) {
    return off_1E6301990[a2];
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 3, @"Invalid notification domain %zd", a2);
  return 0;
}

+ (BOOL)setBadge:(id)a3 forDomain:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  v12 = +[HDUnprotectedKeyValueEntity _keyForNotificationDomain:error:]((uint64_t)a1, a4, (uint64_t)a6);
  if (v12)
  {
    BOOL v13 = [v10 keyValueRepresentation];
    char v14 = [a1 setNumber:v13 forKey:v12 domain:&stru_1F1728D60 category:2 profile:v11 error:a6];
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

+ (id)databaseTable
{
  return @"key_value";
}

+ (const)_insertStatementKey
{
  return (const char *)&_insertStatementKey_key_479;
}

@end