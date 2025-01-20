@interface ManagedOrderWebServiceLogEntry
- (BOOL)validateForInsert:(id *)a3;
- (BOOL)validateForUpdate:(id *)a3;
- (_TtC10FinanceKit30ManagedOrderWebServiceLogEntry)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
@end

@implementation ManagedOrderWebServiceLogEntry

- (_TtC10FinanceKit30ManagedOrderWebServiceLogEntry)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  return [(ManagedOrderWebServiceLogEntry *)&v7 initWithEntity:a3 insertIntoManagedObjectContext:a4];
}

- (BOOL)validateForInsert:(id *)a3
{
  return sub_2436013D8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))ManagedOrderWebServiceLogEntry.validateForInsert());
}

- (BOOL)validateForUpdate:(id *)a3
{
  return sub_2436013D8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))ManagedOrderWebServiceLogEntry.validateForUpdate());
}

@end