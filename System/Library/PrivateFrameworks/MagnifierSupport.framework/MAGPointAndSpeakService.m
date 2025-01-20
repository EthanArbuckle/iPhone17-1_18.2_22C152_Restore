@interface MAGPointAndSpeakService
- (void)playHandAbsentTone;
@end

@implementation MAGPointAndSpeakService

- (void)playHandAbsentTone
{
  uint64_t v2 = type metadata accessor for MAGOutputEvent(0);
  uint64_t v3 = v2 - 8;
  MEMORY[0x270FA5388](v2, v4, v5, v6, v7);
  v9 = (char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MAGOutputEvent.EventType(0);
  swift_storeEnumTagMultiPayload();
  sub_2359470F8();
  sub_2359470F8();
  sub_235947968();
  v9[*(int *)(v3 + 32)] = 1;
  v9[*(int *)(v3 + 36)] = 1;
  sub_235741600((uint64_t)v9);
  swift_release();
  sub_2356B4D10((uint64_t)v9, type metadata accessor for MAGOutputEvent);
  swift_release();
}

@end