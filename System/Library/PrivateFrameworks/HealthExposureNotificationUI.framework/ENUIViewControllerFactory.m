@interface ENUIViewControllerFactory
+ (ENUIViewControllerFactory)sharedInstance;
- (ENUIViewControllerFactory)init;
- (UIViewController)inflightOnboardingStack;
- (UIViewController)inflightPreAuthorizationStack;
- (UIViewController)inflightVerificationStack;
- (id)createAnalyticsConsentStackForAgencyModel:(id)a3 exposureManager:(id)a4 completion:(id)a5;
- (id)createKeyReleaseDialogueWithBundleIdentifier:(id)a3 region:(id)a4 completion:(id)a5;
- (id)createOnboardingStackForAgencyModel:(id)a3 exposureManager:(id)a4 fromAvailabilityAlert:(BOOL)a5 fromDeepLink:(BOOL)a6 subsequentFlow:(int64_t)a7 completion:(id)a8;
- (id)createPreApprovalDialogueWithBundleIdentifier:(id)a3 region:(id)a4 completion:(id)a5;
- (id)createPreAuthorizationStackForAgencyModel:(id)a3 exposureManager:(id)a4 completion:(id)a5;
- (id)createTurndownStackWithEnteredFromMainScreen:(BOOL)a3 completion:(id)a4;
- (id)createVerificationStackForAgencyModel:(id)a3 exposureManager:(id)a4 sessionIdentifier:(id)a5 reportType:(unsigned int)a6 enteredFromMainScreen:(BOOL)a7 completion:(id)a8;
- (void)setInflightOnboardingStack:(id)a3;
- (void)setInflightPreAuthorizationStack:(id)a3;
- (void)setInflightVerificationStack:(id)a3;
@end

@implementation ENUIViewControllerFactory

+ (ENUIViewControllerFactory)sharedInstance
{
  if (qword_26AF0EF30 != -1) {
    swift_once();
  }
  v2 = (void *)static ViewControllerFactory.shared;

  return (ENUIViewControllerFactory *)v2;
}

- (UIViewController)inflightOnboardingStack
{
  return (UIViewController *)sub_22940B650((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ENUIViewControllerFactory_inflightOnboardingStack);
}

- (void)setInflightOnboardingStack:(id)a3
{
}

- (UIViewController)inflightVerificationStack
{
  return (UIViewController *)sub_22940B650((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ENUIViewControllerFactory_inflightVerificationStack);
}

- (void)setInflightVerificationStack:(id)a3
{
}

- (UIViewController)inflightPreAuthorizationStack
{
  return (UIViewController *)sub_22940B650((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ENUIViewControllerFactory_inflightPreAuthorizationStack);
}

- (void)setInflightPreAuthorizationStack:(id)a3
{
}

- (id)createOnboardingStackForAgencyModel:(id)a3 exposureManager:(id)a4 fromAvailabilityAlert:(BOOL)a5 fromDeepLink:(BOOL)a6 subsequentFlow:(int64_t)a7 completion:(id)a8
{
  v14 = _Block_copy(a8);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v14;
  id v16 = a3;
  swift_unknownObjectRetain();
  v17 = self;
  id v18 = ViewControllerFactory.createOnboardingStack(forAgencyModel:exposureManager:fromAvailabilityAlert:fromDeepLink:subsequentFlow:completion:)(a3, (uint64_t)a4, a5, a6, a7, (uint64_t)sub_2293DFD78, v15);

  swift_unknownObjectRelease();
  swift_release();

  return v18;
}

- (id)createAnalyticsConsentStackForAgencyModel:(id)a3 exposureManager:(id)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  swift_unknownObjectRetain();
  v11 = self;
  id v12 = _s28HealthExposureNotificationUI21ViewControllerFactoryC27createAnalyticsConsentStack14forAgencyModel15exposureManager10completionSo06UIViewF0CAA010ENUIPublicamN0C_AA0B9Notifying_pyAA10FlowResultOctF_0(v10, (uint64_t)a4, (uint64_t)sub_2293DFD78, v9);

  swift_unknownObjectRelease();
  swift_release();

  return v12;
}

- (id)createVerificationStackForAgencyModel:(id)a3 exposureManager:(id)a4 sessionIdentifier:(id)a5 reportType:(unsigned int)a6 enteredFromMainScreen:(BOOL)a7 completion:(id)a8
{
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268316DF0);
  MEMORY[0x270FA5388](v15 - 8);
  v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v18 = _Block_copy(a8);
  if (a5)
  {
    sub_229418E98();
    uint64_t v19 = sub_229418EA8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v17, 0, 1, v19);
  }
  else
  {
    uint64_t v20 = sub_229418EA8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v17, 1, 1, v20);
  }
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = v18;
  id v22 = a3;
  swift_unknownObjectRetain();
  v23 = self;
  id v24 = ViewControllerFactory.createVerificationStack(forAgencyModel:exposureManager:sessionIdentifier:reportType:enteredFromMainScreen:completion:)(v22, (uint64_t)a4, (uint64_t)v17, a6, a7, (uint64_t)sub_2293DFD78, v21);

  swift_unknownObjectRelease();
  swift_release();
  sub_22940D194((uint64_t)v17);

  return v24;
}

