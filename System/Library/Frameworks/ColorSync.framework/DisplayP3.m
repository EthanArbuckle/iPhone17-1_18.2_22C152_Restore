@interface DisplayP3
@end

@implementation DisplayP3

void __DisplayP3_luminance_coefficients_block_invoke()
{
  DisplayP3_luminance_coefficients_coeffs_0 = 1047166714;
  DisplayP3_luminance_coefficients_coeffs_1 = 1060180800;
  DisplayP3_luminance_coefficients_coeffs_2 = 1034053642;
}

void __create_DisplayP3_709OETFProfile_block_invoke()
{
  CFDataRef v0 = CFDataCreateWithBytesNoCopy(0, Display_P3_ITU_709OETF_data, 568, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  create_DisplayP3_709OETFProfile_profile = (uint64_t)ColorSyncProfileCreateSigleton(v0, 0xB3E433111801BD50, 0xD1400D5DFBE11BEBLL, @"/System/Library/ColorSync/Profiles/Display P3-ITU-709OETF.icc", 2, 0);

  CFRelease(v0);
}

void __create_DisplayP3_PQProfile_block_invoke()
{
  CFDataRef v0 = CFDataCreateWithBytesNoCopy(0, Display_P3_PQ_data, 13312, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  create_DisplayP3_PQProfile_profile = (uint64_t)ColorSyncProfileCreateSigleton(v0, 0x8C5987200AC97799, 0x58B6D11F9BE59A4BLL, @"/System/Library/ColorSync/Profiles/Display P3-PQ.icc", 2, 0);

  CFRelease(v0);
}

void __create_DisplayP3_HLGProfile_block_invoke()
{
  CFDataRef v0 = CFDataCreateWithBytesNoCopy(0, Display_P3_HLG_data, 7168, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  create_DisplayP3_HLGProfile_profile = (uint64_t)ColorSyncProfileCreateSigleton(v0, 0x6EF884CEA7181386, 0xDC7450C64BBE6A23, @"/System/Library/ColorSync/Profiles/Display P3-HLG.icc", 2, 0);

  CFRelease(v0);
}

void __create_DisplayP3_legacy_Profile_block_invoke()
{
  CFDataRef v0 = CFDataCreateWithBytesNoCopy(0, Display_P3_legacy_data, 548, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  create_DisplayP3_legacy_Profile_profile = (uint64_t)ColorSyncProfileCreateSigleton(v0, 0xCD46BD67980EBBE5, 0x98751BBD6E44BE4BLL, @"/System/Library/ColorSync/Profiles/Display P3.icc", 2, 0);

  CFRelease(v0);
}

@end