@interface ConsentSignatureController
- (BOOL)textFieldShouldReturn:(id)a3;
- (BOOL)validateRequiredFields;
- (_TtC11Diagnostics26ConsentSignatureController)initWithCoder:(id)a3;
- (_TtC11Diagnostics26ConsentSignatureController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)cancelConsent;
- (void)clearSignature;
- (void)generateConsentDocument;
- (void)handleTapOutside:(id)a3;
- (void)viewDidLoad;
@end

@implementation ConsentSignatureController

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ConsentSignatureController();
  id v2 = v6.receiver;
  [(ConsentSignatureController *)&v6 viewDidLoad];
  id v3 = [v2 view];
  if (v3)
  {
    v4 = v3;
    id v5 = [self systemBackgroundColor];
    [v4 setBackgroundColor:v5];

    sub_1000F0D88();
    sub_1000F2218();
  }
  else
  {
    __break(1u);
  }
}

- (void)clearSignature
{
  id v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_signatureView);
  if (v2) {
    [v2 clear];
  }
  else {
    __break(1u);
  }
}

- (BOOL)validateRequiredFields
{
  id v2 = self;
  unsigned __int8 v3 = sub_1000F3ED0();

  return v3 & 1;
}

- (void)cancelConsent
{
  id v2 = self;
  sub_1000F43A8();
}

- (void)generateConsentDocument
{
  id v2 = self;
  sub_1000F4764();
}

- (_TtC11Diagnostics26ConsentSignatureController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC11Diagnostics26ConsentSignatureController *)sub_1000F54FC(v5, v7, a4);
}

- (_TtC11Diagnostics26ConsentSignatureController)initWithCoder:(id)a3
{
  return (_TtC11Diagnostics26ConsentSignatureController *)sub_1000F5754(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_firstNameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_firstNameTextField));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_lastNameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_lastNameTextField));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_submitBtn));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_cancelBtn));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_signatureLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_signatureView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_clearSignBtn));
  unsigned __int8 v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_documentHelper);
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1000F5A98(v4);

  return 1;
}

- (void)handleTapOutside:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1000F5BF4(v4);
}

@end