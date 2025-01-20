@interface CNPhotoPickerCoordinator
- (_TtC10ContactsUI24CNPhotoPickerCoordinator)init;
- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4;
@end

@implementation CNPhotoPickerCoordinator

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  type metadata accessor for InfoKey(0);
  sub_18B72B6D8((unint64_t *)&qword_1E913B990, type metadata accessor for InfoKey);
  uint64_t v6 = sub_18B985D78();
  id v7 = a3;
  v8 = self;
  sub_18B72B720(v6);

  swift_bridgeObjectRelease();
}

- (_TtC10ContactsUI24CNPhotoPickerCoordinator)init
{
  result = (_TtC10ContactsUI24CNPhotoPickerCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end