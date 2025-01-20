@interface InCallControlsView
- (_TtC15ConversationKit18InCallControlsView)initWithCoder:(id)a3;
- (_TtC15ConversationKit18InCallControlsView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation InCallControlsView

- (_TtC15ConversationKit18InCallControlsView)initWithCoder:(id)a3
{
  id v3 = a3;
  InCallControlsView.init(coder:)();
}

- (void)layoutSubviews
{
  v2 = self;
  InCallControlsView.layoutSubviews()();
}

- (_TtC15ConversationKit18InCallControlsView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit18InCallControlsView_dataSource);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit18InCallControlsView_effectsButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit18InCallControlsView_muteButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit18InCallControlsView_flipCameraButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit18InCallControlsView_joinLeaveButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit18InCallControlsView_screenShareButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit18InCallControlsView_audioRouteButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit18InCallControlsView_toggleCameraButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit18InCallControlsView_toggleCinematicFramingButton));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end