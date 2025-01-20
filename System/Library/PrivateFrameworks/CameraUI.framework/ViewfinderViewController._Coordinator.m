@interface ViewfinderViewController._Coordinator
- (_TtCV8CameraUI24ViewfinderViewControllerP33_97E8248984EBD43B1770A42696E06CCA12_Coordinator)init;
- (void)viewfinderViewController:(CAMViewfinderViewController *)a3 didRequestUnlockForCameraRollController:(CAMCameraRollController *)a4 withCameraRollActionType:(unint64_t)a5 completionHandler:(id)a6;
- (void)viewfinderViewControllerDidRequestUnlockForDocumentScanning:(CAMViewfinderViewController *)a3 completionHandler:(id)a4;
@end

@implementation ViewfinderViewController._Coordinator

- (void)viewfinderViewController:(CAMViewfinderViewController *)a3 didRequestUnlockForCameraRollController:(CAMCameraRollController *)a4 withCameraRollActionType:(unint64_t)a5 completionHandler:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267600CD8);
  MEMORY[0x270FA5388](v11 - 8);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = sub_209C4D2F8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_2676010D8;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_2676010E0;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  v21 = self;
  sub_209C36468((uint64_t)v13, (uint64_t)&unk_2676010E8, (uint64_t)v18);
  swift_release();
}

- (void)viewfinderViewControllerDidRequestUnlockForDocumentScanning:(CAMViewfinderViewController *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267600CD8);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_209C4D2F8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_267601088;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_267601098;
  v14[5] = v13;
  v15 = a3;
  uint64_t v16 = self;
  sub_209C36468((uint64_t)v9, (uint64_t)&unk_2676010A8, (uint64_t)v14);
  swift_release();
}

- (_TtCV8CameraUI24ViewfinderViewControllerP33_97E8248984EBD43B1770A42696E06CCA12_Coordinator)init
{
  result = (_TtCV8CameraUI24ViewfinderViewControllerP33_97E8248984EBD43B1770A42696E06CCA12_Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end