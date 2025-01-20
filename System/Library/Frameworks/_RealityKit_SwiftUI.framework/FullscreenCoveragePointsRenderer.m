@interface FullscreenCoveragePointsRenderer
- (_TtC19_RealityKit_SwiftUI32FullscreenCoveragePointsRenderer)init;
- (void)dealloc;
- (void)drawInMTKView:(id)a3;
- (void)mtkView:(id)a3 drawableSizeWillChange:(CGSize)a4;
@end

@implementation FullscreenCoveragePointsRenderer

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC19_RealityKit_SwiftUI32FullscreenCoveragePointsRenderer_dragGesture);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC19_RealityKit_SwiftUI32FullscreenCoveragePointsRenderer_dragGesture) = 0;
  v3 = self;

  *(void *)&v3->view[OBJC_IVAR____TtC19_RealityKit_SwiftUI32FullscreenCoveragePointsRenderer_transformProvider] = 0;
  swift_unknownObjectWeakAssign();
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for FullscreenCoveragePointsRenderer(0);
  [(FullscreenCoveragePointsRenderer *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19_RealityKit_SwiftUI32FullscreenCoveragePointsRenderer_view));
  outlined destroy of URL?((uint64_t)self + OBJC_IVAR____TtC19_RealityKit_SwiftUI32FullscreenCoveragePointsRenderer_coveragePointCloud, (uint64_t *)&demangling cache variable for type metadata for CoveragePointCloud?);
  outlined destroy of URL?((uint64_t)self + OBJC_IVAR____TtC19_RealityKit_SwiftUI32FullscreenCoveragePointsRenderer_coveragePoints, &demangling cache variable for type metadata for ObjectCaptureSession.Frame.PointCloud?);
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  outlined consume of PlatterRenderer??(*(uint64_t *)((char *)&self->super.isa
                                                   + OBJC_IVAR____TtC19_RealityKit_SwiftUI32FullscreenCoveragePointsRenderer____lazy_storage___voxelRenderer));
  swift_release();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19_RealityKit_SwiftUI32FullscreenCoveragePointsRenderer_dragGesture));
  outlined destroy of weak RangefinderDelegate?((uint64_t)self + OBJC_IVAR____TtC19_RealityKit_SwiftUI32FullscreenCoveragePointsRenderer_transformProvider);
  v3 = (char *)self + OBJC_IVAR____TtC19_RealityKit_SwiftUI32FullscreenCoveragePointsRenderer_colorScheme;
  uint64_t v4 = type metadata accessor for ColorScheme();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_release();
}

- (void)mtkView:(id)a3 drawableSizeWillChange:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v7 = a3;
  v8 = self;
  FullscreenCoveragePointsRenderer.mtkView(_:drawableSizeWillChange:)((MTKView)v7, (CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));
}

- (void)drawInMTKView:(id)a3
{
  id v4 = a3;
  v5 = self;
  FullscreenCoveragePointsRenderer.draw(in:)((MTKView)v4);
}

- (_TtC19_RealityKit_SwiftUI32FullscreenCoveragePointsRenderer)init
{
  result = (_TtC19_RealityKit_SwiftUI32FullscreenCoveragePointsRenderer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end