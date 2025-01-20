@interface PushToTalkView
- (_TtC15ConversationKit14PushToTalkView)initWithCoder:(id)a3;
- (_TtC15ConversationKit14PushToTalkView)initWithFrame:(CGRect)a3;
- (void)openPTTApp:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PushToTalkView

- (_TtC15ConversationKit14PushToTalkView)initWithCoder:(id)a3
{
  id v3 = a3;
  PushToTalkView.init(coder:)();
}

- (void)openPTTApp:(id)a3
{
  id v4 = a3;
  v5 = self;
  PushToTalkView.openPTTApp(_:)((UITapGestureRecognizer *)v5);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  v9.is_nil = (char)v6;
  v7 = v6;
  v9.value.super.isa = (Class)a3;
  PushToTalkView.traitCollectionDidChange(_:)(v9);
}

- (_TtC15ConversationKit14PushToTalkView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit14PushToTalkView_leaveButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit14PushToTalkView_talkButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit14PushToTalkView_pttSessionDetailsView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit14PushToTalkView____lazy_storage___leaveLabelButtonView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit14PushToTalkView____lazy_storage___talkLabelButtonView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit14PushToTalkView_leftMarginLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit14PushToTalkView_rightMarginLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit14PushToTalkView_centerContentLayoutGuide));
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15ConversationKit14PushToTalkView_alwaysOnDisplayDimmingView);
}

@end