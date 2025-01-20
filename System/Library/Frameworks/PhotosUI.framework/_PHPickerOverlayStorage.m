@interface _PHPickerOverlayStorage
- (_TtC8PhotosUIP33_E2E20DF4EAC1FCE07E5336962A6E0BEF23_PHPickerOverlayStorage)init;
- (void)picker:(id)a3 didFinishPicking:(id)a4;
@end

@implementation _PHPickerOverlayStorage

- (void)picker:(id)a3 didFinishPicking:(id)a4
{
  sub_217C3F6FC(0, &qword_267BB1AB0);
  unint64_t v6 = sub_217C5CF78();
  id v7 = a3;
  v8 = self;
  sub_217C3C274((uint64_t)v7, v6);

  swift_bridgeObjectRelease();
}

- (_TtC8PhotosUIP33_E2E20DF4EAC1FCE07E5336962A6E0BEF23_PHPickerOverlayStorage)init
{
}

- (void).cxx_destruct
{
  sub_217C3D858((uint64_t)self + OBJC_IVAR____TtC8PhotosUIP33_E2E20DF4EAC1FCE07E5336962A6E0BEF23_PHPickerOverlayStorage_configuration);
  v3 = (char *)self + OBJC_IVAR____TtC8PhotosUIP33_E2E20DF4EAC1FCE07E5336962A6E0BEF23_PHPickerOverlayStorage_delegate;

  sub_217C3F664((uint64_t)v3);
}

@end