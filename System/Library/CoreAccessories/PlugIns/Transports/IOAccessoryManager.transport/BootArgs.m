@interface BootArgs
+ (BOOL)BOOLForKey:(id)a3;
+ (id)configuredBootArgs;
+ (id)configuredBootArgsString;
+ (id)numberForKey:(id)a3;
+ (id)stringForKey:(id)a3;
+ (int)intForKey:(id)a3;
+ (int64_t)integerForKey:(id)a3;
- (BootArgs)init;
@end

@implementation BootArgs

- (BootArgs)init
{
  v4 = (void *)MEMORY[0x263EFF940];
  uint64_t v5 = *MEMORY[0x263EFF498];
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = NSStringFromSelector(sel_configuredBootArgs);
  v9 = NSStringFromSelector(a2);
  [v4 raise:v5, @"Use +[%@ %@] instead of -%@.", v7, v8, v9 format];

  return 0;
}

+ (id)configuredBootArgs
{
  if (configuredBootArgs_onceToken != -1) {
    dispatch_once(&configuredBootArgs_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)configuredBootArgs_bootArgsDict;
  return v2;
}

void __30__BootArgs_configuredBootArgs__block_invoke()
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v0 = +[BootArgs configuredBootArgsString];
  v1 = v0;
  if (v0)
  {
    v2 = [v0 componentsSeparatedByString:@" "];
    if ([v2 count])
    {
      v15 = v1;
      v3 = [MEMORY[0x263EFF9A0] dictionary];
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      v14 = v2;
      id v4 = v2;
      uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v17;
        do
        {
          uint64_t v8 = 0;
          do
          {
            if (*(void *)v17 != v7) {
              objc_enumerationMutation(v4);
            }
            v9 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v8), "componentsSeparatedByString:", @"=", v14);
            if ([v9 count])
            {
              if ((unint64_t)[v9 count] < 2) {
                [MEMORY[0x263EFF9D0] null];
              }
              else {
              v10 = [v9 objectAtIndexedSubscript:1];
              }
              v11 = [v9 objectAtIndexedSubscript:0];
              [v3 setObject:v10 forKeyedSubscript:v11];
            }
            ++v8;
          }
          while (v6 != v8);
          uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v6);
      }

      uint64_t v12 = [v3 copy];
      v13 = (void *)configuredBootArgs_bootArgsDict;
      configuredBootArgs_bootArgsDict = v12;

      v2 = v14;
      v1 = v15;
    }
  }
}

+ (id)configuredBootArgsString
{
  if (configuredBootArgsString_onceToken != -1) {
    dispatch_once(&configuredBootArgsString_onceToken, &__block_literal_global_12);
  }
  v2 = (void *)configuredBootArgsString_bootArgsString;
  return v2;
}

void __36__BootArgs_configuredBootArgsString__block_invoke()
{
  io_registry_entry_t v0 = IORegistryEntryFromPath(*MEMORY[0x263F0EC90], "IODeviceTree:/options");
  if (v0)
  {
    io_object_t v1 = v0;
    CFProperty = (void *)IORegistryEntryCreateCFProperty(v0, @"boot-args", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    IOObjectRelease(v1);
    if (CFProperty)
    {
      CFTypeID v3 = CFGetTypeID(CFProperty);
      if (v3 == CFStringGetTypeID())
      {
        id v4 = [MEMORY[0x263F08708] whitespaceCharacterSet];
        uint64_t v5 = [CFProperty stringByTrimmingCharactersInSet:v4];
        uint64_t v6 = (void *)configuredBootArgsString_bootArgsString;
        configuredBootArgsString_bootArgsString = v5;
      }
      CFRelease(CFProperty);
    }
  }
}

+ (id)stringForKey:(id)a3
{
  id v3 = a3;
  id v4 = +[BootArgs configuredBootArgs];
  uint64_t v5 = [v4 objectForKeyedSubscript:v3];

  return v5;
}

+ (id)numberForKey:(id)a3
{
  id v3 = +[BootArgs stringForKey:a3];
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F08A30]);
    [v4 setNumberStyle:1];
    uint64_t v5 = [v4 numberFromString:v3];
    if (!v5)
    {
      uint64_t v6 = [MEMORY[0x263F08B08] scannerWithString:v3];
      unsigned int v8 = -1431655766;
      if ([v6 scanHexInt:&v8])
      {
        uint64_t v5 = [NSNumber numberWithUnsignedInt:v8];
      }
      else
      {
        uint64_t v5 = 0;
      }
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

+ (BOOL)BOOLForKey:(id)a3
{
  id v3 = a3;
  id v4 = +[BootArgs numberForKey:v3];
  uint64_t v5 = v4;
  if (v4)
  {
    char v6 = [v4 BOOLValue];
  }
  else
  {
    uint64_t v7 = +[BootArgs stringForKey:v3];
    unsigned int v8 = v7;
    char v6 = v7
      && (![v7 caseInsensitiveCompare:@"true"]
       || ![v8 caseInsensitiveCompare:@"yes"]);
  }
  return v6;
}

+ (int64_t)integerForKey:(id)a3
{
  id v3 = +[BootArgs numberForKey:a3];
  id v4 = v3;
  if (v3) {
    int64_t v5 = [v3 integerValue];
  }
  else {
    int64_t v5 = 0;
  }

  return v5;
}

+ (int)intForKey:(id)a3
{
  id v3 = +[BootArgs numberForKey:a3];
  id v4 = v3;
  if (v3) {
    int v5 = [v3 intValue];
  }
  else {
    int v5 = 0;
  }

  return v5;
}

@end