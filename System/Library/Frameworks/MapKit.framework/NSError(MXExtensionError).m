@interface NSError(MXExtensionError)
+ (uint64_t)_errorWithExtensionServiceError:()MXExtensionError;
@end

@implementation NSError(MXExtensionError)

+ (uint64_t)_errorWithExtensionServiceError:()MXExtensionError
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:@"_MXExtensionServiceErrorDomain" code:a3 userInfo:0];
}

@end