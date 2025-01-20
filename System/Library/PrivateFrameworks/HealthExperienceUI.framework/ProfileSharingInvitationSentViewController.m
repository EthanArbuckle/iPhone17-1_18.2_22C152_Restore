@interface ProfileSharingInvitationSentViewController
- (void)viewDidLoad;
@end

@implementation ProfileSharingInvitationSentViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ProfileSharingInvitationSentViewController();
  id v2 = v3.receiver;
  [(OBBaseWelcomeController *)&v3 viewDidLoad];
  sub_1AD2C22B0();
}

- (void).cxx_destruct
{
  objc_super v3 = (char *)self
     + OBJC_IVAR____TtC18HealthExperienceUI42ProfileSharingInvitationSentViewController_profileBeingShared;
  uint64_t v4 = sub_1AD73B5F0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self
     + OBJC_IVAR____TtC18HealthExperienceUI42ProfileSharingInvitationSentViewController_profileReceivingSharedProfile;
  uint64_t v6 = sub_1AD73BD60();
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
}

@end