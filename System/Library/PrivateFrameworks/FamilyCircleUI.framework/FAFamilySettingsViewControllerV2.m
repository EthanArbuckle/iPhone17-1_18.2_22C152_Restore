@interface FAFamilySettingsViewControllerV2
- (UINavigationItem)navigationItem;
- (UIViewController)_presenter;
- (_TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2)initWithAppleAccount:(id)a3 grandSlamSigner:(id)a4 familyCircle:(id)a5 pictureStore:(id)a6 accountManager:(id)a7 peopleDiscoveryService:(id)a8;
- (_TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2)initWithCoder:(id)a3;
- (_TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtP14FamilyCircleUI40FAFamilySettingsViewControllerV2Delegate_)delegate;
- (void)addFamilyMemberButtonWasTapped;
- (void)amsHookWasCalled;
- (void)dealloc;
- (void)didSelectSubscriptionWithURL:(NSURL *)a3 completion:(id)a4;
- (void)didSelectSubscriptionWithURLMemberDetails:(NSURL *)a3 familyMemberDSID:(NSString *)a4 serviceName:(int64_t)a5 completion:(id)a6;
- (void)didTapAddRemoteGuardianFor:(id)a3;
- (void)handleDisclosureDismiss;
- (void)loadMemberDetailsWithMember:(FAFamilyMember *)a3 navigationController:(UINavigationController *)a4 completionHandler:(id)a5;
- (void)setDelegate:(id)a3;
- (void)set_presenter:(id)a3;
- (void)stopFamilySharing;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation FAFamilySettingsViewControllerV2

- (_TtP14FamilyCircleUI40FAFamilySettingsViewControllerV2Delegate_)delegate
{
  v2 = (char *)self + OBJC_IVAR____TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x21D47CB30](v2);
  return (_TtP14FamilyCircleUI40FAFamilySettingsViewControllerV2Delegate_ *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (UIViewController)_presenter
{
  v2 = (id *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2__presenter);
  swift_beginAccess();
  return (UIViewController *)*v2;
}

- (void)set_presenter:(id)a3
{
  v4 = (void **)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2__presenter);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (_TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2)initWithAppleAccount:(id)a3 grandSlamSigner:(id)a4 familyCircle:(id)a5 pictureStore:(id)a6 accountManager:(id)a7 peopleDiscoveryService:(id)a8
{
  swift_getObjectType();
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  swift_unknownObjectRetain();
  return (_TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2 *)sub_218A4E684(v15, v16, v17, v18, v19, (uint64_t)a8, (char *)self);
}

- (_TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_218A4F3F0();
}

- (UINavigationItem)navigationItem
{
  v2 = self;
  id v3 = sub_218A40C94();

  return (UINavigationItem *)v3;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_218A40DAC();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FAFamilySettingsViewControllerV2();
  id v4 = v7.receiver;
  [(FAFamilySettingsViewControllerV2 *)&v7 viewWillAppear:v3];
  sub_218A4436C();
  id v5 = objc_msgSend(v4, sel_navigationItem, v7.receiver, v7.super_class);
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_init);
  objc_msgSend(v5, sel_setTitleView_, v6);
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_218A42C84(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v4 = self;
  sub_218A44058(a3);
}

- (void)dealloc
{
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2_currentStateController);
  id v4 = self;
  if (v3) {
    objc_msgSend(v3, sel_cancel);
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FAFamilySettingsViewControllerV2();
  [(FAFamilySettingsViewControllerV2 *)&v5 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2_appleAccount));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2_grandSlamSigner));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2_pictureStore));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2_accountManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2_activityIndicatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2_activityIndicatorViewForAdd));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2_viewModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2_locationViewModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2_familySettingsHelper));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2_addMemberButton));
  sub_218A50450((uint64_t)self + OBJC_IVAR____TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2_currentStateController));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2_appleCashHandler));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2_appleCardFamilySettingsViewModel));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2_circleStore);
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2__presenter));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2_disclosureViewController);
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  id v8 = a3;
  objc_super v7 = self;
  sub_218A45488((uint64_t)a3, a4);
}

- (_TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC14FamilyCircleUI32FAFamilySettingsViewControllerV2 *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)didSelectSubscriptionWithURL:(NSURL *)a3 completion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AA85500);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_218CAF198();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_267BE8CB8;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_267BE8CC0;
  v14[5] = v13;
  id v15 = a3;
  id v16 = self;
  sub_218C50914((uint64_t)v9, (uint64_t)&unk_267BE8CC8, (uint64_t)v14);
  swift_release();
}

- (void)didSelectSubscriptionWithURLMemberDetails:(NSURL *)a3 familyMemberDSID:(NSString *)a4 serviceName:(int64_t)a5 completion:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AA85500);
  MEMORY[0x270FA5388](v11 - 8);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  id v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = sub_218CAF198();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_267BE8C98;
  v17[5] = v15;
  id v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_267BE8CA0;
  v18[5] = v17;
  id v19 = a3;
  v20 = a4;
  v21 = self;
  sub_218C50914((uint64_t)v13, (uint64_t)&unk_267BE8CA8, (uint64_t)v18);
  swift_release();
}

- (void)stopFamilySharing
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AA85500);
  MEMORY[0x270FA5388](v3 - 8);
  objc_super v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_218CAF198();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  sub_218CAF168();
  uint64_t v7 = self;
  uint64_t v8 = sub_218CAF158();
  v9 = (void *)swift_allocObject();
  uint64_t v10 = MEMORY[0x263F8F500];
  v9[2] = v8;
  v9[3] = v10;
  v9[4] = v7;
  sub_218A41DF4((uint64_t)v5, (uint64_t)&unk_267BE8C88, (uint64_t)v9);

  swift_release();
}

- (void)addFamilyMemberButtonWasTapped
{
  v2 = self;
  FAFamilySettingsViewControllerV2.addFamilyMemberButtonWasTapped()();
}

- (void)loadMemberDetailsWithMember:(FAFamilyMember *)a3 navigationController:(UINavigationController *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AA85500);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_218CAF198();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  id v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_267BE8C70;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_267BEF290;
  v16[5] = v15;
  uint64_t v17 = a3;
  id v18 = a4;
  id v19 = self;
  sub_218C50914((uint64_t)v11, (uint64_t)&unk_267BE8C80, (uint64_t)v16);
  swift_release();
}

- (void)didTapAddRemoteGuardianFor:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  _s14FamilyCircleUI32FAFamilySettingsViewControllerV2C23didTapAddRemoteGuardian3forySo0D6MemberC_tF_0();
}

- (void)amsHookWasCalled
{
  v2 = self;
  sub_218A4C208();
}

- (void)handleDisclosureDismiss
{
  v2 = self;
  sub_218A4C438();
}

@end