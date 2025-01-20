@interface MapsSyncObjectWrapper
- (BOOL)isEqual:(id)a3;
- (_TtC8MapsSync21MapsSyncObjectWrapper)init;
- (id)copyWithZone:(void *)a3;
- (int64_t)hash;
@end

@implementation MapsSyncObjectWrapper

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  sub_1A6F81C04(v6);

  __swift_project_boxed_opaque_existential_0(v6, v6[3]);
  v4 = (void *)sub_1A709DCB8();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1A709D888();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = sub_1A6F82400((uint64_t)v8);

  sub_1A6F00364((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync21MapsSyncObjectWrapper__managedObjectID);
  if (v3)
  {
    return (int64_t)objc_msgSend(v3, sel_hash);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)type metadata accessor for MapsSyncObjectWrapper();
    return [(MapsSyncObjectWrapper *)&v5 hash];
  }
}

- (_TtC8MapsSync21MapsSyncObjectWrapper)init
{
  result = (_TtC8MapsSync21MapsSyncObjectWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync21MapsSyncObjectWrapper__callbackQueue);
}

@end