@interface ManagedInternalAccount
- (BOOL)validateForInsert:(id *)a3;
- (BOOL)validateForUpdate:(id *)a3;
- (_TtC10FinanceKit22ManagedInternalAccount)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
@end

@implementation ManagedInternalAccount

- (_TtC10FinanceKit22ManagedInternalAccount)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  return [(ManagedInternalAccount *)&v7 initWithEntity:a3 insertIntoManagedObjectContext:a4];
}

- (BOOL)validateForInsert:(id *)a3
{
  return sub_243786098(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))ManagedInternalAccount.validateForInsert());
}

- (BOOL)validateForUpdate:(id *)a3
{
  return sub_243786098(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))ManagedInternalAccount.validateForUpdate());
}

@end