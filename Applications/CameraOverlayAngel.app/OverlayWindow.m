@interface OverlayWindow
+ (BOOL)_isSecure;
- (_TtC18CameraOverlayAngelP33_26879C1C0E4FD34210CC0E55F689DAC713OverlayWindow)initWithCoder:(id)a3;
- (_TtC18CameraOverlayAngelP33_26879C1C0E4FD34210CC0E55F689DAC713OverlayWindow)initWithContentRect:(CGRect)a3;
- (_TtC18CameraOverlayAngelP33_26879C1C0E4FD34210CC0E55F689DAC713OverlayWindow)initWithFrame:(CGRect)a3;
- (_TtC18CameraOverlayAngelP33_26879C1C0E4FD34210CC0E55F689DAC713OverlayWindow)initWithWindowScene:(id)a3;
@end

@implementation OverlayWindow

+ (BOOL)_isSecure
{
  return 1;
}

- (_TtC18CameraOverlayAngelP33_26879C1C0E4FD34210CC0E55F689DAC713OverlayWindow)initWithWindowScene:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for OverlayWindow();
  return [(OverlayWindow *)&v5 initWithWindowScene:a3];
}

- (_TtC18CameraOverlayAngelP33_26879C1C0E4FD34210CC0E55F689DAC713OverlayWindow)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for OverlayWindow();
  return -[OverlayWindow initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC18CameraOverlayAngelP33_26879C1C0E4FD34210CC0E55F689DAC713OverlayWindow)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for OverlayWindow();
  return [(OverlayWindow *)&v5 initWithCoder:a3];
}

- (_TtC18CameraOverlayAngelP33_26879C1C0E4FD34210CC0E55F689DAC713OverlayWindow)initWithContentRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for OverlayWindow();
  return -[OverlayWindow initWithContentRect:](&v8, "initWithContentRect:", x, y, width, height);
}

@end