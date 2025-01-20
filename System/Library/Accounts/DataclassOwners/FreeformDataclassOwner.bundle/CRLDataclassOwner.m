@interface CRLDataclassOwner
+ (id)dataclasses;
- (BOOL)performAction:(id)a3 forAccount:(id)a4 withChildren:(id)a5 forDataclass:(id)a6;
- (_TtC22FreeformDataclassOwner17CRLDataclassOwner)init;
- (id)actionsForAddingAccount:(id)a3 forDataclass:(id)a4;
- (id)actionsForDeletingAccount:(id)a3 forDataclass:(id)a4;
- (id)actionsForDisablingDataclassOnAccount:(id)a3 forDataclass:(id)a4;
- (id)actionsForEnablingDataclassOnAccount:(id)a3 forDataclass:(id)a4;
@end

@implementation CRLDataclassOwner

- (_TtC22FreeformDataclassOwner17CRLDataclassOwner)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(CRLDataclassOwner *)&v3 init];
}

+ (id)dataclasses
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<ACAccountDataclass>);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_20650;
  objc_super v3 = (void *)ACAccountDataclassFreeform;
  *(void *)(v2 + 32) = ACAccountDataclassFreeform;
  type metadata accessor for ACAccountDataclass();
  id v4 = v3;
  v5.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return v5.super.isa;
}

- (id)actionsForDeletingAccount:(id)a3 forDataclass:(id)a4
{
  return @objc CRLDataclassOwner.actions(forDeleting:forDataclass:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(void))specialized CRLDataclassOwner.actionsForDisablingDataclass(on:forDataclass:));
}

- (id)actionsForAddingAccount:(id)a3 forDataclass:(id)a4
{
  return @objc CRLDataclassOwner.actions(forDeleting:forDataclass:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(void))specialized CRLDataclassOwner.actionsForEnablingDataclass(on:forDataclass:));
}

- (id)actionsForEnablingDataclassOnAccount:(id)a3 forDataclass:(id)a4
{
  return @objc CRLDataclassOwner.actionsForEnablingDataclass(on:forDataclass:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(void))specialized CRLDataclassOwner.actionsForEnablingDataclass(on:forDataclass:));
}

- (id)actionsForDisablingDataclassOnAccount:(id)a3 forDataclass:(id)a4
{
  return @objc CRLDataclassOwner.actionsForEnablingDataclass(on:forDataclass:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(void))specialized CRLDataclassOwner.actionsForDisablingDataclass(on:forDataclass:));
}

- (BOOL)performAction:(id)a3 forAccount:(id)a4 withChildren:(id)a5 forDataclass:(id)a6
{
  if (a5) {
    static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = self;
  unsigned __int8 v14 = specialized CRLDataclassOwner.perform(_:for:withChildren:forDataclass:)(a3);

  swift_bridgeObjectRelease();
  return v14 & 1;
}

@end