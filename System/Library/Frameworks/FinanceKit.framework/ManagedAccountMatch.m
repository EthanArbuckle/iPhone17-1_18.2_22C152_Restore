@interface ManagedAccountMatch
- (_TtC10FinanceKit19ManagedAccountMatch)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
- (void).cxx_construct;
@end

@implementation ManagedAccountMatch

- (_TtC10FinanceKit19ManagedAccountMatch)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  return [(ManagedAccountMatch *)&v7 initWithEntity:a3 insertIntoManagedObjectContext:a4];
}

- (void).cxx_construct
{
  v2 = (char *)self + OBJC_IVAR____TtC10FinanceKit19ManagedAccountMatch_matchingTypeKey;
  strcpy((char *)self + OBJC_IVAR____TtC10FinanceKit19ManagedAccountMatch_matchingTypeKey, "matchingType");
  v2[13] = 0;
  *((_WORD *)v2 + 7) = -5120;
}

- (void).cxx_destruct
{
}

@end