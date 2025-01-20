@interface AX
@end

@implementation AX

uint64_t __95__AX_AX_SBSecureMainScreenActiveInterfaceOrientationWindowOverride__processEventForVOSpeakage___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _accessibilitySetBoolValue:1 forKey:@"TripleClickSpeakWaited"];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 _tripleClickSpeakMenuProcessTouch:v3];
}

@end