@interface NTKParmesanGalleryContentEffect
- (NTKParmesanColorPalette)palette;
- (NTKParmesanGalleryContentEffect)init;
- (NTKParmesanGalleryContentEffect)initWithStyleOption:(unint64_t)a3 palette:(id)a4;
- (unint64_t)styleOption;
@end

@implementation NTKParmesanGalleryContentEffect

- (unint64_t)styleOption
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanGalleryContentEffect_styleOption);
}

- (NTKParmesanColorPalette)palette
{
  return (NTKParmesanColorPalette *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                            + OBJC_IVAR___NTKParmesanGalleryContentEffect_palette));
}

- (NTKParmesanGalleryContentEffect)initWithStyleOption:(unint64_t)a3 palette:(id)a4
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanGalleryContentEffect_styleOption) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanGalleryContentEffect_palette) = (Class)a4;
  id v6 = a4;
  v7 = self;
  uint64_t v8 = sub_246BF0274(a3, v6);
  v9 = (uint64_t *)((char *)v7 + OBJC_IVAR___NTKParmesanGalleryContentEffect_style);
  uint64_t *v9 = v8;
  v9[1] = v10;
  v9[2] = v11;
  v9[3] = v12;

  v15.receiver = v7;
  v15.super_class = (Class)type metadata accessor for ParmesanGalleryContentEffect();
  v13 = [(NTKParmesanGalleryContentEffect *)&v15 init];

  return v13;
}

- (NTKParmesanGalleryContentEffect)init
{
  result = (NTKParmesanGalleryContentEffect *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end