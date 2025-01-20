@interface ManagedPendingApplePayTransactionRegistration
- (_TtC10FinanceKit45ManagedPendingApplePayTransactionRegistration)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
- (void).cxx_construct;
- (void)awakeFromInsert;
@end

@implementation ManagedPendingApplePayTransactionRegistration

- (void)awakeFromInsert
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = sub_243957400();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10.receiver = self;
  v10.super_class = ObjectType;
  v8 = self;
  [(ManagedPendingApplePayTransactionRegistration *)&v10 awakeFromInsert];
  sub_2439573B0();
  v9 = (void *)sub_243957350();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  [(ManagedPendingApplePayTransactionRegistration *)v8 setCreationDate:v9];
}

- (_TtC10FinanceKit45ManagedPendingApplePayTransactionRegistration)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  return [(ManagedPendingApplePayTransactionRegistration *)&v7 initWithEntity:a3 insertIntoManagedObjectContext:a4];
}

- (void).cxx_construct
{
  v2 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC10FinanceKit45ManagedPendingApplePayTransactionRegistration_transactionIdentifierKey);
  void *v2 = 0xD000000000000015;
  v2[1] = 0x80000002439A2F10;
  v3 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC10FinanceKit45ManagedPendingApplePayTransactionRegistration_privateKeyKey);
  void *v3 = 0x4B65746176697270;
  v3[1] = 0xEA00000000007965;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end