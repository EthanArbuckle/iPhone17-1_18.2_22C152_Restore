@interface JERollItemsMediaActivityTracker
- (JERollItemsMediaActivityTracker)init;
- (JERollItemsMediaActivityTracker)initWithPipeline:(id)a3 playlist:(id)a4 eventData:(id)a5 topic:(id)a6;
- (void)jumpFromOverallPosition:(unint64_t)a3 fromRollItem:(id)a4 toRollItem:(id)a5 eventData:(id)a6;
- (void)playStartedAtOverallPosition:(unint64_t)a3 type:(id)a4 reason:(id)a5 rollItem:(id)a6 eventData:(id)a7;
- (void)playStartedWithPlaybackRate:(float)a3 overallPosition:(unint64_t)a4 type:(id)a5 reason:(id)a6 rollItem:(id)a7 eventData:(id)a8;
- (void)playStoppedAtOverallPosition:(unint64_t)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6;
- (void)resetEventData:(id)a3;
- (void)seekStartedAtOverallPosition:(unint64_t)a3 type:(id)a4 reason:(id)a5 rollItem:(id)a6 eventData:(id)a7;
- (void)seekStoppedAtOverallPosition:(unint64_t)a3 type:(id)a4 reason:(id)a5 rollItem:(id)a6 eventData:(id)a7;
- (void)updateEventData:(id)a3;
@end

@implementation JERollItemsMediaActivityTracker

- (JERollItemsMediaActivityTracker)initWithPipeline:(id)a3 playlist:(id)a4 eventData:(id)a5 topic:(id)a6
{
  uint64_t v6 = (uint64_t)a5;
  if (a5)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB392CD0);
    uint64_t v6 = sub_19F1DC16C();
  }
  uint64_t v9 = sub_19F1DBD7C();
  uint64_t v11 = v10;
  id v12 = a3;
  swift_unknownObjectRetain();
  v13 = (JERollItemsMediaActivityTracker *)sub_19F0E3AAC(v12, (uint64_t)a4, v6, v9, v11);

  swift_unknownObjectRelease();
  return v13;
}

- (void)playStartedAtOverallPosition:(unint64_t)a3 type:(id)a4 reason:(id)a5 rollItem:(id)a6 eventData:(id)a7
{
  uint64_t v7 = (uint64_t)a7;
  if (a7)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB392CD0);
    uint64_t v7 = sub_19F1DC16C();
  }
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = self;
  _s9JetEngine29RollItemsMediaActivityTrackerC28playStartedAtOverallPosition_4type6reason8rollItem9eventDatays6UInt64V_So07JEMediaF11TriggerTypeaSo0tF15PlayStartReasonaSo09JEHLSRollP0CSaySDySSypGGSgtF_0(a3, (int)v13, (int)v14, v15, v7);

  swift_bridgeObjectRelease();
}

- (void)playStartedWithPlaybackRate:(float)a3 overallPosition:(unint64_t)a4 type:(id)a5 reason:(id)a6 rollItem:(id)a7 eventData:(id)a8
{
  uint64_t v8 = (uint64_t)a8;
  if (a8)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB392CD0);
    uint64_t v8 = sub_19F1DC16C();
  }
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = self;
  _s9JetEngine29RollItemsMediaActivityTrackerC28playStartedAtOverallPosition_4type6reason8rollItem9eventDatays6UInt64V_So07JEMediaF11TriggerTypeaSo0tF15PlayStartReasonaSo09JEHLSRollP0CSaySDySSypGGSgtF_0(a4, (int)v14, (int)v15, v16, v8);

  swift_bridgeObjectRelease();
}

- (void)playStoppedAtOverallPosition:(unint64_t)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6
{
  uint64_t v6 = (uint64_t)a6;
  if (a6)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB392CD0);
    uint64_t v6 = sub_19F1DC16C();
  }
  uint64_t v11 = sub_19F1DBD7C();
  uint64_t v13 = v12;
  uint64_t v14 = sub_19F1DBD7C();
  uint64_t v16 = v15;
  id v17 = a4;
  id v18 = a5;
  v19 = self;
  sub_19F0E29BC(0, a3, v11, v13, v14, v16, v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)jumpFromOverallPosition:(unint64_t)a3 fromRollItem:(id)a4 toRollItem:(id)a5 eventData:(id)a6
{
  uint64_t v6 = a6;
  if (a6)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB392CD0);
    uint64_t v6 = (void *)sub_19F1DC16C();
  }
  uint64_t v11 = (JEHLSRollItem *)a4;
  uint64_t v12 = (JEHLSRollItem *)a5;
  uint64_t v13 = self;
  v15.value._rawValue = v6;
  RollItemsMediaActivityTracker.jumpFromOverallPosition(_:fromRollItem:toRollItem:eventData:)(a3, v11, v12, v15);

  swift_bridgeObjectRelease();
}

- (void)seekStartedAtOverallPosition:(unint64_t)a3 type:(id)a4 reason:(id)a5 rollItem:(id)a6 eventData:(id)a7
{
  uint64_t v7 = (uint64_t)a7;
  if (a7)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB392CD0);
    uint64_t v7 = sub_19F1DC16C();
  }
  uint64_t v13 = sub_19F1DBD7C();
  uint64_t v15 = v14;
  uint64_t v16 = sub_19F1DBD7C();
  uint64_t v18 = v17;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  v22 = self;
  sub_19F0E2724(1, a3, v13, v15, v16, v18, v21, v7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)seekStoppedAtOverallPosition:(unint64_t)a3 type:(id)a4 reason:(id)a5 rollItem:(id)a6 eventData:(id)a7
{
  uint64_t v7 = (uint64_t)a7;
  if (a7)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB392CD0);
    uint64_t v7 = sub_19F1DC16C();
  }
  uint64_t v13 = sub_19F1DBD7C();
  uint64_t v15 = v14;
  uint64_t v16 = sub_19F1DBD7C();
  uint64_t v18 = v17;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  v22 = self;
  sub_19F0E29BC(1, a3, v13, v15, v16, v18, v7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)updateEventData:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB392CD0);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___JERollItemsMediaActivityTracker_trackerEventData) = (Class)sub_19F1DC16C();
  swift_bridgeObjectRelease();
}

- (void)resetEventData:(id)a3
{
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB392CD0);
    v4 = (objc_class *)sub_19F1DC16C();
  }
  else
  {
    v4 = (objc_class *)MEMORY[0x1E4FBC860];
  }
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___JERollItemsMediaActivityTracker_trackerEventData) = v4;
  swift_bridgeObjectRelease();
}

- (JERollItemsMediaActivityTracker)init
{
  result = (JERollItemsMediaActivityTracker *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___JERollItemsMediaActivityTracker_seekActivity);
}

@end