@interface FBADataClientStub
- (_TtC18Feedback_Assistant17FBADataClientStub)init;
- (id)initForBundle:(id)a3;
- (void)dataForURL:(id)a3 success:(id)a4 error:(id)a5;
- (void)dataForURL:(id)a3 successWithResponse:(id)a4 error:(id)a5;
- (void)dataForURLRequest:(id)a3 success:(id)a4 error:(id)a5;
- (void)dataForURLRequest:(id)a3 successWithResponse:(id)a4 error:(id)a5;
- (void)deleteAtURL:(id)a3 parameters:(id)a4 encoding:(unint64_t)a5 success:(id)a6 error:(id)a7;
- (void)deleteResourceAtURL:(id)a3 success:(id)a4 error:(id)a5;
- (void)didLogInWithLoginUserInfo:(id)a3 completion:(id)a4;
- (void)didLogOutWithCompletion:(id)a3;
- (void)jsonForURL:(id)a3 success:(id)a4 error:(id)a5;
- (void)jsonForURLRequest:(id)a3 success:(id)a4 error:(id)a5;
- (void)postToURL:(id)a3 parameters:(id)a4 encoding:(unint64_t)a5 success:(id)a6 error:(id)a7;
- (void)putToURL:(id)a3 parameters:(id)a4 encoding:(unint64_t)a5 success:(id)a6 error:(id)a7;
@end

@implementation FBADataClientStub

- (id)initForBundle:(id)a3
{
  id v3 = a3;
  id v4 = sub_100095758(v3);

  return v4;
}

- (void)didLogOutWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  v5 = (void (*)(void *))v4[2];
  v6 = self;
  v5(v4);
  _Block_release(v4);
}

- (void)didLogInWithLoginUserInfo:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  v7 = (void (*)(void *))v6[2];
  id v8 = a3;
  v9 = self;
  v7(v6);
  _Block_release(v6);
}

- (void)dataForURLRequest:(id)a3 success:(id)a4 error:(id)a5
{
}

- (void)dataForURLRequest:(id)a3 successWithResponse:(id)a4 error:(id)a5
{
}

- (void)jsonForURLRequest:(id)a3 success:(id)a4 error:(id)a5
{
  uint64_t v8 = sub_10004DE60(&qword_100122790);
  __chkstk_darwin(v8 - 8);
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for URLRequest();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = _Block_copy(a4);
  v16 = _Block_copy(a5);
  static URLRequest._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v15;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v16;
  v19 = self;
  URLRequest.url.getter();
  uint64_t v20 = type metadata accessor for URL();
  uint64_t v21 = *(void *)(v20 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v10, 1, v20) == 1)
  {
    __break(1u);
  }
  else
  {
    sub_100093304((uint64_t)v10, (uint64_t)sub_10009603C, v17, (uint64_t)sub_100095E3C, v18);
    (*(void (**)(char *, uint64_t))(v21 + 8))(v10, v20);

    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

- (void)dataForURL:(id)a3 success:(id)a4 error:(id)a5
{
  uint64_t v8 = type metadata accessor for URL();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a4);
  uint64_t v13 = _Block_copy(a5);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v12;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v13;
  v16 = self;
  sub_100094224((uint64_t)v11, (uint64_t)sub_100095E38, v14, (uint64_t)sub_100095E3C, v15);

  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)dataForURL:(id)a3 successWithResponse:(id)a4 error:(id)a5
{
  uint64_t v8 = type metadata accessor for URL();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a4);
  uint64_t v13 = _Block_copy(a5);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = self;
  _Block_release(v13);
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)jsonForURL:(id)a3 success:(id)a4 error:(id)a5
{
  uint64_t v8 = type metadata accessor for URL();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a4);
  uint64_t v13 = _Block_copy(a5);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v12;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v13;
  v16 = self;
  sub_100093304((uint64_t)v11, (uint64_t)sub_100095E40, v14, (uint64_t)sub_100095E3C, v15);

  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)postToURL:(id)a3 parameters:(id)a4 encoding:(unint64_t)a5 success:(id)a6 error:(id)a7
{
  uint64_t v10 = type metadata accessor for URL();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  uint64_t v15 = _Block_copy(a7);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v14;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v15;
  uint64_t v18 = self;
  sub_100094224((uint64_t)v13, (uint64_t)sub_100095E38, v16, (uint64_t)sub_100095E3C, v17);

  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)putToURL:(id)a3 parameters:(id)a4 encoding:(unint64_t)a5 success:(id)a6 error:(id)a7
{
  uint64_t v10 = type metadata accessor for URL();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  uint64_t v15 = _Block_copy(a7);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v14;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v15;
  uint64_t v18 = self;
  sub_100094224((uint64_t)v13, (uint64_t)sub_100095E38, v16, (uint64_t)sub_100095E3C, v17);

  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)deleteResourceAtURL:(id)a3 success:(id)a4 error:(id)a5
{
  uint64_t v8 = type metadata accessor for URL();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a4);
  uint64_t v13 = _Block_copy(a5);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v12;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v13;
  uint64_t v16 = self;
  sub_100094224((uint64_t)v11, (uint64_t)sub_100095E38, v14, (uint64_t)sub_100095E3C, v15);

  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)deleteAtURL:(id)a3 parameters:(id)a4 encoding:(unint64_t)a5 success:(id)a6 error:(id)a7
{
  uint64_t v10 = type metadata accessor for URL();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  uint64_t v15 = _Block_copy(a7);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v14;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v15;
  uint64_t v18 = self;
  sub_100094224((uint64_t)v13, (uint64_t)sub_100095E38, v16, (uint64_t)sub_100095E3C, v17);

  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (_TtC18Feedback_Assistant17FBADataClientStub)init
{
  result = (_TtC18Feedback_Assistant17FBADataClientStub *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant17FBADataClientStub_Log);
}

@end