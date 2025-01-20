@interface WDClinicalAccountOnboardingSession
- (BOOL)allowsCancellingClinicalOnboarding;
- (BOOL)shouldLaunchClinicalSharing;
- (HRProfile)profile;
- (WDClinicalAccountOnboardingSession)init;
- (WDClinicalAccountOnboardingSession)initWithContext:(int64_t)a3 options:(unint64_t)a4 sourceIdentifier:(id)a5 profile:(id)a6 analyticsManager:(id)a7;
- (id)makeDataTypeSelectionViewControllerForAccount:(id)a3;
- (id)makeNecessaryScopesNotPresentViewControllerForAccount:(id)a3;
- (int64_t)context;
- (unint64_t)options;
- (void)didAddStaticSampleAccount:(id)a3;
- (void)markShouldDismissOnboardingTileViewController;
- (void)onboardingWillDisappearWith:(id)a3 animated:(BOOL)a4;
- (void)persistEphemeralAccount:(id)a3 fromSharing:(BOOL)a4 completion:(id)a5;
- (void)submitClinicalSharingOnboardingStepAnalytic:(int64_t)a3;
@end

@implementation WDClinicalAccountOnboardingSession

- (id)makeDataTypeSelectionViewControllerForAccount:(id)a3
{
  id v5 = objc_allocWithZone((Class)type metadata accessor for ClinicalSharingDataTypeSelectionViewController(0));
  id v6 = a3;
  v7 = self;
  id v8 = sub_1C220F0DC((char *)v7, v6);

  return v8;
}

- (id)makeNecessaryScopesNotPresentViewControllerForAccount:(id)a3
{
  id v4 = objc_allocWithZone((Class)type metadata accessor for ClinicalSharingOnboardingNecessaryScopesNotPresentViewController());
  id v5 = sub_1C2441648(a3);
  return v5;
}

- (int64_t)context
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___WDClinicalAccountOnboardingSession_context);
}

- (unint64_t)options
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___WDClinicalAccountOnboardingSession_options);
}

- (HRProfile)profile
{
  return (HRProfile *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                              + OBJC_IVAR___WDClinicalAccountOnboardingSession_profile));
}

- (BOOL)shouldLaunchClinicalSharing
{
  return *(_DWORD *)((unsigned char *)&self->super.isa + OBJC_IVAR___WDClinicalAccountOnboardingSession_options) & 1;
}

- (BOOL)allowsCancellingClinicalOnboarding
{
  return *(Class *)((char *)&self->super.isa + OBJC_IVAR___WDClinicalAccountOnboardingSession_context) != (Class)2;
}

- (WDClinicalAccountOnboardingSession)initWithContext:(int64_t)a3 options:(unint64_t)a4 sourceIdentifier:(id)a5 profile:(id)a6 analyticsManager:(id)a7
{
  if (a5)
  {
    uint64_t v11 = sub_1C254F470();
    uint64_t v13 = v12;
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v13 = 0;
  }
  id v14 = a6;
  id v15 = a7;
  v16 = (WDClinicalAccountOnboardingSession *)sub_1C252C1B4(a3, a4, v11, v13, v14, v15);

  return v16;
}

- (void)submitClinicalSharingOnboardingStepAnalytic:(int64_t)a3
{
  id v4 = self;
  sub_1C2529874(a3);
}

- (void)persistEphemeralAccount:(id)a3 fromSharing:(BOOL)a4 completion:(id)a5
{
  sub_1C252C30C(0, (unint64_t *)&qword_1EBB6F490, MEMORY[0x1E4FBCFE8]);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = (char *)&v19 - v10;
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  uint64_t v14 = sub_1C254F840();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = 0;
  *(void *)(v15 + 24) = 0;
  *(void *)(v15 + 32) = self;
  *(void *)(v15 + 40) = a3;
  *(unsigned char *)(v15 + 48) = a4;
  *(void *)(v15 + 56) = sub_1C252CF1C;
  *(void *)(v15 + 64) = v13;
  id v16 = a3;
  v17 = self;
  id v18 = v16;
  swift_retain();
  sub_1C24D0A0C((uint64_t)v11, (uint64_t)&unk_1EA2E5258, v15);

  swift_release();
  swift_release();
}

- (void)didAddStaticSampleAccount:(id)a3
{
  sub_1C252C30C(0, (unint64_t *)&qword_1EBB6F490, MEMORY[0x1E4FBCFE8]);
  MEMORY[0x1F4188790](v4 - 8);
  id v6 = (char *)&v18 - v5;
  uint64_t v7 = sub_1C254CB40();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  uint64_t v13 = (char *)&v18 - v12;
  sub_1C254CB20();
  uint64_t v14 = sub_1C254F840();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v6, 1, 1, v14);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v10, v13, v7);
  unint64_t v15 = (*(unsigned __int8 *)(v8 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  id v16 = (char *)swift_allocObject();
  *((void *)v16 + 2) = 0;
  *((void *)v16 + 3) = 0;
  *((void *)v16 + 4) = self;
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v16[v15], v10, v7);
  v17 = self;
  sub_1C24D0A0C((uint64_t)v6, (uint64_t)&unk_1EA2E5250, (uint64_t)v16);

  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
}

- (void)markShouldDismissOnboardingTileViewController
{
  v2 = self;
  sub_1C252B094();
}

- (void)onboardingWillDisappearWith:(id)a3 animated:(BOOL)a4
{
  sub_1C252C30C(0, (unint64_t *)&qword_1EBB6F490, MEMORY[0x1E4FBCFE8]);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v15 - v8;
  uint64_t v10 = sub_1C254F840();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = 0;
  *(void *)(v11 + 24) = 0;
  *(void *)(v11 + 32) = self;
  *(unsigned char *)(v11 + 40) = a4;
  *(void *)(v11 + 48) = a3;
  id v12 = a3;
  uint64_t v13 = self;
  id v14 = v12;
  sub_1C24D0A0C((uint64_t)v9, (uint64_t)&unk_1EA2E5248, v11);

  swift_release();
}

- (WDClinicalAccountOnboardingSession)init
{
  result = (WDClinicalAccountOnboardingSession *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_release();
}

@end