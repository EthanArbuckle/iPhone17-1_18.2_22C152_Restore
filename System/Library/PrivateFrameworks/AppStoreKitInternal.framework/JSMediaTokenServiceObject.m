@interface JSMediaTokenServiceObject
- (NSString)tokenString;
- (_TtC19AppStoreKitInternal25JSMediaTokenServiceObject)init;
- (id)overrideToken:(id)a3;
- (id)refreshToken;
- (void)resetToken;
@end

@implementation JSMediaTokenServiceObject

- (id)refreshToken
{
  swift_getObjectType();
  sub_1E15E9E84(0, (unint64_t *)&qword_1EBF368E8);
  v3 = self;
  v4 = (void *)sub_1E1D5CC88();
  v5 = (void *)sub_1E1D5CC98();

  return v5;
}

- (id)overrideToken:(id)a3
{
  swift_getObjectType();
  sub_1E15E9E84(0, (unint64_t *)&qword_1EBF368E8);
  id v5 = a3;
  v6 = self;
  v7 = (void *)sub_1E1D5CC88();
  v8 = (void *)sub_1E1D5CC98();

  return v8;
}

- (NSString)tokenString
{
  sub_1E1D5A5D8();
  v3 = self;
  sub_1E1D5A5C8();
  if (qword_1EBF36410 != -1) {
    swift_once();
  }
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBF404B8);
  __swift_project_value_buffer(v4, (uint64_t)qword_1EBF363F0);
  sub_1E1D59DF8();
  swift_release();

  id v5 = (void *)sub_1E1D5BE18();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (void)resetToken
{
  sub_1E1D5A5D8();
  v3 = self;
  sub_1E1D5A5C8();
  if (qword_1EBF36410 != -1) {
    swift_once();
  }
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBF404B8);
  uint64_t v5 = __swift_project_value_buffer(v4, (uint64_t)qword_1EBF363F0);
  v7[3] = v4;
  v7[4] = sub_1E17F4578();
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v7);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(boxed_opaque_existential_0, v5, v4);
  sub_1E1D5A598();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  objc_msgSend(*(id *)((char *)&v3->super.isa + OBJC_IVAR____TtC19AppStoreKitInternal25JSMediaTokenServiceObject_tokenService), sel_invalidateMediaToken);
}

- (_TtC19AppStoreKitInternal25JSMediaTokenServiceObject)init
{
  result = (_TtC19AppStoreKitInternal25JSMediaTokenServiceObject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end