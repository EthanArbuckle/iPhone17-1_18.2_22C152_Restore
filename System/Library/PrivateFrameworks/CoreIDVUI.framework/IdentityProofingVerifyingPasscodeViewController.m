@interface IdentityProofingVerifyingPasscodeViewController
- (_TtC9CoreIDVUI47IdentityProofingVerifyingPasscodeViewController)initWithCoder:(id)a3;
- (_TtC9CoreIDVUI47IdentityProofingVerifyingPasscodeViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)configureFonts;
- (void)configureTextFieldViewColors;
- (void)updateUI:(id)a3 previousTraitCollection:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation IdentityProofingVerifyingPasscodeViewController

- (_TtC9CoreIDVUI47IdentityProofingVerifyingPasscodeViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_21F46E8B0();
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for IdentityProofingVerifyingPasscodeViewController();
  id v2 = v7.receiver;
  [(IdentityProofingVerifyingPasscodeViewController *)&v7 viewDidLoad];
  sub_21F46CEA8();
  sub_21F46EFD8(0, &qword_267EDE5E0);
  uint64_t v3 = sub_21F5518A0();
  MEMORY[0x223C4E2D0](v3, sel_configureTextFieldViewColors);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EDF970);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_21F554510;
  uint64_t v5 = sub_21F550C40();
  uint64_t v6 = MEMORY[0x263F82018];
  *(void *)(v4 + 32) = v5;
  *(void *)(v4 + 40) = v6;
  MEMORY[0x223C4E2D0](v4, sel_updateUI_previousTraitCollection_);

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_21F46BB78(a3);
}

- (void)viewDidLayoutSubviews
{
  id v2 = self;
  sub_21F46CB6C();
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for IdentityProofingVerifyingPasscodeViewController();
  uint64_t v4 = (char *)v5.receiver;
  [(IdentityProofingVerifyingPasscodeViewController *)&v5 viewWillDisappear:v3];
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC9CoreIDVUI47IdentityProofingVerifyingPasscodeViewController_thresholdTimer], sel_invalidate, v5.receiver, v5.super_class);
}

- (void)updateUI:(id)a3 previousTraitCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_21F46EC50(a4);
}

- (void)configureFonts
{
  id v2 = self;
  sub_21F46DD40();
}

- (void)configureTextFieldViewColors
{
  id v2 = self;
  sub_21F46E024();
}

- (_TtC9CoreIDVUI47IdentityProofingVerifyingPasscodeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9CoreIDVUI47IdentityProofingVerifyingPasscodeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI47IdentityProofingVerifyingPasscodeViewController_thresholdTimer));
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI47IdentityProofingVerifyingPasscodeViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI47IdentityProofingVerifyingPasscodeViewController_activityIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI47IdentityProofingVerifyingPasscodeViewController_secondaryStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI47IdentityProofingVerifyingPasscodeViewController_primaryStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI47IdentityProofingVerifyingPasscodeViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI47IdentityProofingVerifyingPasscodeViewController_primaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI47IdentityProofingVerifyingPasscodeViewController_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI47IdentityProofingVerifyingPasscodeViewController_imageViewContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI47IdentityProofingVerifyingPasscodeViewController_textField));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI47IdentityProofingVerifyingPasscodeViewController____lazy_storage___textFieldView));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9CoreIDVUI47IdentityProofingVerifyingPasscodeViewController_config);
}

@end