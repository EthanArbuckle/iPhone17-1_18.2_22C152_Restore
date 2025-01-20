@interface MapsSyncHistoryItem
+ (id)fetchHistoryItemForIdentifier:(id)a3;
+ (void)fetch:(int64_t)a3 :(int64_t)a4 :(id)a5 sort:(int64_t)a6 ascending:(BOOL)a7 completion:(id)a8;
+ (void)fetch:(int64_t)a3 :(int64_t)a4 :(id)a5 sort:(int64_t)a6 ascending:(BOOL)a7 completionWithError:(id)a8;
- (BOOL)isEqual:(id)a3;
- (Class)managedObjectClass;
- (_TtC8MapsSync19MapsSyncHistoryItem)initWithObject:(id)a3;
- (double)position;
- (void)addEditWithBlock:(id)a3;
- (void)setPropertiesWithObject:(id)a3;
@end

@implementation MapsSyncHistoryItem

+ (id)fetchHistoryItemForIdentifier:(id)a3
{
  uint64_t v3 = sub_1A709D258();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A709D238();
  v7 = (void *)_s8MapsSync0aB11HistoryItemC05fetchcD13ForIdentifieryACSg10Foundation4UUIDVFZ_0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v7;
}

- (double)position
{
  return *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncHistoryItem__position);
}

+ (void)fetch:(int64_t)a3 :(int64_t)a4 :(id)a5 sort:(int64_t)a6 ascending:(BOOL)a7 completion:(id)a8
{
  v13 = _Block_copy(a8);
  if (a5)
  {
    swift_unknownObjectRetain();
    sub_1A709D888();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v14, 0, sizeof(v14));
  }
  sub_1A7080DF4(a3, a4, (uint64_t)v14, a6, a7, v13);
  _Block_release(v13);
  sub_1A6F00364((uint64_t)v14);
}

+ (void)fetch:(int64_t)a3 :(int64_t)a4 :(id)a5 sort:(int64_t)a6 ascending:(BOOL)a7 completionWithError:(id)a8
{
  v11 = _Block_copy(a8);
  if (a5)
  {
    swift_unknownObjectRetain();
    sub_1A709D888();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v13, 0, sizeof(v13));
  }
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  sub_1A7081504(a3, a4, (uint64_t)v13, 1, 0, sub_1A6F12A80, v12);
  swift_release();
  sub_1A6F00364((uint64_t)v13);
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_1A709D888();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  char v6 = sub_1A70802BC((uint64_t)v8);

  sub_1A6F00364((uint64_t)v8);
  return v6 & 1;
}

- (void)setPropertiesWithObject:(id)a3
{
  id v4 = a3;
  char v6 = self;
  sub_1A7018C34(v4);
  type metadata accessor for MapsSyncManagedHistoryItem();
  if (swift_dynamicCastClass())
  {
    objc_msgSend((id)swift_dynamicCastClassUnconditional(), sel_position);
    *(Class *)((char *)&v6->super.super.super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncHistoryItem__position) = v5;
  }
}

- (Class)managedObjectClass
{
  type metadata accessor for MapsSyncManagedHistoryItem();
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
  sub_1A7019234((uint64_t)sub_1A70806B4, v6);

  swift_release();
  swift_release();
}

- (_TtC8MapsSync19MapsSyncHistoryItem)initWithObject:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncHistoryItem__position) = 0;
  id v4 = a3;
  return (_TtC8MapsSync19MapsSyncHistoryItem *)sub_1A70198A0(a3);
}

@end