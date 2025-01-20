@interface NTKParmesanGalleryPlaceholderConfiguration
- (NSString)uniqueSnapshotIdentifier;
- (NTKParmesanGalleryPlaceholderConfiguration)init;
- (void)applyToFace:(id)a3 forDevice:(id)a4;
@end

@implementation NTKParmesanGalleryPlaceholderConfiguration

- (void)applyToFace:(id)a3 forDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_246BF0454(v6, (uint64_t)v7);
}

- (NSString)uniqueSnapshotIdentifier
{
  v2 = self;
  sub_246BF0884();

  v3 = (void *)sub_246C2CC08();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (NTKParmesanGalleryPlaceholderConfiguration)init
{
  result = (NTKParmesanGalleryPlaceholderConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end