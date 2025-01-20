@interface NSMapTable(GKAdditions)
- (void)_gkEnumerateKeysAndObjectsUsingBlock:()GKAdditions;
@end

@implementation NSMapTable(GKAdditions)

- (void)_gkEnumerateKeysAndObjectsUsingBlock:()GKAdditions
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v5 = a3;
  if (!v5)
  {
    v6 = NSString;
    v7 = NSStringFromSelector(a2);
    v8 = [v6 stringWithFormat:@"No block passed to NSMapTable's %@", v7];
    v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKCollectionUtils.m"];
    id v10 = [v9 lastPathComponent];
    v11 = [v6 stringWithFormat:@"%@ (block)\n[%s (%s:%d)]", v8, "-[NSMapTable(GKAdditions) _gkEnumerateKeysAndObjectsUsingBlock:]", objc_msgSend(v10, "UTF8String"), 507];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v11 format];
  }
  char v23 = 0;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v12 = a1;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
LABEL_5:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v20 != v15) {
        objc_enumerationMutation(v12);
      }
      uint64_t v17 = *(void *)(*((void *)&v19 + 1) + 8 * v16);
      v18 = [v12 objectForKey:v17];
      v5[2](v5, v17, v18, &v23);

      if (v23) {
        break;
      }
      if (v14 == ++v16)
      {
        uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v24 count:16];
        if (v14) {
          goto LABEL_5;
        }
        break;
      }
    }
  }
}

@end