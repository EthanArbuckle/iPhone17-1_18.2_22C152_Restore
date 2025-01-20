@interface CameraPathManager
- (_TtC19_RealityKit_SwiftUI17CameraPathManager)init;
@end

@implementation CameraPathManager

- (_TtC19_RealityKit_SwiftUI17CameraPathManager)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19_RealityKit_SwiftUI17CameraPathManager_shots) = (Class)MEMORY[0x263F8EE78];
  v2 = (char *)self + OBJC_IVAR____TtC19_RealityKit_SwiftUI17CameraPathManager_cameraPosesBoundingBox;
  *(_OWORD *)v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  v2[32] = 1;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CameraPathManager();
  return [(CameraPathManager *)&v4 init];
}

- (void).cxx_destruct
{
}

@end