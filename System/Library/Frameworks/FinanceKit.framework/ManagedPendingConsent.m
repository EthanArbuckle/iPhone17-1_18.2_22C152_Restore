@interface ManagedPendingConsent
- (_TtC10FinanceKit21ManagedPendingConsent)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
@end

@implementation ManagedPendingConsent

- (_TtC10FinanceKit21ManagedPendingConsent)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  return [(ManagedPendingConsent *)&v7 initWithEntity:a3 insertIntoManagedObjectContext:a4];
}

@end