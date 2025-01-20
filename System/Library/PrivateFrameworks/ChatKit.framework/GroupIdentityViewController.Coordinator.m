@interface GroupIdentityViewController.Coordinator
- (_TtCV7ChatKit27GroupIdentityViewController11Coordinator)init;
- (void)dismissIdentityPicker:(id)a3;
- (void)handleAddressBookChanged:(id)a3;
- (void)handleGroupDisplayNameChanged:(id)a3;
- (void)handleGroupPhotoChanged:(id)a3;
- (void)headerViewControllerDidTapActionButton:(id)a3;
- (void)presentGroupNameAndPhotoEditor;
- (void)visualIdentityPicker:(id)a3 didUpdatePhotoForVisualIdentity:(id)a4 withContactImage:(id)a5;
- (void)visualIdentityPicker:(id)a3 presentationControllerWillDismiss:(id)a4;
- (void)visualIdentityPickerDidCancel:(id)a3;
@end

@implementation GroupIdentityViewController.Coordinator

- (void)handleGroupPhotoChanged:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_18F6504D4(v4);
}

- (void)handleGroupDisplayNameChanged:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_18F650C20(v4);
}

- (void)handleAddressBookChanged:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_18F65139C(v4);
}

- (void)headerViewControllerDidTapActionButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_18F651C08();
}

- (void)presentGroupNameAndPhotoEditor
{
  v2 = self;
  sub_18F651C08();
}

- (void)visualIdentityPicker:(id)a3 presentationControllerWillDismiss:(id)a4
{
  uint64_t v6 = qword_1E92378B0;
  id v7 = a3;
  id v13 = a4;
  v8 = self;
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_18F7B68E0();
  __swift_project_value_buffer(v9, (uint64_t)qword_1E923E0E0);
  v10 = sub_18F7B68C0();
  os_log_type_t v11 = sub_18F7B9D60();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_18EF18000, v10, v11, "visualIdentityPicker.presentationControllerWillDismiss", v12, 2u);
    MEMORY[0x192FBC240](v12, -1, -1);
  }
}

- (void)dismissIdentityPicker:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_18F6539B4(v4);
}

- (void)visualIdentityPickerDidCancel:(id)a3
{
  uint64_t v4 = qword_1E92378B0;
  id v5 = a3;
  v10 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_18F7B68E0();
  __swift_project_value_buffer(v6, (uint64_t)qword_1E923E0E0);
  id v7 = sub_18F7B68C0();
  os_log_type_t v8 = sub_18F7B9D60();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_18EF18000, v7, v8, "visualIdentityPickerDidCancel", v9, 2u);
    MEMORY[0x192FBC240](v9, -1, -1);
  }

  sub_18F6539B4(v5);
}

- (void)visualIdentityPicker:(id)a3 didUpdatePhotoForVisualIdentity:(id)a4 withContactImage:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  os_log_type_t v11 = self;
  sub_18F653AF4(v8, v9);
}

- (_TtCV7ChatKit27GroupIdentityViewController11Coordinator)init
{
  result = (_TtCV7ChatKit27GroupIdentityViewController11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCV7ChatKit27GroupIdentityViewController11Coordinator_groupIdentityController);
}

@end