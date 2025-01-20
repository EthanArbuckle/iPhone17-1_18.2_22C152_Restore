@interface NSDate(ISO8601)
- (id)ISO8601String;
@end

@implementation NSDate(ISO8601)

- (id)ISO8601String
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28D48]);
  objc_msgSend(v2, "setFormatOptions:", objc_msgSend(v2, "formatOptions") | 0x800);
  v3 = [v2 stringFromDate:a1];

  return v3;
}

@end