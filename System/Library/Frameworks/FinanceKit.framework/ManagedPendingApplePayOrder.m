@interface ManagedPendingApplePayOrder
- (BOOL)validateForInsert:(id *)a3;
- (BOOL)validateForUpdate:(id *)a3;
- (_TtC10FinanceKit27ManagedPendingApplePayOrder)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
- (void)awakeFromInsert;
@end

@implementation ManagedPendingApplePayOrder

- (void)awakeFromInsert
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = sub_243957400();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10.receiver = self;
  v10.super_class = ObjectType;
  v8 = self;
  [(ManagedPendingApplePayOrder *)&v10 awakeFromInsert];
  sub_2439573B0();
  v9 = (void *)sub_243957350();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  [(ManagedPendingApplePayOrder *)v8 setCreationDate:v9];
}

- (_TtC10FinanceKit27ManagedPendingApplePayOrder)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  return [(ManagedPendingApplePayOrder *)&v7 initWithEntity:a3 insertIntoManagedObjectContext:a4];
}

- (BOOL)validateForInsert:(id *)a3
{
  return sub_24360A344(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))ManagedPendingApplePayOrder.validateForInsert());
}

- (BOOL)validateForUpdate:(id *)a3
{
  return sub_24360A344(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))ManagedPendingApplePayOrder.validateForUpdate());
}

@end