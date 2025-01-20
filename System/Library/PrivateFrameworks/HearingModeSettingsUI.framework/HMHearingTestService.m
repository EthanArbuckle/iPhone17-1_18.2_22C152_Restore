@interface HMHearingTestService
- (UIViewController)hearingTestViewController;
- (_TtC21HearingModeSettingsUI20HMHearingTestService)init;
- (id)hearingTestViewControllerWithEnrollmentViewController:(id)a3;
- (void)didTapImportAudiogramLinkIn:(id)a3 completion:(id)a4;
@end

@implementation HMHearingTestService

- (UIViewController)hearingTestViewController
{
  v3 = self;
  id v4 = objc_allocWithZone(MEMORY[0x263F0A410]);
  v5 = self;
  id v6 = objc_msgSend(v4, sel_init);
  id v7 = objc_msgSend(v3, sel_makeStandardViewControllerWithHealthStore_entryPoint_, v6, 0);

  return (UIViewController *)v7;
}

- (id)hearingTestViewControllerWithEnrollmentViewController:(id)a3
{
  id v4 = *(void (**)(id))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.isa) + 0x70);
  id v5 = a3;
  id v6 = self;
  v4(v5);
  id v7 = objc_msgSend(self, sel_makeStandardViewControllerAudioGramImportFlowProvider_, v6);

  return v7;
}

- (void)didTapImportAudiogramLinkIn:(id)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  id v11 = a3;
  id v7 = self;
  id v8 = objc_msgSend(v11, sel_navigationController);
  if (v8)
  {
    v9 = v8;
    v10 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & (uint64_t)v7->super.isa) + 0x68))();
    objc_msgSend(v9, sel_pushViewController_animated_, v10, 1);
  }
  _Block_release(v6);
}

- (_TtC21HearingModeSettingsUI20HMHearingTestService)init
{
  uint64_t v3 = OBJC_IVAR____TtC21HearingModeSettingsUI20HMHearingTestService_enrollmentViewController;
  id v4 = objc_allocWithZone(MEMORY[0x263F82E10]);
  id v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)objc_msgSend(v4, sel_init);

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for HMHearingTestService();
  return [(HMHearingTestService *)&v7 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21HearingModeSettingsUI20HMHearingTestService_enrollmentViewController));
}

@end