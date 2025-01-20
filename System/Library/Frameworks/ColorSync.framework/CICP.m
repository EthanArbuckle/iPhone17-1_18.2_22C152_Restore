@interface CICP
@end

@implementation CICP

void __displayP3PQ_CICP_tag_block_invoke()
{
  v0 = ColorSyncProfileCreateWithName((CFStringRef)kColorSyncDisplayP3_PQProfile);
  displayP3PQ_CICP_tag_cicp = (uint64_t)ColorSyncProfileCopyTag(v0, @"cicp");

  CFRelease(v0);
}

void __bt709HLG_CICP_tag_block_invoke()
{
  v0 = ColorSyncProfileCreateWithName((CFStringRef)kColorSyncITUR709_HLGProfile);
  bt709HLG_CICP_tag_cicp = (uint64_t)ColorSyncProfileCopyTag(v0, @"cicp");

  CFRelease(v0);
}

void __bt709PQ_CICP_tag_block_invoke()
{
  v0 = ColorSyncProfileCreateWithName((CFStringRef)kColorSyncITUR709_PQProfile);
  bt709PQ_CICP_tag_cicp = (uint64_t)ColorSyncProfileCopyTag(v0, @"cicp");

  CFRelease(v0);
}

void __bt2100PQ_CICP_tag_block_invoke()
{
  v0 = ColorSyncProfileCreateWithName((CFStringRef)kColorSyncITUR2100_PQProfile);
  bt2100PQ_CICP_tag_cicp = (uint64_t)ColorSyncProfileCopyTag(v0, @"cicp");

  CFRelease(v0);
}

void __bt2100HLG_CICP_tag_block_invoke()
{
  v0 = ColorSyncProfileCreateWithName((CFStringRef)kColorSyncITUR2100_HLGProfile);
  bt2100HLG_CICP_tag_cicp = (uint64_t)ColorSyncProfileCopyTag(v0, @"cicp");

  CFRelease(v0);
}

void __displayP3HLG_CICP_tag_block_invoke()
{
  v0 = ColorSyncProfileCreateWithName((CFStringRef)kColorSyncDisplayP3_HLGProfile);
  displayP3HLG_CICP_tag_cicp = (uint64_t)ColorSyncProfileCopyTag(v0, @"cicp");

  CFRelease(v0);
}

@end