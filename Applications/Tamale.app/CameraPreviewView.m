@interface CameraPreviewView
- (_TtC6Tamale17CameraPreviewView)initWithCoder:(id)a3;
- (_TtC6Tamale17CameraPreviewView)initWithFrame:(CGRect)a3;
@end

@implementation CameraPreviewView

- (_TtC6Tamale17CameraPreviewView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  swift_weakInit();
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for CameraPreviewView();
  return -[CameraPreviewView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtC6Tamale17CameraPreviewView)initWithCoder:(id)a3
{
  swift_weakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CameraPreviewView();
  return [(CameraPreviewView *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end