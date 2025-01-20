@interface ITUR2100
@end

@implementation ITUR2100

void __create_ITUR2100_HLGProfile_block_invoke()
{
  CFDataRef v0 = CFDataCreateWithBytesNoCopy(0, ITU_2100_HLG_data, 7156, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  create_ITUR2100_HLGProfile_profile = (uint64_t)ColorSyncProfileCreateSigleton(v0, 0x6624B3F7F8BD990ALL, 0xB555822AAA50B525, @"/System/Library/ColorSync/Profiles/ITU-2100-HLG.icc", 3, 0);

  CFRelease(v0);
}

void __create_ITUR2100_PQProfile_block_invoke()
{
  CFDataRef v0 = CFDataCreateWithBytesNoCopy(0, ITU_2100_PQ_data, 13300, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  create_ITUR2100_PQProfile_profile = (uint64_t)ColorSyncProfileCreateSigleton(v0, 0xA650795E0C79FBEALL, 0xCCF4A4F52D8EF95FLL, @"/System/Library/ColorSync/Profiles/ITU-2100-PQ.icc", 3, 0);

  CFRelease(v0);
}

@end