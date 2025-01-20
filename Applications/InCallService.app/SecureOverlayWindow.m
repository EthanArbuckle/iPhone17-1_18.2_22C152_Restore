@interface SecureOverlayWindow
- (BOOL)_allowsOcclusionDetectionOverride;
- (_TtC13InCallService19SecureOverlayWindow)initWithCoder:(id)a3;
- (_TtC13InCallService19SecureOverlayWindow)initWithContentRect:(CGRect)a3;
- (_TtC13InCallService19SecureOverlayWindow)initWithFrame:(CGRect)a3;
- (_TtC13InCallService19SecureOverlayWindow)initWithWindowScene:(id)a3;
@end

@implementation SecureOverlayWindow

- (BOOL)_allowsOcclusionDetectionOverride
{
  return 1;
}

- (_TtC13InCallService19SecureOverlayWindow)initWithWindowScene:(id)a3
{
  return (_TtC13InCallService19SecureOverlayWindow *)sub_10018A608(a3);
}

- (_TtC13InCallService19SecureOverlayWindow)initWithFrame:(CGRect)a3
{
  return (_TtC13InCallService19SecureOverlayWindow *)sub_10018A680();
}

- (_TtC13InCallService19SecureOverlayWindow)initWithCoder:(id)a3
{
  return (_TtC13InCallService19SecureOverlayWindow *)sub_10018A6E4(a3);
}

- (_TtC13InCallService19SecureOverlayWindow)initWithContentRect:(CGRect)a3
{
  return (_TtC13InCallService19SecureOverlayWindow *)sub_10018A75C();
}

@end