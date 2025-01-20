@interface IMWallpaperMetadataColor_Impl
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (IMWallpaperMetadataColor_Impl)init;
- (IMWallpaperMetadataColor_Impl)initWithCoder:(id)a3;
- (IMWallpaperMetadataColor_Impl)initWithDictionaryRepresentation:(id)a3;
- (IMWallpaperMetadataColor_Impl)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6;
- (NSDictionary)dictionaryRepresentation;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IMWallpaperMetadataColor_Impl

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1A09E8A50(v4);
}

- (IMWallpaperMetadataColor_Impl)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  return (IMWallpaperMetadataColor_Impl *)WallpaperMetadataColor.init(red:green:blue:alpha:)(a3, a4, a5, a6);
}

- (IMWallpaperMetadataColor_Impl)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (IMWallpaperMetadataColor_Impl *)sub_1A09E962C();

  return v4;
}

- (IMWallpaperMetadataColor_Impl)initWithDictionaryRepresentation:(id)a3
{
  uint64_t v3 = sub_1A09F3D08();
  return (IMWallpaperMetadataColor_Impl *)WallpaperMetadataColor.init(dictionaryRepresentation:)(v3);
}

- (BOOL)isEqual:(id)a3
{
  return sub_1A09E92C0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))sub_1A09E91CC);
}

- (NSDictionary)dictionaryRepresentation
{
  return (NSDictionary *)sub_1A09E9360(self, (uint64_t)a2, (void (*)(void))sub_1A09E93DC);
}

- (IMWallpaperMetadataColor_Impl)init
{
  result = (IMWallpaperMetadataColor_Impl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end