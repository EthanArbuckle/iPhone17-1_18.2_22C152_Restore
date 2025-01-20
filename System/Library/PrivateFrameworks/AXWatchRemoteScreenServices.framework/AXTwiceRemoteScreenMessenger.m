@interface AXTwiceRemoteScreenMessenger
+ (_TtC27AXWatchRemoteScreenServices28AXTwiceRemoteScreenMessenger)sharedInstance;
- (AXTwiceRemoteScreenMessengerDelegateProtocolObjc)delegate;
- (_TtC27AXWatchRemoteScreenServices28AXTwiceRemoteScreenMessenger)init;
- (id)sendMessage:(id)a3;
- (void)cleanup;
- (void)connectedDevicesDidChange:(id)a3;
- (void)dealloc;
- (void)didReceiveIncomingData:(id)a3;
- (void)receiveMessage:(id)a3;
- (void)reconnectToAXUIServerIfNeeded;
- (void)serverConnectionWasInterrupted;
- (void)setDelegate:(id)a3;
@end

@implementation AXTwiceRemoteScreenMessenger

+ (_TtC27AXWatchRemoteScreenServices28AXTwiceRemoteScreenMessenger)sharedInstance
{
  if (qword_26837DC40 != -1) {
    swift_once();
  }
  v2 = (void *)qword_26837DFB0;
  return (_TtC27AXWatchRemoteScreenServices28AXTwiceRemoteScreenMessenger *)v2;
}

- (AXTwiceRemoteScreenMessengerDelegateProtocolObjc)delegate
{
  v2 = (char *)self + OBJC_IVAR____TtC27AXWatchRemoteScreenServices28AXTwiceRemoteScreenMessenger_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x22A6CF0D0](v2);
  return (AXTwiceRemoteScreenMessengerDelegateProtocolObjc *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (_TtC27AXWatchRemoteScreenServices28AXTwiceRemoteScreenMessenger)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  v9.receiver = self;
  v9.super_class = ObjectType;
  v4 = [(AXTwiceRemoteScreenMessenger *)&v9 init];
  v5 = self;
  v6 = v4;
  result = (_TtC27AXWatchRemoteScreenServices28AXTwiceRemoteScreenMessenger *)objc_msgSend(v5, sel_sharedInstance);
  if (result)
  {
    v8 = result;
    [(AXTwiceRemoteScreenMessenger *)result registerForIncomingData:v6];

    return v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  v5 = self;
  id v6 = objc_msgSend(v4, sel_sharedInstance);
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, sel_deregisterForIncomingData_, v5);

    v8.receiver = v5;
    v8.super_class = ObjectType;
    [(AXTwiceRemoteScreenMessenger *)&v8 dealloc];
  }
  else
  {
    __break(1u);
  }
}

- (void).cxx_destruct
{
}

- (void)reconnectToAXUIServerIfNeeded
{
  v2 = self;
  AXTwiceRemoteScreenMessenger.reconnectToAXUIServerIfNeeded()();
}

- (id)sendMessage:(id)a3
{
  uint64_t v4 = sub_22A60A690();
  v5 = self;
  _s27AXWatchRemoteScreenServices07AXTwicebC9MessengerC11sendMessageySSSgSDys11AnyHashableVypGF_0(v4);
  uint64_t v7 = v6;

  swift_bridgeObjectRelease();
  if (v7)
  {
    objc_super v8 = (void *)sub_22A60A6B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v8 = 0;
  }
  return v8;
}

- (void)receiveMessage:(id)a3
{
  uint64_t v4 = sub_22A60A690();
  v5 = self;
  AXTwiceRemoteScreenMessenger.receiveMessage(_:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
}

- (void)cleanup
{
  v3 = self;
  uint64_t v4 = self;
  id v5 = objc_msgSend(v3, sel_sharedInstance);
  if (v5)
  {
    id v6 = v5;
    objc_msgSend(v5, sel_deregisterForIncomingData_, v4);
  }
  else
  {
    __break(1u);
  }
}

- (void)didReceiveIncomingData:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_22A60A690();
    id v5 = self;
    AXTwiceRemoteScreenMessenger.receiveMessage(_:)((Swift::OpaquePointer)v4);

    swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

- (void)connectedDevicesDidChange:(id)a3
{
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26837DFC0);
    uint64_t v4 = (void *)sub_22A60A780();
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = self;
  v7.value._rawValue = v4;
  AXTwiceRemoteScreenMessenger.connectedDevicesDidChange(_:)(v7);

  swift_bridgeObjectRelease();
}

- (void)serverConnectionWasInterrupted
{
  v2 = self;
  AXTwiceRemoteScreenMessenger.serverConnectionWasInterrupted()();
}

@end