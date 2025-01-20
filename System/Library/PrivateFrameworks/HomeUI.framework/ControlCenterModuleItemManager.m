@interface ControlCenterModuleItemManager
- (BOOL)_shouldBuildItemProvidersAndModulesForNilHome;
- (HMHome)home;
- (_TtC6HomeUI30ControlCenterModuleItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildItemProvidersWithoutHome;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)_homeFuture;
- (id)_itemsToHideInSet:(id)a3;
- (id)_updateResultsForItems:(id)a3 context:(id)a4;
- (void)executionEnvironmentDidEnterBackground:(id)a3;
- (void)executionEnvironmentWillEnterForeground:(id)a3;
- (void)home:(id)a3 didRemoveAccessory:(id)a4;
- (void)home:(id)a3 didRemoveActionSet:(id)a4;
- (void)home:(id)a3 didRemoveMediaSystem:(id)a4;
- (void)home:(id)a3 didRemoveServiceGroup:(id)a4;
- (void)homeManagerDidFinishInitialDatabaseLoad:(id)a3;
- (void)setHome:(id)a3;
@end

@implementation ControlCenterModuleItemManager

- (BOOL)_shouldBuildItemProvidersAndModulesForNilHome
{
  return 1;
}

- (id)_buildItemProvidersWithoutHome
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA45A00);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1BEA0E6D0;
  v4 = self;
  if ((MEMORY[0x1E4FBC860] & 0xC000000000000000) != 0 && sub_1BE9C5AA8()) {
    sub_1BE39CC9C(MEMORY[0x1E4FBC860]);
  }
  id v5 = objc_allocWithZone(MEMORY[0x1E4F695C8]);
  sub_1BE37E9E8(0, (unint64_t *)&qword_1EBA46790);
  sub_1BE3A253C();
  v6 = (void *)sub_1BE9C4E58();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(v5, sel_initWithItems_, v6);

  *(void *)(v3 + 32) = v7;
  sub_1BE9C4C38();

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBA45750);
  v8 = (void *)sub_1BE9C4BF8();
  swift_bridgeObjectRelease();

  return v8;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1BE5516F8(v4);

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBA45750);
  v6 = (void *)sub_1BE9C4BF8();
  swift_bridgeObjectRelease();

  return v6;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  sub_1BE37E9E8(0, (unint64_t *)&qword_1EBA46790);
  sub_1BE3A253C();
  uint64_t v4 = sub_1BE9C4E88();
  id v5 = self;
  sub_1BE552440(v4);

  swift_bridgeObjectRelease();
  sub_1BE37E9E8(0, (unint64_t *)&unk_1EBA45730);
  v6 = (void *)sub_1BE9C4BF8();
  swift_bridgeObjectRelease();

  return v6;
}

- (id)_itemsToHideInSet:(id)a3
{
  sub_1BE37E9E8(0, (unint64_t *)&qword_1EBA46790);
  sub_1BE3A253C();
  uint64_t v4 = sub_1BE9C4E88();
  id v5 = self;
  sub_1BE552838(v4);

  swift_bridgeObjectRelease();
  v6 = (void *)sub_1BE9C4E58();
  swift_bridgeObjectRelease();

  return v6;
}

- (HMHome)home
{
  uint64_t v3 = self;
  uint64_t v4 = self;
  id v5 = objc_msgSend(v3, sel_sharedDispatcher);
  id v6 = objc_msgSend(v5, sel_homeManager);

  if (v6)
  {
    v9.receiver = v4;
    v9.super_class = (Class)type metadata accessor for ControlCenterModuleItemManager();
    id v7 = [(HFItemManager *)&v9 home];
  }
  else
  {

    id v7 = 0;
  }

  return v7;
}

- (void)setHome:(id)a3
{
  id v5 = self;
  id v6 = self;
  id v9 = a3;
  id v7 = objc_msgSend(v5, sel_sharedDispatcher);
  id v8 = objc_msgSend(v7, sel_homeManager);

  if (v8)
  {
    v10.receiver = v6;
    v10.super_class = (Class)type metadata accessor for ControlCenterModuleItemManager();
    [(HFItemManager *)&v10 setHome:v9];
  }
  else
  {
  }
}

- (id)_homeFuture
{
  v2 = self;
  id v3 = sub_1BE553D0C();

  return v3;
}

- (void)homeManagerDidFinishInitialDatabaseLoad:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1BE553FD4(v4);
}

- (id)_updateResultsForItems:(id)a3 context:(id)a4
{
  sub_1BE37E9E8(0, (unint64_t *)&qword_1EBA46790);
  sub_1BE3A253C();
  uint64_t v6 = sub_1BE9C4E88();
  id v7 = a4;
  id v8 = self;
  id v9 = sub_1BE5550FC(v6, v7);

  swift_bridgeObjectRelease();

  return v9;
}

- (void)executionEnvironmentWillEnterForeground:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1BE5555EC((uint64_t)v4);
}

- (void)executionEnvironmentDidEnterBackground:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA113010);
  MEMORY[0x1F4188790](v5 - 8);
  id v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = a3;
  id v9 = self;
  sub_1BE9C10C8();
  uint64_t v10 = sub_1BE9C10E8();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 0, 1, v10);
  uint64_t v11 = (uint64_t)v9 + OBJC_IVAR____TtC6HomeUI30ControlCenterModuleItemManager_lastBackgroundTime;
  swift_beginAccess();
  sub_1BE467DDC((uint64_t)v7, v11);
  swift_endAccess();
  v12 = (objc_class *)type metadata accessor for ControlCenterModuleItemManager();
  v14.receiver = v9;
  v14.super_class = v12;
  [(HFItemManager *)&v14 executionEnvironmentDidEnterBackground:v8];
}

- (void)home:(id)a3 didRemoveAccessory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1BE555EDC((uint64_t)v6, v7, (SEL *)&selRef_home_didRemoveAccessory_, (uint64_t (*)(uint64_t, id))sub_1BE5572AC);
}

- (void)home:(id)a3 didRemoveMediaSystem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1BE555D40((uint64_t)v6, v7, (SEL *)&selRef_home_didRemoveMediaSystem_);
}

- (void)home:(id)a3 didRemoveServiceGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1BE555D40((uint64_t)v6, v7, (SEL *)&selRef_home_didRemoveServiceGroup_);
}

- (void)home:(id)a3 didRemoveActionSet:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1BE555EDC((uint64_t)v6, v7, (SEL *)&selRef_home_didRemoveActionSet_, (uint64_t (*)(uint64_t, id))sub_1BE557AAC);
}

- (_TtC6HomeUI30ControlCenterModuleItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  swift_unknownObjectRetain();
  id v5 = a4;
  result = (_TtC6HomeUI30ControlCenterModuleItemManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC6HomeUI30ControlCenterModuleItemManager_nonEmptyConfigurationFuture));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC6HomeUI30ControlCenterModuleItemManager_predictionManager));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC6HomeUI30ControlCenterModuleItemManager_customizedItemProvider));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC6HomeUI30ControlCenterModuleItemManager_recommendedItemProvider));
  sub_1BE39DA0C((uint64_t)self + OBJC_IVAR____TtC6HomeUI30ControlCenterModuleItemManager_lastBackgroundTime, (uint64_t *)&unk_1EA113010);
}

@end