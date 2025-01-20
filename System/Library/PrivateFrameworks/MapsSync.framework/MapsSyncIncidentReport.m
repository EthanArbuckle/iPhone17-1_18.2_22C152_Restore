@interface MapsSyncIncidentReport
- (BOOL)isEqual:(id)a3;
- (Class)managedObjectClass;
- (NSString)countryCode;
- (_TtC8MapsSync22MapsSyncIncidentReport)initWithObject:(id)a3;
- (signed)type;
- (void)addEditWithBlock:(id)a3;
- (void)setPropertiesWithObject:(id)a3;
@end

@implementation MapsSyncIncidentReport

- (NSString)countryCode
{
  if (*(void *)&self->super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync22MapsSyncIncidentReport__countryCode])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1A709D428();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (signed)type
{
  return *(_WORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync22MapsSyncIncidentReport__type);
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
  char v6 = sub_1A7026208((uint64_t)v8);

  sub_1A6F00364((uint64_t)v8);
  return v6 & 1;
}

- (void)setPropertiesWithObject:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1A7026524(v4);
}

- (Class)managedObjectClass
{
  type metadata accessor for MapsSyncManagedIncidentReport();
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
  sub_1A7019234((uint64_t)sub_1A7026764, v6);

  swift_release();
  swift_release();
}

- (_TtC8MapsSync22MapsSyncIncidentReport)initWithObject:(id)a3
{
  id v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync22MapsSyncIncidentReport__countryCode);
  void *v4 = 0;
  v4[1] = 0;
  *(_WORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync22MapsSyncIncidentReport__type) = 0;
  id v5 = a3;
  return (_TtC8MapsSync22MapsSyncIncidentReport *)sub_1A70198A0(a3);
}

- (void).cxx_destruct
{
}

@end