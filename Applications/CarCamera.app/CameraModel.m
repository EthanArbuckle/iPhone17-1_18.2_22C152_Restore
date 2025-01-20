@interface CameraModel
- (_TtC9CarCamera11CameraModel)init;
- (void)cameraButtonService:(id)a3 didUpdateChildrenIdentifiers:(id)a4;
- (void)cameraButtonService:(id)a3 didUpdateHidden:(BOOL)a4;
- (void)cameraButtonService:(id)a3 didUpdateSelectedEntryIndex:(unsigned __int8)a4;
- (void)cameraButtonService:(id)a3 didUpdateSortOrder:(unsigned __int8)a4;
- (void)cameraGeneralService:(id)a3 didUpdateOn:(BOOL)a4;
- (void)cameraGeneralService:(id)a3 didUpdateUserDismissible:(BOOL)a4;
- (void)carDidUpdateAccessories:(id)a3;
@end

@implementation CameraModel

- (void)carDidUpdateAccessories:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100014D54();
}

- (void)cameraGeneralService:(id)a3 didUpdateOn:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  sub_100014F40(v5);
}

- (void)cameraGeneralService:(id)a3 didUpdateUserDismissible:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_10000FAB8((uint64_t)v6, a4);
}

- (void)cameraButtonService:(id)a3 didUpdateSortOrder:(unsigned __int8)a4
{
  id v5 = a3;
  id v6 = self;
  sub_100015134();
}

- (void)cameraButtonService:(id)a3 didUpdateHidden:(BOOL)a4
{
  id v5 = a3;
  id v6 = self;
  sub_10000FF3C(v5);
}

- (void)cameraButtonService:(id)a3 didUpdateChildrenIdentifiers:(id)a4
{
  if (a4) {
    uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = a3;
  v8 = self;
  sub_100010148(v7, v6);

  swift_bridgeObjectRelease();
}

- (void)cameraButtonService:(id)a3 didUpdateSelectedEntryIndex:(unsigned __int8)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_100010ACC(v5);
}

- (_TtC9CarCamera11CameraModel)init
{
  result = (_TtC9CarCamera11CameraModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC9CarCamera11CameraModel__cameraCloseButton;
  uint64_t v4 = sub_100005214(&qword_10003F550);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  id v5 = (char *)self + OBJC_IVAR____TtC9CarCamera11CameraModel__visibleButtons;
  uint64_t v6 = sub_100005214(&qword_10003F548);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  id v7 = (char *)self + OBJC_IVAR____TtC9CarCamera11CameraModel__identifierChanged;
  uint64_t v8 = sub_100005214(&qword_10003F540);
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  v9 = (char *)self + OBJC_IVAR____TtC9CarCamera11CameraModel__submenuParent;
  uint64_t v10 = sub_100005214(&qword_10003F538);
  (*(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end