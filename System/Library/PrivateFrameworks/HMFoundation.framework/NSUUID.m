@interface NSUUID
@end

@implementation NSUUID

void __36__NSUUID_HMFoundation__hmf_zeroUUID__block_invoke()
{
  v2[2] = *MEMORY[0x1E4F143B8];
  v2[0] = 0;
  v2[1] = 0;
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v2];
  v1 = (void *)_MergedGlobals_69;
  _MergedGlobals_69 = v0;
}

@end