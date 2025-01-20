@interface NTKFaceState
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (_TtC30NTKParmesanFaceBundleCompanion12NTKFaceState)init;
@end

@implementation NTKFaceState

- (NSString)description
{
  v2 = self;
  sub_246BB3A24();

  v3 = (void *)sub_246C2CC08();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_246C2D1F8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  BOOL v6 = sub_246BB3B34((uint64_t)v8);

  sub_246BAD92C((uint64_t)v8);
  return v6;
}

- (_TtC30NTKParmesanFaceBundleCompanion12NTKFaceState)init
{
  result = (_TtC30NTKParmesanFaceBundleCompanion12NTKFaceState *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end