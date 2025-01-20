@interface PersonalizationPrivacyConsentViewController
- (_TtC10Blackbeard43PersonalizationPrivacyConsentViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC10Blackbeard43PersonalizationPrivacyConsentViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)didTapOptInButton;
- (void)didTapOptOutButton;
- (void)viewDidLoad;
@end

@implementation PersonalizationPrivacyConsentViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_2490E58F0();
}

- (void)didTapOptInButton
{
}

- (void)didTapOptOutButton
{
}

- (_TtC10Blackbeard43PersonalizationPrivacyConsentViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC10Blackbeard43PersonalizationPrivacyConsentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC10Blackbeard43PersonalizationPrivacyConsentViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC10Blackbeard43PersonalizationPrivacyConsentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10Blackbeard43PersonalizationPrivacyConsentViewController_privacyPreferenceClient);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10Blackbeard43PersonalizationPrivacyConsentViewController_textLabel));
  swift_unknownObjectRelease();
  sub_248B95DD4(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC10Blackbeard43PersonalizationPrivacyConsentViewController_onConsent));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC10Blackbeard43PersonalizationPrivacyConsentViewController_onDismiss);
  sub_248B95DD4(v3);
}

@end