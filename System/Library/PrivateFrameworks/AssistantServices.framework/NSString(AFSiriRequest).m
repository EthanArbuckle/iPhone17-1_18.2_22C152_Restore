@interface NSString(AFSiriRequest)
- (__CFString)_af_stringByRemovingPrefixWithLength:()AFSiriRequest;
- (id)_af_stringByRemovingSuffix:()AFSiriRequest;
@end

@implementation NSString(AFSiriRequest)

- (id)_af_stringByRemovingSuffix:()AFSiriRequest
{
  id v4 = a3;
  if ([a1 hasSuffix:v4])
  {
    uint64_t v5 = objc_msgSend(a1, "substringToIndex:", objc_msgSend(a1, "length") - objc_msgSend(v4, "length"));
  }
  else
  {
    uint64_t v5 = [a1 copy];
  }
  v6 = (void *)v5;

  return v6;
}

- (__CFString)_af_stringByRemovingPrefixWithLength:()AFSiriRequest
{
  if ([a1 length] >= a3)
  {
    uint64_t v5 = [a1 substringFromIndex:a3];
  }
  else
  {
    uint64_t v5 = &stru_1EEE35D28;
  }
  return v5;
}

@end