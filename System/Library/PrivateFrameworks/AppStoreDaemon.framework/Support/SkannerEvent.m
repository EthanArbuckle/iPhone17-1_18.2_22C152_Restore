@interface SkannerEvent
+ (NSString)adTypeApp;
+ (NSString)adTypeWeb;
+ (NSString)destinationAdNetwork;
+ (NSString)destinationCommerce;
+ (NSString)destinationDeveloper;
+ (NSString)interactionTypeClick;
+ (NSString)interactionTypeView;
+ (NSString)postbackTypePending;
+ (NSString)postbackTypeRealized;
+ (NSString)resultTypeDelayedReceipt;
+ (NSString)resultTypeFailure;
+ (NSString)resultTypeFinalized;
+ (NSString)resultTypeReceipt;
+ (NSString)resultTypeRegister;
+ (NSString)resultTypeRejected;
+ (NSString)resultTypeTokenReceived;
+ (NSString)resultTypeTransmission;
+ (NSString)resultTypeUpdate;
+ (id)conversionWithResult:(id)a3 postbackType:(id)a4 postbackSequenceIndex:(id)a5 error:(id)a6;
+ (id)impressionWithResult:(id)a3 adNetworkID:(id)a4 adType:(id)a5 interactionType:(id)a6 version:(id)a7 error:(id)a8;
+ (id)requestWithResult:(id)a3 destination:(id)a4 responseCode:(id)a5 postback:(id)a6 error:(id)a7;
+ (id)webImpressionWithResult:(id)a3 adNetworkRegistrableDomain:(id)a4 version:(id)a5 error:(id)a6;
- (_TtC9appstored12SkannerEvent)init;
- (void)setError:(id)a3;
@end

@implementation SkannerEvent

- (void)setError:(id)a3
{
  v4 = self;
  id v5 = a3;
  sub_1000F2C34((uint64_t)a3);
}

- (_TtC9appstored12SkannerEvent)init
{
  result = (_TtC9appstored12SkannerEvent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

+ (NSString)resultTypeFinalized
{
  NSString v2 = String._bridgeToObjectiveC()();
  return (NSString *)v2;
}

+ (NSString)resultTypeRegister
{
  NSString v2 = String._bridgeToObjectiveC()();
  return (NSString *)v2;
}

+ (NSString)resultTypeUpdate
{
  NSString v2 = String._bridgeToObjectiveC()();
  return (NSString *)v2;
}

+ (NSString)resultTypeTransmission
{
  NSString v2 = String._bridgeToObjectiveC()();
  return (NSString *)v2;
}

+ (NSString)resultTypeReceipt
{
  NSString v2 = String._bridgeToObjectiveC()();
  return (NSString *)v2;
}

+ (NSString)resultTypeTokenReceived
{
  NSString v2 = String._bridgeToObjectiveC()();
  return (NSString *)v2;
}

+ (NSString)resultTypeDelayedReceipt
{
  NSString v2 = String._bridgeToObjectiveC()();
  return (NSString *)v2;
}

+ (NSString)resultTypeFailure
{
  NSString v2 = String._bridgeToObjectiveC()();
  return (NSString *)v2;
}

+ (NSString)resultTypeRejected
{
  NSString v2 = String._bridgeToObjectiveC()();
  return (NSString *)v2;
}

+ (NSString)adTypeApp
{
  NSString v2 = String._bridgeToObjectiveC()();
  return (NSString *)v2;
}

+ (NSString)adTypeWeb
{
  NSString v2 = String._bridgeToObjectiveC()();
  return (NSString *)v2;
}

+ (NSString)interactionTypeView
{
  NSString v2 = String._bridgeToObjectiveC()();
  return (NSString *)v2;
}

+ (NSString)interactionTypeClick
{
  NSString v2 = String._bridgeToObjectiveC()();
  return (NSString *)v2;
}

+ (NSString)destinationCommerce
{
  NSString v2 = String._bridgeToObjectiveC()();
  return (NSString *)v2;
}

+ (NSString)destinationAdNetwork
{
  NSString v2 = String._bridgeToObjectiveC()();
  return (NSString *)v2;
}

+ (NSString)destinationDeveloper
{
  NSString v2 = String._bridgeToObjectiveC()();
  return (NSString *)v2;
}

+ (NSString)postbackTypePending
{
  NSString v2 = String._bridgeToObjectiveC()();
  return (NSString *)v2;
}

+ (NSString)postbackTypeRealized
{
  NSString v2 = String._bridgeToObjectiveC()();
  return (NSString *)v2;
}

+ (id)webImpressionWithResult:(id)a3 adNetworkRegistrableDomain:(id)a4 version:(id)a5 error:(id)a6
{
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = v10;
  if (a4)
  {
    uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a4 = v13;
    if (a5)
    {
LABEL_3:
      uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      a5 = v15;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v12 = 0;
    if (a5) {
      goto LABEL_3;
    }
  }
  uint64_t v14 = 0;
LABEL_6:
  id v16 = a6;
  id v17 = sub_1000F79B0(v9, v11, v12, (uint64_t)a4, v14, (uint64_t)a5, a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v17;
}

+ (id)impressionWithResult:(id)a3 adNetworkID:(id)a4 adType:(id)a5 interactionType:(id)a6 version:(id)a7 error:(id)a8
{
  uint64_t v29 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = v13;
  if (a4)
  {
    uint64_t v28 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a4 = v15;
    if (a5) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v16 = 0;
    if (a6) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v28 = 0;
  if (!a5) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  a5 = v17;
  if (a6)
  {
LABEL_4:
    uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a6 = v19;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v18 = 0;
LABEL_8:
  id v20 = a8;
  id v21 = a7;
  if (v21)
  {
    v22 = v21;
    uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v25 = v24;
  }
  else
  {
    uint64_t v23 = 0;
    uint64_t v25 = 0;
  }
  id v26 = sub_1000F8518(v29, v14, v28, (uint64_t)a4, v16, a5, v18, a6, v23, v25, v20);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v26;
}

+ (id)conversionWithResult:(id)a3 postbackType:(id)a4 postbackSequenceIndex:(id)a5 error:(id)a6
{
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = v10;
  if (a4)
  {
    uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a4 = v13;
  }
  else
  {
    uint64_t v12 = 0;
  }
  id v14 = a6;
  id v15 = a5;
  id v16 = sub_1000F86F4(v9, v11, v12, a4, a5, a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v16;
}

+ (id)requestWithResult:(id)a3 destination:(id)a4 responseCode:(id)a5 postback:(id)a6 error:(id)a7
{
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;
  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v15 = v14;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = sub_1000F88A4(v10, v12, v13, v15, a5, a6, a7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v19;
}

@end