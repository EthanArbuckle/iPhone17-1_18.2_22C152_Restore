@interface NSString(FBKInstalledAppAdditions)
- (uint64_t)directoryCountFromRootPath:()FBKInstalledAppAdditions;
@end

@implementation NSString(FBKInstalledAppAdditions)

- (uint64_t)directoryCountFromRootPath:()FBKInstalledAppAdditions
{
  id v4 = a3;
  id v5 = a1;
  if ([v5 hasSuffix:@"/"])
  {
    uint64_t v6 = objc_msgSend(v5, "substringToIndex:", objc_msgSend(v5, "length") - 1);

    id v5 = (id)v6;
  }
  if ([v5 hasPrefix:v4])
  {
    v7 = [v5 stringByReplacingOccurrencesOfString:v4 withString:&stru_26DDF6A30];
    if (([v7 hasPrefix:@"/"] & 1) == 0)
    {
      uint64_t v8 = [@"/" stringByAppendingString:v7];

      v7 = (void *)v8;
    }
    v9 = [v7 componentsSeparatedByString:@"/"];
    uint64_t v10 = [v9 count] - 1;
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

@end