@interface GenericLabProfile
@end

@implementation GenericLabProfile

void __create_GenericLabProfile_block_invoke()
{
  CFDataRef v0 = CFDataCreateWithBytesNoCopy(0, Generic_Lab_Profile_data, 3588, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  create_GenericLabProfile_profile = (uint64_t)ColorSyncProfileCreateSigleton(v0, 0xC592F61D4A3BC000, 0x263ECD799E43830ELL, @"/System/Library/ColorSync/Profiles/Generic Lab Profile.icc", 0, 0);

  CFRelease(v0);
}

@end