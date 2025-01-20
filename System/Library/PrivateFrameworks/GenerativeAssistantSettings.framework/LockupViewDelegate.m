@interface LockupViewDelegate
- (_TtC27GenerativeAssistantSettings18LockupViewDelegate)init;
- (id)presentingViewControllerForLockupView:(id)a3;
- (void)lockupView:(id)a3 didFailRequestWithError:(id)a4;
- (void)lockupViewDidFinishRequest:(id)a3;
@end

@implementation LockupViewDelegate

- (_TtC27GenerativeAssistantSettings18LockupViewDelegate)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C1A0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v12 = 0;
  v8 = self;
  sub_24FABF5F0();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))((uint64_t)v8 + OBJC_IVAR____TtC27GenerativeAssistantSettings18LockupViewDelegate__hideLockup, v7, v4);

  v11.receiver = v8;
  v11.super_class = ObjectType;
  return [(LockupViewDelegate *)&v11 init];
}

- (id)presentingViewControllerForLockupView:(id)a3
{
  return 0;
}

- (void)lockupView:(id)a3 didFailRequestWithError:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = self;
  sub_24FAAE810();
}

- (void)lockupViewDidFinishRequest:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C2D0);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = &v13[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_getKeyPath();
  swift_getKeyPath();
  id v8 = a3;
  v9 = self;
  sub_24FABF600();
  swift_release();
  swift_release();
  if (v13[15] == 1)
  {
    uint64_t v10 = sub_24FAC0110();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
    objc_super v11 = (void *)swift_allocObject();
    v11[2] = 0;
    v11[3] = 0;
    v11[4] = v9;
    char v12 = v9;
    sub_24FA937DC((uint64_t)v7, (uint64_t)&unk_269A4C2E0, (uint64_t)v11);
    swift_release();
  }
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC27GenerativeAssistantSettings18LockupViewDelegate__hideLockup;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C1A0);
  uint64_t v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end