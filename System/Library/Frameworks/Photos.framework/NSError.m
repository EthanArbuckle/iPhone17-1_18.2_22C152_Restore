@interface NSError
@end

@implementation NSError

void __55__NSError_PHErrors_Private__ph_genericEntitlementError__block_invoke()
{
  v4[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F28568];
  v4[0] = @"Process is not entitled to run this operation.";
  v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1];
  uint64_t v1 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PHPhotosErrorDomain" code:5101 userInfo:v0];
  v2 = (void *)ph_genericEntitlementError_s_error;
  ph_genericEntitlementError_s_error = v1;
}

@end