@interface NSData(DYNSDataHexConversion)
- (uint64_t)hexStringWithLength:()DYNSDataHexConversion;
@end

@implementation NSData(DYNSDataHexConversion)

- (uint64_t)hexStringWithLength:()DYNSDataHexConversion
{
  uint64_t v5 = [a1 bytes];
  if (v5)
  {
    uint64_t v6 = v5;
    if ([a1 length] <= a3) {
      a3 = [a1 length];
    }
    v7 = (void *)[MEMORY[0x263F089D8] stringWithCapacity:a3];
    if (a3)
    {
      uint64_t v8 = 0;
      unsigned int v9 = 1;
      do
      {
        objc_msgSend(v7, "appendFormat:", @"%02x", *(unsigned __int8 *)(v6 + v8));
        uint64_t v8 = v9;
      }
      while (a3 > v9++);
    }
    return (uint64_t)v7;
  }
  else
  {
    v12 = NSString;
    return [v12 string];
  }
}

@end