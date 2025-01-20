@interface NSFileHandle
- (void)pathname;
@end

@implementation NSFileHandle

- (void)pathname
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  if (result)
  {
    int v1 = [result fileDescriptor];
    if (v1 < 0 || fcntl(v1, 50, v2) < 0) {
      return 0;
    }
    else {
      return (void *)[NSString stringWithUTF8String:v2];
    }
  }
  return result;
}

@end