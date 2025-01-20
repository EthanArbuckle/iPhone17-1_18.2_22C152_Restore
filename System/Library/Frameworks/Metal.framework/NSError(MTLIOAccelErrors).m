@interface NSError(MTLIOAccelErrors)
- (uint64_t)initWithIOAccelError:()MTLIOAccelErrors;
@end

@implementation NSError(MTLIOAccelErrors)

- (uint64_t)initWithIOAccelError:()MTLIOAccelErrors
{
  if (a3 > 0x12)
  {
    v4 = "Internal Error";
    uint64_t v6 = 1;
    v5 = "Internal Error";
  }
  else
  {
    v4 = off_1E52217F8[a3];
    v5 = off_1E5221890[a3];
    uint64_t v6 = qword_1828F20C0[a3];
  }
  uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s (%08x:%s)", v5, a3, v4);
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v7 forKey:*MEMORY[0x1E4F28568]];

  return [a1 initWithDomain:@"MTLCommandBufferErrorDomain" code:v6 userInfo:v8];
}

@end