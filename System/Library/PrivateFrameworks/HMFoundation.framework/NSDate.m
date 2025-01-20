@interface NSDate
@end

@implementation NSDate

uint64_t __48__NSDate_HMFoundation__hmf_localTimeDescription__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28D48]);
  v1 = (void *)qword_1EB4EEDC0;
  qword_1EB4EEDC0 = (uint64_t)v0;

  v2 = (void *)qword_1EB4EEDC0;
  return [v2 setFormatOptions:3059];
}

@end