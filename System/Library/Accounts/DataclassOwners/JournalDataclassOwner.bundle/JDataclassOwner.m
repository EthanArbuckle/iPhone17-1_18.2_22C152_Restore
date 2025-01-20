@interface JDataclassOwner
+ (id)dataclasses;
- (BOOL)performAction:(id)a3 forAccount:(id)a4 withChildren:(id)a5 forDataclass:(id)a6;
- (JDataclassOwner)init;
- (id)actionsForAddingAccount:(id)a3 forDataclass:(id)a4;
- (id)actionsForDeletingAccount:(id)a3 forDataclass:(id)a4;
- (id)actionsForDisablingDataclassOnAccount:(id)a3 forDataclass:(id)a4;
- (id)actionsForEnablingDataclassOnAccount:(id)a3 forDataclass:(id)a4;
@end

@implementation JDataclassOwner

+ (id)dataclasses
{
  sub_82B4((uint64_t *)&unk_32580);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_27570;
  v3 = (void *)ACAccountDataclassMoments;
  *(void *)(v2 + 32) = ACAccountDataclassMoments;
  type metadata accessor for Dataclass(0);
  id v4 = v3;
  v5.super.isa = sub_23F90().super.isa;
  swift_bridgeObjectRelease();
  return v5.super.isa;
}

- (id)actionsForAddingAccount:(id)a3 forDataclass:(id)a4
{
  return sub_9CF4(self, (uint64_t)a2, a3, a4, (uint64_t (*)(void *, void *))sub_AA84);
}

- (id)actionsForDeletingAccount:(id)a3 forDataclass:(id)a4
{
  return sub_9CF4(self, (uint64_t)a2, a3, a4, (uint64_t (*)(void *, void *))sub_AE04);
}

- (id)actionsForEnablingDataclassOnAccount:(id)a3 forDataclass:(id)a4
{
  return sub_9CF4(self, (uint64_t)a2, a3, a4, (uint64_t (*)(void *, void *))sub_A554);
}

- (id)actionsForDisablingDataclassOnAccount:(id)a3 forDataclass:(id)a4
{
  return sub_9CF4(self, (uint64_t)a2, a3, a4, (uint64_t (*)(void *, void *))sub_B464);
}

- (BOOL)performAction:(id)a3 forAccount:(id)a4 withChildren:(id)a5 forDataclass:(id)a6
{
  if (a5) {
    sub_23FA0();
  }
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = self;
  char v14 = sub_BB08(a3, a4, a6);

  swift_bridgeObjectRelease();
  return v14 & 1;
}

- (JDataclassOwner)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(JDataclassOwner *)&v3 init];
}

@end