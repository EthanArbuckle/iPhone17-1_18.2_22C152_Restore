@interface PersonalNicknameMenuView
+ (BOOL)meCardSharingEnabled;
- (_TtC11MobilePhone24PersonalNicknameMenuView)initWithCoder:(id)a3;
- (_TtC11MobilePhone24PersonalNicknameMenuView)initWithFrame:(CGRect)a3;
- (void)didTapWithSender:(id)a3;
@end

@implementation PersonalNicknameMenuView

+ (BOOL)meCardSharingEnabled
{
  if (one-time initialization token for nicknamesDefaults != -1) {
    swift_once();
  }
  Class isa = nicknamesDefaults.value.super.isa;
  if (!nicknamesDefaults.value.super.isa) {
    return 0;
  }
  NSString v3 = String._bridgeToObjectiveC()();
  unsigned __int8 v4 = [(objc_class *)isa BOOLForKey:v3];

  return v4;
}

- (_TtC11MobilePhone24PersonalNicknameMenuView)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized PersonalNicknameMenuView.init(coder:)();
}

- (void)didTapWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  specialized PersonalNicknameMenuView.didTap(sender:)();
}

- (_TtC11MobilePhone24PersonalNicknameMenuView)initWithFrame:(CGRect)a3
{
  result = (_TtC11MobilePhone24PersonalNicknameMenuView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  outlined consume of UILabel??(*(id *)((char *)&self->super.super.super.isa
                                      + (unint64_t)nicknamesDefaults.value._container_));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MobilePhone24PersonalNicknameMenuView____lazy_storage___nameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MobilePhone24PersonalNicknameMenuView____lazy_storage___subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MobilePhone24PersonalNicknameMenuView____lazy_storage___labelStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MobilePhone24PersonalNicknameMenuView____lazy_storage___containerStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MobilePhone24PersonalNicknameMenuView____lazy_storage___tapRecognizer));
  id v3 = (char *)self + OBJC_IVAR____TtC11MobilePhone24PersonalNicknameMenuView_personalNicknameMenuViewDelegate;

  outlined destroy of weak (UIViewController & ContactAvatarCardControllerProtocol)?((uint64_t)v3);
}

@end