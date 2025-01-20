@interface ITUR2020Profile
@end

@implementation ITUR2020Profile

void __create_ITUR2020Profile_block_invoke()
{
  CFDataRef v0 = CFDataCreateWithBytesNoCopy(0, ITU_2020_data, 556, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  create_ITUR2020Profile_profile = (uint64_t)ColorSyncProfileCreateSigleton(v0, 0xB27E1129BDCD7920, 0x69BE8BF62DA6400FLL, @"/System/Library/ColorSync/Profiles/ITU-2020.icc", 3, 2u);

  CFRelease(v0);
}

@end