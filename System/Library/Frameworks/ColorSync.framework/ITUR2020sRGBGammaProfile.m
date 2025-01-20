@interface ITUR2020sRGBGammaProfile
@end

@implementation ITUR2020sRGBGammaProfile

void __create_ITUR2020sRGBGammaProfile_block_invoke()
{
  CFDataRef v0 = CFDataCreateWithBytesNoCopy(0, ITU_2020_sRGB_Gamma_data, 580, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  create_ITUR2020sRGBGammaProfile_profile = (uint64_t)ColorSyncProfileCreateSigleton(v0, 0xDFBD2546F36E1D77, 0x73271EC979C26938, @"/System/Library/ColorSync/Profiles/ITU-2020-sRGB-gamma.icc", 3, 5u);

  CFRelease(v0);
}

@end