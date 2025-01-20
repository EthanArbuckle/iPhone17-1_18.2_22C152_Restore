@interface HDMCExperienceStoreServer
+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5;
+ (Class)configurationClass;
+ (NSString)taskIdentifier;
- (HDMCExperienceStoreServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)experienceModelManagerDidUpdateModel;
- (void)remote_deleteAllPregnancySetupRecordsWithCompletion:(id)a3;
- (void)remote_deleteSetupRecord:(id)a3 completion:(id)a4;
- (void)remote_getCachedPregnancyModelWithCompletion:(id)a3;
- (void)remote_getExperienceModelWithCompletion:(id)a3;
- (void)remote_persistSetupRecord:(id)a3 completion:(id)a4;
- (void)remote_persistSetupRecord:(id)a3 mergeWith:(id)a4 completion:(id)a5;
- (void)remote_startObservingChangesWithCompletion:(id)a3;
- (void)remote_stopObservingChanges;
@end

@implementation HDMCExperienceStoreServer

- (id)exportedInterface
{
  id v2 = (id)HKMCExperienceStoreServerInterface();
  return v2;
}

- (id)remoteInterface
{
  id v2 = (id)HKMCExperienceStoreClientInterface();
  return v2;
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  sub_2257256E8(v7);

  return 1;
}

- (HDMCExperienceStoreServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  sub_22579F398();
  MEMORY[0x270FA5388]();
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22579F378();
  id v11 = a4;
  id v12 = a5;
  swift_unknownObjectRetain();
  return (HDMCExperienceStoreServer *)HDMCExperienceStoreServer.init(uuid:configuration:client:delegate:)((uint64_t)v10, a4, v12, (uint64_t)a6);
}

- (void)remote_startObservingChangesWithCompletion:(id)a3
{
}

- (void)remote_getExperienceModelWithCompletion:(id)a3
{
}

+ (Class)configurationClass
{
  sub_22572F19C(0, (unint64_t *)&unk_26ABF9A78);
  return (Class)swift_getObjCClassFromMetadata();
}

+ (NSString)taskIdentifier
{
  sub_22572F19C(0, &qword_26ABF9390);
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  v3 = NSStringFromClass(ObjCClassFromMetadata);
  sub_22579FAC8();

  v4 = (void *)sub_22579FA98();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (void)remote_stopObservingChanges
{
  id v2 = self;
  sub_22578D380();
}

- (void)remote_persistSetupRecord:(id)a3 completion:(id)a4
{
  uint64_t v7 = sub_22579F398();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = _Block_copy(a4);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  id v13 = a3;
  uint64_t v14 = self;
  id v15 = objc_msgSend(v13, sel_sampleUUID);
  sub_22579F378();

  sub_22578D8E4(v13, (uint64_t)v10, (void (*)(uint64_t, void))sub_22573C424, v12);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  swift_release();
}

- (void)remote_persistSetupRecord:(id)a3 mergeWith:(id)a4 completion:(id)a5
{
  uint64_t v8 = sub_22579F398();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  id v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  sub_22579F378();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  id v14 = a3;
  id v15 = self;
  sub_22578D8E4(v14, (uint64_t)v11, (void (*)(uint64_t, void))sub_22573C424, v13);

  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)remote_deleteSetupRecord:(id)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  uint64_t v9 = self;
  sub_22578E000(v8, (void (*)(uint64_t, void))sub_22573C424, v7);

  swift_release();
}

- (void)remote_getCachedPregnancyModelWithCompletion:(id)a3
{
}

- (void)remote_deleteAllPregnancySetupRecordsWithCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
}

- (void)experienceModelManagerDidUpdateModel
{
  id v2 = self;
  HDMCExperienceStoreServer.experienceModelManagerDidUpdateModel()();
}

@end