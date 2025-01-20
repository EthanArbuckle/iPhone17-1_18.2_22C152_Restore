@interface ITUR2020
@end

@implementation ITUR2020

void __verify_ITUR2020_sRGBGamma_data_block_invoke()
{
  v0 = ColorSyncProfileCreateWithName((CFStringRef)kColorSyncITUR2020_sRGBGammaProfile);
  verify_ITUR2020_sRGBGamma_data_itu2020_sRGBGamma_profile_data = (uint64_t)ColorSyncProfileCopyData(v0, 0);
  verify_ITUR2020_sRGBGamma_data_itu2020_sRGBGamma_profile_data_length = CFDataGetLength((CFDataRef)verify_ITUR2020_sRGBGamma_data_itu2020_sRGBGamma_profile_data);
  if (v0)
  {
    CFRelease(v0);
  }
}

void __create_ITUR2020_PQProfile_block_invoke()
{
  CFDataRef v0 = CFDataCreateWithBytesNoCopy(0, ITU_2020_PQ_data, 13476, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  create_ITUR2020_PQProfile_profile = (uint64_t)ColorSyncProfileCreateSigleton(v0, 0xD87ACDFAFC0D2215, 0xCDE9D50165028BF4, @"/System/Library/ColorSync/Profiles/ITU-2020-PQ.icc", 3, 0);

  CFRelease(v0);
}

void __create_ITUR2020_HLGProfile_block_invoke()
{
  CFDataRef v0 = CFDataCreateWithBytesNoCopy(0, ITU_2020_HLG_data, 7332, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  create_ITUR2020_HLGProfile_profile = (uint64_t)ColorSyncProfileCreateSigleton(v0, 0xEB6713A849320FACLL, 0x763F8C82605C0EC8, @"/System/Library/ColorSync/Profiles/ITU-2020-HLG.icc", 3, 0);

  CFRelease(v0);
}

@end