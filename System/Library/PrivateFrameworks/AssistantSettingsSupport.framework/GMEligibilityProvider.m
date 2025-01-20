@interface GMEligibilityProvider
+ (_TtC24AssistantSettingsSupport21GMEligibilityProvider)shared;
- (BOOL)activeEnabled;
- (BOOL)deviceSupported;
- (BOOL)onWaitlist;
- (BOOL)optedIn;
- (PSListController)presenter;
- (_TtC24AssistantSettingsSupport21GMEligibilityProvider)init;
- (_TtP24AssistantSettingsSupport29GMSpecifierControllerProcotol_)gmSpecifierController;
- (int64_t)eligibility;
- (int64_t)requestState;
- (void)fetchStatusAndForceDownloadIfNeededWithPresenter:(id)a3;
- (void)fetchStatusWithPresenter:(id)a3;
- (void)setEligibility:(int64_t)a3;
- (void)setPresenter:(id)a3;
- (void)setRequestState:(int64_t)a3;
- (void)updateADMState;
- (void)updateWithContext:(int64_t)a3;
@end

@implementation GMEligibilityProvider

- (int64_t)eligibility
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_eligibility);
  swift_beginAccess();
  return *v2;
}

- (void)setEligibility:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_eligibility);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (int64_t)requestState
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_requestState);
  swift_beginAccess();
  return *v2;
}

- (void)setRequestState:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_requestState);
  swift_beginAccess();
  int64_t *v4 = a3;
}

+ (_TtC24AssistantSettingsSupport21GMEligibilityProvider)shared
{
  if (qword_26AD53290 != -1) {
    swift_once();
  }
  v2 = (void *)qword_26AD53210;

  return (_TtC24AssistantSettingsSupport21GMEligibilityProvider *)v2;
}

- (PSListController)presenter
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_presenter);
  swift_beginAccess();
  return (PSListController *)*v2;
}

- (void)setPresenter:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_presenter);
  swift_beginAccess();
  v5 = *v4;
  int64_t *v4 = a3;
  id v6 = a3;
}

- (_TtP24AssistantSettingsSupport29GMSpecifierControllerProcotol_)gmSpecifierController
{
  v2 = (void *)swift_unknownObjectRetain();

  return (_TtP24AssistantSettingsSupport29GMSpecifierControllerProcotol_ *)v2;
}

- (BOOL)deviceSupported
{
  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_eligibility);
  swift_beginAccess();
  return (sub_220C6F424(*v2, (uint64_t)&unk_26D2AA978) & 1) == 0;
}

- (BOOL)activeEnabled
{
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_eligibility);
  swift_beginAccess();
  if (*v3 == 5) {
    return objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_gmSpecifierController), sel_featureOptInStatus);
  }
  else {
    return 0;
  }
}

- (BOOL)optedIn
{
  return objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_gmSpecifierController), sel_featureOptInStatus);
}

- (BOOL)onWaitlist
{
  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_eligibility);
  swift_beginAccess();
  return sub_220C6F424(*v2, (uint64_t)&unk_26D2AA9D8) & 1;
}

- (_TtC24AssistantSettingsSupport21GMEligibilityProvider)init
{
  return (_TtC24AssistantSettingsSupport21GMEligibilityProvider *)GMEligibilityProvider.init()();
}

- (void)fetchStatusAndForceDownloadIfNeededWithPresenter:(id)a3
{
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_shouldForceDownloadIfNeededOnFetch) = 1;
  id v5 = a3;
  id v6 = self;
  sub_220C6F800(a3);
}

- (void)fetchStatusWithPresenter:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_220C6F800(a3);
}

- (void)updateWithContext:(int64_t)a3
{
  v4 = self;
  sub_220C70954(a3);
}

- (void)updateADMState
{
  v2 = self;
  sub_220C70F54();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_presenter));

  swift_unknownObjectRelease();
}

@end