@interface __AISSetupController
- (__AISSetupController)init;
- (__AISSetupController)initWithQueue:(id)a3;
- (void)setupWithContext:(id)a3 completionHandler:(id)a4;
@end

@implementation __AISSetupController

- (__AISSetupController)initWithQueue:(id)a3
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D97D0);
  MEMORY[0x270FA5388](v4 - 8);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_248174C90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  type metadata accessor for SetupController();
  uint64_t v8 = swift_allocObject();
  id v9 = a3;
  SetupController.init(queue:endpoint:inactiveSession:)(a3, (uint64_t)v6, 0);
  v10 = (objc_class *)type metadata accessor for __SetupController();
  v11 = (char *)objc_allocWithZone(v10);
  *(void *)&v11[OBJC_IVAR_____AISSetupController_setupController] = v8;
  v14.receiver = v11;
  v14.super_class = v10;
  v12 = [(__AISSetupController *)&v14 init];

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v12;
}

- (void)setupWithContext:(id)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = sub_2480A096C;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  id v9 = self;
  sub_24809CE74(v8, (uint64_t)v6, v7);
  sub_247F98D68((uint64_t)v6);
}

- (__AISSetupController)init
{
  result = (__AISSetupController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end