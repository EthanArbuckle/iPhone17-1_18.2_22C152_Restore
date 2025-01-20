@interface CHSControlService
+ (CHSControlService)sharedInstance;
- (CHSControlService)init;
- (void)allControlConfigurationsByHostWithCompletion:(id)a3;
- (void)fetchControlDescriptorsForExtensionBundleIdentifier:(id)a3 userInitiated:(BOOL)a4 reason:(id)a5 completion:(id)a6;
- (void)reloadControlsForExtension:(id)a3 kind:(id)a4 reason:(id)a5;
@end

@implementation CHSControlService

+ (CHSControlService)sharedInstance
{
  if (qword_1E92AA388 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1E92AA390;
  return (CHSControlService *)v2;
}

- (void)reloadControlsForExtension:(id)a3 kind:(id)a4 reason:(id)a5
{
  uint64_t v7 = sub_190D41978();
  unint64_t v9 = v8;
  if (a4)
  {
    uint64_t v10 = sub_190D41978();
    a4 = v11;
  }
  else
  {
    uint64_t v10 = 0;
  }
  uint64_t v12 = sub_190D41978();
  unint64_t v14 = v13;
  v15 = self;
  _sSo17CHSControlServiceC14ChronoServicesE14reloadControls12forExtension4kind6reasonySS_SSSgSStF_0(v7, v9, v10, (unint64_t)a4, v12, v14);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (CHSControlService)init
{
  v3.receiver = self;
  v3.super_class = (Class)CHSControlService;
  return [(CHSControlService *)&v3 init];
}

- (void)allControlConfigurationsByHostWithCompletion:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92AC330);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  uint64_t v10 = sub_190D41C88();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = self;
  v11[5] = sub_190D19860;
  v11[6] = v9;
  uint64_t v12 = self;
  swift_retain();
  sub_190D183D0((uint64_t)v7, (uint64_t)&unk_1E92AC358, (uint64_t)v11);

  swift_release();
  swift_release();
}

- (void)fetchControlDescriptorsForExtensionBundleIdentifier:(id)a3 userInitiated:(BOOL)a4 reason:(id)a5 completion:(id)a6
{
  BOOL v6 = a4;
  unint64_t v8 = _Block_copy(a6);
  uint64_t v9 = sub_190D41978();
  unint64_t v11 = v10;
  uint64_t v12 = sub_190D41978();
  unint64_t v14 = v13;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v8;
  v16 = self;
  CHSControlService.fetchControlDescriptors(forExtensionBundleIdentifier:userInitiated:reason:completion:)(v9, v11, v6, v12, v14, (uint64_t)sub_190D19858, v15);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

@end