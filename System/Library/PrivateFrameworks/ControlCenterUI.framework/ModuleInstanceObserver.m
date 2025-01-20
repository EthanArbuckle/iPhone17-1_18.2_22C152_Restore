@interface ModuleInstanceObserver
- (_TtC15ControlCenterUI22ModuleInstanceObserver)init;
- (void)moduleInstancesChangedForModuleInstanceManager:(id)a3;
- (void)orderedEnabledModuleIdentifiersChangedForSettingsManager:(id)a3;
@end

@implementation ModuleInstanceObserver

- (_TtC15ControlCenterUI22ModuleInstanceObserver)init
{
  result = (_TtC15ControlCenterUI22ModuleInstanceObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();

  swift_unknownObjectWeakDestroy();
}

- (void)orderedEnabledModuleIdentifiersChangedForSettingsManager:(id)a3
{
  uint64_t v5 = MEMORY[0x1D947FB60]((char *)self + OBJC_IVAR____TtC15ControlCenterUI22ModuleInstanceObserver_moduleInstanceManager, a2);
  if (v5)
  {
    v6 = (void *)v5;
    id v7 = a3;
    v8 = self;
    id v9 = objc_msgSend(v7, sel_orderedEnabledModuleIdentifiersFromSettingsApp);
    uint64_t v10 = sub_1D7BB72F8();

    sub_1D7B63D84(v10);
    swift_bridgeObjectRelease();
    id v11 = (id)sub_1D7BB7398();
    swift_bridgeObjectRelease();
    objc_msgSend(v6, sel_setEnabledModuleIdentifiersFromSettingsApp_, v11);
  }
}

- (void)moduleInstancesChangedForModuleInstanceManager:(id)a3
{
  uint64_t v5 = MEMORY[0x1D947FB60]((char *)self + OBJC_IVAR____TtC15ControlCenterUI22ModuleInstanceObserver_pagingViewController, a2);
  if (v5)
  {
    id v8 = (id)v5;
    id v6 = a3;
    id v7 = self;
    sub_1D7B88F54();
  }
}

@end