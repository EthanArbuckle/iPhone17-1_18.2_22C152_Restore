@interface SecureCloudActivationObserver
- (_TtC23ActivitySharingServices29SecureCloudActivationObserver)init;
- (void)activitySharingManagerActivated:(id)a3;
- (void)activitySharingManagerDeactivated:(id)a3;
@end

@implementation SecureCloudActivationObserver

- (void)activitySharingManagerActivated:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12F4D0);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2476B2BE8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = (void *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = self;
  v9[5] = a3;
  id v10 = a3;
  v11 = self;
  id v12 = v10;
  sub_247675354((uint64_t)v7, (uint64_t)&unk_26925AA70, (uint64_t)v9);

  swift_release();
}

- (void)activitySharingManagerDeactivated:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_247634D14();
}

- (_TtC23ActivitySharingServices29SecureCloudActivationObserver)init
{
  result = (_TtC23ActivitySharingServices29SecureCloudActivationObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end