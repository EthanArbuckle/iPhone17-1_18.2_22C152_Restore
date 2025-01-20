@interface DisplayP3Profile
@end

@implementation DisplayP3Profile

void __create_DisplayP3Profile_block_invoke()
{
  CFDataRef v0 = CFDataCreateWithBytesNoCopy(0, Display_P3_data, 536, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  create_DisplayP3Profile_profile = (uint64_t)ColorSyncProfileCreateSigleton(v0, 0xC34785388EA3FDECLL, 0x2F18DA7A4FBDB46DLL, @"/System/Library/ColorSync/Profiles/Display P3.icc", 2, 4u);

  CFRelease(v0);
}

@end