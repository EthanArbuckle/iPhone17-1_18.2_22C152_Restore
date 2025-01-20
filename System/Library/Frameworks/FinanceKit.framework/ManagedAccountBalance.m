@interface ManagedAccountBalance
- (BOOL)validateForInsert:(id *)a3;
- (BOOL)validateForUpdate:(id *)a3;
- (_TtC10FinanceKit21ManagedAccountBalance)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
@end

@implementation ManagedAccountBalance

- (_TtC10FinanceKit21ManagedAccountBalance)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  return [(ManagedAccountBalance *)&v7 initWithEntity:a3 insertIntoManagedObjectContext:a4];
}

- (BOOL)validateForInsert:(id *)a3
{
  return sub_2433BE938(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))ManagedAccountBalance.validateForInsert());
}

- (BOOL)validateForUpdate:(id *)a3
{
  return sub_2433BE938(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))ManagedAccountBalance.validateForUpdate());
}

@end