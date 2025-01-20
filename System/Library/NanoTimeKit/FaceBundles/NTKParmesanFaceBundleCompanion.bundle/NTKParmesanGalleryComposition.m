@interface NTKParmesanGalleryComposition
- (BOOL)isEqual:(id)a3;
- (NSString)swatchKey;
- (NTKParmesanGalleryComposition)init;
- (NTKParmesanTimeLayout)timeLayout;
- (int64_t)hash;
- (void)setTimeLayout:(id)a3;
@end

@implementation NTKParmesanGalleryComposition

- (NTKParmesanTimeLayout)timeLayout
{
  return (NTKParmesanTimeLayout *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                          + OBJC_IVAR___NTKParmesanGalleryComposition_timeLayout));
}

- (void)setTimeLayout:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanGalleryComposition_timeLayout);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanGalleryComposition_timeLayout) = (Class)a3;
  id v3 = a3;
}

- (NSString)swatchKey
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanGalleryComposition_timeLayout);
  id v3 = self;
  id v4 = v2;
  sub_246BB1B50();

  swift_bridgeObjectRetain();
  sub_246C2CCD8();
  sub_246C2CCD8();

  swift_bridgeObjectRelease();
  v5 = (void *)sub_246C2CC08();
  swift_bridgeObjectRelease();

  return (NSString *)v5;
}

- (int64_t)hash
{
  sub_246C2D6C8();
  id v3 = self;
  swift_bridgeObjectRetain();
  sub_246C2CCC8();
  swift_bridgeObjectRelease();
  id v4 = *(id *)((char *)&v3->super.isa + OBJC_IVAR___NTKParmesanGalleryComposition_timeLayout);
  sub_246C2D118();

  int64_t v5 = sub_246C2D6A8();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_246C2D1F8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    int64_t v5 = self;
  }
  BOOL v6 = sub_246BCDCEC((uint64_t)v8);

  sub_246BAD92C((uint64_t)v8);
  return v6;
}

- (NTKParmesanGalleryComposition)init
{
  result = (NTKParmesanGalleryComposition *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanGalleryComposition__cachedLayoutAlphaImage);
}

@end