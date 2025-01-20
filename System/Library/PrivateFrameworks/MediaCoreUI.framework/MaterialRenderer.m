@interface MaterialRenderer
- (_TtC11MediaCoreUI16MaterialRenderer)init;
- (void)drawInMTKView:(id)a3;
- (void)mtkView:(id)a3 drawableSizeWillChange:(CGSize)a4;
@end

@implementation MaterialRenderer

- (void)mtkView:(id)a3 drawableSizeWillChange:(CGSize)a4
{
  id v5 = a3;
  v6 = self;
  sub_255B50B4C(v5);
}

- (void)drawInMTKView:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_255B4E9DC(v4);
}

- (_TtC11MediaCoreUI16MaterialRenderer)init
{
  result = (_TtC11MediaCoreUI16MaterialRenderer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_255B50DD8((uint64_t)self + OBJC_IVAR____TtC11MediaCoreUI16MaterialRenderer_textureProvider);
  swift_release();
  swift_unknownObjectRelease();

  swift_release();
}

@end