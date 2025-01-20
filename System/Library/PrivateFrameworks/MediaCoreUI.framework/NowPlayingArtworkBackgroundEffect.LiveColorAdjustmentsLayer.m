@interface NowPlayingArtworkBackgroundEffect.LiveColorAdjustmentsLayer
- (_TtCV11MediaCoreUI33NowPlayingArtworkBackgroundEffectP33_0BADDE1E8FA0478530CC88B691A6D29125LiveColorAdjustmentsLayer)init;
- (_TtCV11MediaCoreUI33NowPlayingArtworkBackgroundEffectP33_0BADDE1E8FA0478530CC88B691A6D29125LiveColorAdjustmentsLayer)initWithCoder:(id)a3;
- (_TtCV11MediaCoreUI33NowPlayingArtworkBackgroundEffectP33_0BADDE1E8FA0478530CC88B691A6D29125LiveColorAdjustmentsLayer)initWithLayer:(id)a3;
@end

@implementation NowPlayingArtworkBackgroundEffect.LiveColorAdjustmentsLayer

- (_TtCV11MediaCoreUI33NowPlayingArtworkBackgroundEffectP33_0BADDE1E8FA0478530CC88B691A6D29125LiveColorAdjustmentsLayer)init
{
  return (_TtCV11MediaCoreUI33NowPlayingArtworkBackgroundEffectP33_0BADDE1E8FA0478530CC88B691A6D29125LiveColorAdjustmentsLayer *)sub_255B413B0();
}

- (_TtCV11MediaCoreUI33NowPlayingArtworkBackgroundEffectP33_0BADDE1E8FA0478530CC88B691A6D29125LiveColorAdjustmentsLayer)initWithLayer:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectRetain();
  sub_255C80F58();
  swift_unknownObjectRelease();
  v5 = (_OWORD *)((char *)self
                + OBJC_IVAR____TtCV11MediaCoreUI33NowPlayingArtworkBackgroundEffectP33_0BADDE1E8FA0478530CC88B691A6D29125LiveColorAdjustmentsLayer_dimmingMatrix);
  _OWORD *v5 = xmmword_255C8F6A0;
  v5[1] = xmmword_255C8F6B0;
  v5[2] = xmmword_255C8F6C0;
  v5[3] = xmmword_255C8F6D0;
  v5[4] = xmmword_255C89FD0;
  v6 = (objc_super *)((char *)self
                    + OBJC_IVAR____TtCV11MediaCoreUI33NowPlayingArtworkBackgroundEffectP33_0BADDE1E8FA0478530CC88B691A6D29125LiveColorAdjustmentsLayer_saturationMatrix);
  v7 = self;
  CAColorMatrixMakeSaturation();
  objc_super v8 = v15[2];
  objc_super v9 = v15[3];
  objc_super v10 = v15[4];
  objc_super v11 = v15[5];
  objc_super *v6 = v15[1];
  v6[1] = v8;
  v6[2] = v9;
  v6[3] = v10;
  v6[4] = v11;

  __swift_project_boxed_opaque_existential_1(v16, v16[3]);
  uint64_t v12 = sub_255C81418();
  v15[0].receiver = v7;
  v15[0].super_class = ObjectType;
  v13 = [(objc_super *)v15 initWithLayer:v12];
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
  return v13;
}

- (_TtCV11MediaCoreUI33NowPlayingArtworkBackgroundEffectP33_0BADDE1E8FA0478530CC88B691A6D29125LiveColorAdjustmentsLayer)initWithCoder:(id)a3
{
  v4 = (_OWORD *)((char *)self
                + OBJC_IVAR____TtCV11MediaCoreUI33NowPlayingArtworkBackgroundEffectP33_0BADDE1E8FA0478530CC88B691A6D29125LiveColorAdjustmentsLayer_dimmingMatrix);
  _OWORD *v4 = xmmword_255C8F6A0;
  v4[1] = xmmword_255C8F6B0;
  v4[2] = xmmword_255C8F6C0;
  v4[3] = xmmword_255C8F6D0;
  v4[4] = xmmword_255C89FD0;
  v5 = (_OWORD *)((char *)self
                + OBJC_IVAR____TtCV11MediaCoreUI33NowPlayingArtworkBackgroundEffectP33_0BADDE1E8FA0478530CC88B691A6D29125LiveColorAdjustmentsLayer_saturationMatrix);
  id v6 = a3;
  CAColorMatrixMakeSaturation();
  _OWORD *v5 = v8;
  v5[1] = v9;
  v5[2] = v10;
  v5[3] = v11;
  v5[4] = v12;

  result = (_TtCV11MediaCoreUI33NowPlayingArtworkBackgroundEffectP33_0BADDE1E8FA0478530CC88B691A6D29125LiveColorAdjustmentsLayer *)sub_255C81248();
  __break(1u);
  return result;
}

@end