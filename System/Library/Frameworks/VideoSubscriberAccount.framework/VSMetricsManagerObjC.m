@interface VSMetricsManagerObjC
+ (void)recordAccountUpdateWithAccount:(id)a3 source:(id)a4 updateType:(id)a5 completion:(id)a6;
+ (void)recordClickEventWithPage:(id)a3 pageType:(id)a4 target:(id)a5;
+ (void)recordEnterEventWithPage:(id)a3 pageType:(id)a4;
+ (void)recordExitEventWithPage:(id)a3 pageType:(id)a4;
+ (void)recordFederatedPunchoutEventWithError:(id)a3 metadata:(id)a4;
+ (void)recordInvalidTemplateErrorWithProviderAppAdamID:(id)a3;
+ (void)recordMetadataRequestWithProviderIdentifier:(id)a3 channelAdamID:(id)a4 fulfilledByProvider:(BOOL)a5 error:(id)a6;
+ (void)recordNowPlayingBrokenEventWithBundleID:(id)a3;
+ (void)recordSTBOptOutEventWithError:(id)a3;
+ (void)recordSignInEventWithProviderIdentifier:(id)a3 supportedProvider:(BOOL)a4 channelAdamID:(id)a5 signInType:(id)a6 error:(id)a7;
+ (void)recordSignOutEventWithProviderIdentifier:(id)a3;
- (VSMetricsManagerObjC)init;
@end

@implementation VSMetricsManagerObjC

+ (void)recordEnterEventWithPage:(id)a3 pageType:(id)a4
{
}

+ (void)recordExitEventWithPage:(id)a3 pageType:(id)a4
{
}

+ (void)recordClickEventWithPage:(id)a3 pageType:(id)a4 target:(id)a5
{
  uint64_t v5 = sub_1DA744A18();
  v7 = v6;
  uint64_t v8 = sub_1DA744A18();
  v10 = v9;
  uint64_t v11 = sub_1DA744A18();
  sub_1DA6F1950(v5, v7, v8, v10, v11, v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

+ (void)recordSignInEventWithProviderIdentifier:(id)a3 supportedProvider:(BOOL)a4 channelAdamID:(id)a5 signInType:(id)a6 error:(id)a7
{
  uint64_t v9 = sub_1DA744A18();
  uint64_t v11 = v10;
  if (a5)
  {
    uint64_t v12 = sub_1DA744A18();
    a5 = v13;
  }
  else
  {
    uint64_t v12 = 0;
  }
  uint64_t v14 = sub_1DA744A18();
  uint64_t v16 = v15;
  id v17 = a7;
  sub_1DA6F201C(v9, v11, v12, (uint64_t)a5, v14, v16, a7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

+ (void)recordSignOutEventWithProviderIdentifier:(id)a3
{
}

+ (void)recordSTBOptOutEventWithError:(id)a3
{
  id v4 = a3;
  sub_1DA6F25B8(a3);
}

+ (void)recordMetadataRequestWithProviderIdentifier:(id)a3 channelAdamID:(id)a4 fulfilledByProvider:(BOOL)a5 error:(id)a6
{
  uint64_t v8 = sub_1DA744A18();
  uint64_t v10 = v9;
  uint64_t v11 = sub_1DA744A18();
  uint64_t v13 = v12;
  id v14 = a6;
  sub_1DA6F28A0(v8, v10, v11, v13, a5, a6);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

+ (void)recordInvalidTemplateErrorWithProviderAppAdamID:(id)a3
{
}

+ (void)recordNowPlayingBrokenEventWithBundleID:(id)a3
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8E2818);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1DA744A18();
  uint64_t v8 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8E2820);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1DA74E200;
  *(unsigned char *)(inited + 32) = 0;
  *(void *)(inited + 40) = v6;
  *(void *)(inited + 48) = v8;
  swift_bridgeObjectRetain();
  sub_1DA6EDC08(inited);
  swift_bridgeObjectRelease();
  uint64_t v10 = sub_1DA744AD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v5, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = v6;
  v11[5] = v8;
  swift_bridgeObjectRetain();
  sub_1DA6EE60C((uint64_t)v5, (uint64_t)&unk_1EA8E2858, (uint64_t)v11);
  swift_bridgeObjectRelease();
  swift_release();
}

+ (void)recordFederatedPunchoutEventWithError:(id)a3 metadata:(id)a4
{
  uint64_t v5 = sub_1DA7449B8();
  id v6 = a3;
  sub_1DA6F2ED0(a3, v5);

  swift_bridgeObjectRelease();
}

+ (void)recordAccountUpdateWithAccount:(id)a3 source:(id)a4 updateType:(id)a5 completion:(id)a6
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8E2818);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _Block_copy(a6);
  uint64_t v12 = sub_1DA744A18();
  uint64_t v14 = v13;
  uint64_t v15 = sub_1DA744A18();
  uint64_t v17 = v16;
  if (v11)
  {
    *(void *)(swift_allocObject() + 16) = v11;
    uint64_t v11 = sub_1DA6F3DB4;
  }
  v18 = (VSUserAccount *)a3;
  VSUserAccount.init(_:)((VideoSubscriberAccount::VSUserAccount *)&v23, v18);
  uint64_t v19 = v23;
  uint64_t v20 = sub_1DA744AD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v10, 1, 1, v20);
  v21 = (void *)swift_allocObject();
  v21[2] = 0;
  v21[3] = 0;
  v21[4] = v19;
  v21[5] = v12;
  v21[6] = v14;
  v21[7] = v15;
  v21[8] = v17;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1DA6EE60C((uint64_t)v10, (uint64_t)&unk_1EA8E2850, (uint64_t)v21);
  swift_release();
  sub_1DA6F3D6C((uint64_t)v11);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (VSMetricsManagerObjC)init
{
  v3.receiver = self;
  v3.super_class = (Class)VSMetricsManagerObjC;
  return [(VSMetricsManagerObjC *)&v3 init];
}

@end