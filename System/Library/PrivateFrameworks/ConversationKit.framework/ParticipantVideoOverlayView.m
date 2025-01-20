@interface ParticipantVideoOverlayView
- (_TtC15ConversationKit27ParticipantVideoOverlayView)init;
- (_TtC15ConversationKit27ParticipantVideoOverlayView)initWithCoder:(id)a3;
- (_TtC15ConversationKit27ParticipantVideoOverlayView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ParticipantVideoOverlayView

- (_TtC15ConversationKit27ParticipantVideoOverlayView)init
{
  return (_TtC15ConversationKit27ParticipantVideoOverlayView *)ParticipantVideoOverlayView.init()();
}

- (_TtC15ConversationKit27ParticipantVideoOverlayView)initWithCoder:(id)a3
{
  id v3 = a3;
  ParticipantVideoOverlayView.init(coder:)();
}

- (_TtC15ConversationKit27ParticipantVideoOverlayView)initWithFrame:(CGRect)a3
{
}

- (void)layoutSubviews
{
  v2 = self;
  ParticipantVideoOverlayView.layoutSubviews()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit27ParticipantVideoOverlayView_visualEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit27ParticipantVideoOverlayView_imageAndLabelContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit27ParticipantVideoOverlayView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit27ParticipantVideoOverlayView_labelView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit27ParticipantVideoOverlayView_imageViewWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit27ParticipantVideoOverlayView_imageViewHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit27ParticipantVideoOverlayView_monogramView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit27ParticipantVideoOverlayView_spinnerView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15ConversationKit27ParticipantVideoOverlayView_snapshotView);
}

@end