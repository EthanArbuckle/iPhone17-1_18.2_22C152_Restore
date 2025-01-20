@interface CKHistoricEvent
+ (BOOL)supportsSecureCoding;
- (CKHistoricEvent)init;
- (CKHistoricEvent)initWithCoder:(id)a3;
- (NSDate)firstSeen;
- (NSDate)lastSeen;
- (NSDictionary)metadata;
- (NSString)identifier;
- (double)lastDuration;
- (double)totalDuration;
- (id)copyWithZone:(void *)a3;
- (id)init:(id)a3;
- (id)initFrom:(id)a3 withIdentifier:(id)a4;
- (int64_t)frequency;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKHistoricEvent

- (NSString)identifier
{
  CKHistoricEvent.identifier.getter();
  v2 = (void *)sub_1A78317DC();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSDate)firstSeen
{
  return (NSDate *)sub_1A77F615C((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_1A77F6138);
}

- (NSDate)lastSeen
{
  return (NSDate *)sub_1A77F615C((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_1A77F6210);
}

- (int64_t)frequency
{
  return sub_1A77F62B8();
}

- (double)lastDuration
{
  return sub_1A77F62EC();
}

- (double)totalDuration
{
  return sub_1A77F6320();
}

- (NSDictionary)metadata
{
  sub_1A77F6398();
  v2 = (void *)sub_1A783177C();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1A77F6510(v4);
}

- (CKHistoricEvent)initWithCoder:(id)a3
{
  return (CKHistoricEvent *)CKHistoricEvent.init(coder:)(a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)init:(id)a3
{
  return CKHistoricEvent.init(_:)((char *)a3);
}

- (id)initFrom:(id)a3 withIdentifier:(id)a4
{
  uint64_t v4 = sub_1A78317EC();
  unint64_t v6 = v5;
  uint64_t v7 = sub_1A78317EC();
  return CKHistoricEvent.init(from:withIdentifier:)(v4, v6, v7, v8);
}

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  sub_1A77F8264(v6);

  __swift_project_boxed_opaque_existential_0(v6, v6[3]);
  uint64_t v4 = (void *)sub_1A7831DAC();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

- (CKHistoricEvent)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1A78315FC();
  OUTLINED_FUNCTION_32_0();
  v3 = *(void (**)(void))(v2 + 8);
  OUTLINED_FUNCTION_14_7();
  v3();
  OUTLINED_FUNCTION_14_7();
  v3();
  swift_bridgeObjectRelease();
}

@end