@interface WidgetCenterServerClient
- (void)_loadCurrentConfigurations:(id)a3;
- (void)_reloadAllTimelines:(id)a3;
- (void)_reloadTimelinesOfKind:(id)a3 completion:(id)a4;
- (void)_reloadTimelinesOfKind:(id)a3 inBundle:(id)a4 completion:(id)a5;
- (void)invalidateConfigurationRecommendationsInBundle:(id)a3 completion:(id)a4;
- (void)invalidateConfigurationRecommendationsWithCompletion:(id)a3;
- (void)invalidateRelevancesOfKind:(NSString *)a3 completionHandler:(id)a4;
- (void)invalidateRelevancesOfKind:(NSString *)a3 inBundle:(NSString *)a4 completionHandler:(id)a5;
- (void)widgetRelevanceArchiveForKind:(id)a3 inBundle:(id)a4 handler:(id)a5;
@end

@implementation WidgetCenterServerClient

- (void)invalidateConfigurationRecommendationsWithCompletion:(id)a3
{
}

- (void)invalidateConfigurationRecommendationsInBundle:(id)a3 completion:(id)a4
{
}

- (void)_loadCurrentConfigurations:(id)a3
{
}

- (void)_reloadTimelinesOfKind:(id)a3 completion:(id)a4
{
}

- (void)_reloadTimelinesOfKind:(id)a3 inBundle:(id)a4 completion:(id)a5
{
  v6 = _Block_copy(a5);
  sub_1DAD27918();
  sub_1DAD27918();
  sub_1DAD26EE8();
  _Block_copy(v6);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v7 = (void *)sub_1DAD26EC8();
  sub_1DABBEDAC(v7, (uint64_t)self, (uint64_t)v6);
  _Block_release(v6);

  _Block_release(v6);
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)_reloadAllTimelines:(id)a3
{
}

- (void)invalidateRelevancesOfKind:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE48EB0);
  MEMORY[0x1F4188790](v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1DAD27C38();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EA8EF6E0;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EA8EF6E8;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_1DABBD44C((uint64_t)v9, (uint64_t)&unk_1EA8EF6F0, (uint64_t)v14);
  swift_release();
}

- (void)invalidateRelevancesOfKind:(NSString *)a3 inBundle:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE48EB0);
  MEMORY[0x1F4188790](v9 - 8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_1DAD27C38();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EA8EF690;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EA8EE980;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  swift_retain();
  sub_1DABBD44C((uint64_t)v11, (uint64_t)&unk_1EA8EF6B0, (uint64_t)v16);
  swift_release();
}

- (void)widgetRelevanceArchiveForKind:(id)a3 inBundle:(id)a4 handler:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  uint64_t v8 = sub_1DAD27918();
  unint64_t v10 = v9;
  if (a4)
  {
    uint64_t v11 = sub_1DAD27918();
    a4 = v12;
  }
  else
  {
    uint64_t v11 = 0;
  }
  _Block_copy(v7);
  swift_retain();
  sub_1DABC0308(v8, v10, v11, (unint64_t)a4, (uint64_t)self, (void (**)(void, void, void))v7);
  _Block_release(v7);
  _Block_release(v7);
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end