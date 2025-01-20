@interface EDSearchableMessageCategoryUpdate
- (EDSearchableMessageCategoryUpdate)init;
- (EDSearchableMessageCategoryUpdate)initWithCategory:(id)a3;
- (void)addToAttributes:(id)a3;
@end

@implementation EDSearchableMessageCategoryUpdate

- (EDSearchableMessageCategoryUpdate)initWithCategory:(id)a3
{
  v3 = (id *)((char *)&self->super.isa + OBJC_IVAR___EDSearchableMessageCategoryUpdate__underlying);
  v3[3] = &type metadata for SearchableMessageCategoryUpdate;
  id *v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)EDSearchableMessageCategoryUpdate;
  id v4 = a3;
  return [(EDSearchableMessageCategoryUpdate *)&v6 init];
}

- (void)addToAttributes:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1DB5C3178(v4);
}

- (EDSearchableMessageCategoryUpdate)init
{
  result = (EDSearchableMessageCategoryUpdate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end