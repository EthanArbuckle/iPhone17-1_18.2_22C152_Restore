@interface GenericXYZProfile
@end

@implementation GenericXYZProfile

void __create_GenericXYZProfile_block_invoke()
{
  CFDataRef v0 = CFDataCreateWithBytesNoCopy(0, Generic_XYZ_Profile_data, 1936, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  create_GenericXYZProfile_profile = (uint64_t)ColorSyncProfileCreateSigleton(v0, 0x28FBD70ABCB659F1, 0x507F9D11AEA86D0DLL, @"/System/Library/ColorSync/Profiles/Generic XYZ Profile.icc", 0, 0);

  CFRelease(v0);
}

@end