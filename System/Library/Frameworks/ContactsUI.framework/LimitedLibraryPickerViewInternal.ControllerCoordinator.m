@interface LimitedLibraryPickerViewInternal.ControllerCoordinator
- (_TtCV10ContactsUI32LimitedLibraryPickerViewInternal21ControllerCoordinator)init;
- (void)contactPicker:(id)a3 didSelectContacts:(id)a4;
- (void)contactPickerDidCancel:(id)a3;
@end

@implementation LimitedLibraryPickerViewInternal.ControllerCoordinator

- (void)contactPicker:(id)a3 didSelectContacts:(id)a4
{
  sub_18B6950C8();
  unint64_t v6 = sub_18B985F88();
  id v7 = a3;
  v8 = self;
  sub_18B694CC0(v6);

  swift_bridgeObjectRelease();
}

- (void)contactPickerDidCancel:(id)a3
{
  id v4 = a3;
  self;
  sub_18B694FD4();
}

- (_TtCV10ContactsUI32LimitedLibraryPickerViewInternal21ControllerCoordinator)init
{
  result = (_TtCV10ContactsUI32LimitedLibraryPickerViewInternal21ControllerCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end