@interface NSString(CLSExtensions)
+ (id)cls_generateUUID;
- (__CFString)cls_normalizedString;
- (id)clsBetterComponentsSeparatedByCharactersInSet:()CLSExtensions;
- (id)cls_indentBy:()CLSExtensions;
@end

@implementation NSString(CLSExtensions)

- (id)clsBetterComponentsSeparatedByCharactersInSet:()CLSExtensions
{
  id v4 = a3;
  v5 = [a1 stringByTrimmingCharactersInSet:v4];
  v6 = (void *)MEMORY[0x1E4F1CA48];
  v7 = [v5 componentsSeparatedByCharactersInSet:v4];
  v8 = [v6 arrayWithArray:v7];

  [v8 removeObject:&stru_1F28DF9D8];
  if ([v8 count])
  {
    unint64_t v9 = 0;
    do
    {
      v10 = [v8 objectAtIndexedSubscript:v9];
      v11 = [v10 stringByTrimmingCharactersInSet:v4];

      [v8 replaceObjectAtIndex:v9 withObject:v11];
      ++v9;
    }
    while (v9 < [v8 count]);
  }

  return v8;
}

- (id)cls_indentBy:()CLSExtensions
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = [a1 componentsSeparatedByString:@"\n"];
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        for (uint64_t j = a3; j; --j)
          [v5 appendString:@"\t"];
        [v5 appendFormat:@"%@\n", v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  objc_msgSend(v5, "deleteCharactersInRange:", objc_msgSend(v5, "length") - 1, 1);
  return v5;
}

- (__CFString)cls_normalizedString
{
  v1 = [MEMORY[0x1E4F28E78] stringWithString:a1];
  CFStringNormalize(v1, kCFStringNormalizationFormD);
  CFStringFold(v1, 0x181uLL, 0);
  return v1;
}

+ (id)cls_generateUUID
{
  CFUUIDRef v0 = CFUUIDCreate(0);
  if (!v0) {
    __assert_rtn("+[NSString(CLSExtensions) cls_generateUUID]", "NSString+CLSExtensions.m", 20, "uuid != NULL");
  }
  CFUUIDRef v1 = v0;
  CFStringRef v2 = CFUUIDCreateString(0, v0);
  if (!v2) {
    __assert_rtn("+[NSString(CLSExtensions) cls_generateUUID]", "NSString+CLSExtensions.m", 23, "uuidString != NULL");
  }
  CFStringRef v3 = v2;
  id v4 = [NSString stringWithString:v2];
  CFRelease(v3);
  CFRelease(v1);
  return v4;
}

@end