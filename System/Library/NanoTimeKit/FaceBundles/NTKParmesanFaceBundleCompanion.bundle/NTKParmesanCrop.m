@interface NTKParmesanCrop
- (CGRect)cgRect;
- (NSString)description;
- (NTKParmesanCrop)init;
- (NTKParmesanCrop)initWithRect:(CGRect)a3;
@end

@implementation NTKParmesanCrop

- (NTKParmesanCrop)initWithRect:(CGRect)a3
{
  return (NTKParmesanCrop *)sub_246BCE810(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CGRect)cgRect
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanCrop_origin);
  double v3 = *(double *)(v2 + OBJC_IVAR___NTKParmesanPoint_x);
  double v4 = *(double *)(v2 + OBJC_IVAR___NTKParmesanPoint_y);
  uint64_t v5 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanCrop_size);
  double v6 = *(double *)(v5 + OBJC_IVAR___NTKParmesanSize_width);
  double v7 = *(double *)(v5 + OBJC_IVAR___NTKParmesanSize_height);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (NSString)description
{
  sub_246C2D088();
  uint64_t v2 = (void *)sub_246C2CC08();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NTKParmesanCrop)init
{
  CGRect result = (NTKParmesanCrop *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  double v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanCrop_size);
}

@end