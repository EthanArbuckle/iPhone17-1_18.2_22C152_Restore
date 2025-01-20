@interface PrivacyAuthenticatorWrapper
- (_TtC19ContactlessReaderUI27PrivacyAuthenticatorWrapper)init;
- (void)authenticator:(id)a3 didTransitionToCoachingState:(int64_t)a4;
- (void)authenticator:(id)a3 didTransitionToEvaluationStateWithEvent:(id)a4;
- (void)dealloc;
- (void)dismissPasscodeViewController;
- (void)dismissPassphraseViewController;
- (void)presentPasscodeViewController:(id)a3 completionHandler:(id)a4 reply:(id)a5;
- (void)presentPassphraseViewController:(id)a3 completionHandler:(id)a4 reply:(id)a5;
@end

@implementation PrivacyAuthenticatorWrapper

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC19ContactlessReaderUI27PrivacyAuthenticatorWrapper_authenticator);
  if (v2)
  {
    ObjectType = (objc_class *)swift_getObjectType();
    v5 = self;
    objc_msgSend(v2, sel_invalidate);
    objc_msgSend(v2, sel_setDelegate_, 0);
    v6.receiver = v5;
    v6.super_class = ObjectType;
    [(PrivacyAuthenticatorWrapper *)&v6 dealloc];
  }
  else
  {
    __break(1u);
  }
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19ContactlessReaderUI27PrivacyAuthenticatorWrapper_authenticator));
  v3 = (char *)self + OBJC_IVAR____TtC19ContactlessReaderUI27PrivacyAuthenticatorWrapper_delegate;
  sub_23EDC4A90((uint64_t)v3);
}

- (_TtC19ContactlessReaderUI27PrivacyAuthenticatorWrapper)init
{
  result = (_TtC19ContactlessReaderUI27PrivacyAuthenticatorWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)authenticator:(id)a3 didTransitionToEvaluationStateWithEvent:(id)a4
{
  var1 = (char *)a4.var1;
  var0 = (char *)a4.var0;
  id v7 = a3;
  v8 = self;
  sub_23EEE4A08(var0, var1);
}

- (void)authenticator:(id)a3 didTransitionToCoachingState:(int64_t)a4
{
  id v6 = a3;
  id v7 = self;
  sub_23EEE5C0C(a4);
}

- (void)presentPasscodeViewController:(id)a3 completionHandler:(id)a4 reply:(id)a5
{
  v8 = (uint64_t (*)(uint64_t))_Block_copy(a4);
  v9 = (uint64_t (*)())_Block_copy(a5);
  v10 = v9;
  if (v8)
  {
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v8;
    v8 = (uint64_t (*)(uint64_t))sub_23EEE62E4;
    if (!v10) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  uint64_t v11 = 0;
  if (v9)
  {
LABEL_3:
    *(void *)(swift_allocObject() + 16) = v10;
    v10 = sub_23EEE62E0;
  }
LABEL_5:
  id v12 = a3;
  v13 = self;
  sub_23EEE5E28(a3, v8, v11);
  sub_23EDB8970((uint64_t)v10);
  sub_23EDB8970((uint64_t)v8);
}

- (void)presentPassphraseViewController:(id)a3 completionHandler:(id)a4 reply:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268C21A00);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = _Block_copy(a4);
  v13 = (void (*)(uint64_t, unint64_t))_Block_copy(a5);
  v14 = v13;
  if (v12)
  {
    *(void *)(swift_allocObject() + 16) = v12;
    id v12 = sub_23EEE49F0;
    if (!v14) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  if (v13)
  {
LABEL_3:
    *(void *)(swift_allocObject() + 16) = v14;
    v14 = sub_23EEE49B0;
  }
LABEL_5:
  uint64_t v15 = qword_268C202D8;
  id v16 = a3;
  v17 = self;
  if (v15 != -1) {
    swift_once();
  }
  uint64_t v18 = __swift_project_value_buffer(v9, (uint64_t)qword_268C266C0);
  sub_23EDB8CB8(v18, (uint64_t)v11, (uint64_t *)&unk_268C21A00);
  uint64_t v19 = sub_23EF03AA8();
  uint64_t v20 = *(void *)(v19 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v11, 1, v19) == 1)
  {
    sub_23EDBA1A8((uint64_t)v11);
  }
  else
  {
    sub_23ED9D368((uint64_t)v17, 0xD00000000000003BLL, 0x800000023EF1A300, 0, 0xE000000000000000);
    (*(void (**)(char *, uint64_t))(v20 + 8))(v11, v19);
  }
  sub_23EDB8970((uint64_t)v14);
  sub_23EDB8970((uint64_t)v12);
}

- (void)dismissPasscodeViewController
{
  v2 = self;
  sub_23EEE3CB0();
}

- (void)dismissPassphraseViewController
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268C21A00);
  MEMORY[0x270FA5388](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = qword_268C202D8;
  id v7 = self;
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v8 = __swift_project_value_buffer(v3, (uint64_t)qword_268C266C0);
  sub_23EDB8CB8(v8, (uint64_t)v5, (uint64_t *)&unk_268C21A00);
  uint64_t v9 = sub_23EF03AA8();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v5, 1, v9) == 1)
  {
    sub_23EDBA1A8((uint64_t)v5);
  }
  else
  {
    sub_23ED9D368((uint64_t)v7, 0xD000000000000021, 0x800000023EF1A2B0, 0, 0xE000000000000000);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v5, v9);
  }
}

@end