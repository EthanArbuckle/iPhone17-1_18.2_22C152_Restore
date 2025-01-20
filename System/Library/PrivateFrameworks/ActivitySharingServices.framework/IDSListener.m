@interface IDSListener
- (_TtC23ActivitySharingServices11IDSListener)init;
- (void)messageCenter:(id)a3 didReceivePayload:(id)a4 type:(int)a5 fromSenderAddress:(id)a6 messageHandledCompletion:(id)a7;
@end

@implementation IDSListener

- (_TtC23ActivitySharingServices11IDSListener)init
{
  result = (_TtC23ActivitySharingServices11IDSListener *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC23ActivitySharingServices11IDSListener_messageCenter);
}

- (void)messageCenter:(id)a3 didReceivePayload:(id)a4 type:(int)a5 fromSenderAddress:(id)a6 messageHandledCompletion:(id)a7
{
  v12 = _Block_copy(a7);
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  v22 = self;
  uint64_t v16 = sub_2476B2238();
  unint64_t v18 = v17;

  uint64_t v19 = sub_2476B2A38();
  uint64_t v21 = v20;

  _Block_copy(v12);
  sub_2475C48C4(v16, v18, a5, v19, v21, v22, (void (**)(void, void))v12);
  _Block_release(v12);
  _Block_release(v12);
  swift_bridgeObjectRelease();
  sub_2475ACF74(v16, v18);
}

@end