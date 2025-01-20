@interface ManagedOrder
- (BOOL)validateForInsert:(id *)a3;
- (BOOL)validateForUpdate:(id *)a3;
- (_TtC10FinanceKit12ManagedOrder)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
- (void).cxx_construct;
- (void)awakeFromInsert;
- (void)willSave;
@end

@implementation ManagedOrder

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
  [(ManagedOrder *)&v10 awakeFromInsert];
  sub_2439573B0();
  v9 = (void *)sub_243957350();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  [(ManagedOrder *)v8 setCreationDate:v9];
}

- (void)willSave
{
  v2 = self;
  ManagedOrder.willSave()();
}

- (_TtC10FinanceKit12ManagedOrder)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  return [(ManagedOrder *)&v7 initWithEntity:a3 insertIntoManagedObjectContext:a4];
}

- (void).cxx_construct
{
  v2 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC10FinanceKit12ManagedOrder_orderContentTypeKey);
  void *v2 = 0xD000000000000010;
  v2[1] = 0x80000002439AADA0;
}

- (void).cxx_destruct
{
}

- (BOOL)validateForInsert:(id *)a3
{
  return sub_24357AF2C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))ManagedOrder.validateForInsert());
}

- (BOOL)validateForUpdate:(id *)a3
{
  return sub_24357AF2C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))ManagedOrder.validateForUpdate());
}

@end