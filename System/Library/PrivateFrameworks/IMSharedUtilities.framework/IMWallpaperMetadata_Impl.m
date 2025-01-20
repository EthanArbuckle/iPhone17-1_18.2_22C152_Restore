@interface IMWallpaperMetadata_Impl
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isVertical;
- (IMWallpaperMetadataColor_Impl)backgroundColor;
- (IMWallpaperMetadataColor_Impl)fontColor;
- (IMWallpaperMetadata_Impl)init;
- (IMWallpaperMetadata_Impl)initWithCoder:(id)a3;
- (IMWallpaperMetadata_Impl)initWithDictionaryRepresentation:(id)a3;
- (IMWallpaperMetadata_Impl)initWithFontName:(id)a3 fontSize:(double)a4 fontWeight:(double)a5 fontColor:(id)a6 isVertical:(BOOL)a7 type:(id)a8 backgroundColor:(id)a9;
- (NSDictionary)dictionaryRepresentation;
- (NSString)fontName;
- (NSString)type;
- (double)fontSize;
- (double)fontWeight;
- (void)encodeWithCoder:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setFontColor:(id)a3;
@end

@implementation IMWallpaperMetadata_Impl

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)fontName
{
  return (NSString *)sub_1A088C3D4();
}

- (double)fontSize
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___IMWallpaperMetadata_Impl_fontSize);
}

- (double)fontWeight
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___IMWallpaperMetadata_Impl_fontWeight);
}

- (IMWallpaperMetadataColor_Impl)fontColor
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___IMWallpaperMetadata_Impl_fontColor);
  swift_beginAccess();
  return (IMWallpaperMetadataColor_Impl *)*v2;
}

- (void)setFontColor:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___IMWallpaperMetadata_Impl_fontColor);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (BOOL)isVertical
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___IMWallpaperMetadata_Impl_isVertical);
}

- (NSString)type
{
  return (NSString *)sub_1A088C3D4();
}

- (IMWallpaperMetadataColor_Impl)backgroundColor
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___IMWallpaperMetadata_Impl_backgroundColor);
  swift_beginAccess();
  return (IMWallpaperMetadataColor_Impl *)*v2;
}

- (void)setBackgroundColor:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___IMWallpaperMetadata_Impl_backgroundColor);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1A09E6D40(v4);
}

- (IMWallpaperMetadata_Impl)initWithFontName:(id)a3 fontSize:(double)a4 fontWeight:(double)a5 fontColor:(id)a6 isVertical:(BOOL)a7 type:(id)a8 backgroundColor:(id)a9
{
  uint64_t v13 = sub_1A09F3E18();
  uint64_t v15 = v14;
  sub_1A078231C(0, (unint64_t *)&qword_1EB4A59B8);
  uint64_t v16 = sub_1A09F3D08();
  uint64_t v17 = sub_1A09F3E18();
  uint64_t v19 = v18;
  if (a9) {
    uint64_t v20 = sub_1A09F3D08();
  }
  else {
    uint64_t v20 = 0;
  }
  return (IMWallpaperMetadata_Impl *)WallpaperMetadata.init(fontName:fontSize:fontWeight:fontColor:isVertical:type:backgroundColor:)(v13, v15, v16, a7, v17, v19, v20, a4, a5);
}

- (IMWallpaperMetadata_Impl)initWithCoder:(id)a3
{
  return (IMWallpaperMetadata_Impl *)WallpaperMetadata.init(coder:)(a3);
}

- (IMWallpaperMetadata_Impl)initWithDictionaryRepresentation:(id)a3
{
  uint64_t v3 = sub_1A09F3D08();
  return (IMWallpaperMetadata_Impl *)WallpaperMetadata.init(dictionaryRepresentation:)(v3);
}

- (BOOL)isEqual:(id)a3
{
  return sub_1A09E92C0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))sub_1A09E81E0);
}

- (NSDictionary)dictionaryRepresentation
{
  return (NSDictionary *)sub_1A09E9360(self, (uint64_t)a2, (void (*)(void))sub_1A09E845C);
}

- (IMWallpaperMetadata_Impl)init
{
  result = (IMWallpaperMetadata_Impl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMWallpaperMetadata_Impl_backgroundColor);
}

@end