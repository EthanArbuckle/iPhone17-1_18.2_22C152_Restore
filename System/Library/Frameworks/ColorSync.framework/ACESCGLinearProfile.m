@interface ACESCGLinearProfile
@end

@implementation ACESCGLinearProfile

void __create_ACESCGLinearProfile_block_invoke()
{
  CFDataRef v0 = CFDataCreateWithBytesNoCopy(0, ACESCG_Linear_data, 600, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  create_ACESCGLinearProfile_profile = (uint64_t)ColorSyncProfileCreateSigleton(v0, 0x82E7BF8438EF974DLL, 0xAE5B64C6327DE136, @"/System/Library/ColorSync/Profiles/ACESCG Linear.icc", 0, 0);

  CFRelease(v0);
}

@end