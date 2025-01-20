@interface Quaternion
- (BOOL)isEqual:(id)a3;
- (_TtC11DockKitCore10Quaternion)init;
- (_TtC11DockKitCore10Quaternion)initWithX:(double)a3 y:(double)a4 z:(double)a5 w:(double)a6;
- (int64_t)hash;
@end

@implementation Quaternion

- (_TtC11DockKitCore10Quaternion)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore10Quaternion_x) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore10Quaternion_y) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore10Quaternion_z) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore10Quaternion_w) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Quaternion();
  return [(Quaternion *)&v3 init];
}

- (_TtC11DockKitCore10Quaternion)initWithX:(double)a3 y:(double)a4 z:(double)a5 w:(double)a6
{
  uint64_t v6 = OBJC_IVAR____TtC11DockKitCore10Quaternion_y;
  uint64_t v7 = OBJC_IVAR____TtC11DockKitCore10Quaternion_z;
  uint64_t v8 = OBJC_IVAR____TtC11DockKitCore10Quaternion_w;
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore10Quaternion_x) = a3;
  *(double *)((char *)&self->super.isa + v6) = a4;
  *(double *)((char *)&self->super.isa + v7) = a5;
  *(double *)((char *)&self->super.isa + v8) = a6;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for Quaternion();
  return [(Quaternion *)&v10 init];
}

- (BOOL)isEqual:(id)a3
{
  return sub_24CF37204(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))sub_24CF36EAC);
}

- (int64_t)hash
{
  return sub_24CF36FC4();
}

@end