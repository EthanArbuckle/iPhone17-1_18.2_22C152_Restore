@interface MapsSyncCachedUserReview
- (BOOL)isEqual:(id)a3;
- (Class)managedObjectClass;
- (NSString)description;
- (_TtC8MapsSync19MapsSyncDataSession)session;
- (_TtC8MapsSync24MapsSyncCachedUserReview)initWithObject:(id)a3;
- (int)numberPhotosUploaded;
- (signed)rating;
- (unint64_t)muid;
- (void)addEditWithBlock:(id)a3;
- (void)setPropertiesWithObject:(id)a3;
@end

@implementation MapsSyncCachedUserReview

- (NSString)description
{
  v2 = self;
  sub_1A6F36EE4();

  v3 = (void *)sub_1A709D428();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (unint64_t)muid
{
  return *(unint64_t *)((char *)&self->super.super.super.isa
                             + OBJC_IVAR____TtC8MapsSync24MapsSyncCachedUserReview__muid);
}

- (int)numberPhotosUploaded
{
  return *(_DWORD *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC8MapsSync24MapsSyncCachedUserReview__numberPhotosUploaded);
}

- (signed)rating
{
  return *(_WORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync24MapsSyncCachedUserReview__rating);
}

- (_TtC8MapsSync19MapsSyncDataSession)session
{
  if (byte_1E96E7990 == 1)
  {
    uint64_t v3 = qword_1E96E6F20;
    v4 = self;
    if (v3 != -1) {
      swift_once();
    }
    v5 = &qword_1E96E7988;
  }
  else
  {
    uint64_t v6 = qword_1EB670280;
    v7 = self;
    if (v6 != -1) {
      swift_once();
    }
    v5 = &qword_1EB670248;
  }
  v8 = (_TtC8MapsSync19MapsSyncDataSession *)(id)*v5;

  return v8;
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
  char v6 = sub_1A6F372A8((uint64_t)v8);

  sub_1A6F00364((uint64_t)v8);
  return v6 & 1;
}

- (void)setPropertiesWithObject:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1A6F37560(v4);
}

- (Class)managedObjectClass
{
  type metadata accessor for MapsSyncManagedCachedUserReview();
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
  sub_1A7019234((uint64_t)sub_1A6F37DF4, v6);

  swift_release();
  swift_release();
}

- (_TtC8MapsSync24MapsSyncCachedUserReview)initWithObject:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync24MapsSyncCachedUserReview__muid) = 0;
  *(_DWORD *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC8MapsSync24MapsSyncCachedUserReview__numberPhotosUploaded) = 0;
  *(_WORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync24MapsSyncCachedUserReview__rating) = 0;
  id v4 = a3;
  return (_TtC8MapsSync24MapsSyncCachedUserReview *)sub_1A70198A0(a3);
}

@end