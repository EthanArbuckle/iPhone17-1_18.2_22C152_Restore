@interface AISSilentSignOutFlowControllerDelegate
- (_TtC18AppleIDSetupDaemon38AISSilentSignOutFlowControllerDelegate)init;
- (void)signOutFlowController:(AASignOutFlowController *)a3 disableFindMyDeviceForAccount:(ACAccount *)a4 completion:(id)a5;
- (void)signOutFlowController:(AASignOutFlowController *)a3 performWalrusValidationForAccount:(ACAccount *)a4 completion:(id)a5;
- (void)signOutFlowController:(AASignOutFlowController *)a3 showAlertWithTitle:(NSString *)a4 message:(NSString *)a5 completion:(id)a6;
- (void)signOutFlowController:(AASignOutFlowController *)a3 signOutAccount:(ACAccount *)a4 completion:(id)a5;
@end

@implementation AISSilentSignOutFlowControllerDelegate

- (void)signOutFlowController:(AASignOutFlowController *)a3 showAlertWithTitle:(NSString *)a4 message:(NSString *)a5 completion:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B13C9D0);
  MEMORY[0x270FA5388](v11 - 8);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = sub_24829AD90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_26930F3C0;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_26930F3C8;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = self;
  sub_248285628((uint64_t)v13, (uint64_t)&unk_26930F3D0, (uint64_t)v18);
  swift_release();
}

- (void)signOutFlowController:(AASignOutFlowController *)a3 disableFindMyDeviceForAccount:(ACAccount *)a4 completion:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B13C9D0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_24829AD90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_26930F398;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_26930F3A0;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_248285628((uint64_t)v11, (uint64_t)&unk_26930F3A8, (uint64_t)v16);
  swift_release();
}

- (void)signOutFlowController:(AASignOutFlowController *)a3 performWalrusValidationForAccount:(ACAccount *)a4 completion:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B13C9D0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_24829AD90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_26930F370;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_26930F378;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_248285628((uint64_t)v11, (uint64_t)&unk_26930F380, (uint64_t)v16);
  swift_release();
}

- (void)signOutFlowController:(AASignOutFlowController *)a3 signOutAccount:(ACAccount *)a4 completion:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B13C9D0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_24829AD90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_26930F340;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_26930FE10;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_248285628((uint64_t)v11, (uint64_t)&unk_26930F350, (uint64_t)v16);
  swift_release();
}

- (_TtC18AppleIDSetupDaemon38AISSilentSignOutFlowControllerDelegate)init
{
  result = (_TtC18AppleIDSetupDaemon38AISSilentSignOutFlowControllerDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end