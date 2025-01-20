@interface PassbookDataclassOwner
+ (id)dataclasses;
- (BOOL)performAction:(id)a3 forAccount:(id)a4 withChildren:(id)a5 forDataclass:(id)a6;
- (_TtC28PassbookDataclassOwnerPlugin22PassbookDataclassOwner)init;
- (id)actionsForDeletingAccount:(id)a3 forDataclass:(id)a4;
@end

@implementation PassbookDataclassOwner

+ (id)dataclasses
{
  sub_2C2C(&qword_8658);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_32A0;
  v3 = (void *)ACAccountDataclassShoebox;
  *(void *)(v2 + 32) = ACAccountDataclassShoebox;
  type metadata accessor for Dataclass();
  id v4 = v3;
  v5.super.isa = sub_3008().super.isa;
  swift_bridgeObjectRelease();
  return v5.super.isa;
}

- (id)actionsForDeletingAccount:(id)a3 forDataclass:(id)a4
{
  if (sub_2344())
  {
    v4.super.isa = sub_3008().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }
  return v4.super.isa;
}

- (BOOL)performAction:(id)a3 forAccount:(id)a4 withChildren:(id)a5 forDataclass:(id)a6
{
  if (a5) {
    sub_3018();
  }
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = self;
  char v14 = sub_27E4(a3);

  swift_bridgeObjectRelease();
  return v14 & 1;
}

- (_TtC28PassbookDataclassOwnerPlugin22PassbookDataclassOwner)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(PassbookDataclassOwner *)&v3 init];
}

@end