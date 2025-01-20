@interface NSCoder(CPLCodingProxy)
- (uint64_t)cplDecodeCharForKey:()CPLCodingProxy;
@end

@implementation NSCoder(CPLCodingProxy)

- (uint64_t)cplDecodeCharForKey:()CPLCodingProxy
{
  return (char)objc_msgSend(a1, "decodeIntForKey:");
}

@end