@interface BSUI
@end

@implementation BSUI

void ___BSUI_Private_IsN84_block_invoke()
{
  v0 = (void *)MGCopyAnswer();
  if (v0)
  {
    id v3 = v0;
    v1 = [v0 objectForKey:@"ArtworkDeviceSubType"];
    uint64_t v2 = [v1 integerValue];

    _MergedGlobals_11 = v2 == 1792;
    v0 = v3;
  }
}

@end