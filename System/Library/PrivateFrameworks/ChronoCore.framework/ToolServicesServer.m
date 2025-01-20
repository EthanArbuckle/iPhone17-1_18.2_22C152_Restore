@interface ToolServicesServer
- (_TtC10ChronoCore18ToolServicesServer)init;
- (void)allCachedSnapshotURLsWithCompletion:(id)a3;
- (void)contentURLForActivityID:(id)a3 completion:(id)a4;
- (void)expireLocationGracePeriods;
- (void)extensionInfoForBundleIdentifier:(id)a3 completion:(id)a4;
- (void)extensionInfoWithCompletion:(id)a3;
- (void)fetchStateForItemWithIdentifier:(id)a3 completion:(id)a4;
- (void)fetchStateWithCompletion:(id)a3;
- (void)fetchWidgetSceneInfoWithCompletion:(id)a3;
- (void)listStateCaptureIdentifiersWithCompletion:(id)a3;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)refreshDescriptorsForExtensionBundleIdentifier:(id)a3 completion:(id)a4;
- (void)reloadControlsOfKind:(id)a3 containedIn:(id)a4 reason:(id)a5 completion:(id)a6;
- (void)reloadTimelinesOfKind:(id)a3 containedIn:(id)a4 reason:(id)a5 completion:(id)a6;
- (void)resetCaches:(id)a3 completion:(id)a4;
- (void)runMigrationReaper;
- (void)runReaper;
- (void)timelineForWidgetKey:(id)a3 completion:(id)a4;
- (void)widgetsWithTimelines:(id)a3;
@end

@implementation ToolServicesServer

- (_TtC10ChronoCore18ToolServicesServer)init
{
  result = (_TtC10ChronoCore18ToolServicesServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1DA9DD290((uint64_t)self + OBJC_IVAR____TtC10ChronoCore18ToolServicesServer_activityService, &qword_1EBE4ADF0);
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  sub_1DAAABD50(v8);

  swift_unknownObjectRelease();
}

- (void)refreshDescriptorsForExtensionBundleIdentifier:(id)a3 completion:(id)a4
{
}

- (void)resetCaches:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = (void *)swift_allocObject();
  v8[2] = a3;
  v8[3] = sub_1DAA8D57C;
  v8[4] = v7;
  v12[4] = sub_1DAAAF9C4;
  v12[5] = v8;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 1107296256;
  v12[2] = sub_1DA9E19DC;
  v12[3] = &block_descriptor_137;
  v9 = _Block_copy(v12);
  id v10 = a3;
  v11 = self;
  swift_retain();
  swift_release();
  BSDispatchMain();
  _Block_release(v9);

  swift_release();
}

- (void)expireLocationGracePeriods
{
}

- (void)allCachedSnapshotURLsWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_1DAAAFBE8;
  *(void *)(v6 + 24) = v5;
  v9[4] = sub_1DAAAF90C;
  v9[5] = v6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 1107296256;
  v9[2] = sub_1DA9E19DC;
  v9[3] = &block_descriptor_125;
  uint64_t v7 = _Block_copy(v9);
  id v8 = self;
  swift_retain();
  swift_release();
  BSDispatchMain();
  _Block_release(v7);

  swift_release();
}

- (void)listStateCaptureIdentifiersWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_1DAAAF8D8;
  *(void *)(v6 + 24) = v5;
  uint64_t v7 = self;
  swift_retain();
  sub_1DAAAD000(MEMORY[0x1E4FBC860], (void (*)(uint64_t *, id))sub_1DAAAF8E0, v6, (uint64_t)v7, (uint64_t)v7);

  swift_release();

  swift_release();
}

- (void)fetchStateWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_1DAAAFC8C;
  *(void *)(v6 + 24) = v5;
  uint64_t v7 = self;
  swift_retain();
  sub_1DAAAD284(0x3E6C696E3CLL, 0xE500000000000000, (void (*)(uint64_t *, void *))sub_1DAAAFC5C, v6, (uint64_t)v7, (uint64_t)v7);

  swift_release();

  swift_release();
}

- (void)fetchStateForItemWithIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = sub_1DAD27918();
  uint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = sub_1DAAAF82C;
  *(void *)(v10 + 24) = v9;
  v11 = self;
  swift_retain();
  sub_1DAAAD44C(0x3E6C696E3CLL, 0xE500000000000000, (void (*)(uint64_t *, void *))sub_1DAAAF86C, v10, (uint64_t)v11, (uint64_t)v11, v6, v8);

  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
}

- (void)extensionInfoForBundleIdentifier:(id)a3 completion:(id)a4
{
}

- (void)extensionInfoWithCompletion:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE48EB0);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  uint64_t v10 = sub_1DAD27C38();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = self;
  v11[5] = sub_1DAAAF584;
  v11[6] = v9;
  v12 = self;
  swift_retain();
  sub_1DACA6484((uint64_t)v7, (uint64_t)&unk_1EA8EEA10, (uint64_t)v11);

  swift_release();
  swift_release();
}

- (void)widgetsWithTimelines:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_1DAAAF53C;
  *(void *)(v6 + 24) = v5;
  uint64_t v7 = self;
  swift_retain();
  sub_1DAAAD62C(0, (void (*)(id *, id))sub_1DAAAF558, v6, (uint64_t)v7, (uint64_t)v7);

  swift_release();

  swift_release();
}

- (void)timelineForWidgetKey:(id)a3 completion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE438E0);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  uint64_t v12 = sub_1DAD21E08();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = self;
  id v14 = a3;
  sub_1DAAAD848(v9, (void (*)(unsigned char *, void *))sub_1DAAAFBE0, v11, (uint64_t)v13, (uint64_t)v13, v14);
  sub_1DA9DD290((uint64_t)v9, &qword_1EBE438E0);

  swift_release();
}

- (void)reloadControlsOfKind:(id)a3 containedIn:(id)a4 reason:(id)a5 completion:(id)a6
{
}

- (void)reloadTimelinesOfKind:(id)a3 containedIn:(id)a4 reason:(id)a5 completion:(id)a6
{
}

- (void)contentURLForActivityID:(id)a3 completion:(id)a4
{
}

- (void)runReaper
{
}

- (void)fetchWidgetSceneInfoWithCompletion:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE48EB0);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1DAD27C38();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EA8EE978;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EA8EE980;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_1DABBD44C((uint64_t)v7, (uint64_t)&unk_1EA8EF6B0, (uint64_t)v12);
  swift_release();
}

- (void)runMigrationReaper
{
}

@end