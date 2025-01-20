@interface ManagedDropboxApplePayOrder
- (_TtC10FinanceKit27ManagedDropboxApplePayOrder)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
- (void).cxx_construct;
@end

@implementation ManagedDropboxApplePayOrder

- (_TtC10FinanceKit27ManagedDropboxApplePayOrder)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  return [(ManagedDropboxApplePayOrder *)&v7 initWithEntity:a3 insertIntoManagedObjectContext:a4];
}

- (void).cxx_construct
{
  v2 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC10FinanceKit27ManagedDropboxApplePayOrder_encryptionSchemeKey);
  void *v2 = 0xD000000000000010;
  v2[1] = 0x80000002439AC290;
  v3 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC10FinanceKit27ManagedDropboxApplePayOrder_ephemeralPublicKeyKey);
  void *v3 = 0xD000000000000012;
  v3[1] = 0x80000002439AC2B0;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end