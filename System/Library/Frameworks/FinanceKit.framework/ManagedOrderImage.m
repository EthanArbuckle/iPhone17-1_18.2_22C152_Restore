@interface ManagedOrderImage
- (BOOL)validateForInsert:(id *)a3;
- (BOOL)validateForUpdate:(id *)a3;
- (_TtC10FinanceKit17ManagedOrderImage)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
@end

@implementation ManagedOrderImage

- (_TtC10FinanceKit17ManagedOrderImage)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  return [(ManagedOrderImage *)&v7 initWithEntity:a3 insertIntoManagedObjectContext:a4];
}

- (BOOL)validateForInsert:(id *)a3
{
  return sub_24359BF04(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))ManagedOrderImage.validateForInsert());
}

- (BOOL)validateForUpdate:(id *)a3
{
  return sub_24359BF04(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))ManagedOrderImage.validateForUpdate());
}

@end