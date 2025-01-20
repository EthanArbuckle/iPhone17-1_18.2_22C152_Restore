@interface Backdrop.CompositeRenderer
- (_TtCO11MediaCoreUI8Backdrop17CompositeRenderer)init;
- (void)drawInMTKView:(id)a3;
- (void)mtkView:(id)a3 drawableSizeWillChange:(CGSize)a4;
@end

@implementation Backdrop.CompositeRenderer

- (_TtCO11MediaCoreUI8Backdrop17CompositeRenderer)init
{
  result = (_TtCO11MediaCoreUI8Backdrop17CompositeRenderer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_255B50DD8((uint64_t)self + OBJC_IVAR____TtCO11MediaCoreUI8Backdrop17CompositeRenderer_observer);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCO11MediaCoreUI8Backdrop17CompositeRenderer_placeholderColor));

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCO11MediaCoreUI8Backdrop17CompositeRenderer_crossfadeTimingFunction));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCO11MediaCoreUI8Backdrop17CompositeRenderer_modeTimingFunction));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCO11MediaCoreUI8Backdrop17CompositeRenderer_warpTimingFunction));
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

- (void)mtkView:(id)a3 drawableSizeWillChange:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  v11 = self;
  id v8 = objc_msgSend(v7, sel_traitCollection);
  objc_msgSend(v8, sel_displayScale);
  double v10 = v9;

  sub_255B64F14(width, height, v10);
}

- (void)drawInMTKView:(id)a3
{
  v4 = (MTKView *)a3;
  v5 = self;
  Backdrop.CompositeRenderer.draw(in:)(v4);
}

@end