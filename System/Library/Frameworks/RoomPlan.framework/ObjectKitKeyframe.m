@interface ObjectKitKeyframe
- (NSUUID)identifier;
- (_TtC8RoomPlan17ObjectKitKeyframe)init;
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
- (void)setColors:(_TtC8RoomPlan17ObjectKitKeyframe *)self;
- (void)setCount:(int64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setPoints:(_TtC8RoomPlan17ObjectKitKeyframe *)self;
- (void)setPointsToWorld:(_TtC8RoomPlan17ObjectKitKeyframe *)self;
- (void)setSemanticLabels:(_TtC8RoomPlan17ObjectKitKeyframe *)self;
- (void)setSemanticVotes:(_TtC8RoomPlan17ObjectKitKeyframe *)self;
- (void)setTimestamp:(double)a3;
@end

@implementation ObjectKitKeyframe

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  [(ObjectKitKeyframe *)v3 copy];
  sub_2347EEBD0();

  swift_unknownObjectRelease();
  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  v4 = (void *)sub_2347EF080();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  return v4;
}

- (NSUUID)identifier
{
  return (NSUUID *)sub_23476CAD0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8RoomPlan17ObjectKitKeyframe_identifier);
}

- (void)setIdentifier:(id)a3
{
}

- (double)cameraPose
{
  *(void *)&double result = sub_23476CD6C(a1, a2, &OBJC_IVAR____TtC8RoomPlan17ObjectKitKeyframe_cameraPose).n128_u64[0];
  return result;
}

- (uint64_t)setCameraPose:(__n128)a3
{
  return sub_23476CD8C(a1, a3, a4, a5, a6, a2, &OBJC_IVAR____TtC8RoomPlan17ObjectKitKeyframe_cameraPose);
}

- (int64_t)count
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8RoomPlan17ObjectKitKeyframe_count);
}

- (void)setCount:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8RoomPlan17ObjectKitKeyframe_count) = (Class)a3;
}

- (uint64_t)points
{
  return *(void *)(a1 + OBJC_IVAR____TtC8RoomPlan17ObjectKitKeyframe_points);
}

- (void)setPoints:(_TtC8RoomPlan17ObjectKitKeyframe *)self
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8RoomPlan17ObjectKitKeyframe_points) = v2;
}

- (uint64_t)pointsToWorld
{
  return *(void *)(a1 + OBJC_IVAR____TtC8RoomPlan17ObjectKitKeyframe_pointsToWorld);
}

- (void)setPointsToWorld:(_TtC8RoomPlan17ObjectKitKeyframe *)self
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8RoomPlan17ObjectKitKeyframe_pointsToWorld) = v2;
}

- (uint64_t)semanticLabels
{
  return *(void *)(a1 + OBJC_IVAR____TtC8RoomPlan17ObjectKitKeyframe_semanticLabels);
}

- (void)setSemanticLabels:(_TtC8RoomPlan17ObjectKitKeyframe *)self
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8RoomPlan17ObjectKitKeyframe_semanticLabels) = v2;
}

- (uint64_t)semanticVotes
{
  return *(void *)(a1 + OBJC_IVAR____TtC8RoomPlan17ObjectKitKeyframe_semanticVotes);
}

- (void)setSemanticVotes:(_TtC8RoomPlan17ObjectKitKeyframe *)self
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8RoomPlan17ObjectKitKeyframe_semanticVotes) = v2;
}

- (uint64_t)colors
{
  return *(void *)(a1 + OBJC_IVAR____TtC8RoomPlan17ObjectKitKeyframe_colors);
}

- (void)setColors:(_TtC8RoomPlan17ObjectKitKeyframe *)self
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8RoomPlan17ObjectKitKeyframe_colors) = v2;
}

- (double)timestamp
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8RoomPlan17ObjectKitKeyframe_timestamp);
}

- (void)setTimestamp:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8RoomPlan17ObjectKitKeyframe_timestamp) = a3;
}

- (_TtC8RoomPlan17ObjectKitKeyframe)init
{
  double result = (_TtC8RoomPlan17ObjectKitKeyframe *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2346A7C30((uint64_t)self + OBJC_IVAR____TtC8RoomPlan17ObjectKitKeyframe_identifier, (uint64_t *)&unk_2687AEB70);
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8RoomPlan17ObjectKitKeyframe_coreKeyframe);
}

@end