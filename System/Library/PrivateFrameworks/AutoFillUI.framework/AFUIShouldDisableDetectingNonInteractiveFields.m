@interface AFUIShouldDisableDetectingNonInteractiveFields
@end

@implementation AFUIShouldDisableDetectingNonInteractiveFields

void ___AFUIShouldDisableDetectingNonInteractiveFields_block_invoke()
{
  v0 = [MEMORY[0x263F086E0] mainBundle];
  v1 = [v0 bundleIdentifier];
  int v2 = [v1 isEqualToString:@"com.zhiliaoapp.musically"];

  if (v2) {
    _AFUIShouldDisableDetectingNonInteractiveFields_disableDetectingNonInteractiveFields = 1;
  }
}

@end