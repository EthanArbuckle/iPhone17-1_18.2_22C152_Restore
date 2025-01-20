@interface ParmesanBackdropView
+ (Class)layerClass;
- (_TtC30NTKParmesanFaceBundleCompanion20ParmesanBackdropView)initWithCoder:(id)a3;
- (_TtC30NTKParmesanFaceBundleCompanion20ParmesanBackdropView)initWithFrame:(CGRect)a3;
@end

@implementation ParmesanBackdropView

+ (Class)layerClass
{
  sub_246BE4A70();

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC30NTKParmesanFaceBundleCompanion20ParmesanBackdropView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ParmesanBackdropView();
  return -[ParmseanPassthroughView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC30NTKParmesanFaceBundleCompanion20ParmesanBackdropView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ParmesanBackdropView();
  return [(ParmseanPassthroughView *)&v5 initWithCoder:a3];
}

@end