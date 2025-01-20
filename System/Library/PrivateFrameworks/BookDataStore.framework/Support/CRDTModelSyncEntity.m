@interface CRDTModelSyncEntity
+ (id)propertyIDKey;
- (BOOL)isEqualExceptForDate:(id)a3 ignoringEmptySalt:(BOOL)a4;
- (NSString)debugDescription;
- (_TtC14bookdatastored19CRDTModelSyncEntity)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
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
  v4 = (BCCloudDataPrivacyDelegate *)a4;
  if (a4)
  {
    sub_10007DC14(&qword_1002924D0);
    v4 = (BCCloudDataPrivacyDelegate *)sub_1001EC260();
  }
  swift_unknownObjectRetain();
  v7 = self;
  v8.super.super.isa = (Class)a3;
  v8._privacyDelegate = v4;
  CRDTModelSyncEntity.configure(from:withMergers:)(v8, v10);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (BOOL)isEqualExceptForDate:(id)a3 ignoringEmptySalt:(BOOL)a4
{
  BOOL v4 = a4;
  swift_unknownObjectRetain();
  v7 = self;
  v8.super.super.isa = (Class)a3;
  v8._privacyDelegate = (BCCloudDataPrivacyDelegate *)v4;
  LOBYTE(v4) = CRDTModelSyncEntity.isEqualExceptForDate(_:ignoringEmptySalt:)(v8, v9);
  swift_unknownObjectRelease();

  return v4;
}

- (void)resolveConflictsFromRecord:(id)a3 withResolvers:(id)a4
{
  BOOL v4 = a4;
  if (a4)
  {
    sub_10007DC14(&qword_1002924D0);
    BOOL v4 = (void *)sub_1001EC260();
  }
  id v7 = a3;
  BCCloudData v8 = self;
  v10.value._rawValue = v4;
  CRDTModelSyncEntity.resolveConflicts(from:withResolvers:)((CKRecord)v7, v10);

  swift_bridgeObjectRelease();
}

+ (id)propertyIDKey
{
  NSString v2 = sub_1001EC340();
  return v2;
}

- (_TtC14bookdatastored19CRDTModelSyncEntity)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CRDTModelSyncEntity();
  return [(CRDTModelSyncEntity *)&v7 initWithEntity:a3 insertIntoManagedObjectContext:a4];
}

- (void).cxx_construct
{
  NSString v2 = (char *)self + OBJC_IVAR____TtC14bookdatastored19CRDTModelSyncEntity____lazy_storage___logger;
  uint64_t v3 = sub_1001EB560();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 1, 1, v3);
}

- (void).cxx_destruct
{
}

- (id)mutableCopy
{
  id v3 = objc_allocWithZone((Class)type metadata accessor for CRDTModelSync());
  BOOL v4 = self;
  id result = [v3 initWithCloudData:v4];
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
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for CRDTModelSyncEntity();
  id v2 = v9.receiver;
  id v3 = [(CRDTModelSyncEntity *)&v9 debugDescription];
  sub_1001EC370();

  uint64_t v4 = sub_10015756C(v2);
  id v6 = v5;
  swift_bridgeObjectRetain();
  v11._countAndFlagsBits = v4;
  v11._object = v6;
  sub_1001EC490(v11);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  NSString v7 = sub_1001EC340();
  swift_bridgeObjectRelease();
  return (NSString *)v7;
}

- (id)recordType
{
  id v2 = self;
  id v3 = [(CRDTModelSyncEntity *)v2 type];
  uint64_t v4 = sub_1001EC370();
  unint64_t v6 = v5;

  sub_1001EC530();
  uint64_t v7 = sub_1001EC3E0();
  unint64_t v9 = v8;
  swift_bridgeObjectRelease();
  sub_100152E34(15, v7, v9, v4, v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  NSString v10 = sub_1001EC340();
  swift_bridgeObjectRelease();
  return v10;
}

- (id)identifier
{
  id v2 = self;
  sub_1001576A8(v2);
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = sub_1001EC340();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  return v5;
}

- (id)zoneName
{
  id v2 = self;
  id v3 = [(CRDTModelSyncEntity *)v2 type];
  sub_1001EC370();

  NSString v4 = sub_1001EC340();
  swift_bridgeObjectRelease();
  return v4;
}

@end