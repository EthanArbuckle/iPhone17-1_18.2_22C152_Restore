@interface HPMHeadphoneManager
+ (HPMHeadphoneManager)shared;
- (BOOL)isAppleHeadphoneWithCbDevice:(id)a3;
- (CBDeviceReporting)deviceConnectionListener;
- (HPMHeadphoneManager)init;
- (HPMHeadphoneMangerTopLevelEntryUIHandling)topLevelUIHandler;
- (NSDictionary)connectedHeadphones;
- (NSDictionary)connectedRecords;
- (NSDictionary)pendingConnectedHeadphones;
- (void)addTopLevelEntryWithHpDevice:(id)a3;
- (void)dealloc;
- (void)disconnectWithHpDevice:(id)a3;
- (void)removeTopLevelEntryWithHpDevice:(id)a3;
- (void)setConnectedHeadphones:(id)a3;
- (void)setConnectedRecords:(id)a3;
- (void)setDeviceConnectionListener:(id)a3;
- (void)setPendingConnectedHeadphones:(id)a3;
- (void)setTopLevelUIHandler:(id)a3;
- (void)unpairWithHpDevice:(id)a3;
- (void)updateDeviceConfigWithHpDevice:(id)a3 settings:(id)a4;
- (void)updateTitleBar;
- (void)updateTopLevelEntryWithHpDevice:(id)a3;
@end

@implementation HPMHeadphoneManager

+ (HPMHeadphoneManager)shared
{
  swift_getObjCClassMetadata();
  swift_getObjCClassMetadata();
  v2 = static Headphone_Manager.shared.getter();
  return (HPMHeadphoneManager *)v2;
}

- (void)setTopLevelUIHandler:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  Headphone_Manager.topLevelUIHandler.setter();
}

- (HPMHeadphoneManager)init
{
  return (HPMHeadphoneManager *)Headphone_Manager.init()();
}

- (NSDictionary)connectedHeadphones
{
  v2 = self;
  Headphone_Manager.connectedHeadphones.getter();

  type metadata accessor for HeadphoneDevice();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSDictionary *)isa;
}

- (HPMHeadphoneMangerTopLevelEntryUIHandling)topLevelUIHandler
{
  v2 = self;
  id v5 = (id)Headphone_Manager.topLevelUIHandler.getter();

  return (HPMHeadphoneMangerTopLevelEntryUIHandling *)v5;
}

- (NSDictionary)connectedRecords
{
  v2 = self;
  Headphone_Manager.connectedRecords.getter();

  type metadata accessor for HMDeviceRecord();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSDictionary *)isa;
}

- (void)setConnectedRecords:(id)a3
{
  id v4 = a3;
  id v5 = self;
  type metadata accessor for HMDeviceRecord();
  uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  Headphone_Manager.connectedRecords.setter(v6);
}

- (CBDeviceReporting)deviceConnectionListener
{
  v2 = self;
  id v5 = (id)Headphone_Manager.deviceConnectionListener.getter();

  return (CBDeviceReporting *)v5;
}

- (void)setDeviceConnectionListener:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  Headphone_Manager.deviceConnectionListener.setter();
}

- (void)setConnectedHeadphones:(id)a3
{
  id v4 = a3;
  id v5 = self;
  type metadata accessor for HeadphoneDevice();
  uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  Headphone_Manager.connectedHeadphones.setter(v6);
}

- (NSDictionary)pendingConnectedHeadphones
{
  v2 = self;
  Headphone_Manager.pendingConnectedHeadphones.getter();

  type metadata accessor for HeadphoneDevice();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSDictionary *)isa;
}

- (void)setPendingConnectedHeadphones:(id)a3
{
  id v4 = a3;
  id v5 = self;
  type metadata accessor for HeadphoneDevice();
  uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  Headphone_Manager.pendingConnectedHeadphones.setter(v6);
}

- (void)dealloc
{
  v2 = self;
  Headphone_Manager.__deallocating_deinit();
}

- (void).cxx_destruct
{
  outlined destroy of weak HeadphoneMangerTopLevelEntryUIHandling?();
  outlined destroy of HMServiceClient?((id *)((char *)&self->super.isa
                                            + OBJC_IVAR___HPMHeadphoneManager____lazy_storage___hmsClient));
  outlined destroy of [String : HMDeviceRecord]();
  outlined destroy of weak CBDeviceReporting?();
  outlined destroy of [String : HeadphoneDevice]();
  outlined destroy of [String : HeadphoneDevice]();
}

- (BOOL)isAppleHeadphoneWithCbDevice:(id)a3
{
  id v4 = a3;
  id v5 = self;
  Headphone_Manager.isAppleHeadphone(cbDevice:)(a3);

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)updateDeviceConfigWithHpDevice:(id)a3 settings:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = self;
  Headphone_Manager.updateDeviceConfig(hpDevice:settings:)((char *)a3, a4);
}

- (void)disconnectWithHpDevice:(id)a3
{
  id v4 = a3;
  id v5 = self;
  Headphone_Manager.disconnect(hpDevice:)(a3);
}

- (void)unpairWithHpDevice:(id)a3
{
  id v4 = a3;
  id v5 = self;
  Headphone_Manager.unpair(hpDevice:)(a3);
}

- (void)updateTitleBar
{
  v2 = self;
  Headphone_Manager.updateTitleBar()();
}

- (void)addTopLevelEntryWithHpDevice:(id)a3
{
  id v4 = a3;
  id v5 = self;
  Headphone_Manager.addTopLevelEntry(hpDevice:)((uint64_t)a3);
}

- (void)updateTopLevelEntryWithHpDevice:(id)a3
{
  id v4 = a3;
  id v5 = self;
  Headphone_Manager.updateTopLevelEntry(hpDevice:)((uint64_t)a3);
}

- (void)removeTopLevelEntryWithHpDevice:(id)a3
{
  id v4 = a3;
  id v5 = self;
  Headphone_Manager.removeTopLevelEntry(hpDevice:)((uint64_t)a3);
}

@end