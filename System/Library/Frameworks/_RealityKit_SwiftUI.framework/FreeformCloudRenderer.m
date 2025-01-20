@interface FreeformCloudRenderer
- (_TtC19_RealityKit_SwiftUI21FreeformCloudRenderer)init;
- (void)drawInMTKView:(id)a3;
- (void)mtkView:(id)a3 drawableSizeWillChange:(CGSize)a4;
@end

@implementation FreeformCloudRenderer

- (_TtC19_RealityKit_SwiftUI21FreeformCloudRenderer)init
{
  return (_TtC19_RealityKit_SwiftUI21FreeformCloudRenderer *)FreeformCloudRenderer.init()();
}

- (void)mtkView:(id)a3 drawableSizeWillChange:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v7 = a3;
  v8 = self;
  FreeformCloudRenderer.mtkView(_:drawableSizeWillChange:)((MTKView)v7, (CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));
}

- (void)drawInMTKView:(id)a3
{
  id v4 = a3;
  v5 = self;
  FreeformCloudRenderer.draw(in:)((MTKView)v4);
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC19_RealityKit_SwiftUI21FreeformCloudRenderer__interfaceOrientation;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<UIInterfaceOrientation>);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC19_RealityKit_SwiftUI21FreeformCloudRenderer_colorScheme;
  uint64_t v6 = type metadata accessor for ColorScheme();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19_RealityKit_SwiftUI21FreeformCloudRenderer_cameraTransformProvider));
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  outlined consume of PlatterRenderer??(*(uint64_t *)((char *)&self->super.isa
                                                   + OBJC_IVAR____TtC19_RealityKit_SwiftUI21FreeformCloudRenderer____lazy_storage___platterRenderer));
  swift_release();
  swift_release();

  swift_release();
}

@end