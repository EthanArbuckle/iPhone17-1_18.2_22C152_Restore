@interface SFToolbar
@end

@implementation SFToolbar

uint64_t __37___SFToolbar__deviceSupportsMinibars__block_invoke()
{
  if (MGGetBoolAnswer() && MGGetBoolAnswer())
  {
    v0 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v0 _referenceBounds];
    BOOL v1 = CGRectGetWidth(v3) <= 375.0;
  }
  else
  {
    BOOL v1 = 1;
  }
  uint64_t result = _SFDeviceIsPad();
  _deviceSupportsMinibars_deviceSupportsMinibars = v1 & ~(_BYTE)result;
  return result;
}

void __117___SFToolbar_animateLinkImage_fromRect_inView_toBarItem_afterImageDisappearsBlock_afterDestinationLayerBouncesBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  if (*(void *)(a1 + 40))
  {
    CGRect v3 = *(void **)(a1 + 40);
    v4 = MEMORY[0x1E4F14428];
    dispatch_async(v4, v3);
  }
}

@end