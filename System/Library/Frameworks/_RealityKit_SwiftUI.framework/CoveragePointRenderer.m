@interface CoveragePointRenderer
- (_TtC19_RealityKit_SwiftUI21CoveragePointRenderer)init;
- (void)drawInMTKView:(id)a3;
- (void)mtkView:(id)a3 drawableSizeWillChange:(CGSize)a4;
@end

@implementation CoveragePointRenderer

- (_TtC19_RealityKit_SwiftUI21CoveragePointRenderer)init
{
  return (_TtC19_RealityKit_SwiftUI21CoveragePointRenderer *)CoveragePointRenderer.init()();
}

- (void)mtkView:(id)a3 drawableSizeWillChange:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v7 = a3;
  v8 = self;
  CoveragePointRenderer.mtkView(_:drawableSizeWillChange:)((MTKView)v7, (CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));
}

- (void)drawInMTKView:(id)a3
{
  id v4 = a3;
  v5 = self;
  CoveragePointRenderer.draw(in:)((MTKView)v4);
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC19_RealityKit_SwiftUI21CoveragePointRenderer__interfaceOrientation;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<UIInterfaceOrientation>);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();

  outlined destroy of URL?((uint64_t)self + OBJC_IVAR____TtC19_RealityKit_SwiftUI21CoveragePointRenderer_coveragePointCloud, (uint64_t *)&demangling cache variable for type metadata for CoveragePointCloud?);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19_RealityKit_SwiftUI21CoveragePointRenderer_cameraTransformProvider));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  outlined consume of PlatterRenderer??(*(uint64_t *)((char *)&self->super.isa
                                                   + OBJC_IVAR____TtC19_RealityKit_SwiftUI21CoveragePointRenderer____lazy_storage___voxelRenderer));
  outlined consume of PlatterRenderer??(*(uint64_t *)((char *)&self->super.isa
                                                   + OBJC_IVAR____TtC19_RealityKit_SwiftUI21CoveragePointRenderer____lazy_storage___captureCircleRenderer));
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

@end