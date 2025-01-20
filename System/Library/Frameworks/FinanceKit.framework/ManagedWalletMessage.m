@interface ManagedWalletMessage
- (_TtC10FinanceKit20ManagedWalletMessage)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
- (void)didSave;
@end

@implementation ManagedWalletMessage

- (void)didSave
{
  v4 = self;
  if (PKRunningInPassd())
  {
    v2 = v4;
  }
  else
  {
    v3 = (_TtC10FinanceKit20ManagedWalletMessage *)objc_msgSend(objc_allocWithZone(MEMORY[0x263F5C0A8]), sel_init);
    [(ManagedWalletMessage *)v3 updateFinanceKitApplicationMessages];

    v2 = v3;
  }
}

- (_TtC10FinanceKit20ManagedWalletMessage)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  return [(ManagedWalletMessage *)&v7 initWithEntity:a3 insertIntoManagedObjectContext:a4];
}

@end