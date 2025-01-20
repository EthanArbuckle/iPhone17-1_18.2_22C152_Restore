@interface HearingFitNoiseVideoLoopPlayer
- (_TtC13HearingModeUI30HearingFitNoiseVideoLoopPlayer)initWithCoder:(id)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation HearingFitNoiseVideoLoopPlayer

- (void)layoutSubviews
{
  v2 = self;
  sub_251299530();
}

- (_TtC13HearingModeUI30HearingFitNoiseVideoLoopPlayer)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC13HearingModeUI30HearingFitNoiseVideoLoopPlayer_videoContainerLayoutGuide;
  id v6 = objc_allocWithZone(MEMORY[0x263F82908]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC13HearingModeUI30HearingFitNoiseVideoLoopPlayer_heightConstraint) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC13HearingModeUI30HearingFitNoiseVideoLoopPlayer_widthConstraint) = 0;

  result = (_TtC13HearingModeUI30HearingFitNoiseVideoLoopPlayer *)sub_2512C4B48();
  __break(1u);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_2512998CC((uint64_t)a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13HearingModeUI30HearingFitNoiseVideoLoopPlayer_videoContainerLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13HearingModeUI30HearingFitNoiseVideoLoopPlayer_heightConstraint));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC13HearingModeUI30HearingFitNoiseVideoLoopPlayer_widthConstraint);
}

@end