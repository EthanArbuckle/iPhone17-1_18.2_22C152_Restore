@interface DSCloudObject
- (BOOL)isEqual:(id)a3;
- (NSArray)participants;
- (NSString)displayDetail;
- (NSString)displayName;
- (_TtC13DSNotesPlugin13DSCloudObject)init;
- (int64_t)visibility;
@end

@implementation DSCloudObject

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_12A68();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = sub_FB8C((uint64_t)v8);

  sub_101BC((uint64_t)v8);
  return v6 & 1;
}

- (NSString)displayName
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13DSNotesPlugin13DSCloudObject_cloudSyncingObject);
  v3 = self;
  id v4 = [v2 shareTitle];
  if (v4)
  {
    v5 = v4;
    sub_128E8();

    NSString v6 = sub_128B8();
    swift_bridgeObjectRelease();
  }
  else
  {

    NSString v6 = 0;
  }

  return (NSString *)v6;
}

- (NSString)displayDetail
{
  self;
  if (swift_dynamicCastObjCClass() || (self, swift_dynamicCastObjCClass()))
  {
    NSString v2 = sub_128B8();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v2 = 0;
  }

  return (NSString *)v2;
}

- (NSArray)participants
{
  NSString v2 = self;
  sub_E430();

  sub_D2D0(&qword_1DF68);
  v3.super.isa = sub_12928().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (int64_t)visibility
{
  if ([*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC13DSNotesPlugin13DSCloudObject_cloudSyncingObject) isPubliclyShared])return 2; {
  else
  }
    return 1;
}

- (_TtC13DSNotesPlugin13DSCloudObject)init
{
  result = (_TtC13DSNotesPlugin13DSCloudObject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end