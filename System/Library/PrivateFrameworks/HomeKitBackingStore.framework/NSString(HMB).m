@interface NSString(HMB)
+ (__CFString)hmbDescriptionForEncodedQueryableVariable:()HMB;
+ (id)hmbDecodeQueryableParameter:()HMB;
+ (uint64_t)hmbEncodeQueryableParameter:()HMB;
@end

@implementation NSString(HMB)

+ (__CFString)hmbDescriptionForEncodedQueryableVariable:()HMB
{
  id v3 = a3;
  if ([v3 length])
  {
    objc_msgSend(NSString, "stringWithCString:encoding:", objc_msgSend(v3, "bytes"), 2415919360);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = @"<NULL STRING>";
  }

  return v4;
}

+ (id)hmbDecodeQueryableParameter:()HMB
{
  id v3 = (objc_class *)NSString;
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithData:v4 encoding:2415919360];

  return v5;
}

+ (uint64_t)hmbEncodeQueryableParameter:()HMB
{
  return [a3 dataUsingEncoding:2415919360];
}

@end