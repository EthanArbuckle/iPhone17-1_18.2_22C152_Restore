@interface BT709
@end

@implementation BT709

void __BT709_luminance_coefficients_block_invoke()
{
  BT709_luminance_coefficients_coeffs_0 = 1046066128;
  BT709_luminance_coefficients_coeffs_1 = 1060575065;
  BT709_luminance_coefficients_coeffs_2 = 1033100696;
}

void __pre_cicp_BT709_PQProfile_block_invoke()
{
  CFDataRef v0 = CFDataCreateWithBytesNoCopy(0, ITU_709_PQ_pre_cicp_data, 13496, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  pre_cicp_BT709_PQProfile_profile = create(v0, 0, 0);

  CFRelease(v0);
}

@end