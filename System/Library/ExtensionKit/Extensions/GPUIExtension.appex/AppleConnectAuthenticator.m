@interface AppleConnectAuthenticator
- (_TtC13GPUIExtension25AppleConnectAuthenticator)init;
- (void)authenticateIfNeededWithCompletion:(id)a3;
@end

@implementation AppleConnectAuthenticator

- (_TtC13GPUIExtension25AppleConnectAuthenticator)init
{
  return (_TtC13GPUIExtension25AppleConnectAuthenticator *)sub_100005B80();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13GPUIExtension25AppleConnectAuthenticator_context);
}

- (void)authenticateIfNeededWithCompletion:(id)a3
{
  uint64_t v5 = sub_100004178(&qword_10000C4F0);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  uint64_t v10 = sub_100006B68();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  sub_100006B48();
  v11 = self;
  swift_retain();
  uint64_t v12 = sub_100006B38();
  v13 = (void *)swift_allocObject();
  v13[2] = v12;
  v13[3] = &protocol witness table for MainActor;
  v13[4] = v11;
  v13[5] = sub_100006458;
  v13[6] = v9;
  sub_100003AA4((uint64_t)v7, (uint64_t)&unk_10000C628, (uint64_t)v13);

  swift_release();
  swift_release();
}

@end