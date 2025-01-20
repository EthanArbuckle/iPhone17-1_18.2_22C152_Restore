@interface ASOOverlayWindow
+ (BOOL)_isSystemWindow;
- (ASOOverlayWindow)initWithWindowScene:(id)a3;
- (BOOL)_canAffectStatusBarAppearance;
- (BOOL)isInternalWindow;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation ASOOverlayWindow

- (ASOOverlayWindow)initWithWindowScene:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ASOOverlayWindow;
  v3 = [(UIApplicationRotationFollowingWindow *)&v6 initWithWindowScene:a3];
  v4 = v3;
  if (v3) {
    [(ASOOverlayWindow *)v3 setLevel:*MEMORY[0x263F1D768]];
  }
  return v4;
}

+ (BOOL)_isSystemWindow
{
  return 1;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (BOOL)isInternalWindow
{
  return 1;
}

- (BOOL)_canAffectStatusBarAppearance
{
  return 0;
}

@end