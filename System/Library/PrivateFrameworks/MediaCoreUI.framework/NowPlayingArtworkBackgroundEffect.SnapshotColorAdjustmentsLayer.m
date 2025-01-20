@interface NowPlayingArtworkBackgroundEffect.SnapshotColorAdjustmentsLayer
- (_TtCV11MediaCoreUI33NowPlayingArtworkBackgroundEffectP33_0BADDE1E8FA0478530CC88B691A6D29129SnapshotColorAdjustmentsLayer)init;
- (_TtCV11MediaCoreUI33NowPlayingArtworkBackgroundEffectP33_0BADDE1E8FA0478530CC88B691A6D29129SnapshotColorAdjustmentsLayer)initWithCoder:(id)a3;
- (void)layoutSublayers;
@end

@implementation NowPlayingArtworkBackgroundEffect.SnapshotColorAdjustmentsLayer

- (_TtCV11MediaCoreUI33NowPlayingArtworkBackgroundEffectP33_0BADDE1E8FA0478530CC88B691A6D29129SnapshotColorAdjustmentsLayer)init
{
  return (_TtCV11MediaCoreUI33NowPlayingArtworkBackgroundEffectP33_0BADDE1E8FA0478530CC88B691A6D29129SnapshotColorAdjustmentsLayer *)sub_255B41FE8();
}

- (_TtCV11MediaCoreUI33NowPlayingArtworkBackgroundEffectP33_0BADDE1E8FA0478530CC88B691A6D29129SnapshotColorAdjustmentsLayer)initWithCoder:(id)a3
{
  result = (_TtCV11MediaCoreUI33NowPlayingArtworkBackgroundEffectP33_0BADDE1E8FA0478530CC88B691A6D29129SnapshotColorAdjustmentsLayer *)sub_255C81248();
  __break(1u);
  return result;
}

- (void)layoutSublayers
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v2 = v5.receiver;
  [(NowPlayingArtworkBackgroundEffect.SnapshotColorAdjustmentsLayer *)&v5 layoutSublayers];
  id v3 = objc_msgSend(v2, sel_mask, v5.receiver, v5.super_class);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v2, sel_bounds);
    objc_msgSend(v4, sel_setFrame_);

    id v2 = v4;
  }
}

@end