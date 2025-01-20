@interface FeatureRequestHandler
- (_TtC25CloudSubscriptionFeatures21FeatureRequestHandler)init;
- (void)clearCFUGateWithFeature:(id)a3 completion:(id)a4;
- (void)clearCFUWithId:(id)a3 completion:(id)a4;
- (void)clearCacheAndNotify;
- (void)clearTicketCacheAndNotify;
- (void)forcePostCFUWithCompletion:(id)a3;
- (void)getFeatureEligibilityFor:(id)a3 bundleID:(id)a4 completion:(id)a5;
- (void)getSharedAlbumsStatusWithCompletion:(id)a3;
- (void)getTicketForFeature:(id)a3 completion:(id)a4;
- (void)getTicketStatusForFeature:(id)a3 completion:(id)a4;
- (void)getTicketStatusFromCacheForFeature:(id)a3 completion:(id)a4;
- (void)gmOptInToggleWithCompletion:(id)a3;
- (void)postCFUIfEligibleWithFeature:(id)a3 completion:(id)a4;
- (void)requestFeatureWithId:(id)a3 ignoreCache:(BOOL)a4 completion:(id)a5;
- (void)requestGeoClassificationFor:(id)a3 bundleID:(id)a4 altDSID:(id)a5 ignoreCache:(BOOL)a6 completion:(id)a7;
- (void)revalidateCFU;
- (void)signupForWaitlistWithFeatureID:(id)a3 completion:(id)a4;
- (void)waitlistStatusWithFeatureID:(id)a3 completion:(id)a4;
@end

@implementation FeatureRequestHandler

- (void)requestFeatureWithId:(id)a3 ignoreCache:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  v7 = _Block_copy(a5);
  uint64_t v8 = sub_1A8D59BF0();
  unint64_t v10 = v9;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v7;
  v12 = self;
  sub_1A8C892E8(v8, v10, v5, 1, (void (*)(void, void))sub_1A8C938F0, v11);
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)getFeatureEligibilityFor:(id)a3 bundleID:(id)a4 completion:(id)a5
{
  v6 = _Block_copy(a5);
  uint64_t v7 = sub_1A8D59BF0();
  uint64_t v9 = v8;
  uint64_t v10 = sub_1A8D59BF0();
  uint64_t v12 = v11;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v6;
  v14 = self;
  sub_1A8C856E0(v7, v9, v10, v12, (uint64_t)sub_1A8CCFDB4, v13);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)clearCacheAndNotify
{
  v2 = self;
  sub_1A8CC3B58();
}

- (void)requestGeoClassificationFor:(id)a3 bundleID:(id)a4 altDSID:(id)a5 ignoreCache:(BOOL)a6 completion:(id)a7
{
  uint64_t v9 = _Block_copy(a7);
  uint64_t v10 = sub_1A8D59BF0();
  unint64_t v12 = v11;
  uint64_t v13 = sub_1A8D59BF0();
  unint64_t v15 = v14;
  uint64_t v16 = sub_1A8D59BF0();
  uint64_t v18 = v17;
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v9;
  v20 = self;
  sub_1A8CC4FF8(v10, v12, v13, v15, v16, v18, a6, (uint64_t)sub_1A8CCFDD8, v19);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)getSharedAlbumsStatusWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  BOOL v5 = self;
  sub_1A8CCE210((uint64_t)v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)getTicketStatusForFeature:(id)a3 completion:(id)a4
{
  BOOL v5 = _Block_copy(a4);
  uint64_t v6 = sub_1A8D59BF0();
  unint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  uint64_t v10 = self;
  sub_1A8CC742C(v6, v8, (uint64_t)sub_1A8CCFDD8, v9, "Fetching ticket %s", (uint64_t)&unk_1EFF564A0, (uint64_t)&unk_1E979EBE0);
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)getTicketStatusFromCacheForFeature:(id)a3 completion:(id)a4
{
  BOOL v5 = _Block_copy(a4);
  uint64_t v6 = sub_1A8D59BF0();
  unint64_t v8 = v7;
  _Block_copy(v5);
  uint64_t v9 = self;
  sub_1A8CCE4AC(v6, v8, (uint64_t)v9, (uint64_t)v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)getTicketForFeature:(id)a3 completion:(id)a4
{
  BOOL v5 = _Block_copy(a4);
  uint64_t v6 = sub_1A8D59BF0();
  unint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  uint64_t v10 = self;
  sub_1A8CC742C(v6, v8, (uint64_t)sub_1A8CCFDD8, v9, "Getting or fetching ticket %s", (uint64_t)&unk_1EFF56428, (uint64_t)&unk_1E979EBC0);
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)clearCFUGateWithFeature:(id)a3 completion:(id)a4
{
}

- (void)clearCFUWithId:(id)a3 completion:(id)a4
{
  BOOL v5 = (void (**)(void *, void))_Block_copy(a4);
  uint64_t v6 = sub_1A8D59BF0();
  uint64_t v8 = v7;
  uint64_t v10 = self;
  if (_s25CloudSubscriptionFeatures8FollowUpCACSgycfC_0())
  {
    sub_1A8D2AB78(v6, v8);
    v5[2](v5, 0);
    swift_release();
  }
  else
  {
    id v9 = sub_1A8CA6B90(7);
    ((void (**)(void *, id))v5)[2](v5, v9);
  }
  _Block_release(v5);
  swift_bridgeObjectRelease();
}

- (void)postCFUIfEligibleWithFeature:(id)a3 completion:(id)a4
{
}

- (void)revalidateCFU
{
  v2 = self;
  sub_1A8CC9AE0();
}

- (void)gmOptInToggleWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v6 = self;
  id v5 = _s25CloudSubscriptionFeatures7GMOptInC7currentACSgvgZ_0();
  LOBYTE(self) = sub_1A8CB9D9C();

  (*((void (**)(void *, void, void))v4 + 2))(v4, self & 1, 0);
  _Block_release(v4);
}

