@interface __NSLocalTimeZone
+ (BOOL)supportsSecureCoding;
- (Class)classForCoder;
- (__NSLocalTimeZone)initWithCoder:(id)a3;
@end

@implementation __NSLocalTimeZone

- (Class)classForCoder
{
  return (Class)self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (__NSLocalTimeZone)initWithCoder:(id)a3
{
  char v4 = [a3 allowsKeyedCoding];

  if ((v4 & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSTimeZone cannot be decoded by non-keyed archivers" userInfo:0]);
  }
  v5 = (void *)[MEMORY[0x1E4F1CAF0] localTimeZone];

  return (__NSLocalTimeZone *)v5;
}

@end