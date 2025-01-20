@interface IDSManager
- (_TtC10DropInCore10IDSManager)init;
- (void)dealloc;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
@end

@implementation IDSManager

- (_TtC10DropInCore10IDSManager)init
{
  sub_24D0C9920();
  return result;
}

- (void)dealloc
{
  v2 = self;
  sub_24D0C9D9C();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC10DropInCore10IDSManager_logger;
  sub_24D0F01C0();
  OUTLINED_FUNCTION_11_0();
  (*(void (**)(char *))(v4 + 8))(v3);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v5 = (char *)self + OBJC_IVAR____TtC10DropInCore10IDSManager_delegate;

  sub_24D05C8DC((uint64_t)v5);
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  if (a5)
  {
    sub_24D0F04E0();
    if (!a6) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  if (a6) {
LABEL_3:
  }
    sub_24D0F05A0();
LABEL_5:
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  v15 = self;
  sub_24D0CB6E8();

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  if (a5) {
    sub_24D0F05A0();
  }
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  id v14 = self;
  sub_24D0CE354();

  swift_bridgeObjectRelease();
}

@end