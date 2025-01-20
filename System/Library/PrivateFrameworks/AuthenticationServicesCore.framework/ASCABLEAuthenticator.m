@interface ASCABLEAuthenticator
- (_TtC26AuthenticationServicesCore20ASCABLEAuthenticator)init;
- (_TtC26AuthenticationServicesCore20ASCABLEAuthenticator)initWithCaBLEURL:(id)a3 error:(id *)a4;
- (void)dealloc;
- (void)finishTransactionWithCredential:(id)a3 error:(id)a4;
- (void)sendExcludedCredentialMatchError;
- (void)startWithCompletionHandler:(id)a3;
@end

@implementation ASCABLEAuthenticator

- (_TtC26AuthenticationServicesCore20ASCABLEAuthenticator)initWithCaBLEURL:(id)a3 error:(id *)a4
{
  uint64_t v4 = sub_2193E1FF0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  v8 = &v16[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v6);
  v10 = &v16[-v9];
  sub_2193E1FA0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v5 + 16))(v8, v10, v4);
  id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFEEF8]), sel_init);
  id v12 = objc_allocWithZone((Class)type metadata accessor for ASCABLEAuthenticator());
  sub_2193541BC((uint64_t)v8, v11);
  v14 = v13;
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v10, v4);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v14;
}

- (void)startWithCompletionHandler:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = (void (**)(uint64_t, uint64_t))((char *)self
                                              + OBJC_IVAR____TtC26AuthenticationServicesCore20ASCABLEAuthenticator_completionHandler);
  uint64_t v7 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC26AuthenticationServicesCore20ASCABLEAuthenticator_completionHandler);
  *uint64_t v6 = sub_219360404;
  v6[1] = (void (*)(uint64_t, uint64_t))v5;
  v8 = self;
  swift_retain();
  sub_219360334(v7);
  sub_219354BF4(0);
  objc_msgSend(*(id *)((char *)&v8->super.isa + OBJC_IVAR____TtC26AuthenticationServicesCore20ASCABLEAuthenticator_powerLogger), sel_logAuthenticationStartedEventIfNeeded);

  swift_release();
}

- (void)sendExcludedCredentialMatchError
{
  v2 = self;
  sub_219352BA4();
}

- (void)finishTransactionWithCredential:(id)a3 error:(id)a4
{
  swift_unknownObjectRetain();
  uint64_t v7 = self;
  id v8 = a4;
  sub_2193530DC((uint64_t)a3, a4);
  swift_unknownObjectRelease();
}

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC26AuthenticationServicesCore20ASCABLEAuthenticator_bluetoothAdvertiser);
  v3 = self;
  objc_msgSend(v2, sel_invalidate);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for ASCABLEAuthenticator();
  [(ASCABLEAuthenticator *)&v4 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26AuthenticationServicesCore20ASCABLEAuthenticator_bluetoothAdvertiser));
  sub_219360620((uint64_t)self + OBJC_IVAR____TtC26AuthenticationServicesCore20ASCABLEAuthenticator_advertisement, (uint64_t *)&unk_26AC27230);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26AuthenticationServicesCore20ASCABLEAuthenticator_webSocket));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26AuthenticationServicesCore20ASCABLEAuthenticator_apsConnection));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26AuthenticationServicesCore20ASCABLEAuthenticator_apsWrapper));
  sub_219360334(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC26AuthenticationServicesCore20ASCABLEAuthenticator_completionHandler));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26AuthenticationServicesCore20ASCABLEAuthenticator_powerLogger));
  sub_219360140((uint64_t)self + OBJC_IVAR____TtC26AuthenticationServicesCore20ASCABLEAuthenticator_currentCTAPCommand, (uint64_t)v3, &qword_267C18D10);
  sub_21935C580((uint64_t)v3, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_21935C604);
  swift_release();
}

- (_TtC26AuthenticationServicesCore20ASCABLEAuthenticator)init
{
  result = (_TtC26AuthenticationServicesCore20ASCABLEAuthenticator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end