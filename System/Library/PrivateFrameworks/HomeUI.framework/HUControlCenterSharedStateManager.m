@interface HUControlCenterSharedStateManager
+ (HUControlCenterSharedStateManager)sharedManager;
- (HUControlCenterSharedStateManager)init;
- (void)bootstrap;
- (void)enterModuleViewWillAppear;
- (void)exitModuleViewDidDisappear;
@end

@implementation HUControlCenterSharedStateManager

+ (HUControlCenterSharedStateManager)sharedManager
{
  if (qword_1EBA46688 != -1) {
    swift_once();
  }
  os_unfair_lock_lock((os_unfair_lock_t)(qword_1EBA46678 + 16));
  if (qword_1EBA466A0 != -1) {
    swift_once();
  }
  v2 = (os_unfair_lock_s *)(qword_1EBA46678 + 16);
  id v3 = (id)qword_1EBA46690;
  os_unfair_lock_unlock(v2);

  return (HUControlCenterSharedStateManager *)v3;
}

- (void)enterModuleViewWillAppear
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___HUControlCenterSharedStateManager_isVisibleRefCounter);
  id v3 = self;
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 24));
  sub_1BE49477C((void *)(v2 + 16));
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 24));

  swift_release();
}

- (void)exitModuleViewDidDisappear
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___HUControlCenterSharedStateManager_isVisibleRefCounter);
  id v3 = self;
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 24));
  sub_1BE494090((uint64_t *)(v2 + 16));
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 24));

  swift_release();
}

- (HUControlCenterSharedStateManager)init
{
  uint64_t v3 = OBJC_IVAR___HUControlCenterSharedStateManager_isVisibleRefCounter;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA466B0);
  uint64_t v4 = swift_allocObject();
  *(_DWORD *)(v4 + 24) = 0;
  *(void *)(v4 + 16) = 0;
  *(Class *)((char *)&self->super.isa + v3) = (Class)v4;
  v6.receiver = self;
  v6.super_class = (Class)HUControlCenterSharedStateManager;
  return [(HUControlCenterSharedStateManager *)&v6 init];
}

- (void).cxx_destruct
{
}

- (void)bootstrap
{
  v0 = self;
  sub_1BE37E9E8(0, &qword_1EBA46668);
  v1 = (void *)sub_1BE9C52E8();
  objc_msgSend(v0, sel_setConfiguration_, v1);

  objc_msgSend(v0, sel_setAutomaticallySynchronizesHomeDataModel_, 0);
  id v2 = objc_msgSend(v0, sel_sharedDispatcher);
  objc_msgSend(v2, sel_warmup);

  id v3 = objc_msgSend(v0, sel_sharedDispatcher);
  id v4 = objc_msgSend(v3, sel_homeManager);

  if (qword_1EBA46580 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_1BE9C2C68();
  __swift_project_value_buffer(v5, (uint64_t)qword_1EBA46568);
  id v11 = v4;
  objc_super v6 = sub_1BE9C2C48();
  os_log_type_t v7 = sub_1BE9C5038();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = (void *)swift_slowAlloc();
    *(_DWORD *)v8 = 138412290;
    if (v11)
    {
      id v10 = v11;
      sub_1BE9C5568();
    }
    else
    {
      sub_1BE9C5568();
      id v4 = 0;
    }
    void *v9 = v4;

    _os_log_impl(&dword_1BE345000, v6, v7, "ControlCenterSharedStateManager is bootstrapped: %@", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA467B0);
    swift_arrayDestroy();
    MEMORY[0x1C1898CE0](v9, -1, -1);
    MEMORY[0x1C1898CE0](v8, -1, -1);
  }
  else
  {
  }
}

@end