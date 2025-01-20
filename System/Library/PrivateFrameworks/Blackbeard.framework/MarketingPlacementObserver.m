@interface MarketingPlacementObserver
- (_TtC24FitnessEngagementServiceP33_BEC6C0704903DD2FBF3B8EA6FBD9907426MarketingPlacementObserver)init;
- (void)engagement:(AMSEngagement *)a3 didUpdateEngagementRequest:(AMSEngagementRequest *)a4 placement:(NSString *)a5 serviceType:(NSString *)a6 completion:(id)a7;
- (void)engagement:(AMSEngagement *)a3 handleDialogRequest:(AMSDialogRequest *)a4 completion:(id)a5;
- (void)engagement:(AMSEngagement *)a3 handleEngagementRequest:(AMSEngagementRequest *)a4 completion:(id)a5;
- (void)engagement:(id)a3 didUpdateRequest:(id)a4 placement:(id)a5 serviceType:(id)a6;
@end

@implementation MarketingPlacementObserver

- (_TtC24FitnessEngagementServiceP33_BEC6C0704903DD2FBF3B8EA6FBD9907426MarketingPlacementObserver)init
{
  result = (_TtC24FitnessEngagementServiceP33_BEC6C0704903DD2FBF3B8EA6FBD9907426MarketingPlacementObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_248B95DD4(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC24FitnessEngagementServiceP33_BEC6C0704903DD2FBF3B8EA6FBD9907426MarketingPlacementObserver_onRequestUpdateForDialogPlacement));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC24FitnessEngagementServiceP33_BEC6C0704903DD2FBF3B8EA6FBD9907426MarketingPlacementObserver_onRequestUpdateForEngagementPlacement);
  sub_248B95DD4(v3);
}

- (void)engagement:(id)a3 didUpdateRequest:(id)a4 placement:(id)a5 serviceType:(id)a6
{
  uint64_t v9 = sub_24925DA70();
  unint64_t v11 = v10;
  id v12 = a3;
  id v13 = a4;
  v14 = self;
  sub_2492155A0(a4, v9, v11);

  swift_bridgeObjectRelease();
}

- (void)engagement:(AMSEngagement *)a3 didUpdateEngagementRequest:(AMSEngagementRequest *)a4 placement:(NSString *)a5 serviceType:(NSString *)a6 completion:(id)a7
{
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1522C0);
  MEMORY[0x270FA5388](v13 - 8);
  v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _Block_copy(a7);
  v17 = (void *)swift_allocObject();
  v17[2] = a3;
  v17[3] = a4;
  v17[4] = a5;
  v17[5] = a6;
  v17[6] = v16;
  v17[7] = self;
  uint64_t v18 = sub_24925DE80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v15, 1, 1, v18);
  v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_269682F58;
  v19[5] = v17;
  v20 = (void *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_269682F60;
  v20[5] = v19;
  v21 = a3;
  v22 = a4;
  v23 = a5;
  v24 = a6;
  v25 = self;
  sub_248DE34B8((uint64_t)v15, (uint64_t)&unk_269682F68, (uint64_t)v20);
  swift_release();
}

- (void)engagement:(AMSEngagement *)a3 handleDialogRequest:(AMSDialogRequest *)a4 completion:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1522C0);
  MEMORY[0x270FA5388](v9 - 8);
  unint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_24925DE80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_269682F38;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_269682F40;
  v16[5] = v15;
  v17 = a3;
  uint64_t v18 = a4;
  v19 = self;
  sub_248DE34B8((uint64_t)v11, (uint64_t)&unk_269682F48, (uint64_t)v16);
  swift_release();
}

- (void)engagement:(AMSEngagement *)a3 handleEngagementRequest:(AMSEngagementRequest *)a4 completion:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1522C0);
  MEMORY[0x270FA5388](v9 - 8);
  unint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_24925DE80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_269682EF0;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_269682F00;
  v16[5] = v15;
  v17 = a3;
  uint64_t v18 = a4;
  v19 = self;
  sub_248DE34B8((uint64_t)v11, (uint64_t)&unk_269682F10, (uint64_t)v16);
  swift_release();
}

@end