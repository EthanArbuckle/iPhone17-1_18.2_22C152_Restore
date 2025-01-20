@interface NSURL(MessagesAdditions)
+ (id)__ms_cachesDirectory;
- (BOOL)__ms_conformsToUTI:()MessagesAdditions;
- (id)__ms_UTI;
@end

@implementation NSURL(MessagesAdditions)

- (BOOL)__ms_conformsToUTI:()MessagesAdditions
{
  v4 = a3;
  objc_msgSend(a1, "__ms_UTI");
  CFStringRef v5 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  v6 = (__CFString *)v5;
  if (v5) {
    BOOL v7 = UTTypeConformsTo(v5, v4) != 0;
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)__ms_UTI
{
  id v3 = 0;
  [a1 getResourceValue:&v3 forKey:*MEMORY[0x1E4F1C728] error:0];
  id v1 = v3;

  return v1;
}

+ (id)__ms_cachesDirectory
{
  if (__ms_cachesDirectory_once[0] != -1) {
    dispatch_once(__ms_cachesDirectory_once, &__block_literal_global_9);
  }
  v0 = (void *)__ms_cachesDirectory_sCachesDirectory;

  return v0;
}

@end