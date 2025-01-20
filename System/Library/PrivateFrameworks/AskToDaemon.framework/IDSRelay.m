@interface IDSRelay
- (_TtC11AskToDaemon8IDSRelay)init;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
@end

@implementation IDSRelay

- (_TtC11AskToDaemon8IDSRelay)init
{
  sub_248791E7C();
  return result;
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v8 = a6;
  if (a5)
  {
    uint64_t v12 = sub_2487A6338();
    if (v8)
    {
LABEL_3:
      uint64_t v13 = sub_2487A63B8();
      id v8 = v14;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v12 = 0;
    if (a6) {
      goto LABEL_3;
    }
  }
  uint64_t v13 = 0;
LABEL_6:
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  v18 = self;
  sub_248795E14(a3, v12, v13, (uint64_t)v8);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  if (a5)
  {
    uint64_t v12 = sub_2487A63B8();
    unint64_t v14 = v13;
  }
  else
  {
    uint64_t v12 = 0;
    unint64_t v14 = 0;
  }
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  v18 = self;
  sub_2487965B8(v12, v14, a6, a7);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end