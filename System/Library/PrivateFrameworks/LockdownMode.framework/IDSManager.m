@interface IDSManager
- (_TtC13lockdownmoded10IDSManager)init;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
@end

@implementation IDSManager

- (_TtC13lockdownmoded10IDSManager)init
{
  return (_TtC13lockdownmoded10IDSManager *)sub_10002F550();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC13lockdownmoded10IDSManager_delegate;

  sub_100030840((uint64_t)v3);
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v8 = a6;
  if (a5)
  {
    uint64_t v12 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
    if (v8)
    {
LABEL_3:
      uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
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
  sub_100030398(v12, v13, (unint64_t)v8);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end