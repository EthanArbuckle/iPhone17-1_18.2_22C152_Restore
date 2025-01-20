@interface SDDataclassOwner
+ (id)dataclasses;
- (BOOL)performAction:(id)a3 forAccount:(id)a4 withChildren:(id)a5 forDataclass:(id)a6;
- (SDDataclassOwner)init;
- (id)actionsForAddingAccount:(id)a3 forDataclass:(id)a4;
- (id)actionsForDeletingAccount:(id)a3 forDataclass:(id)a4;
- (id)actionsForDisablingDataclassOnAccount:(id)a3 forDataclass:(id)a4;
- (id)actionsForEnablingDataclassOnAccount:(id)a3 forDataclass:(id)a4;
@end

@implementation SDDataclassOwner

- (SDDataclassOwner)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(SDDataclassOwner *)&v3 init];
}

+ (id)dataclasses
{
  sub_2440();
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_3BE0;
  objc_super v3 = (void *)ACAccountDataclassStocks;
  *(void *)(v2 + 32) = ACAccountDataclassStocks;
  type metadata accessor for Dataclass(0);
  id v4 = v3;
  v5.super.isa = sub_31D0().super.isa;
  swift_bridgeObjectRelease();
  return v5.super.isa;
}

- (id)actionsForAddingAccount:(id)a3 forDataclass:(id)a4
{
  return sub_2334((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(void))sub_2A30);
}

- (id)actionsForDeletingAccount:(id)a3 forDataclass:(id)a4
{
  return sub_2334((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(void))sub_2B88);
}

- (id)actionsForEnablingDataclassOnAccount:(id)a3 forDataclass:(id)a4
{
  return sub_2334((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(void))sub_2A30);
}

- (id)actionsForDisablingDataclassOnAccount:(id)a3 forDataclass:(id)a4
{
  return sub_2334((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(void))sub_2B88);
}

- (BOOL)performAction:(id)a3 forAccount:(id)a4 withChildren:(id)a5 forDataclass:(id)a6
{
  if (a5) {
    sub_31E0();
  }
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = self;
  sub_2E54(a3);
  char v15 = v14;

  swift_bridgeObjectRelease();
  return v15 & 1;
}

@end