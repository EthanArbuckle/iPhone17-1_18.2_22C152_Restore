@interface ManagedPIIRedactionConfiguration
- (_TtC10FinanceKit32ManagedPIIRedactionConfiguration)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
@end

@implementation ManagedPIIRedactionConfiguration

- (_TtC10FinanceKit32ManagedPIIRedactionConfiguration)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  return [(ManagedPIIRedactionConfiguration *)&v7 initWithEntity:a3 insertIntoManagedObjectContext:a4];
}

@end