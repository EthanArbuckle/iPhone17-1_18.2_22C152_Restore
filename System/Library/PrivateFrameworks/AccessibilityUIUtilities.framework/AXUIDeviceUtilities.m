@interface AXUIDeviceUtilities
+ (void)setOrientation:(int64_t)a3;
@end

@implementation AXUIDeviceUtilities

+ (void)setOrientation:(int64_t)a3
{
}

void __38__AXUIDeviceUtilities_setOrientation___block_invoke(uint64_t a1)
{
  v2 = (const void *)GSEventCreateWithEventRecord();
  [(id)*MEMORY[0x1E4FB2608] _handleDeviceOrientationChangedEvent:v2];
  v3 = [MEMORY[0x1E4F49428] server];
  [v3 setDeviceOrientation:*(void *)(a1 + 32)];

  if (v2) {
    CFRelease(v2);
  }
}

@end