@interface JSDebugObject
- (_TtC9JetEngine13JSDebugObject)init;
- (id)pollPoints;
- (void)enable;
@end

@implementation JSDebugObject

- (_TtC9JetEngine13JSDebugObject)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  uint64_t v5 = sub_19EE6A624(0, 0, 256);
  v6 = (uint64_t *)((char *)v4 + OBJC_IVAR____TtC9JetEngine13JSDebugObject_newPoints);
  uint64_t *v6 = v5;
  v6[1] = 0;
  *((unsigned char *)&v4->super.isa + OBJC_IVAR____TtC9JetEngine13JSDebugObject_isDebugPointsEnabled) = 0;
  sub_19F1DADCC();
  swift_allocObject();
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC9JetEngine13JSDebugObject_encoder) = (Class)sub_19F1DADBC();

  v8.receiver = v4;
  v8.super_class = ObjectType;
  return [(JSDebugObject *)&v8 init];
}

- (id)pollPoints
{
  v2 = self;
  sub_19F1D562C();

  v3 = (void *)sub_19F1DC14C();
  swift_bridgeObjectRelease();
  return v3;
}

- (void)enable
{
  v2 = self;
  sub_19F1D5760();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
}

@end