@interface MapsSyncAnalyticsIdentifier
- (BOOL)isEqual:(id)a3;
- (Class)managedObjectClass;
- (NSData)data;
- (_TtC8MapsSync27MapsSyncAnalyticsIdentifier)initWithObject:(id)a3;
- (void)addEditWithBlock:(id)a3;
- (void)setPropertiesWithObject:(id)a3;
@end

@implementation MapsSyncAnalyticsIdentifier

- (NSData)data
{
  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8MapsSync27MapsSyncAnalyticsIdentifier__data);
  unint64_t v3 = *(void *)&self->super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync27MapsSyncAnalyticsIdentifier__data];
  if (v3 >> 60 == 15)
  {
    v4 = 0;
  }
  else
  {
    uint64_t v5 = *v2;
    sub_1A6EEF59C(*v2, v3);
    v4 = (void *)sub_1A709D188();
    sub_1A6EEF5F4(v5, v3);
  }
  return (NSData *)v4;
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
    uint64_t v5 = self;
  }
  char v6 = sub_1A6F7FA84((uint64_t)v8);

  sub_1A6F00364((uint64_t)v8);
  return v6 & 1;
}

- (void)setPropertiesWithObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1A6F7FDD0(v4);
}

- (Class)managedObjectClass
{
  type metadata accessor for MapsSyncManagedAnalyticsIdentifier();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)addEditWithBlock:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_1A6F022EC;
  *(void *)(v6 + 24) = v5;
  v7 = self;
  swift_retain();
  sub_1A7019234((uint64_t)sub_1A6F80930, v6);

  swift_release();
  swift_release();
}

- (_TtC8MapsSync27MapsSyncAnalyticsIdentifier)initWithObject:(id)a3
{
  *(_OWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync27MapsSyncAnalyticsIdentifier__data) = xmmword_1A70A4EA0;
  id v4 = a3;
  return (_TtC8MapsSync27MapsSyncAnalyticsIdentifier *)sub_1A70198A0(a3);
}

- (void).cxx_destruct
{
}

@end