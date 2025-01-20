@interface DuplicatesUIHelper
- (_TtC10ContactsUI18DuplicatesUIHelper)init;
- (_TtC10ContactsUI18DuplicatesUIHelper)initWithDelegate:(id)a3;
- (id)duplicateContactsListViewController:(BOOL)a3;
@end

@implementation DuplicatesUIHelper

- (_TtC10ContactsUI18DuplicatesUIHelper)initWithDelegate:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10ContactsUI18DuplicatesUIHelper_delegate) = (Class)a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DuplicatesUIHelper();
  swift_unknownObjectRetain();
  return [(DuplicatesUIHelper *)&v4 init];
}

- (id)duplicateContactsListViewController:(BOOL)a3
{
  objc_super v4 = self;
  v5 = (void *)sub_18B6BB2BC(a3);

  return v5;
}

- (_TtC10ContactsUI18DuplicatesUIHelper)init
{
  result = (_TtC10ContactsUI18DuplicatesUIHelper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end