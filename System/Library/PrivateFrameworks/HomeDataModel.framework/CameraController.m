@interface CameraController
- (NSString)description;
- (_TtC13HomeDataModel16CameraController)init;
- (void)cameraSnapshotControl:(id)a3 didTakeSnapshot:(id)a4 error:(id)a5;
- (void)cameraSnapshotControlDidUpdateMostRecentSnapshot:(id)a3;
- (void)cameraStreamControl:(id)a3 didStopStreamWithError:(id)a4;
- (void)cameraStreamControlDidStartStream:(id)a3;
- (void)cameraUserSettingsDidUpdate:(id)a3;
@end

@implementation CameraController

- (void)cameraStreamControlDidStartStream:(id)a3
{
}

- (void)cameraStreamControl:(id)a3 didStopStreamWithError:(id)a4
{
  id v5 = a3;
  swift_retain();
  id v6 = a4;
  CameraController.cameraStreamControl(_:didStopStreamWithError:)(v5, a4);

  swift_release();
}

- (void)cameraSnapshotControlDidUpdateMostRecentSnapshot:(id)a3
{
}

- (void)cameraSnapshotControl:(id)a3 didTakeSnapshot:(id)a4 error:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_retain();
  id v9 = a5;
  sub_251B52500(a4, a5);

  swift_release();
}

- (void)cameraUserSettingsDidUpdate:(id)a3
{
}

- (_TtC13HomeDataModel16CameraController)init
{
  swift_defaultActor_initialize();
  result = (_TtC13HomeDataModel16CameraController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (NSString)description
{
  swift_retain();
  CameraController.description.getter();
  swift_release();
  v2 = (void *)sub_251F356C0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

@end