@interface GKServiceInterface
+ (id)interface;
+ (id)interfaceProtocol;
+ (id)plistClasses;
@end

@implementation GKServiceInterface

+ (id)interface
{
  v3 = [a1 interfaceProtocol];
  if (v3)
  {
    v4 = [MEMORY[0x1E4F29280] interfaceWithProtocol:v3];
    [a1 configureInterface:v4];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)plistClasses
{
  if (plistClasses_onceToken != -1) {
    dispatch_once(&plistClasses_onceToken, &__block_literal_global_19);
  }
  v2 = (void *)plistClasses_sPlistClasses;

  return v2;
}

uint64_t __34__GKServiceInterface_plistClasses__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  plistClasses_sPlistClasses = objc_msgSend(v0, "initWithObjects:", v1, v2, v3, v4, v5, v6, v7, v8, objc_opt_class(), 0);

  return MEMORY[0x1F41817F8]();
}

+ (id)interfaceProtocol
{
  uint64_t v2 = NSString;
  uint64_t v3 = [NSString stringWithFormat:@"Concrete subclasses must override +[GKServer interfaceProtocol]."];
  uint64_t v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKServiceInterface.m"];
  id v5 = [v4 lastPathComponent];
  uint64_t v6 = [v2 stringWithFormat:@"%@ (NO)\n[%s (%s:%d)]", v3, "+[GKServiceInterface interfaceProtocol]", objc_msgSend(v5, "UTF8String"), 48];

  [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v6 format];
  return 0;
}

@end