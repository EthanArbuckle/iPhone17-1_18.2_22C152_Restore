@interface NowPlayingArtworkBackgroundEffect.BlurLayer
- (_TtCV11MediaCoreUI33NowPlayingArtworkBackgroundEffectP33_0BADDE1E8FA0478530CC88B691A6D2919BlurLayer)init;
- (_TtCV11MediaCoreUI33NowPlayingArtworkBackgroundEffectP33_0BADDE1E8FA0478530CC88B691A6D2919BlurLayer)initWithCoder:(id)a3;
- (id)initWithLayer:(void *)a1;
@end

@implementation NowPlayingArtworkBackgroundEffect.BlurLayer

- (_TtCV11MediaCoreUI33NowPlayingArtworkBackgroundEffectP33_0BADDE1E8FA0478530CC88B691A6D2919BlurLayer)init
{
  return (_TtCV11MediaCoreUI33NowPlayingArtworkBackgroundEffectP33_0BADDE1E8FA0478530CC88B691A6D2919BlurLayer *)sub_255B41134();
}

- (_TtCV11MediaCoreUI33NowPlayingArtworkBackgroundEffectP33_0BADDE1E8FA0478530CC88B691A6D2919BlurLayer)initWithCoder:(id)a3
{
  result = (_TtCV11MediaCoreUI33NowPlayingArtworkBackgroundEffectP33_0BADDE1E8FA0478530CC88B691A6D2919BlurLayer *)sub_255C81248();
  __break(1u);
  return result;
}

- (id)initWithLayer:(void *)a1
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectRetain();
  sub_255C80F58();
  swift_unknownObjectRelease();
  __swift_project_boxed_opaque_existential_1(v7, v7[3]);
  uint64_t v3 = sub_255C81418();
  v6.receiver = a1;
  v6.super_class = ObjectType;
  id v4 = objc_msgSendSuper2(&v6, sel_initWithLayer_, v3);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
  return v4;
}

@end