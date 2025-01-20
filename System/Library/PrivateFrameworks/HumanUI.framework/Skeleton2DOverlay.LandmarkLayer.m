@interface Skeleton2DOverlay.LandmarkLayer
- (_TtCC7HumanUI17Skeleton2DOverlay13LandmarkLayer)init;
- (_TtCC7HumanUI17Skeleton2DOverlay13LandmarkLayer)initWithCoder:(id)a3;
- (_TtCC7HumanUI17Skeleton2DOverlay13LandmarkLayer)initWithLayer:(id)a3;
@end

@implementation Skeleton2DOverlay.LandmarkLayer

- (_TtCC7HumanUI17Skeleton2DOverlay13LandmarkLayer)init
{
  v3.receiver = self;
  v3.super_class = (Class)_s13LandmarkLayerCMa();
  return [(Skeleton2DOverlay.LandmarkLayer *)&v3 init];
}

- (_TtCC7HumanUI17Skeleton2DOverlay13LandmarkLayer)initWithCoder:(id)a3
{
  result = (_TtCC7HumanUI17Skeleton2DOverlay13LandmarkLayer *)sub_25298D678();
  __break(1u);
  return result;
}

- (_TtCC7HumanUI17Skeleton2DOverlay13LandmarkLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  sub_25298D5E8();
  swift_unknownObjectRelease();
  __swift_project_boxed_opaque_existential_0(v8, v8[3]);
  uint64_t v4 = sub_25298D6F8();
  v7.receiver = self;
  v7.super_class = (Class)_s13LandmarkLayerCMa();
  v5 = [(Skeleton2DOverlay.LandmarkLayer *)&v7 initWithLayer:v4];
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
  return v5;
}

@end