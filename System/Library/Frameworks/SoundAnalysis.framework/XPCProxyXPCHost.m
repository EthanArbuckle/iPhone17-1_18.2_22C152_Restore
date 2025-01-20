@interface XPCProxyXPCHost
- (_TtC13SoundAnalysis15XPCProxyXPCHost)init;
- (void)xpcUnsafeSendMessageWithData:(id)a3 proxy:(id)a4 completionHandler:(id)a5;
@end

@implementation XPCProxyXPCHost

- (void)xpcUnsafeSendMessageWithData:(id)a3 proxy:(id)a4 completionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  swift_unknownObjectRetain();
  v9 = self;
  if (a3)
  {
    id v10 = a3;
    a3 = (id)sub_1DCB86AD8();
    unint64_t v12 = v11;
  }
  else
  {
    unint64_t v12 = 0xF000000000000000;
  }
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v8;
  sub_1DC8FB9D4((uint64_t)a3, v12, (uint64_t)a4, (uint64_t)sub_1DC90262C, v13);
  swift_release();
  sub_1DC88668C((uint64_t)a3, v12);

  swift_unknownObjectRelease();
}

- (_TtC13SoundAnalysis15XPCProxyXPCHost)init
{
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
}

@end