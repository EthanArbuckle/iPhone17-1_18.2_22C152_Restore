@interface PersonalNicknameMenuView
- (_TtC15ConversationKit24PersonalNicknameMenuView)initWithCoder:(id)a3;
- (_TtC15ConversationKit24PersonalNicknameMenuView)initWithFrame:(CGRect)a3;
- (void)didTapWithSender:(id)a3;
@end

@implementation PersonalNicknameMenuView

- (_TtC15ConversationKit24PersonalNicknameMenuView)initWithCoder:(id)a3
{
  id v3 = a3;
  PersonalNicknameMenuView.init(coder:)();
}

- (void)didTapWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  PersonalNicknameMenuView.didTap(sender:)((UITapGestureRecognizer *)v5);
}

- (_TtC15ConversationKit24PersonalNicknameMenuView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  outlined consume of UIView??(*(id *)((char *)&self->super.super.super.isa
                                     + (unint64_t)nicknamesDefaults.value._container_));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit24PersonalNicknameMenuView____lazy_storage___nameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit24PersonalNicknameMenuView____lazy_storage___subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit24PersonalNicknameMenuView____lazy_storage___labelStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit24PersonalNicknameMenuView____lazy_storage___containerStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit24PersonalNicknameMenuView____lazy_storage___tapRecognizer));
  id v3 = (char *)self + OBJC_IVAR____TtC15ConversationKit24PersonalNicknameMenuView_personalNicknameMenuViewDelegate;
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)v3);
}

@end