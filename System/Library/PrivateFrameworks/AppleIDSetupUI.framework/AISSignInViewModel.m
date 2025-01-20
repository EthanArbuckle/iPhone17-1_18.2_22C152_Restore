@interface AISSignInViewModel
- (UIImage)headerImage;
- (_TtC14AppleIDSetupUI18AISSignInViewModel)init;
- (id)authenticationContext;
- (void)signInViewController:(id)a3 didCompleteWithAuthenticationResults:(id)a4 completionHandler:(id)a5;
- (void)signInViewControllerDidCancel:(id)a3;
- (void)willAuthenticateWithContext:(id)a3;
@end

@implementation AISSignInViewModel

- (UIImage)headerImage
{
  v2 = (void *)sub_2482E75AC();
  return (UIImage *)v2;
}

- (_TtC14AppleIDSetupUI18AISSignInViewModel)init
{
  result = (_TtC14AppleIDSetupUI18AISSignInViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC14AppleIDSetupUI18AISSignInViewModel_contextProvider);
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14AppleIDSetupUI18AISSignInViewModel_selectedMember);
}

- (void)signInViewControllerDidCancel:(id)a3
{
  uint64_t v5 = sub_24835C668();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = a3;
  v10 = self;
  sub_24835C5B8();
  v11 = sub_24835C658();
  os_log_type_t v12 = sub_24835D648();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_2482BA000, v11, v12, "AISSignInViewModel: signInViewControllerDidCancel", v13, 2u);
    MEMORY[0x24C579C40](v13, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)signInViewController:(id)a3 didCompleteWithAuthenticationResults:(id)a4 completionHandler:(id)a5
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269313750);
  MEMORY[0x270FA5388](v8 - 8);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a5);
  uint64_t v12 = sub_24835D3A8();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v11;
  uint64_t v14 = sub_24835D5F8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v10, 1, 1, v14);
  sub_24835D5C8();
  v15 = self;
  id v16 = a3;
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v17 = sub_24835D5B8();
  v18 = (void *)swift_allocObject();
  uint64_t v19 = MEMORY[0x263F8F500];
  v18[2] = v17;
  v18[3] = v19;
  v18[4] = v12;
  v18[5] = v15;
  v18[6] = sub_2482E797C;
  v18[7] = v13;
  sub_2482D6148((uint64_t)v10, (uint64_t)&unk_2693139A8, (uint64_t)v18);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (void)willAuthenticateWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_2482E770C(v4);
}

- (id)authenticationContext
{
  v2 = self;
  id v3 = sub_2482E71C0();

  return v3;
}

@end