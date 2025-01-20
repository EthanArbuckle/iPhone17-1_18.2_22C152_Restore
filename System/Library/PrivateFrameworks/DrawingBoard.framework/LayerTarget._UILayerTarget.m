@interface LayerTarget._UILayerTarget
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesLayer:(id)a3;
- (_TtCO12DrawingBoard11LayerTargetP33_503B1B848CE68D8EEDC1C0DE3CC3DEEF14_UILayerTarget)init;
@end

@implementation LayerTarget._UILayerTarget

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_24CFD35B8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = sub_24CFBD5E8((uint64_t)v8);

  sub_24CF8DE78((uint64_t)v8);
  return v6 & 1;
}

- (BOOL)matchesLayer:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_24CFBD740(v4);

  return self & 1;
}

- (_TtCO12DrawingBoard11LayerTargetP33_503B1B848CE68D8EEDC1C0DE3CC3DEEF14_UILayerTarget)init
{
  result = (_TtCO12DrawingBoard11LayerTargetP33_503B1B848CE68D8EEDC1C0DE3CC3DEEF14_UILayerTarget *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end