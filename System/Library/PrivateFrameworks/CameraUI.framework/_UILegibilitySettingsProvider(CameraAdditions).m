@interface _UILegibilitySettingsProvider(CameraAdditions)
- (void)cam_primeForUseWithCameraOverlays;
@end

@implementation _UILegibilitySettingsProvider(CameraAdditions)

- (void)cam_primeForUseWithCameraOverlays
{
  id v2 = [MEMORY[0x263F825C8] colorWithWhite:0.7 alpha:1.0];
  [a1 clearContentColorAccumulator];
  [a1 accumulateChangesToContentColor:v2];
}

@end