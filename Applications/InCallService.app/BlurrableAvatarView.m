@interface BlurrableAvatarView
- (BOOL)wantsBlur;
- (CNAvatarView)cnAvatarView;
- (CNContact)contact;
- (_TtC13InCallService19BlurrableAvatarView)initWithCoder:(id)a3;
- (_TtC13InCallService19BlurrableAvatarView)initWithContact:(id)a3 wantsBlur:(BOOL)a4 isCommunicationSafetyEnabled:(BOOL)a5;
- (_TtC13InCallService19BlurrableAvatarView)initWithFrame:(CGRect)a3;
- (void)didTapWithSender:(id)a3;
- (void)layoutSubviews;
- (void)setContact:(id)a3;
- (void)setWantsBlur:(BOOL)a3;
@end

@implementation BlurrableAvatarView

- (CNContact)contact
{
  id v2 = sub_100170E98();

  return (CNContact *)v2;
}

- (void)setContact:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100170F00(v4);
}

- (BOOL)wantsBlur
{
  return sub_100170FA4() & 1;
}

- (void)setWantsBlur:(BOOL)a3
{
  id v4 = self;
  sub_100171008(a3);
}

- (CNAvatarView)cnAvatarView
{
  id v2 = sub_10017104C();

  return (CNAvatarView *)v2;
}

- (_TtC13InCallService19BlurrableAvatarView)initWithContact:(id)a3 wantsBlur:(BOOL)a4 isCommunicationSafetyEnabled:(BOOL)a5
{
  return (_TtC13InCallService19BlurrableAvatarView *)sub_100171070(a3, a4, a5);
}

- (_TtC13InCallService19BlurrableAvatarView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001711EC();
}

- (void)layoutSubviews
{
  id v2 = self;
  sub_100171280();
}

- (void)didTapWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100171D48();
}

- (_TtC13InCallService19BlurrableAvatarView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13InCallService19BlurrableAvatarView_contact));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13InCallService19BlurrableAvatarView_cnAvatarView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13InCallService19BlurrableAvatarView_blurEffectView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC13InCallService19BlurrableAvatarView_blurEffectViewIcon);
}

@end