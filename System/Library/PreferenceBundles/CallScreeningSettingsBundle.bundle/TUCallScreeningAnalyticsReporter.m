@interface TUCallScreeningAnalyticsReporter
- (_TtC27CallScreeningSettingsBundle32TUCallScreeningAnalyticsReporter)init;
- (void)logLiveVoiceMailToggleWithToggledTo:(BOOL)a3;
@end

@implementation TUCallScreeningAnalyticsReporter

- (void)logLiveVoiceMailToggleWithToggledTo:(BOOL)a3
{
  sub_4EC8(&qword_CB10);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_7D30;
  *(void *)(inited + 32) = 0xD000000000000019;
  *(void *)(inited + 40) = 0x8000000000006FA0;
  sub_607C(0, &qword_CB18);
  v6 = self;
  *(NSNumber *)(inited + 48) = sub_6150(a3);
  unint64_t v7 = sub_4F0C(inited);
  sub_5028(v7);
  uint64_t v9 = v8;
  swift_bridgeObjectRelease();
  sub_5C50(0xD00000000000002ALL, 0x8000000000006FC0, v9);

  swift_bridgeObjectRelease();
}

- (_TtC27CallScreeningSettingsBundle32TUCallScreeningAnalyticsReporter)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TUCallScreeningAnalyticsReporter();
  return [(TUCallScreeningAnalyticsReporter *)&v3 init];
}

@end