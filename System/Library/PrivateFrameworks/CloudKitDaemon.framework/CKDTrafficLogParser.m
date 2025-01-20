@interface CKDTrafficLogParser
- (BOOL)parse:(id)a3 error:(id *)a4;
- (CKDTrafficLogParser)init;
- (id)consumeParsedTrafficLogsAndReturnError:(id *)a3;
@end

@implementation CKDTrafficLogParser

- (BOOL)parse:(id)a3 error:(id *)a4
{
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = self;
  sub_1C4D25F18();
  swift_bridgeObjectRelease();

  return 1;
}

- (id)consumeParsedTrafficLogsAndReturnError:(id *)a3
{
  v3 = self;
  sub_1C4D265F0();

  type metadata accessor for TrafficLogMessage();
  v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return v4.super.isa;
}

- (CKDTrafficLogParser)init
{
  return (CKDTrafficLogParser *)TrafficLogParser.init()();
}

- (void).cxx_destruct
{
}

@end