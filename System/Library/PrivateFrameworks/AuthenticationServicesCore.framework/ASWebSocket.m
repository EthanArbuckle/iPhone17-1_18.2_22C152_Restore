@interface ASWebSocket
- (_TtC26AuthenticationServicesCore11ASWebSocket)init;
- (void)URLSession:(NSURLSession *)a3 task:(NSURLSessionTask *)a4 didReceiveChallenge:(NSURLAuthenticationChallenge *)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 webSocketTask:(id)a4 didOpenWithProtocol:(id)a5;
@end

@implementation ASWebSocket

- (void)URLSession:(id)a3 webSocketTask:(id)a4 didOpenWithProtocol:(id)a5
{
  if (a5)
  {
    uint64_t v8 = sub_2193E2840();
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v10 = 0;
  }
  id v11 = a3;
  id v12 = a4;
  v13 = self;
  sub_2193BB1A0(v8, v10);

  swift_bridgeObjectRelease();
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = self;
  id v11 = a5;
  sub_2193BB2E8(a5);
}

- (void)URLSession:(NSURLSession *)a3 task:(NSURLSessionTask *)a4 didReceiveChallenge:(NSURLAuthenticationChallenge *)a5 completionHandler:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC27638);
  MEMORY[0x270FA5388](v11 - 8);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = sub_2193E2A60();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_267C19DF8;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_267C19E00;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = self;
  sub_2193D88D4((uint64_t)v13, (uint64_t)&unk_267C19480, (uint64_t)v18);
  swift_release();
}

- (_TtC26AuthenticationServicesCore11ASWebSocket)init
{
  result = (_TtC26AuthenticationServicesCore11ASWebSocket *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2193699C0((uint64_t)self + OBJC_IVAR____TtC26AuthenticationServicesCore11ASWebSocket_delegate);

  sub_219360334(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC26AuthenticationServicesCore11ASWebSocket_connectionCompletionHandler));
  v3 = (char *)self + OBJC_IVAR____TtC26AuthenticationServicesCore11ASWebSocket_testDelegate;

  sub_2193BB85C((uint64_t)v3);
}

@end