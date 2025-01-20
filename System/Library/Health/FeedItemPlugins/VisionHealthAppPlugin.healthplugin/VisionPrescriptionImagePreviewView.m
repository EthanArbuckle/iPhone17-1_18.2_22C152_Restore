@interface VisionPrescriptionImagePreviewView
- (UIImage)image;
- (_TtC21VisionHealthAppPlugin34VisionPrescriptionImagePreviewView)init;
- (_TtC21VisionHealthAppPlugin34VisionPrescriptionImagePreviewView)initWithCoder:(id)a3;
- (_TtC21VisionHealthAppPlugin34VisionPrescriptionImagePreviewView)initWithFrame:(CGRect)a3;
- (_TtC21VisionHealthAppPlugin34VisionPrescriptionImagePreviewView)initWithImage:(id)a3;
- (_TtC21VisionHealthAppPlugin34VisionPrescriptionImagePreviewView)initWithImage:(id)a3 highlightedImage:(id)a4;
- (void)setImage:(id)a3;
@end

@implementation VisionPrescriptionImagePreviewView

- (UIImage)image
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for VisionPrescriptionImagePreviewView();
  v2 = [(VisionPrescriptionImagePreviewView *)&v4 image];

  return v2;
}

- (void)setImage:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for VisionPrescriptionImagePreviewView();
  id v4 = a3;
  id v5 = v6.receiver;
  [(VisionPrescriptionImagePreviewView *)&v6 setImage:v4];
  sub_241D410AC();
}

- (_TtC21VisionHealthAppPlugin34VisionPrescriptionImagePreviewView)init
{
  return -[VisionPrescriptionImagePreviewView initWithFrame:](self, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
}

- (_TtC21VisionHealthAppPlugin34VisionPrescriptionImagePreviewView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC21VisionHealthAppPlugin34VisionPrescriptionImagePreviewView_imageHeightAnchorConstraint) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC21VisionHealthAppPlugin34VisionPrescriptionImagePreviewView_item) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for VisionPrescriptionImagePreviewView();
  v7 = -[VisionPrescriptionImagePreviewView initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
  [(VisionPrescriptionImagePreviewView *)v7 setContentMode:1];
  return v7;
}

- (_TtC21VisionHealthAppPlugin34VisionPrescriptionImagePreviewView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC21VisionHealthAppPlugin34VisionPrescriptionImagePreviewView_imageHeightAnchorConstraint) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC21VisionHealthAppPlugin34VisionPrescriptionImagePreviewView_item) = 0;
  id v4 = a3;

  result = (_TtC21VisionHealthAppPlugin34VisionPrescriptionImagePreviewView *)sub_241DAB080();
  __break(1u);
  return result;
}

- (_TtC21VisionHealthAppPlugin34VisionPrescriptionImagePreviewView)initWithImage:(id)a3
{
  id v3 = a3;
  result = (_TtC21VisionHealthAppPlugin34VisionPrescriptionImagePreviewView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC21VisionHealthAppPlugin34VisionPrescriptionImagePreviewView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  result = (_TtC21VisionHealthAppPlugin34VisionPrescriptionImagePreviewView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC21VisionHealthAppPlugin34VisionPrescriptionImagePreviewView_imageHeightAnchorConstraint));

  swift_release();
}

@end