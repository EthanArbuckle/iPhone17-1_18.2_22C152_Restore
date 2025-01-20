@interface CKLTrafficLogMessage
- (CKLTrafficLogMessage)init;
- (CKLTrafficLogMessage)initWithUuid:(id)a3 requestMetadata:(id)a4 requestObjects:(id)a5 bodyStreamResetCount:(int64_t)a6 responseMetadata:(id)a7 responseObjects:(id)a8;
- (NSArray)requestObjects;
- (NSArray)responseObjects;
- (NSDate)requestTime;
- (NSDate)responseTime;
- (NSDictionary)requestHeaders;
- (NSDictionary)responseHeaders;
- (NSString)bundleIdentifier;
- (NSString)containerIdentifier;
- (NSString)description;
- (NSString)requestMethod;
- (NSString)uuid;
- (NSURL)requestURL;
- (int64_t)bodyStreamResetCount;
- (int64_t)responseStatus;
@end

@implementation CKLTrafficLogMessage

- (NSString)uuid
{
  uint64_t v2 = TrafficLogMessage.uuid.getter();
  v3 = (void *)MEMORY[0x1C87879B0](v2);
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSDate)requestTime
{
  return (NSDate *)sub_1C4D432C8((uint64_t)self, (uint64_t)a2, (uint64_t *)&unk_1EA3CC170, (void (*)(uint64_t))TrafficLogMessage.requestTime.getter, MEMORY[0x1E4F27928], MEMORY[0x1E4F278C0]);
}

- (NSString)requestMethod
{
  uint64_t v2 = TrafficLogMessage.requestMethod.getter();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1C87879B0](v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (NSURL)requestURL
{
  return (NSURL *)sub_1C4D432C8((uint64_t)self, (uint64_t)a2, &qword_1EA3CBE40, (void (*)(uint64_t))TrafficLogMessage.requestURL.getter, MEMORY[0x1E4F276F0], MEMORY[0x1E4F276D8]);
}

- (NSDictionary)requestHeaders
{
  return (NSDictionary *)sub_1C4D43420((uint64_t)self, (uint64_t)a2, TrafficLogMessage.requestHeaders.getter);
}

- (int64_t)bodyStreamResetCount
{
  return TrafficLogMessage.bodyStreamResetCount.getter();
}

- (NSArray)requestObjects
{
  return (NSArray *)sub_1C4D434B4((uint64_t)self, (uint64_t)a2, TrafficLogMessage.requestObjects.getter);
}

- (int64_t)responseStatus
{
  return TrafficLogMessage.responseStatus.getter();
}

- (NSDate)responseTime
{
  return (NSDate *)sub_1C4D432C8((uint64_t)self, (uint64_t)a2, (uint64_t *)&unk_1EA3CC170, (void (*)(uint64_t))TrafficLogMessage.responseTime.getter, MEMORY[0x1E4F27928], MEMORY[0x1E4F278C0]);
}

- (NSDictionary)responseHeaders
{
  return (NSDictionary *)sub_1C4D43420((uint64_t)self, (uint64_t)a2, TrafficLogMessage.responseHeaders.getter);
}

- (NSArray)responseObjects
{
  return (NSArray *)sub_1C4D434B4((uint64_t)self, (uint64_t)a2, TrafficLogMessage.responseObjects.getter);
}

- (CKLTrafficLogMessage)initWithUuid:(id)a3 requestMetadata:(id)a4 requestObjects:(id)a5 bodyStreamResetCount:(int64_t)a6 responseMetadata:(id)a7 responseObjects:(id)a8
{
  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v15 = v14;
  if (a5)
  {
    sub_1C4D10728(&qword_1EA3CBE50);
    a5 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  if (a8)
  {
    sub_1C4D10728(&qword_1EA3CBE50);
    a8 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v16 = a7;
  id v17 = a4;
  return (CKLTrafficLogMessage *)TrafficLogMessage.init(uuid:requestMetadata:requestObjects:bodyStreamResetCount:responseMetadata:responseObjects:)(v13, v15, (char *)a4, (uint64_t)a5, a6, (char *)a7, (uint64_t)a8);
}

- (NSString)bundleIdentifier
{
  return (NSString *)sub_1C4D43A6C(self, (uint64_t)a2, sub_1C4D43A48);
}

- (NSString)containerIdentifier
{
  return (NSString *)sub_1C4D43A6C(self, (uint64_t)a2, sub_1C4D43AEC);
}

- (NSString)description
{
  uint64_t v2 = self;
  uint64_t v3 = sub_1C4D43BC8();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x1C87879B0](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (CKLTrafficLogMessage)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1C4D19490((uint64_t)self + OBJC_IVAR___CKLTrafficLogMessage_requestTime, (uint64_t *)&unk_1EA3CC170);
  swift_bridgeObjectRelease();
  sub_1C4D19490((uint64_t)self + OBJC_IVAR___CKLTrafficLogMessage_requestURL, &qword_1EA3CBE40);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1C4D19490((uint64_t)self + OBJC_IVAR___CKLTrafficLogMessage_responseTime, (uint64_t *)&unk_1EA3CC170);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end