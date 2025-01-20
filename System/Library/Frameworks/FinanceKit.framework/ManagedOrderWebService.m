@interface ManagedOrderWebService
- (BOOL)validateForInsert:(id *)a3;
- (BOOL)validateForUpdate:(id *)a3;
- (_TtC10FinanceKit22ManagedOrderWebService)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
@end

@implementation ManagedOrderWebService

- (_TtC10FinanceKit22ManagedOrderWebService)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  return [(ManagedOrderWebService *)&v7 initWithEntity:a3 insertIntoManagedObjectContext:a4];
}

- (BOOL)validateForInsert:(id *)a3
{
  return sub_2435F9BE8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))ManagedOrderWebService.validateForInsert());
}

- (BOOL)validateForUpdate:(id *)a3
{
  return sub_2435F9BE8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))ManagedOrderWebService.validateForUpdate());
}

@end