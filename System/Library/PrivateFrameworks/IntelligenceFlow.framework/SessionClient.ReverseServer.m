@interface SessionClient.ReverseServer
- (void)connectionClosedWith:(id)a3;
- (void)runTransactionHookWithSessionId:(id)a3 transaction:(id)a4 with:(id)a5;
- (void)sendWithMessageData:(id)a3 with:(id)a4;
@end

@implementation SessionClient.ReverseServer

- (void)sendWithMessageData:(id)a3 with:(id)a4
{
  v6 = _Block_copy(a4);
  id v7 = a3;
  swift_retain();
  uint64_t v8 = sub_252D194D8();
  unint64_t v10 = v9;

  _Block_copy(v6);
  sub_252D090AC(v8, v10, (uint64_t)self, (void (**)(void, void, void))v6);
  _Block_release(v6);
  sub_252AC5C14(v8, v10);

  swift_release();
}

- (void)connectionClosedWith:(id)a3
{
  v3 = _Block_copy(a3);
  _Block_copy(v3);
  uint64_t v4 = swift_retain();
  sub_252D096C4(v4, (void (**)(void, void, void))v3);
  _Block_release(v3);

  swift_release();
}

- (void)runTransactionHookWithSessionId:(id)a3 transaction:(id)a4 with:(id)a5
{
  uint64_t v6 = sub_252D19588();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  unint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = _Block_copy(a5);
  sub_252D19548();
  sub_252D19ED8();
  *(void *)(swift_allocObject() + 16) = v10;
  swift_retain();
  sub_252D099D0();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end