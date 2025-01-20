@interface ITUR709Profile
@end

@implementation ITUR709Profile

void __create_ITUR709Profile_block_invoke()
{
  CFDataRef v0 = CFDataCreateWithBytesNoCopy(0, ITU_709_data, 556, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  create_ITUR709Profile_profile = (uint64_t)ColorSyncProfileCreateSigleton(v0, 0xF56313F2AE17BBB7, 0x7DF422AAEFF67E97, @"/System/Library/ColorSync/Profiles/ITU-709.icc", 1, 1u);

  CFRelease(v0);
}

@end