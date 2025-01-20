@interface SharedContentView
- (CGRect)convertRect:(CGRect)a3 toCoordinateSpace:(id)a4;
- (_TtC15ConversationKit17SharedContentView)initWithCoder:(id)a3;
- (_TtC15ConversationKit17SharedContentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SharedContentView

- (_TtC15ConversationKit17SharedContentView)initWithFrame:(CGRect)a3
{
  return (_TtC15ConversationKit17SharedContentView *)SharedContentView.init(frame:)();
}

- (_TtC15ConversationKit17SharedContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  SharedContentView.init(coder:)();
}

- (void)layoutSubviews
{
  v2 = self;
  SharedContentView.layoutSubviews()();
}

- (CGRect)convertRect:(CGRect)a3 toCoordinateSpace:(id)a4
{
  swift_unknownObjectRetain();
  v6 = self;
  SharedContentView.convert(_:to:)((uint64_t)a4);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  swift_unknownObjectRelease();

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit17SharedContentView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit17SharedContentView_videoViewSnapshot));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit17SharedContentView_videoView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit17SharedContentView_videoOverlayView));
  id v3 = (char *)self + OBJC_IVAR____TtC15ConversationKit17SharedContentView_loggingIdentifier;
  type metadata accessor for UUID();
  OUTLINED_FUNCTION_0();
  (*(void (**)(char *))(v4 + 8))(v3);
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self + OBJC_IVAR____TtC15ConversationKit17SharedContentView_participantIdentifier, (uint64_t *)&demangling cache variable for type metadata for UUID?);
  v5 = (char *)self + OBJC_IVAR____TtC15ConversationKit17SharedContentView_delegate;
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)v5);
}

@end