@interface TrajectoryPoint
- (NSString)description;
- (_TtC11DockKitCore15TrajectoryPoint)init;
- (_TtC11DockKitCore15TrajectoryPoint)initWithTime:(double)a3 positions:(id)a4 velocities:(id)a5;
- (id)copyWithZone:(void *)a3;
@end

@implementation TrajectoryPoint

- (_TtC11DockKitCore15TrajectoryPoint)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15TrajectoryPoint_time) = 0;
  v2 = (objc_class *)MEMORY[0x263F8EE78];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15TrajectoryPoint_positions) = (Class)MEMORY[0x263F8EE78];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15TrajectoryPoint_velocities) = v2;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TrajectoryPoint();
  return [(TrajectoryPoint *)&v4 init];
}

- (_TtC11DockKitCore15TrajectoryPoint)initWithTime:(double)a3 positions:(id)a4 velocities:(id)a5
{
  v7 = (objc_class *)sub_24CF3B470();
  v8 = (objc_class *)sub_24CF3B470();
  uint64_t v9 = OBJC_IVAR____TtC11DockKitCore15TrajectoryPoint_positions;
  uint64_t v10 = OBJC_IVAR____TtC11DockKitCore15TrajectoryPoint_velocities;
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15TrajectoryPoint_time) = a3;
  *(Class *)((char *)&self->super.isa + v9) = v7;
  *(Class *)((char *)&self->super.isa + v10) = v8;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for TrajectoryPoint();
  return [(TrajectoryPoint *)&v12 init];
}

- (id)copyWithZone:(void *)a3
{
  return (id)sub_24CE32420(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void *__return_ptr))sub_24CE32364);
}

- (NSString)description
{
  return (NSString *)sub_24CE324A0(self, (uint64_t)a2, (void (*)(void))sub_24CE32510);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end