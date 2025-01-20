@interface NowPlayingArtworkBackgroundEffect.EffectLayer
- (_TtCV11MediaCoreUI33NowPlayingArtworkBackgroundEffectP33_0BADDE1E8FA0478530CC88B691A6D29111EffectLayer)init;
- (_TtCV11MediaCoreUI33NowPlayingArtworkBackgroundEffectP33_0BADDE1E8FA0478530CC88B691A6D29111EffectLayer)initWithCoder:(id)a3;
- (_TtCV11MediaCoreUI33NowPlayingArtworkBackgroundEffectP33_0BADDE1E8FA0478530CC88B691A6D29111EffectLayer)initWithLayer:(id)a3;
- (void)layoutSublayers;
@end

@implementation NowPlayingArtworkBackgroundEffect.EffectLayer

- (_TtCV11MediaCoreUI33NowPlayingArtworkBackgroundEffectP33_0BADDE1E8FA0478530CC88B691A6D29111EffectLayer)init
{
  return (_TtCV11MediaCoreUI33NowPlayingArtworkBackgroundEffectP33_0BADDE1E8FA0478530CC88B691A6D29111EffectLayer *)sub_255B40C68();
}

- (_TtCV11MediaCoreUI33NowPlayingArtworkBackgroundEffectP33_0BADDE1E8FA0478530CC88B691A6D29111EffectLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  sub_255C80F58();
  swift_unknownObjectRelease();
  return (_TtCV11MediaCoreUI33NowPlayingArtworkBackgroundEffectP33_0BADDE1E8FA0478530CC88B691A6D29111EffectLayer *)sub_255B40D2C(v4);
}

- (void)layoutSublayers
{
  v2 = self;
  sub_255B40E48();
}

- (_TtCV11MediaCoreUI33NowPlayingArtworkBackgroundEffectP33_0BADDE1E8FA0478530CC88B691A6D29111EffectLayer)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_255B42F6C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCV11MediaCoreUI33NowPlayingArtworkBackgroundEffectP33_0BADDE1E8FA0478530CC88B691A6D29111EffectLayer_blurLayer));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCV11MediaCoreUI33NowPlayingArtworkBackgroundEffectP33_0BADDE1E8FA0478530CC88B691A6D29111EffectLayer_liveColorAdjustmentsLayer));
  id v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtCV11MediaCoreUI33NowPlayingArtworkBackgroundEffectP33_0BADDE1E8FA0478530CC88B691A6D29111EffectLayer_snapshotColorAdjustmentsLayer);
}

@end