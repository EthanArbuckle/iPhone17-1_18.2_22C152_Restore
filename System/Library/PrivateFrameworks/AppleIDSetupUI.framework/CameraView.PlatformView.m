@interface CameraView.PlatformView
+ (Class)layerClass;
- (_TtCV14AppleIDSetupUI10CameraViewP33_B0D7FA8B1BB82268A88AE70EE84F2F5712PlatformView)initWithCoder:(id)a3;
- (_TtCV14AppleIDSetupUI10CameraViewP33_B0D7FA8B1BB82268A88AE70EE84F2F5712PlatformView)initWithFrame:(CGRect)a3;
@end

@implementation CameraView.PlatformView

+ (Class)layerClass
{
  sub_2482CFAD4(0, &qword_2693135C0);
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtCV14AppleIDSetupUI10CameraViewP33_B0D7FA8B1BB82268A88AE70EE84F2F5712PlatformView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCV14AppleIDSetupUI10CameraViewP33_B0D7FA8B1BB82268A88AE70EE84F2F5712PlatformView____lazy_storage___videoPreviewLayer) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CameraView.PlatformView();
  return -[CameraView.PlatformView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtCV14AppleIDSetupUI10CameraViewP33_B0D7FA8B1BB82268A88AE70EE84F2F5712PlatformView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCV14AppleIDSetupUI10CameraViewP33_B0D7FA8B1BB82268A88AE70EE84F2F5712PlatformView____lazy_storage___videoPreviewLayer) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CameraView.PlatformView();
  return [(CameraView.PlatformView *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCV14AppleIDSetupUI10CameraViewP33_B0D7FA8B1BB82268A88AE70EE84F2F5712PlatformView____lazy_storage___videoPreviewLayer));
}

@end