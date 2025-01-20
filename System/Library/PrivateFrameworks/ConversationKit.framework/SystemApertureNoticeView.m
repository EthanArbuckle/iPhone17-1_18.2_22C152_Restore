@interface SystemApertureNoticeView
- (_TtC15ConversationKit24SystemApertureNoticeView)initWithCoder:(id)a3;
- (_TtC15ConversationKit24SystemApertureNoticeView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SystemApertureNoticeView

- (_TtC15ConversationKit24SystemApertureNoticeView)initWithFrame:(CGRect)a3
{
  return (_TtC15ConversationKit24SystemApertureNoticeView *)SystemApertureNoticeView.init(frame:)();
}

- (_TtC15ConversationKit24SystemApertureNoticeView)initWithCoder:(id)a3
{
  id v3 = a3;
  SystemApertureNoticeView.init(coder:)();
}

- (void)layoutSubviews
{
  v2 = self;
  SystemApertureNoticeView.layoutSubviews()();
}

- (void).cxx_destruct
{
  outlined destroy of Conversation?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit24SystemApertureNoticeView_fullSentence, (uint64_t *)&demangling cache variable for type metadata for AttributedString?);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit24SystemApertureNoticeView_trailingButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit24SystemApertureNoticeView_leadingContainerView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15ConversationKit24SystemApertureNoticeView_titleView);
}

@end