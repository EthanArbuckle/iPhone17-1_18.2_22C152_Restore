@interface ManagedCloudAccountMatch
- (_TtC10FinanceKit24ManagedCloudAccountMatch)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
- (void).cxx_construct;
@end

@implementation ManagedCloudAccountMatch

- (_TtC10FinanceKit24ManagedCloudAccountMatch)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  return [(ManagedCloudAccountMatch *)&v7 initWithEntity:a3 insertIntoManagedObjectContext:a4];
}

- (void).cxx_construct
{
  v2 = (char *)self + OBJC_IVAR____TtC10FinanceKit24ManagedCloudAccountMatch_matchingTypeKey;
  strcpy((char *)self + OBJC_IVAR____TtC10FinanceKit24ManagedCloudAccountMatch_matchingTypeKey, "matchingType");
  v2[13] = 0;
  *((_WORD *)v2 + 7) = -5120;
  v3 = (char *)self + OBJC_IVAR____TtC10FinanceKit24ManagedCloudAccountMatch_isMismatchedKey;
  strcpy((char *)self + OBJC_IVAR____TtC10FinanceKit24ManagedCloudAccountMatch_isMismatchedKey, "isMismatched");
  v3[13] = 0;
  *((_WORD *)v3 + 7) = -5120;
  v4 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC10FinanceKit24ManagedCloudAccountMatch_ckSchemaVersionKey);
  void *v4 = 0xD000000000000012;
  v4[1] = 0x80000002439B5AE0;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end