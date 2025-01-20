@interface NSData(Utils)
- (id)byteString;
@end

@implementation NSData(Utils)

- (id)byteString
{
  v2 = [MEMORY[0x263F089D8] string];
  id v3 = a1;
  uint64_t v4 = [v3 bytes];
  if ([v3 length])
  {
    unint64_t v5 = 0;
    do
      objc_msgSend(v2, "appendFormat:", @"%02x", *(unsigned __int8 *)(v4 + v5++));
    while (v5 < [v3 length]);
  }
  v6 = [NSString stringWithString:v2];

  return v6;
}

@end