- (void)forcePostCFUWithCompletion:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EAEA0);
  MEMORY[0x1F4188790](v5 - 8, v6);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  uint64_t v18 = self;
  _Block_copy(v9);
  uint64_t v11 = _s25CloudSubscriptionFeatures8FollowUpCACSgycfC_0();
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = sub_1A8D59E10();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v8, 1, 1, v13);
    unint64_t v14 = (void *)swift_allocObject();
    v14[2] = 0;
    v14[3] = 0;
    v14[4] = v12;
    v14[5] = sub_1A8CCF00C;
    v14[6] = v10;
    swift_retain();
    sub_1A8C84960((uint64_t)v8, (uint64_t)&unk_1E979EB20, (uint64_t)v14);
    swift_release();
    swift_release();
    _Block_release(v9);
  }
  else
  {
    id v15 = sub_1A8CA6B90(4);
    (*((void (**)(void *, id))v9 + 2))(v9, v15);
    swift_release();

    _Block_release(v9);
    uint64_t v16 = v18;
  }
}

- (void)signupForWaitlistWithFeatureID:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = sub_1A8D59BF0();
  unint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  uint64_t v10 = self;
  sub_1A8CCC06C(v6, v8, (uint64_t)sub_1A8CCFDD8, v9, "Signing up for ticket %{public}s", (uint64_t)&unk_1EFF56220, (uint64_t)&unk_1E979EAC8);
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)waitlistStatusWithFeatureID:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = sub_1A8D59BF0();
  unint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  uint64_t v10 = self;
  sub_1A8CCC06C(v6, v8, (uint64_t)sub_1A8CCFDD8, v9, "Getting status for ticket %{public}s", (uint64_t)&unk_1EFF561A8, (uint64_t)&unk_1E979EAA0);
  swift_release();
  swift_bridgeObjectRelease();
}

- (_TtC25CloudSubscriptionFeatures21FeatureRequestHandler)init
{
  result = (_TtC25CloudSubscriptionFeatures21FeatureRequestHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25CloudSubscriptionFeatures21FeatureRequestHandler_geoCache));
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC25CloudSubscriptionFeatures21FeatureRequestHandler_accountStore);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25CloudSubscriptionFeatures21FeatureRequestHandler_urlSession));
  v3 = (char *)self + OBJC_IVAR____TtC25CloudSubscriptionFeatures21FeatureRequestHandler_availabilityClient;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v3);
}

- (void)clearTicketCacheAndNotify
{
  if (qword_1EB5EAB40 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1A8D59A80();
  __swift_project_value_buffer(v0, (uint64_t)qword_1EB5EAB60);
  v1 = sub_1A8D59A60();
  os_log_type_t v2 = sub_1A8D59F00();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1A8C7F000, v1, v2, "Ticket cache clear message received.", v3, 2u);
    MEMORY[0x1AD0E6EB0](v3, -1, -1);
  }

  if (qword_1EB5E9828 != -1) {
    swift_once();
  }
  sub_1A8CBF5C8();
  sub_1A8CEAA00();
}

@end