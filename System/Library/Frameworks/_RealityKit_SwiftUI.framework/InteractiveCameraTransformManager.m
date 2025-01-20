@interface InteractiveCameraTransformManager
- (_TtC19_RealityKit_SwiftUI33InteractiveCameraTransformManager)init;
@end

@implementation InteractiveCameraTransformManager

- (_TtC19_RealityKit_SwiftUI33InteractiveCameraTransformManager)init
{
  result = (_TtC19_RealityKit_SwiftUI33InteractiveCameraTransformManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19_RealityKit_SwiftUI33InteractiveCameraTransformManager_dragGesture));
  v3 = (char *)self + OBJC_IVAR____TtC19_RealityKit_SwiftUI33InteractiveCameraTransformManager_startTime;

  outlined destroy of DispatchTime?((uint64_t)v3);
}

@end