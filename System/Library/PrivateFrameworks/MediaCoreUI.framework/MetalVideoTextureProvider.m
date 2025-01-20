@interface MetalVideoTextureProvider
- (_TtC11MediaCoreUI25MetalVideoTextureProvider)init;
- (void)dealloc;
@end

@implementation MetalVideoTextureProvider

- (void)dealloc
{
  v2 = self;
  sub_255A822CC();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_release();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11MediaCoreUI25MetalVideoTextureProvider_currentTextureRef));
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

- (_TtC11MediaCoreUI25MetalVideoTextureProvider)init
{
  result = (_TtC11MediaCoreUI25MetalVideoTextureProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end