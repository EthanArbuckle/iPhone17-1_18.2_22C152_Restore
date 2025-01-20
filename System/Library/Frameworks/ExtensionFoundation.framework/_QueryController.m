@interface _QueryController
- (NSString)description;
- (_TtC19ExtensionFoundationP33_CDD6639443F09112848BD34A3597427C16_QueryController)init;
- (void)dealloc;
- (void)queryControllerDidUpdate:(id)a3 resultDifference:(id)a4;
@end

@implementation _QueryController

- (void)dealloc
{
  v2 = self;
  sub_191FA7C4C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19ExtensionFoundationP33_CDD6639443F09112848BD34A3597427C16_QueryController_controller));

  swift_release();
}

- (void)queryControllerDidUpdate:(id)a3 resultDifference:(id)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92FC5C8);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_191F53E80();
  sub_191FBA4D8();
  v10 = *(void (**)(uint64_t, char *))((char *)&self->super.isa
                                               + OBJC_IVAR____TtC19ExtensionFoundationP33_CDD6639443F09112848BD34A3597427C16_QueryController_handler);
  id v11 = a3;
  v12 = self;
  id v13 = objc_msgSend(v11, sel_extensionIdentities);
  uint64_t v14 = sub_191FB9ED8();

  v10(v14, v9);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (NSString)description
{
  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC19ExtensionFoundationP33_CDD6639443F09112848BD34A3597427C16_QueryController_controller);
  v3 = self;
  id v4 = v2;
  id v5 = objc_msgSend(v4, sel_description);
  sub_191FB9DC8();

  uint64_t v6 = (void *)sub_191FB9DA8();
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

- (_TtC19ExtensionFoundationP33_CDD6639443F09112848BD34A3597427C16_QueryController)init
{
  result = (_TtC19ExtensionFoundationP33_CDD6639443F09112848BD34A3597427C16_QueryController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end