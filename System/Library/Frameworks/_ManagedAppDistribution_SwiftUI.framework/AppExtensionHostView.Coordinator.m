@interface AppExtensionHostView.Coordinator
- (_TtCV31_ManagedAppDistribution_SwiftUI20AppExtensionHostView11Coordinator)init;
- (void)hostViewControllerDidActivate:(id)a3;
@end

@implementation AppExtensionHostView.Coordinator

- (void)hostViewControllerDidActivate:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8BAE8);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24659DE38();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  sub_24659DE08();
  id v9 = a3;
  v10 = self;
  id v11 = v9;
  uint64_t v12 = sub_24659DDF8();
  v13 = (void *)swift_allocObject();
  uint64_t v14 = MEMORY[0x263F8F500];
  v13[2] = v12;
  v13[3] = v14;
  v13[4] = v10;
  v13[5] = v11;
  sub_246551CC0((uint64_t)v7, (uint64_t)&unk_268F8BAF8, (uint64_t)v13);
  swift_release();
}

- (_TtCV31_ManagedAppDistribution_SwiftUI20AppExtensionHostView11Coordinator)init
{
  result = (_TtCV31_ManagedAppDistribution_SwiftUI20AppExtensionHostView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end