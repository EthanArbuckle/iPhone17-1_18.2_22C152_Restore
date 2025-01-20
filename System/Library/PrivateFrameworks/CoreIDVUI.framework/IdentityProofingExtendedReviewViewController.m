@interface IdentityProofingExtendedReviewViewController
- (_TtC9CoreIDVUI44IdentityProofingExtendedReviewViewController)initWithCoder:(id)a3;
- (_TtC9CoreIDVUI44IdentityProofingExtendedReviewViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)configureFonts;
- (void)primaryButtonClicked;
- (void)secondaryButtonClicked;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation IdentityProofingExtendedReviewViewController

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for IdentityProofingExtendedReviewViewController();
  id v2 = v6.receiver;
  [(IdentityProofingExtendedReviewViewController *)&v6 viewDidLoad];
  sub_21F477388();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EDF970);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_21F554510;
  uint64_t v4 = sub_21F550C40();
  uint64_t v5 = MEMORY[0x263F82018];
  *(void *)(v3 + 32) = v4;
  *(void *)(v3 + 40) = v5;
  MEMORY[0x223C4E2D0](v3, sel_configureFonts);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for IdentityProofingExtendedReviewViewController();
  id v4 = v5.receiver;
  [(IdentityProofingExtendedReviewViewController *)&v5 viewDidAppear:v3];
  sub_21F5502A0();
  sub_21F47BD60();
  swift_bridgeObjectRelease();
}

- (_TtC9CoreIDVUI44IdentityProofingExtendedReviewViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_21F47C728();
}

- (void)configureFonts
{
  id v2 = self;
  sub_21F478410();
}

- (void)secondaryButtonClicked
{
  id v2 = self;
  sub_21F47A2C0();
}

- (void)primaryButtonClicked
{
  id v2 = self;
  sub_21F47A54C();
}

- (_TtC9CoreIDVUI44IdentityProofingExtendedReviewViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9CoreIDVUI44IdentityProofingExtendedReviewViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI44IdentityProofingExtendedReviewViewController____lazy_storage___scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI44IdentityProofingExtendedReviewViewController____lazy_storage___primaryStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI44IdentityProofingExtendedReviewViewController____lazy_storage___bottomTray));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI44IdentityProofingExtendedReviewViewController____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI44IdentityProofingExtendedReviewViewController____lazy_storage___primaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI44IdentityProofingExtendedReviewViewController____lazy_storage___secondaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI44IdentityProofingExtendedReviewViewController____lazy_storage___tertiaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI44IdentityProofingExtendedReviewViewController____lazy_storage___primaryButton));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9CoreIDVUI44IdentityProofingExtendedReviewViewController____lazy_storage___secondaryButton);
}

@end