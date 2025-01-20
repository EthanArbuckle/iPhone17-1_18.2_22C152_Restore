@interface ChatInsertMessageRequestHandler
- (_TtC7imagent31ChatInsertMessageRequestHandler)init;
- (void)insertReceivedMessage:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5 serviceName:(id)a6;
@end

@implementation ChatInsertMessageRequestHandler

- (_TtC7imagent31ChatInsertMessageRequestHandler)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7imagent31ChatInsertMessageRequestHandler_requiredCapabilities) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7imagent31ChatInsertMessageRequestHandler_requiredEntitlements) = (Class)&off_100072240;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ChatInsertMessageRequestHandler();
  return [(ChatInsertMessageRequestHandler *)&v3 init];
}

- (void)insertReceivedMessage:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5 serviceName:(id)a6
{
  int v6 = a5;
  if (a4)
  {
    uint64_t v9 = sub_10004D210();
    unint64_t v11 = v10;
  }
  else
  {
    uint64_t v9 = 0;
    unint64_t v11 = 0;
  }
  uint64_t v12 = sub_10004D210();
  unint64_t v14 = v13;
  id v15 = a3;
  v16 = self;
  sub_100036214(a3, v9, v11, v6, v12, v14);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
}

@end