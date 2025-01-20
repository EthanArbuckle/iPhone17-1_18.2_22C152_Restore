@interface ROMMRGBProfile
@end

@implementation ROMMRGBProfile

void __create_ROMMRGBProfile_block_invoke()
{
  CFDataRef v0 = CFDataCreateWithBytesNoCopy(0, ROMM_RGB_data, 568, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  create_ROMMRGBProfile_profile = (uint64_t)ColorSyncProfileCreateSigleton(v0, 0xE601651D4C83290ALL, 0x215F07F7EE846D24, @"/System/Library/ColorSync/Profiles/ROMM RGB.icc", 0, 0);

  CFRelease(v0);
}

@end