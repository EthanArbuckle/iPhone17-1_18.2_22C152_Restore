@interface NSString(EmailCoreAdditions)
- (id)ec_messageIDSubstring;
@end

@implementation NSString(EmailCoreAdditions)

- (id)ec_messageIDSubstring
{
  id v1 = a1;
  uint64_t v2 = [v1 rangeOfString:@">"];
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v3 = objc_msgSend(v1, "rangeOfString:options:range:", @"<", 4, 0, v2);
    if (v3 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v4 = objc_msgSend(v1, "substringWithRange:", v3 + 1, v2 - (v3 + 1));

      id v1 = (id)v4;
    }
  }
  return v1;
}

@end