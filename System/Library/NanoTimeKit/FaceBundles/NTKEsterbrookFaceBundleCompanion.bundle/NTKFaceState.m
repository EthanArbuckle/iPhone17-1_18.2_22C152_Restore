@interface NTKFaceState
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (_TtC32NTKEsterbrookFaceBundleCompanion12NTKFaceState)init;
@end

@implementation NTKFaceState

- (NSString)description
{
  v2 = self;
  sub_246AD84AC();

  v3 = (void *)sub_246AD8B80();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_246AD8DC0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  BOOL v6 = sub_246AD85BC((uint64_t)v8);

  sub_246AD5CFC((uint64_t)v8);
  return v6;
}

- (_TtC32NTKEsterbrookFaceBundleCompanion12NTKFaceState)init
{
  result = (_TtC32NTKEsterbrookFaceBundleCompanion12NTKFaceState *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end