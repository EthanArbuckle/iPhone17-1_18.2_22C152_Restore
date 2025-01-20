@interface LCFModelStoreUtils
+ (BOOL)isEnabledOnMacOS;
+ (BOOL)isPlatformMacOS;
+ (BOOL)isPlatformWatchOS;
+ (BOOL)isPlatformiOS;
+ (BOOL)isPlatformtvOS;
+ (BOOL)isSupportedPlatform;
+ (id)getBaseLocalPath;
+ (id)sha256For:(id)a3;
+ (id)sha256ForURL:(id)a3;
+ (void)SwitchToMobile;
@end

@implementation LCFModelStoreUtils

+ (void)SwitchToMobile
{
  uid_t v2 = geteuid();
  v3 = getpwnam("mobile");
  if (v3) {
    uid_t pw_uid = v3->pw_uid;
  }
  else {
    uid_t pw_uid = 501;
  }
  if (pw_uid != v2)
  {
    if (seteuid(pw_uid)) {
      NSLog(&cfstr_SeteuidToMobil.isa);
    }
  }
}

+ (BOOL)isPlatformiOS
{
  return 1;
}

+ (BOOL)isEnabledOnMacOS
{
  return 1;
}

+ (BOOL)isPlatformMacOS
{
  return 0;
}

+ (BOOL)isPlatformWatchOS
{
  return 0;
}

+ (BOOL)isPlatformtvOS
{
  return 0;
}

+ (BOOL)isSupportedPlatform
{
  return +[LCFModelStoreUtils isPlatformiOS]
      || +[LCFModelStoreUtils isPlatformtvOS]
      || +[LCFModelStoreUtils isPlatformWatchOS]
      || +[LCFModelStoreUtils isPlatformMacOS]
      && +[LCFModelStoreUtils isEnabledOnMacOS];
}

+ (id)getBaseLocalPath
{
  if (+[LCFModelStoreUtils isPlatformiOS]
    || +[LCFModelStoreUtils isPlatformWatchOS]
    || +[LCFModelStoreUtils isPlatformtvOS])
  {
    uid_t v2 = @"/private/var/mobile/Library/Application Support/com.apple.LighthouseCoreMLModelStore";
  }
  else if (+[LCFModelStoreUtils isEnabledOnMacOS] {
         && +[LCFModelStoreUtils isPlatformMacOS])
  }
  {
    size_t v4 = confstr(0x10000, 0, 0);
    v5 = (char *)malloc_type_malloc(v4, 0x51DA0348uLL);
    confstr(0x10000, v5, 0x1F4uLL);
    v6 = [NSString stringWithUTF8String:v5];
    free(v5);
    uid_t v2 = [v6 stringByAppendingString:@"/com.apple.LighthouseCoreMLModelStore/"];
  }
  else
  {
    uid_t v2 = 0;
  }
  return v2;
}

+ (id)sha256For:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a3;
  CC_SHA256((const void *)[v3 bytes], objc_msgSend(v3, "length"), md);
  size_t v4 = [MEMORY[0x263F089D8] stringWithCapacity:64];
  for (uint64_t i = 0; i != 32; ++i)
    objc_msgSend(v4, "appendFormat:", @"%02x", md[i]);

  return v4;
}

+ (id)sha256ForURL:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  size_t v4 = [MEMORY[0x263F08850] defaultManager];
  id v21 = 0;
  v5 = [v4 contentsOfDirectoryAtURL:v3 includingPropertiesForKeys:0 options:0 error:&v21];
  id v6 = v21;

  id v7 = objc_alloc_init(MEMORY[0x263EFF990]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      uint64_t v12 = 0;
      v13 = v3;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        id v3 = *(id *)(*((void *)&v17 + 1) + 8 * v12);

        v14 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithContentsOfURL:", v3, (void)v17);
        [v7 appendData:v14];

        ++v12;
        v13 = v3;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v10);
  }

  v15 = +[LCFModelStoreUtils sha256For:v7];

  return v15;
}

@end