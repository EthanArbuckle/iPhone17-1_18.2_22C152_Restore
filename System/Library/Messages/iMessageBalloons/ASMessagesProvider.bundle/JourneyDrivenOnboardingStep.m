@interface JourneyDrivenOnboardingStep
- (_TtC18ASMessagesProvider27JourneyDrivenOnboardingStep)init;
- (void)engagement:(id)a3 didUpdateEngagementRequest:(id)a4 placement:(id)a5 serviceType:(id)a6 completion:(id)a7;
- (void)engagement:(id)a3 didUpdateRequest:(id)a4 placement:(id)a5 serviceType:(id)a6;
- (void)engagement:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
- (void)engagement:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5;
@end

@implementation JourneyDrivenOnboardingStep

- (void)engagement:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5
{
}

- (void)engagement:(id)a3 didUpdateEngagementRequest:(id)a4 placement:(id)a5 serviceType:(id)a6 completion:(id)a7
{
  v10 = _Block_copy(a7);
  uint64_t v11 = sub_77D670();
  uint64_t v13 = v12;
  uint64_t v14 = sub_77D670();
  uint64_t v16 = v15;
  id v17 = a3;
  id v18 = a4;
  v19 = self;
  sub_14CF3C(v17, a4, v11, v13, v14, v16);
  _Block_release(v10);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)engagement:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
}

- (void)engagement:(id)a3 didUpdateRequest:(id)a4 placement:(id)a5 serviceType:(id)a6
{
  uint64_t v9 = sub_77D670();
  uint64_t v11 = v10;
  uint64_t v12 = sub_77D670();
  uint64_t v14 = v13;
  id v15 = a3;
  id v16 = a4;
  id v17 = self;
  sub_14C440(v15, a4, v9, v11, v12, v14);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (_TtC18ASMessagesProvider27JourneyDrivenOnboardingStep)init
{
  result = (_TtC18ASMessagesProvider27JourneyDrivenOnboardingStep *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider27JourneyDrivenOnboardingStep_onboardingEngagement));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider27JourneyDrivenOnboardingStep_engagementViewController);
}

@end