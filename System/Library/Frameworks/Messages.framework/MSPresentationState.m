@interface MSPresentationState
@end

@implementation MSPresentationState

void __48___MSPresentationState_isRunningInCameraContext__block_invoke()
{
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  id v2 = [v0 bundleIdentifier];

  if (([v2 isEqualToString:@"com.apple.InCallService"] & 1) != 0
    || ([v2 isEqualToString:*MEMORY[0x1E4F6CB98]] & 1) != 0
    || ([v2 isEqualToString:*MEMORY[0x1E4F6CBB8]] & 1) != 0
    || ([v2 isEqualToString:@"com.apple.iMessageAppsBrowserTest"] & 1) != 0)
  {
    char v1 = 1;
  }
  else
  {
    char v1 = [v2 isEqualToString:@"com.apple.CameraEffectsDemo"];
  }
  isRunningInCameraContext_isRunningInCameraContext = v1;
}

@end