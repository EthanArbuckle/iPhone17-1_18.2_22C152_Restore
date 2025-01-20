@interface MapsSyncServerEvaluationStatus
- (BOOL)arpStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)rapStatus;
- (Class)managedObjectClass;
- (NSString)description;
- (_TtC8MapsSync30MapsSyncServerEvaluationStatus)initWithObject:(id)a3;
- (void)addEditWithBlock:(id)a3;
- (void)setPropertiesWithObject:(id)a3;
@end

@implementation MapsSyncServerEvaluationStatus

- (BOOL)arpStatus
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync30MapsSyncServerEvaluationStatus__arpStatus);
}

- (BOOL)rapStatus
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync30MapsSyncServerEvaluationStatus__rapStatus);
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
  char v6 = sub_1A7043644((uint64_t)v8);

  sub_1A6F00364((uint64_t)v8);
  return v6 & 1;
}

- (void)setPropertiesWithObject:(id)a3
{
  id v4 = a3;
  v9 = self;
  sub_1A7018C34(v4);
  type metadata accessor for MapsSyncManagedServerEvaluationStatus();
  uint64_t v5 = swift_dynamicCastClass();
  if (v5)
  {
    char v6 = (void *)v5;
    id v7 = v4;
    unsigned __int8 v8 = objc_msgSend(v6, sel_arpStatus);
    *((unsigned char *)&v9->super.super.super.isa + OBJC_IVAR____TtC8MapsSync30MapsSyncServerEvaluationStatus__arpStatus) = v8;
    LOBYTE(v6) = objc_msgSend(v6, sel_rapStatus);

    *((unsigned char *)&v9->super.super.super.isa + OBJC_IVAR____TtC8MapsSync30MapsSyncServerEvaluationStatus__rapStatus) = (_BYTE)v6;
  }
}

- (Class)managedObjectClass
{
  type metadata accessor for MapsSyncManagedServerEvaluationStatus();
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
  id v7 = self;
  swift_retain();
  sub_1A7019234((uint64_t)sub_1A7043B48, v6);

  swift_release();
  swift_release();
}

- (NSString)description
{
  v2 = self;
  sub_1A7043C7C();

  v3 = (void *)sub_1A709D428();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC8MapsSync30MapsSyncServerEvaluationStatus)initWithObject:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync30MapsSyncServerEvaluationStatus__arpStatus) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync30MapsSyncServerEvaluationStatus__rapStatus) = 0;
  id v4 = a3;
  return (_TtC8MapsSync30MapsSyncServerEvaluationStatus *)sub_1A70198A0(a3);
}

@end