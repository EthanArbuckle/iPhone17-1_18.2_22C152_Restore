@interface ParticipantContactView
- (_TtC15ConversationKit22ParticipantContactView)init;
- (_TtC15ConversationKit22ParticipantContactView)initWithCoder:(id)a3;
- (_TtC15ConversationKit22ParticipantContactView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ParticipantContactView

- (_TtC15ConversationKit22ParticipantContactView)init
{
}

- (_TtC15ConversationKit22ParticipantContactView)initWithCoder:(id)a3
{
  id v3 = a3;
  ParticipantContactView.init(coder:)();
}

- (_TtC15ConversationKit22ParticipantContactView)initWithFrame:(CGRect)a3
{
}

- (void)layoutSubviews
{
  v2 = self;
  ParticipantContactView.layoutSubviews()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit22ParticipantContactView_gradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit22ParticipantContactView_contactMonogram));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit22ParticipantContactView_contactImageView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15ConversationKit22ParticipantContactView_contactDetails);
  uint64_t v4 = *(void *)((char *)&self->super.super._responderFlags
                 + OBJC_IVAR____TtC15ConversationKit22ParticipantContactView_contactDetails);
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity
                  + OBJC_IVAR____TtC15ConversationKit22ParticipantContactView_contactDetails);
  outlined consume of ParticipantContactDetails?(v3, v4, v5);
}

@end