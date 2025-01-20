@interface FamilyDependentPasswordResetController
- (_TtC14FamilyCircleUI38FamilyDependentPasswordResetController)init;
- (void)remoteUIController:(id)a3 didPresentObjectModel:(id)a4 modally:(BOOL)a5;
- (void)remoteUIController:(id)a3 didReceiveHTTPResponse:(id)a4 forRequest:(id)a5;
- (void)remoteUIController:(id)a3 didRefreshObjectModel:(id)a4;
- (void)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5 withCompletionHandler:(id)a6;
@end

@implementation FamilyDependentPasswordResetController

- (_TtC14FamilyCircleUI38FamilyDependentPasswordResetController)init
{
  result = (_TtC14FamilyCircleUI38FamilyDependentPasswordResetController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14FamilyCircleUI38FamilyDependentPasswordResetController_parentAccount));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14FamilyCircleUI38FamilyDependentPasswordResetController_ruiController));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14FamilyCircleUI38FamilyDependentPasswordResetController_serverResourceLoader));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14FamilyCircleUI38FamilyDependentPasswordResetController_serverHookHandler));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC14FamilyCircleUI38FamilyDependentPasswordResetController_sessionConfiguration);
}

- (void)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5 withCompletionHandler:(id)a6
{
  v10 = _Block_copy(a6);
  if (v10)
  {
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v10;
    v10 = sub_218AB132C;
  }
  else
  {
    uint64_t v11 = 0;
  }
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = self;
  sub_218AB05DC(a4, (uint64_t)a5, (void (*)(void, void))v10, v11);
  sub_218AB12E4((uint64_t)v10);
}

- (void)remoteUIController:(id)a3 didReceiveHTTPResponse:(id)a4 forRequest:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BEA638);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    sub_218CAC548();
    uint64_t v12 = sub_218CAC558();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    uint64_t v13 = sub_218CAC558();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  id v14 = a3;
  id v15 = a4;
  v16 = self;
  sub_218AB087C(a4, (uint64_t)v11);

  sub_218A50AA0((uint64_t)v11, &qword_267BEA638);
}

- (void)remoteUIController:(id)a3 didRefreshObjectModel:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_218AB0D58((uint64_t)a4);
}

- (void)remoteUIController:(id)a3 didPresentObjectModel:(id)a4 modally:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = self;
  sub_218AB0EE4((uint64_t)a4, a5);
}

@end