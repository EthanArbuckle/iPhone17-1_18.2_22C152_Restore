@interface CRDTModelSyncEntity
+ (id)propertyIDKey;
- (BOOL)isEqualExceptForDate:(id)a3 ignoringEmptySalt:(BOOL)a4;
- (NSString)debugDescription;
- (_TtC13BookDataStore19CRDTModelSyncEntity)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
- (id)identifier;
- (id)mutableCopy;
- (id)recordType;
- (id)zoneName;
- (void).cxx_construct;
- (void)configureFromCloudData:(id)a3 withMergers:(id)a4;
- (void)resolveConflictsFromRecord:(id)a3 withResolvers:(id)a4;
@end

@implementation CRDTModelSyncEntity

- (void)configureFromCloudData:(id)a3 withMergers:(id)a4
{
  uint64_t v4 = (uint64_t)a4;
  if (a4)
  {
    sub_236126188(&qword_268853500);
    uint64_t v4 = sub_2361FE7F8();
  }
  swift_unknownObjectRetain();
  v7 = self;
  sub_236136F78(a3, v4);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (BOOL)isEqualExceptForDate:(id)a3 ignoringEmptySalt:(BOOL)a4
{
  swift_unknownObjectRetain();
  v7 = self;
  char v8 = sub_23613873C((uint64_t)a3, a4);
  swift_unknownObjectRelease();

  return v8 & 1;
}

- (void)resolveConflictsFromRecord:(id)a3 withResolvers:(id)a4
{
  uint64_t v4 = (uint64_t)a4;
  if (a4)
  {
    sub_236126188(&qword_268853500);
    uint64_t v4 = sub_2361FE7F8();
  }
  id v7 = a3;
  char v8 = self;
  sub_2361389FC(v7, v4);

  swift_bridgeObjectRelease();
}

+ (id)propertyIDKey
{
  v2 = (void *)sub_2361FE8C8();
  return v2;
}

- (_TtC13BookDataStore19CRDTModelSyncEntity)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CRDTModelSyncEntity();
  return [(CRDTModelSyncEntity *)&v7 initWithEntity:a3 insertIntoManagedObjectContext:a4];
}

- (void).cxx_construct
{
  v2 = (char *)self + OBJC_IVAR____TtC13BookDataStore19CRDTModelSyncEntity____lazy_storage___logger;
  uint64_t v3 = sub_2361FDB58();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 1, 1, v3);
}

- (void).cxx_destruct
{
}

- (id)mutableCopy
{
  id v3 = objc_allocWithZone((Class)type metadata accessor for CRDTModelSync());
  uint64_t v4 = self;
  id result = objc_msgSend(v3, sel_initWithCloudData_, v4);
  if (result)
  {
    id v6 = result;

    return v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (NSString)debugDescription
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CRDTModelSyncEntity();
  id v2 = v6.receiver;
  id v3 = [(CRDTModelSyncEntity *)&v6 debugDescription];
  sub_2361FE8D8();

  sub_23613B1DC(v2);
  swift_bridgeObjectRetain();
  sub_2361FE9B8();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)sub_2361FE8C8();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (id)recordType
{
  id v2 = self;
  id v3 = [(CRDTModelSyncEntity *)v2 type];
  uint64_t v4 = sub_2361FE8D8();
  unint64_t v6 = v5;

  sub_2361FEA08();
  uint64_t v7 = sub_2361FE938();
  unint64_t v9 = v8;
  swift_bridgeObjectRelease();
  sub_2361368C8(15, v7, v9, v4, v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v10 = (void *)sub_2361FE8C8();
  swift_bridgeObjectRelease();
  return v10;
}

- (id)identifier
{
  id v2 = self;
  sub_23613B318(v2);
  uint64_t v4 = v3;

  if (v4)
  {
    unint64_t v5 = (void *)sub_2361FE8C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v5 = 0;
  }
  return v5;
}

- (id)zoneName
{
  id v2 = self;
  id v3 = [(CRDTModelSyncEntity *)v2 type];
  sub_2361FE8D8();

  uint64_t v4 = (void *)sub_2361FE8C8();
  swift_bridgeObjectRelease();
  return v4;
}

@end