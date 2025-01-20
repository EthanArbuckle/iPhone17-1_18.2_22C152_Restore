@interface ParmesanCroppedImageView
- (_TtC30NTKParmesanFaceBundleCompanionP33_CCA0DA31BB871EB560D99E844C31548824ParmesanCroppedImageView)initWithCoder:(id)a3;
- (_TtC30NTKParmesanFaceBundleCompanionP33_CCA0DA31BB871EB560D99E844C31548824ParmesanCroppedImageView)initWithFrame:(CGRect)a3;
@end

@implementation ParmesanCroppedImageView

- (_TtC30NTKParmesanFaceBundleCompanionP33_CCA0DA31BB871EB560D99E844C31548824ParmesanCroppedImageView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_CCA0DA31BB871EB560D99E844C31548824ParmesanCroppedImageView_image) = 0;
  v7 = (char *)self
     + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_CCA0DA31BB871EB560D99E844C31548824ParmesanCroppedImageView_crop;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  v7[32] = 1;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ParmesanCroppedImageView();
  return -[ParmesanCroppedImageView initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
}

- (_TtC30NTKParmesanFaceBundleCompanionP33_CCA0DA31BB871EB560D99E844C31548824ParmesanCroppedImageView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_CCA0DA31BB871EB560D99E844C31548824ParmesanCroppedImageView_image) = 0;
  v4 = (char *)self
     + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_CCA0DA31BB871EB560D99E844C31548824ParmesanCroppedImageView_crop;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  v4[32] = 1;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ParmesanCroppedImageView();
  return [(ParmesanCroppedImageView *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_CCA0DA31BB871EB560D99E844C31548824ParmesanCroppedImageView_image));
}

@end