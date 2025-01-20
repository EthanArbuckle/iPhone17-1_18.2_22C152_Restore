@interface FPUserDefaultsWithRootUserWorkaround
+ (id)_userDefaultsSearchList;
- (BOOL)BOOLForKey:(id)a3;
- (FPUserDefaultsWithRootUserWorkaround)initWithSuiteName:(id)a3;
- (id)objectForKey:(id)a3;
- (id)stringForKey:(id)a3;
@end

@implementation FPUserDefaultsWithRootUserWorkaround

- (FPUserDefaultsWithRootUserWorkaround)initWithSuiteName:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FPUserDefaultsWithRootUserWorkaround;
  v5 = [(FPUserDefaultsWithRootUserWorkaround *)&v12 init];
  if (v5)
  {
    if (getuid())
    {
      uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:v4];
      userDefaults = v5->_userDefaults;
      v5->_userDefaults = (NSUserDefaults *)v6;
    }
    else
    {
      userDefaults = +[FPUserDefaultsWithRootUserWorkaround _userDefaultsSearchList];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __58__FPUserDefaultsWithRootUserWorkaround_initWithSuiteName___block_invoke;
      v9[3] = &unk_1E5AF4518;
      id v10 = v4;
      v11 = v5;
      [userDefaults enumerateObjectsUsingBlock:v9];
    }
  }

  return v5;
}

- (BOOL)BOOLForKey:(id)a3
{
  userDefaults = self->_userDefaults;
  if (userDefaults)
  {
    return [(NSUserDefaults *)userDefaults BOOLForKey:a3];
  }
  else
  {
    uint64_t v6 = [(NSDictionary *)self->_localUserDefaults objectForKey:a3];
    if (_NSIsNSString())
    {
      if ([v6 isEqualToString:@"YES"])
      {
        char v7 = 1;
      }
      else
      {
        uint64_t v8 = [v6 length];
        char v7 = 1;
        if (objc_msgSend(v6, "compare:options:range:", @"YES", 1, 0, v8))
        {
          uint64_t v9 = objc_msgSend(v6, "compare:options:range:", @"Y", 1, 0, v8);
          char v7 = v9 == 0;
          if (v9) {
            char v7 = [v6 integerValue] != 0;
          }
        }
      }
    }
    else if (_NSIsNSNumber())
    {
      char v7 = [v6 BOOLValue];
    }
    else
    {
      char v7 = 0;
    }

    return v7;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localUserDefaults, 0);

  objc_storeStrong((id *)&self->_userDefaults, 0);
}

+ (id)_userDefaultsSearchList
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = [NSString stringWithFormat:@"/private/var/%@/Library/Preferences", @"mobile"];
  v7[0] = v2;
  v3 = [NSString stringWithFormat:@"/Users/%@/Library/Preferences", @"mobile"];
  v7[1] = v3;
  id v4 = [NSString stringWithFormat:@"/Library/Managed Preferences/%@/", @"mobile"];
  v7[2] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

void __58__FPUserDefaultsWithRootUserWorkaround_initWithSuiteName___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:a2 isDirectory:1];
  char v7 = [v6 URLByAppendingPathComponent:*(void *)(a1 + 32)];
  id v12 = [v7 URLByAppendingPathExtension:@"plist"];

  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v12];
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = *(void **)(v9 + 16);
  *(void *)(v9 + 16) = v8;

  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 16);
  if (v11)
  {
    *a4 = 1;
    LOBYTE(v11) = *(void *)(*(void *)(a1 + 40) + 16) != 0;
  }
  *a4 = v11;
}

- (id)objectForKey:(id)a3
{
  userDefaults = self->_userDefaults;
  if (!userDefaults) {
    userDefaults = self->_localUserDefaults;
  }
  v5 = [userDefaults objectForKey:a3];

  return v5;
}

- (id)stringForKey:(id)a3
{
  userDefaults = self->_userDefaults;
  if (userDefaults)
  {
    v5 = [(NSUserDefaults *)userDefaults stringForKey:a3];
  }
  else
  {
    v5 = [(NSDictionary *)self->_localUserDefaults objectForKey:a3];
    if ((_NSIsNSString() & 1) == 0)
    {
      if (_NSIsNSNumber())
      {
        uint64_t v6 = [v5 stringValue];
      }
      else
      {
        uint64_t v6 = 0;
      }

      v5 = (void *)v6;
    }
  }

  return v5;
}

@end