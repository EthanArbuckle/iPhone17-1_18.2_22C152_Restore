@interface NSURL(CRKSharingAdditions)
+ (id)crk_overriddenDescriptionForItems:()CRKSharingAdditions originalDescription:;
- (id)crk_sharingDescription;
- (id)crk_stringByRemovingWWWPrefixFromString:()CRKSharingAdditions;
@end

@implementation NSURL(CRKSharingAdditions)

+ (id)crk_overriddenDescriptionForItems:()CRKSharingAdditions originalDescription:
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 length])
  {
    id v7 = v6;
  }
  else if ([v5 count] == 1)
  {
    v8 = [v5 firstObject];
    objc_msgSend(v8, "crk_sharingDescription");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)crk_sharingDescription
{
  if ([a1 isFileURL])
  {
    v2 = [a1 lastPathComponent];
  }
  else
  {
    v3 = [a1 host];
    v2 = objc_msgSend(a1, "crk_stringByRemovingWWWPrefixFromString:", v3);
  }

  return v2;
}

- (id)crk_stringByRemovingWWWPrefixFromString:()CRKSharingAdditions
{
  id v3 = a3;
  if (([v3 hasPrefix:@"www"] & 1) != 0
    && (uint64_t v4 = [v3 rangeOfString:@"."], v4 != 0x7FFFFFFFFFFFFFFFLL))
  {
    uint64_t v5 = [v3 substringFromIndex:v4 + 1];
  }
  else
  {
    uint64_t v5 = [v3 copy];
  }
  id v6 = (void *)v5;

  return v6;
}

@end