- (id)createPreAuthorizationStackForAgencyModel:(id)a3 exposureManager:(id)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  swift_unknownObjectRetain();
  v11 = self;
  id v12 = ViewControllerFactory.createPreAuthorizationStack(forAgencyModel:exposureManager:completion:)(v10, (uint64_t)a4, (uint64_t)sub_2293DF4DC, v9);

  swift_unknownObjectRelease();
  swift_release();

  return v12;
}

- (id)createTurndownStackWithEnteredFromMainScreen:(BOOL)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  v6 = self;
  id v7 = _s28HealthExposureNotificationUI21ViewControllerFactoryC19createTurndownStack21enteredFromMainScreen10completionSo06UIViewF0CSgSb_yAA10FlowResultOctF_0();
  _Block_release(v5);

  return v7;
}

- (id)createKeyReleaseDialogueWithBundleIdentifier:(id)a3 region:(id)a4 completion:(id)a5
{
  id v7 = _Block_copy(a5);
  uint64_t v8 = sub_2294191A8();
  uint64_t v10 = v9;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v7;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = sub_22940D1F8;
  *(void *)(v12 + 24) = v11;
  id v13 = a4;
  v14 = self;
  swift_retain();
  sub_2293F5BC8((uint64_t)v17);
  objc_allocWithZone((Class)type metadata accessor for KeyReleaseAuthorizationViewController());
  swift_bridgeObjectRetain();
  id v15 = sub_229397978(v17, v8, v10, a4, (uint64_t)sub_22940D1F4, v12);

  swift_release();
  sub_229397480((void **)v17);
  objc_msgSend(v15, sel_setModalPresentationStyle_, 0);

  swift_bridgeObjectRelease();
  swift_release();

  return v15;
}

- (id)createPreApprovalDialogueWithBundleIdentifier:(id)a3 region:(id)a4 completion:(id)a5
{
  id v7 = _Block_copy(a5);
  uint64_t v8 = sub_2294191A8();
  uint64_t v10 = v9;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v7;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = sub_22940D17C;
  *(void *)(v12 + 24) = v11;
  id v13 = a4;
  v14 = self;
  swift_retain();
  sub_229396D38((uint64_t)v18);
  objc_allocWithZone((Class)type metadata accessor for PreApprovalViewController());
  id v15 = v13;
  swift_bridgeObjectRetain();
  id v16 = sub_229397130(v18, v8, v10, a4, (uint64_t)sub_22940D1F4, v12);

  swift_release();
  sub_229397480((void **)v18);
  objc_msgSend(v16, sel_setModalPresentationStyle_, 0);

  swift_bridgeObjectRelease();
  swift_release();

  return v16;
}

- (ENUIViewControllerFactory)init
{
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ViewControllerFactory();
  return [(ENUIViewControllerFactory *)&v4 init];
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();

  swift_unknownObjectWeakDestroy();
}

@end