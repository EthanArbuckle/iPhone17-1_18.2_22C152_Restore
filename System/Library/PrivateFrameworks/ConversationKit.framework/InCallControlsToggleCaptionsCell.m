@interface InCallControlsToggleCaptionsCell
- (_TtC15ConversationKit32InCallControlsToggleCaptionsCell)initWithCoder:(id)a3;
- (_TtC15ConversationKit32InCallControlsToggleCaptionsCell)initWithFrame:(CGRect)a3;
- (void)didToggleCaptions;
@end

@implementation InCallControlsToggleCaptionsCell

- (_TtC15ConversationKit32InCallControlsToggleCaptionsCell)initWithFrame:(CGRect)a3
{
  return (_TtC15ConversationKit32InCallControlsToggleCaptionsCell *)InCallControlsToggleCaptionsCell.init(frame:)();
}

- (_TtC15ConversationKit32InCallControlsToggleCaptionsCell)initWithCoder:(id)a3
{
  id v3 = a3;
  InCallControlsToggleCaptionsCell.init(coder:)();
}

- (void)didToggleCaptions
{
  v2 = self;
  InCallControlsToggleCaptionsCell.didToggleCaptions()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit32InCallControlsToggleCaptionsCell____lazy_storage___toggleCaptionsSwitch));
  outlined destroy of Any?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit32InCallControlsToggleCaptionsCell____lazy_storage___accessoryView, &demangling cache variable for type metadata for UICellAccessory?);
  outlined destroy of Any?((uint64_t)self+ OBJC_IVAR____TtC15ConversationKit32InCallControlsToggleCaptionsCell____lazy_storage___cellContentConfiguration, &demangling cache variable for type metadata for UIListContentConfiguration?);
}

@end