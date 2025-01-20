@interface _AppExtensionHostView.HostCoordinator
- (_TtCV15ImagePlayground21_AppExtensionHostView15HostCoordinator)init;
- (void)hostViewControllerDidActivate:(id)a3;
- (void)hostViewControllerWillDeactivate:(id)a3 error:(id)a4;
@end

@implementation _AppExtensionHostView.HostCoordinator

- (void)hostViewControllerDidActivate:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3BD50);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2443BA9E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  sub_2443BA950();
  id v9 = a3;
  v10 = self;
  id v11 = v9;
  uint64_t v12 = sub_2443BA940();
  v13 = (void *)swift_allocObject();
  uint64_t v14 = MEMORY[0x263F8F500];
  v13[2] = v12;
  v13[3] = v14;
  v13[4] = v10;
  v13[5] = v11;
  sub_243EACE30((uint64_t)v7, (uint64_t)&unk_268E3BD70, (uint64_t)v13);

  swift_release();
}

- (void)hostViewControllerWillDeactivate:(id)a3 error:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3BD50);
  MEMORY[0x270FA5388](v7 - 8);
  id v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_2443BA9E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  sub_2443BA950();
  id v11 = self;
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = sub_2443BA940();
  uint64_t v15 = (void *)swift_allocObject();
  uint64_t v16 = MEMORY[0x263F8F500];
  v15[2] = v14;
  v15[3] = v16;
  v15[4] = v11;
  sub_243EACE30((uint64_t)v9, (uint64_t)&unk_268E3BD60, (uint64_t)v15);

  swift_release();
}

- (_TtCV15ImagePlayground21_AppExtensionHostView15HostCoordinator)init
{
  result = (_TtCV15ImagePlayground21_AppExtensionHostView15HostCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end