@interface NSError(MTLCaptureError)
+ (id)errorWithMTLCaptureErrorCode:()MTLCaptureError;
@end

@implementation NSError(MTLCaptureError)

+ (id)errorWithMTLCaptureErrorCode:()MTLCaptureError
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x18530C9F0]();
  if ((unint64_t)(a3 - 1) > 2) {
    v5 = 0;
  }
  else {
    v5 = off_1E5220B38[a3 - 1];
  }
  uint64_t v9 = *MEMORY[0x1E4F28568];
  v10[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"MTLCaptureError" code:a3 userInfo:v6];
  return v7;
}

@end