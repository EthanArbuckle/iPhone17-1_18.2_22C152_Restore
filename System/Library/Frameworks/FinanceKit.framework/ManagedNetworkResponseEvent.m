@interface ManagedNetworkResponseEvent
- (_TtC10FinanceKit27ManagedNetworkResponseEvent)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
@end

@implementation ManagedNetworkResponseEvent

- (_TtC10FinanceKit27ManagedNetworkResponseEvent)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  return [(ManagedNetworkResponseEvent *)&v7 initWithEntity:a3 insertIntoManagedObjectContext:a4];
}

@end