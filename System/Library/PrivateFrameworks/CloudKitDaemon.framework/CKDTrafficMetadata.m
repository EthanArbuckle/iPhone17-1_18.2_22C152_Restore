@interface CKDTrafficMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)parsingStandaloneMessage;
- (CKDTrafficMetadata)init;
- (CKDTrafficMetadata)initWithCoder:(id)a3;
- (NSDate)timestamp;
- (NSDictionary)headers;
- (NSString)method;
- (NSString)requestClassName;
- (NSURL)url;
- (int64_t)status;
- (void)encodeWithCoder:(id)a3;
- (void)setHeaders:(id)a3;
- (void)setMethod:(id)a3;
- (void)setParsingStandaloneMessage:(BOOL)a3;
- (void)setRequestClassName:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setTimestamp:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation CKDTrafficMetadata

- (NSDate)timestamp
{
  return (NSDate *)sub_1C4D407A0((uint64_t)self, (uint64_t)a2, (uint64_t *)&unk_1EA3CC170, (void (*)(void))sub_1C4D406A0, MEMORY[0x1E4F27928], MEMORY[0x1E4F278C0]);
}

- (void)setTimestamp:(id)a3
{
}

- (NSURL)url
{
  return (NSURL *)sub_1C4D407A0((uint64_t)self, (uint64_t)a2, &qword_1EA3CBE40, (void (*)(void))sub_1C4D40898, MEMORY[0x1E4F276F0], MEMORY[0x1E4F276D8]);
}

- (void)setUrl:(id)a3
{
}

- (NSString)method
{
  return (NSString *)sub_1C4D40FBC((uint64_t)self, (uint64_t)a2, sub_1C4D40C54);
}

- (void)setMethod:(id)a3
{
}

- (int64_t)status
{
  return sub_1C4D40CF0();
}

- (void)setStatus:(int64_t)a3
{
}

- (NSDictionary)headers
{
  if (sub_1C4D40E38())
  {
    v2.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.isa = 0;
  }
  return (NSDictionary *)v2.super.isa;
}

- (void)setHeaders:(id)a3
{
  if (a3) {
    uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    uint64_t v4 = 0;
  }
  v5 = self;
  sub_1C4D40EF0(v4);
}

- (NSString)requestClassName
{
  return (NSString *)sub_1C4D40FBC((uint64_t)self, (uint64_t)a2, sub_1C4D41018);
}

- (void)setRequestClassName:(id)a3
{
}

- (BOOL)parsingStandaloneMessage
{
  return sub_1C4D41210() & 1;
}

- (void)setParsingStandaloneMessage:(BOOL)a3
{
}

- (CKDTrafficMetadata)init
{
  return (CKDTrafficMetadata *)TrafficMetadata.init()();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C4D414C4(v4);
}

- (CKDTrafficMetadata)initWithCoder:(id)a3
{
  return (CKDTrafficMetadata *)TrafficMetadata.init(coder:)(a3);
}

- (void).cxx_destruct
{
  sub_1C4D42DD8((uint64_t)self + OBJC_IVAR___CKDTrafficMetadata_timestamp, (uint64_t *)&unk_1EA3CC170);
  sub_1C4D42DD8((uint64_t)self + OBJC_IVAR___CKDTrafficMetadata_url, &qword_1EA3CBE40);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end