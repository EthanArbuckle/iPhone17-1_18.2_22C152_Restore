@interface CNPosterOnboardingPrivacyViewModel
- (_TtC10ContactsUI34CNPosterOnboardingPrivacyViewModel)init;
- (void)setWithItems:(id)a3;
@end

@implementation CNPosterOnboardingPrivacyViewModel

- (void)setWithItems:(id)a3
{
  type metadata accessor for DeviceListServiceDeviceInfo();
  unint64_t v4 = sub_18B985F88();
  v5 = self;
  sub_18B6469B4(v4);

  swift_bridgeObjectRelease();
}

- (_TtC10ContactsUI34CNPosterOnboardingPrivacyViewModel)init
{
  uint64_t v3 = OBJC_IVAR____TtC10ContactsUI34CNPosterOnboardingPrivacyViewModel_model;
  type metadata accessor for CNPosterOnboardingPrivacyView.Model(0);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = MEMORY[0x1E4FBC860];
  *(unsigned char *)(v4 + 24) = 1;
  v5 = self;
  sub_18B983DB8();
  *(Class *)((char *)&self->super.isa + v3) = (Class)v4;

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for CNPosterOnboardingPrivacyViewModel();
  return [(CNPosterOnboardingPrivacyViewModel *)&v7 init];
}

- (void).cxx_destruct
{
}

@end