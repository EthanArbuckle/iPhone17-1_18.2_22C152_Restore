@interface HealthPlatformContextProvider.ObserverShim
- (_TtCC14HealthPlatform29HealthPlatformContextProvider12ObserverShim)init;
- (void)profileListDidUpdateForProfileStore:(id)a3;
@end

@implementation HealthPlatformContextProvider.ObserverShim

- (void)profileListDidUpdateForProfileStore:(id)a3
{
  Strong = (void *)swift_weakLoadStrong();
  if (Strong)
  {
    v6 = Strong;
    uint64_t v7 = Strong[5];
    uint64_t v8 = Strong[6];
    __swift_project_boxed_opaque_existential_1(Strong + 2, v7);
    v9 = *(void (**)(void (*)(uint64_t, void *), void *, uint64_t, uint64_t))(v8 + 24);
    id v10 = a3;
    v11 = self;
    swift_retain();
    v9(sub_1C274AEFC, v6, v7, v8);

    swift_release_n();
  }
}

- (_TtCC14HealthPlatform29HealthPlatformContextProvider12ObserverShim)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_weakInit();
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(HealthPlatformContextProvider.ObserverShim *)&v5 init];
}

- (void).cxx_destruct
{
}

@end