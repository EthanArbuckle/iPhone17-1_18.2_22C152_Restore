@interface AccountRecoveryRowViewModel
- (_TtC9CoreCDPUI27AccountRecoveryRowViewModel)init;
- (id)accountsForAccountManager:(id)a3;
@end

@implementation AccountRecoveryRowViewModel

- (_TtC9CoreCDPUI27AccountRecoveryRowViewModel)init
{
  result = (_TtC9CoreCDPUI27AccountRecoveryRowViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_21880E860((uint64_t)self + OBJC_IVAR____TtC9CoreCDPUI27AccountRecoveryRowViewModel_delegate);
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC9CoreCDPUI27AccountRecoveryRowViewModel__isRecoveryEnabled;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BDCE68);
  v6 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  ((void (*)(void *__return_ptr, char *, uint64_t))v6)((void *)(v4 - 8), v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC9CoreCDPUI27AccountRecoveryRowViewModel__isSpinnerActive;

  v6(v5, v4);
}

- (id)accountsForAccountManager:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BDDCC8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_218869480;
  v6 = (void *)*MEMORY[0x263F26D28];
  *(void *)(inited + 32) = *MEMORY[0x263F26D28];
  id v7 = a3;
  v8 = self;
  id v9 = v6;
  id v10 = objc_msgSend(v7, sel_accountStore);
  id v11 = objc_msgSend(v10, sel_aa_primaryAppleAccount);

  if (v11)
  {
    *(void *)(inited + 40) = v11;
    sub_218857FBC(inited);

    type metadata accessor for AIDAServiceType(0);
    sub_2188581F4();
    sub_218858234();
    v13 = (void *)sub_218861EE0();
    swift_bridgeObjectRelease();
    return v13;
  }
  else
  {
    __break(1u);
  }
  return result;
}

@end