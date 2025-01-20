@interface RoomScanKeyframe
- (NSUUID)identifier;
- (_TtC8RoomPlan16RoomScanKeyframe)init;
- (double)cameraPose;
- (double)timestamp;
- (id)copyWithZone:(void *)a3;
- (int64_t)count;
- (uint64_t)colors;
- (uint64_t)points;
- (uint64_t)pointsToWorld;
- (uint64_t)semanticLabels;
- (uint64_t)semanticVotes;
- (uint64_t)setCameraPose:(__n128)a3;
- (void)setColors:(_TtC8RoomPlan16RoomScanKeyframe *)self;
- (void)setCount:(int64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setPoints:(_TtC8RoomPlan16RoomScanKeyframe *)self;
- (void)setPointsToWorld:(_TtC8RoomPlan16RoomScanKeyframe *)self;
- (void)setSemanticLabels:(_TtC8RoomPlan16RoomScanKeyframe *)self;
- (void)setSemanticVotes:(_TtC8RoomPlan16RoomScanKeyframe *)self;
- (void)setTimestamp:(double)a3;
@end

@implementation RoomScanKeyframe

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  sub_23476BF60(v6);

  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  v4 = (void *)sub_2347EF080();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  return v4;
}

- (NSUUID)identifier
{
  return (NSUUID *)sub_23476CAD0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8RoomPlan16RoomScanKeyframe_identifier);
}

- (void)setIdentifier:(id)a3
{
}

- (double)cameraPose
{
  *(void *)&double result = sub_23476CD6C(a1, a2, &OBJC_IVAR____TtC8RoomPlan16RoomScanKeyframe_cameraPose).n128_u64[0];
  return result;
}

- (uint64_t)setCameraPose:(__n128)a3
{
  return sub_23476CD8C(a1, a3, a4, a5, a6, a2, &OBJC_IVAR____TtC8RoomPlan16RoomScanKeyframe_cameraPose);
}

- (int64_t)count
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8RoomPlan16RoomScanKeyframe_count);
}

- (void)setCount:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8RoomPlan16RoomScanKeyframe_count) = (Class)a3;
}

- (uint64_t)points
{
  return *(void *)(a1 + OBJC_IVAR____TtC8RoomPlan16RoomScanKeyframe_points);
}

- (void)setPoints:(_TtC8RoomPlan16RoomScanKeyframe *)self
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8RoomPlan16RoomScanKeyframe_points) = v2;
}

- (uint64_t)pointsToWorld
{
  return *(void *)(a1 + OBJC_IVAR____TtC8RoomPlan16RoomScanKeyframe_pointsToWorld);
}

- (void)setPointsToWorld:(_TtC8RoomPlan16RoomScanKeyframe *)self
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8RoomPlan16RoomScanKeyframe_pointsToWorld) = v2;
}

- (uint64_t)semanticLabels
{
  return *(void *)(a1 + OBJC_IVAR____TtC8RoomPlan16RoomScanKeyframe_semanticLabels);
}

- (void)setSemanticLabels:(_TtC8RoomPlan16RoomScanKeyframe *)self
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8RoomPlan16RoomScanKeyframe_semanticLabels) = v2;
}

- (uint64_t)semanticVotes
{
  return *(void *)(a1 + OBJC_IVAR____TtC8RoomPlan16RoomScanKeyframe_semanticVotes);
}

- (void)setSemanticVotes:(_TtC8RoomPlan16RoomScanKeyframe *)self
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8RoomPlan16RoomScanKeyframe_semanticVotes) = v2;
}

- (uint64_t)colors
{
  return *(void *)(a1 + OBJC_IVAR____TtC8RoomPlan16RoomScanKeyframe_colors);
}

- (void)setColors:(_TtC8RoomPlan16RoomScanKeyframe *)self
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8RoomPlan16RoomScanKeyframe_colors) = v2;
}

- (double)timestamp
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8RoomPlan16RoomScanKeyframe_timestamp);
}

- (void)setTimestamp:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8RoomPlan16RoomScanKeyframe_timestamp) = a3;
}

- (_TtC8RoomPlan16RoomScanKeyframe)init
{
  double result = (_TtC8RoomPlan16RoomScanKeyframe *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2346A7C30((uint64_t)self + OBJC_IVAR____TtC8RoomPlan16RoomScanKeyframe_identifier, (uint64_t *)&unk_2687AEB70);
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8RoomPlan16RoomScanKeyframe_coreKeyframe);
}

@end