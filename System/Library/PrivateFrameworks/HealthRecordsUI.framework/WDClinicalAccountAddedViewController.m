@interface WDClinicalAccountAddedViewController
- (WDClinicalAccountAddedViewController)initWithOnboardingSession:(id)a3 account:(id)a4;
- (WDClinicalAccountAddedViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (WDClinicalAccountAddedViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (id)dismissHandler;
- (void)hxui_primaryFooterButtonTapped;
- (void)setDismissHandler:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation WDClinicalAccountAddedViewController

- (id)dismissHandler
{
  v2 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR___WDClinicalAccountAddedViewController_dismissHandler);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = v2[1];
    aBlock[4] = *v2;
    aBlock[5] = v3;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1C224E544;
    aBlock[3] = &block_descriptor_50;
    v4 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)setDismissHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_1C235FF18;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___WDClinicalAccountAddedViewController_dismissHandler);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_1C221794C(v7);
}

- (WDClinicalAccountAddedViewController)initWithOnboardingSession:(id)a3 account:(id)a4
{
  AccountAddedViewController.init(onboardingSession:account:)(a3, a4);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1C23E5B78();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AccountAddedViewController();
  id v4 = v6.receiver;
  [(OBBaseWelcomeController *)&v6 viewDidAppear:v3];
  uint64_t v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  sub_1C24160D4((uint64_t)sub_1C23E75BC, v5);

  swift_release_n();
}

- (void)hxui_primaryFooterButtonTapped
{
  char v2 = *((unsigned char *)&self->super.super.super.super.super.isa
       + OBJC_IVAR___WDClinicalAccountAddedViewController_shouldPromptForDataCollection);
  BOOL v3 = self;
  sub_1C23E632C(v2);
}

- (WDClinicalAccountAddedViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (WDClinicalAccountAddedViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (WDClinicalAccountAddedViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (WDClinicalAccountAddedViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___WDClinicalAccountAddedViewController_onboardingSession));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___WDClinicalAccountAddedViewController_account));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___WDClinicalAccountAddedViewController_notificationsManager));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___WDClinicalAccountAddedViewController_primaryButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___WDClinicalAccountAddedViewController____lazy_storage___brandView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR___WDClinicalAccountAddedViewController_dismissHandler);
  sub_1C221794C(v3);
}

@end