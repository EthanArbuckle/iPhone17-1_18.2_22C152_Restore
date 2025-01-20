@interface NSString(CPLAdditions)
- (id)cplStringByAppendingPathExtension:()CPLAdditions fallbackExtension:;
- (id)cpl_redactedShareURL;
@end

@implementation NSString(CPLAdditions)

- (id)cpl_redactedShareURL
{
  v1 = [MEMORY[0x1E4F1CB10] URLWithString:a1];
  v2 = objc_msgSend(v1, "cpl_redactedShareURL");
  v3 = [v2 absoluteString];

  return v3;
}

- (id)cplStringByAppendingPathExtension:()CPLAdditions fallbackExtension:
{
  id v6 = a3;
  id v7 = a4;
  if (![v6 length]
    || ([a1 stringByAppendingPathExtension:v6], (id v8 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (![v7 length]
      || ([a1 stringByAppendingPathExtension:v7], (id v8 = (id)objc_claimAutoreleasedReturnValue()) == 0))
    {
      id v8 = a1;
    }
  }

  return v8;
}

@end