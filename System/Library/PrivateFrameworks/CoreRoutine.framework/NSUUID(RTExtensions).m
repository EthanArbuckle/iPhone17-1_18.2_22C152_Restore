@interface NSUUID(RTExtensions)
+ (id)nilUUID;
@end

@implementation NSUUID(RTExtensions)

+ (id)nilUUID
{
  v2[2] = *MEMORY[0x1E4F143B8];
  v2[0] = 0;
  v2[1] = 0;
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v2];
  return v0;
}

@end