@interface SharedContentVideoView
- (_TtC15ConversationKit22SharedContentVideoView)init;
- (_TtC15ConversationKit22SharedContentVideoView)initWithCoder:(id)a3;
- (_TtC15ConversationKit22SharedContentVideoView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SharedContentVideoView

- (_TtC15ConversationKit22SharedContentVideoView)init
{
  return (_TtC15ConversationKit22SharedContentVideoView *)SharedContentVideoView.init()();
}

- (_TtC15ConversationKit22SharedContentVideoView)initWithCoder:(id)a3
{
  id v3 = a3;
  SharedContentVideoView.init(coder:)();
}

- (_TtC15ConversationKit22SharedContentVideoView)initWithFrame:(CGRect)a3
{
}

- (void)layoutSubviews
{
  v2 = self;
  SharedContentVideoView.layoutSubviews()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit22SharedContentVideoView_screenSharingCameraView));
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self + OBJC_IVAR____TtC15ConversationKit22SharedContentVideoView_viewModel, &demangling cache variable for type metadata for SharedContentVideoView.ViewModel?);
}

@end