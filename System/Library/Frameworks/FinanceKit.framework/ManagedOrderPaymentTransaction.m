@interface ManagedOrderPaymentTransaction
- (_TtC10FinanceKit30ManagedOrderPaymentTransaction)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
- (void).cxx_construct;
@end

@implementation ManagedOrderPaymentTransaction

- (_TtC10FinanceKit30ManagedOrderPaymentTransaction)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  return [(ManagedOrderPaymentTransaction *)&v7 initWithEntity:a3 insertIntoManagedObjectContext:a4];
}

- (void).cxx_construct
{
  v2 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC10FinanceKit30ManagedOrderPaymentTransaction_transactionTypeKey);
  void *v2 = 0x746361736E617274;
  v2[1] = 0xEF657079546E6F69;
  v3 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC10FinanceKit30ManagedOrderPaymentTransaction_statusKey);
  void *v3 = 0x737574617473;
  v3[1] = 0xE600000000000000;
  v4 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC10FinanceKit30ManagedOrderPaymentTransaction_amountKey);
  void *v4 = 0x746E756F6D61;
  v4[1] = 0xE600000000000000;
  v5 = (char *)self + OBJC_IVAR____TtC10FinanceKit30ManagedOrderPaymentTransaction_currencyCodeKey;
  strcpy((char *)self + OBJC_IVAR____TtC10FinanceKit30ManagedOrderPaymentTransaction_currencyCodeKey, "currencyCode");
  v5[13] = 0;
  *((_WORD *)v5 + 7) = -5120;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end