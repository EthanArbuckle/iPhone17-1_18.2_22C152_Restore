@interface NSDictionary(GKImageAdditions)
+ (id)_gkClientImageDictionaryForServerImageURLs:()GKImageAdditions;
+ (id)_gkImageCacheKeyPathsByKey;
- (id)_gkImageURLForSize:()GKImageAdditions scale:foundSize:;
- (uint64_t)_gkImageURLForSize:()GKImageAdditions scale:;
@end

@implementation NSDictionary(GKImageAdditions)

- (id)_gkImageURLForSize:()GKImageAdditions scale:foundSize:
{
  if (a2 == 0.0)
  {
    v9 = NSString;
    v10 = [NSString stringWithFormat:@"Assertion failed"];
    v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/NSDictionary+GKImageAdditions.m"];
    id v12 = [v11 lastPathComponent];
    v13 = [v9 stringWithFormat:@"%@ (scale != 0)\n[%s (%s:%d)]", v10, "-[NSDictionary(GKImageAdditions) _gkImageURLForSize:scale:foundSize:]", objc_msgSend(v12, "UTF8String"), 83];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v13 format];
  }
  uint64_t v14 = (uint64_t)((double)a4 * a2);
  v15 = [a1 objectForKeyedSubscript:@"template"];
  v16 = v15;
  if (v15 && [v15 length])
  {
    v17 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v14);
    v18 = [MEMORY[0x1E4F28E78] stringWithString:v16];
    v19 = [v18 lastPathComponent];
    uint64_t v20 = [v18 rangeOfString:v19 options:12];
    objc_msgSend(v18, "replaceOccurrencesOfString:withString:options:range:", @"{w}", v17, 4, v20, v21);
    v22 = [v18 lastPathComponent];

    uint64_t v23 = [v18 rangeOfString:v22 options:12];
    objc_msgSend(v18, "replaceOccurrencesOfString:withString:options:range:", @"{h}", v17, 4, v23, v24);
    if (a5) {
      *a5 = v14;
    }
  }
  else if (v14 > 512)
  {
LABEL_19:
    v18 = 0;
  }
  else
  {
    while (1)
    {
      uint64_t v25 = (uint64_t)((double)v14 * a2);
      v26 = @"64";
      if (v25 >= 65)
      {
        v26 = @"128";
        if ((unint64_t)v25 >= 0x81)
        {
          if ((unint64_t)v25 >= 0x101) {
            v26 = @"512";
          }
          else {
            v26 = @"256";
          }
        }
      }
      uint64_t v27 = [a1 objectForKey:v26];
      if (v27) {
        break;
      }
      if (v14)
      {
        uint64_t v28 = v14 | (v14 >> 1) | ((v14 | (v14 >> 1)) >> 2);
        uint64_t v29 = v28 | (v28 >> 4) | ((v28 | (v28 >> 4)) >> 8);
        uint64_t v14 = (v29 | (v29 >> 16)) + 1;
      }
      else
      {
        uint64_t v14 = 1;
      }
      if (v14 >= 513) {
        goto LABEL_19;
      }
    }
    v18 = (void *)v27;
    if (a5) {
      *a5 = v14;
    }
  }

  return v18;
}

+ (id)_gkImageCacheKeyPathsByKey
{
  if (_gkImageCacheKeyPathsByKey_onceToken != -1) {
    dispatch_once(&_gkImageCacheKeyPathsByKey_onceToken, &__block_literal_global_30);
  }
  v0 = (void *)_gkImageCacheKeyPathsByKey_sKeyPaths;

  return v0;
}

+ (id)_gkClientImageDictionaryForServerImageURLs:()GKImageAdditions
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  v6 = [a1 _gkImageCacheKeyPathsByKey];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __77__NSDictionary_GKImageAdditions___gkClientImageDictionaryForServerImageURLs___block_invoke;
  v12[3] = &unk_1E646D8D8;
  id v7 = v5;
  id v13 = v7;
  id v14 = v4;
  id v8 = v4;
  [v6 enumerateKeysAndObjectsUsingBlock:v12];

  v9 = v14;
  id v10 = v7;

  return v10;
}

- (uint64_t)_gkImageURLForSize:()GKImageAdditions scale:
{
  return objc_msgSend(a1, "_gkImageURLForSize:scale:foundSize:", a3, 0);
}

@end