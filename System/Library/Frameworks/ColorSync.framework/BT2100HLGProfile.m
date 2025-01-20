@interface BT2100HLGProfile
@end

@implementation BT2100HLGProfile

void __pre_cicp_BT2100HLGProfile_block_invoke()
{
  CFDataRef v0 = CFDataCreateWithBytesNoCopy(0, ITU_2100_HLG_pre_cicp_data, 7320, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  pre_cicp_BT2100HLGProfile_profile = create(v0, 0, 0);

  CFRelease(v0);
}

@end