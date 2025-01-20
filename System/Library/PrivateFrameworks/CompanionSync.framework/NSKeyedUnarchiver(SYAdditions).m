@interface NSKeyedUnarchiver(SYAdditions)
+ (id)sy_unarchivedObjectFromData:()SYAdditions;
+ (id)sy_whitelistedClasses;
@end

@implementation NSKeyedUnarchiver(SYAdditions)

+ (id)sy_whitelistedClasses
{
  if (sy_whitelistedClasses_onceToken != -1) {
    dispatch_once(&sy_whitelistedClasses_onceToken, &__block_literal_global_9);
  }
  v0 = (void *)sy_whitelistedClasses_supportedClasses;
  return v0;
}

+ (id)sy_unarchivedObjectFromData:()SYAdditions
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (a3)
  {
    v3 = (void *)MEMORY[0x263F08928];
    id v4 = a3;
    v5 = objc_msgSend((id)objc_opt_class(), "sy_whitelistedClasses");
    id v10 = 0;
    v6 = [v3 unarchivedObjectOfClasses:v5 fromData:v4 error:&v10];

    id v7 = v10;
    if (v7)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      v8 = _sync_log_facilities;
      if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v12 = v7;
        _os_log_impl(&dword_21C7C9000, v8, OS_LOG_TYPE_DEFAULT, "Failed to unarchive object. %{public}@", buf, 0xCu);
      }
    }
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

@end