@interface CKAnimationOverlayWindow
- (BOOL)canBecomeFirstResponder;
- (BOOL)canBecomeKeyWindow;
- (UIView)keyboardSnapshotView;
- (void)dismiss;
- (void)setKeyboardSnapshotView:(id)a3;
- (void)showInWindowScene:(id)a3;
@end

@implementation CKAnimationOverlayWindow

- (BOOL)canBecomeKeyWindow
{
  return 0;
}

- (BOOL)canBecomeFirstResponder
{
  return 0;
}

- (void)showInWindowScene:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F428B8];
  id v5 = a3;
  v6 = [v4 clearColor];
  [(CKAnimationOverlayWindow *)self setBackgroundColor:v6];

  [(CKAnimationOverlayWindow *)self setWindowLevel:*MEMORY[0x1E4F43C70] + 1000.0];
  [(CKAnimationOverlayWindow *)self setWindowScene:v5];

  [(CKAnimationOverlayWindow *)self setHidden:0];
  if ([MEMORY[0x1E4F42B08] usesInputSystemUI])
  {
    v7 = [MEMORY[0x1E4F42B08] snapshotViewForOptions:1];
    [(CKAnimationOverlayWindow *)self setKeyboardSnapshotView:v7];

    v8 = [(CKAnimationOverlayWindow *)self keyboardSnapshotView];

    if (v8)
    {
      [MEMORY[0x1E4F42B08] setKeyboardAlpha:0.0];
      id v9 = [(CKAnimationOverlayWindow *)self keyboardSnapshotView];
      [(CKAnimationOverlayWindow *)self insertSubview:v9 atIndex:0];
    }
  }
}

- (void)dismiss
{
  [(CKAnimationOverlayWindow *)self setHidden:1];
  if ([MEMORY[0x1E4F42B08] usesInputSystemUI])
  {
    [MEMORY[0x1E4F42B08] setKeyboardAlpha:1.0];
    v3 = [(CKAnimationOverlayWindow *)self keyboardSnapshotView];
    [v3 removeFromSuperview];

    [(CKAnimationOverlayWindow *)self setKeyboardSnapshotView:0];
  }
}

- (UIView)keyboardSnapshotView
{
  return self->_keyboardSnapshotView;
}

- (void)setKeyboardSnapshotView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end