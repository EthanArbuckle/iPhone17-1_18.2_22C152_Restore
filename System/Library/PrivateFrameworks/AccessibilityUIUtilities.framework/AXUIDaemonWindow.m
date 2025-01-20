@interface AXUIDaemonWindow
+ (BOOL)_isSecure;
- (AXUIDaemonWindow)init;
- (BOOL)_accessibilityWindowUsesOwnOrientationForComparingGeometry;
- (UIEdgeInsets)_normalizedSafeAreaInsets;
- (void)_didUpdateOrientation:(id)a3;
@end

@implementation AXUIDaemonWindow

+ (BOOL)_isSecure
{
  return 1;
}

- (AXUIDaemonWindow)init
{
  v6.receiver = self;
  v6.super_class = (Class)AXUIDaemonWindow;
  v2 = [(AXUIDaemonWindow *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4FB1618] clearColor];
    [(AXUIDaemonWindow *)v2 setBackgroundColor:v3];

    [(AXUIDaemonWindow *)v2 setClipsToBounds:1];
    [(AXUIDaemonWindow *)v2 _didUpdateOrientation:0];
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v2 selector:sel__didUpdateOrientation_ name:@"AXUIDaemonOrientationDidUpdateNotification" object:0];
  }
  return v2;
}

- (void)_didUpdateOrientation:(id)a3
{
  v4 = [a3 userInfo];
  v5 = [v4 objectForKeyedSubscript:@"Duration"];
  [v5 doubleValue];
  [(AXUIDaemonWindow *)self _updateInterfaceOrientationFromDeviceOrientation:v6 > 0.0];

  AXPerformSafeBlock();
}

uint64_t __42__AXUIDaemonWindow__didUpdateOrientation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sceneSettingsSafeAreaInsetsDidChange];
}

- (UIEdgeInsets)_normalizedSafeAreaInsets
{
  uint64_t v2 = [(AXUIDaemonWindow *)self interfaceOrientation];
  double v3 = AXUINormalizedSafeAreaInsetsForOrientation(v2);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (BOOL)_accessibilityWindowUsesOwnOrientationForComparingGeometry
{
  return 1;
}

@end