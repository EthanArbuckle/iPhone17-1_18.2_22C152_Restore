@interface ManagedOrderRegistration
- (BOOL)validateForInsert:(id *)a3;
- (BOOL)validateForUpdate:(id *)a3;
- (_TtC10FinanceKit24ManagedOrderRegistration)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
- (void)awakeFromInsert;
@end

@implementation ManagedOrderRegistration

- (void)awakeFromInsert
{
  v2 = self;
  ManagedOrderRegistration.awakeFromInsert()();
}

- (_TtC10FinanceKit24ManagedOrderRegistration)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  return [(ManagedOrderRegistration *)&v7 initWithEntity:a3 insertIntoManagedObjectContext:a4];
}

- (BOOL)validateForInsert:(id *)a3
{
  return sub_2435E4D58(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))ManagedOrderRegistration.validateForInsert());
}

- (BOOL)validateForUpdate:(id *)a3
{
  return sub_2435E4D58(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))ManagedOrderRegistration.validateForUpdate());
}

@end