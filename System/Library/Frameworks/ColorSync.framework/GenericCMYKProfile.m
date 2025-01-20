@interface GenericCMYKProfile
@end

@implementation GenericCMYKProfile

void __create_GenericCMYKProfile_block_invoke()
{
  CFDataRef v0 = CFDataCreateWithBytesNoCopy(0, Generic_CMYK_Profile_data, 55280, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  create_GenericCMYKProfile_profile = (uint64_t)ColorSyncProfileCreateSigleton(v0, 0xE40A7A2FC4B9F464, 0xC62A50E24F29050FLL, @"/System/Library/ColorSync/Profiles/Generic CMYK Profile.icc", 0, 0);

  CFRelease(v0);
}

@end