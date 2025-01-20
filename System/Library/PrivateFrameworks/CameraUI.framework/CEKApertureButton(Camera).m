@interface CEKApertureButton(Camera)
- (uint64_t)imageForAccessibilityHUD;
@end

@implementation CEKApertureButton(Camera)

- (uint64_t)imageForAccessibilityHUD
{
  return [MEMORY[0x263F827E8] systemImageNamed:@"f.cursive"];
}

@end