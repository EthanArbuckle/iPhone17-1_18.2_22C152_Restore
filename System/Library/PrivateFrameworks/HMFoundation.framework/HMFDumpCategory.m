@interface HMFDumpCategory
+ (id)logCategory;
@end

@implementation HMFDumpCategory

+ (id)logCategory
{
  if (_MergedGlobals_59 != -1) {
    dispatch_once(&_MergedGlobals_59, &__block_literal_global_8);
  }
  v2 = (void *)qword_1EB4EECF0;
  return v2;
}

uint64_t __30__HMFDumpCategory_logCategory__block_invoke()
{
  qword_1EB4EECF0 = HMFCreateOSLogHandle(@"DumpState", @"com.apple.HMFoundation");
  return MEMORY[0x1F41817F8]();
}

@end