@interface Pose
- (BOOL)isEqual:(id)a3;
- (_TtC11DockKitCore4Pose)init;
- (int64_t)hash;
@end

@implementation Pose

- (BOOL)isEqual:(id)a3
{
  return sub_24CF37204(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))sub_24CF370A4);
}

- (int64_t)hash
{
  sub_24CF3BDB0();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore4Pose_position);
  v4 = self;
  id v5 = v3;
  sub_24CF3B7B0();

  id v6 = *(id *)((char *)&v4->super.isa + OBJC_IVAR____TtC11DockKitCore4Pose_rotation);
  sub_24CF3B7B0();

  int64_t v7 = sub_24CF3BD90();
  return v7;
}

- (_TtC11DockKitCore4Pose)init
{
  uint64_t v3 = OBJC_IVAR____TtC11DockKitCore4Pose_position;
  id v4 = objc_allocWithZone((Class)type metadata accessor for Vector3());
  id v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)objc_msgSend(v4, sel_init);
  uint64_t v6 = OBJC_IVAR____TtC11DockKitCore4Pose_rotation;
  *(Class *)((char *)&v5->super.isa + v6) = (Class)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for Orientation()), sel_init);

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for Pose();
  return [(Pose *)&v8 init];
}

- (void).cxx_destruct
{
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore4Pose_rotation);
}

@end