@interface CameraPickerCoordinator
- (_TtC15ImagePlayground23CameraPickerCoordinator)init;
- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4;
- (void)imagePickerControllerDidCancel:(id)a3;
@end

@implementation CameraPickerCoordinator

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  type metadata accessor for InfoKey(0);
  sub_243FD83A8();
  uint64_t v6 = sub_2443BA310();
  id v7 = a3;
  v8 = self;
  sub_243FD8400(v6);

  swift_bridgeObjectRelease();
}

- (void)imagePickerControllerDidCancel:(id)a3
{
  uint64_t v5 = sub_2443B7A30();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E3C1A0);
  MEMORY[0x270FA5388](v6);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_243E9DD58((uint64_t)self + OBJC_IVAR____TtC15ImagePlayground23CameraPickerCoordinator__presentationMode, (uint64_t)v8, (uint64_t *)&unk_268E3C1A0);
  id v9 = a3;
  v10 = self;
  MEMORY[0x24568CC50](v6);
  sub_2443B7A20();
  sub_2443B9AD0();
  sub_243E9DDBC((uint64_t)v8, (uint64_t *)&unk_268E3C1A0);
}

- (_TtC15ImagePlayground23CameraPickerCoordinator)init
{
  result = (_TtC15ImagePlayground23CameraPickerCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end