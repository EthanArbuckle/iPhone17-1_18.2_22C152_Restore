@interface CNKParticipantScreenShareInfoViewInternal
- (CNKParticipantScreenShareInfoViewInternal)init;
- (CNKParticipantScreenShareInfoViewInternal)initWithCoder:(id)a3;
- (CNKParticipantScreenShareInfoViewInternal)initWithFrame:(CGRect)a3;
- (UIImage)avatarImage;
- (double)customCornerRadius;
- (double)preferredHeight;
- (void)configureWith:(id)a3 isFullScreenMode:(BOOL)a4;
- (void)layoutSubviews;
- (void)setAvatarImage:(id)a3;
- (void)setCustomCornerRadius:(double)a3;
@end

@implementation CNKParticipantScreenShareInfoViewInternal

- (double)customCornerRadius
{
  return ParticipantScreenShareInfoView.customCornerRadius.getter();
}

- (void)setCustomCornerRadius:(double)a3
{
  v4 = self;
  ParticipantScreenShareInfoView.customCornerRadius.setter(a3);
}

- (double)preferredHeight
{
  v2 = self;
  double v3 = ParticipantScreenShareInfoView.preferredHeight.getter();

  return v3;
}

- (UIImage)avatarImage
{
  v2 = ParticipantScreenShareInfoView.avatarImage.getter();
  return (UIImage *)v2;
}

- (void)setAvatarImage:(id)a3
{
  id v5 = a3;
  v6 = self;
  ParticipantScreenShareInfoView.avatarImage.setter(a3);
}

- (CNKParticipantScreenShareInfoViewInternal)init
{
  return (CNKParticipantScreenShareInfoViewInternal *)ParticipantScreenShareInfoView.init()();
}

- (CNKParticipantScreenShareInfoViewInternal)initWithCoder:(id)a3
{
  id v3 = a3;
  ParticipantScreenShareInfoView.init(coder:)();
}

- (void)layoutSubviews
{
  v2 = self;
  ParticipantScreenShareInfoView.layoutSubviews()((SEL *)&selRef_layoutSubviews);
}

- (void)configureWith:(id)a3 isFullScreenMode:(BOOL)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = v7;
  v9 = self;
  v10._countAndFlagsBits = v6;
  v10._object = v8;
  ParticipantScreenShareInfoView.configure(with:isFullScreenMode:)(v10, a4);

  swift_bridgeObjectRelease();
}

- (CNKParticipantScreenShareInfoViewInternal)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CNKParticipantScreenShareInfoViewInternal_nameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CNKParticipantScreenShareInfoViewInternal_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CNKParticipantScreenShareInfoViewInternal_avatarImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CNKParticipantScreenShareInfoViewInternal_backgroundBlurView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___CNKParticipantScreenShareInfoViewInternal_avatarImage);
}

@end