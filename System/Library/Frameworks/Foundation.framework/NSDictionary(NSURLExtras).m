@interface NSDictionary(NSURLExtras)
- (uint64_t)_web_numberForKey:()NSURLExtras;
- (uint64_t)_web_objectForMIMEType:()NSURLExtras;
- (uint64_t)_web_stringForKey:()NSURLExtras;
- (void)_web_intForKey:()NSURLExtras;
@end

@implementation NSDictionary(NSURLExtras)

- (void)_web_intForKey:()NSURLExtras
{
  result = objc_msgSend(a1, "_web_numberForKey:");
  if (result)
  {
    return (void *)[result intValue];
  }
  return result;
}

- (uint64_t)_web_stringForKey:()NSURLExtras
{
  uint64_t v1 = objc_msgSend(a1, "objectForKey:");
  if (_NSIsNSString()) {
    return v1;
  }
  else {
    return 0;
  }
}

- (uint64_t)_web_numberForKey:()NSURLExtras
{
  uint64_t v1 = objc_msgSend(a1, "objectForKey:");
  if (_NSIsNSNumber()) {
    return v1;
  }
  else {
    return 0;
  }
}

- (uint64_t)_web_objectForMIMEType:()NSURLExtras
{
  uint64_t result = objc_msgSend(a1, "objectForKey:");
  if (!result)
  {
    uint64_t v6 = [a3 rangeOfString:@"/"];
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      return 0;
    }
    else
    {
      uint64_t v7 = [a3 substringToIndex:v6 + 1];
      return [a1 objectForKey:v7];
    }
  }
  return result;
}

@end