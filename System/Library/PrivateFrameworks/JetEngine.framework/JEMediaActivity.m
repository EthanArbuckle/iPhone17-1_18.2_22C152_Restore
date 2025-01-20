@interface JEMediaActivity
- (BOOL)isStopped;
- (JEMediaActivity)init;
- (JEMediaActivity)initWithType:(int64_t)a3 playlistItem:(id)a4 pipeline:(id)a5 topic:(id)a6;
- (JEMediaPlaylistItem)playlistItem;
- (id)eventDataForTransitioningEvents;
- (id)startMetricsFields;
- (id)stopMetricsFields;
- (int64_t)type;
- (unint64_t)positionWithOverallPosition:(unint64_t)a3;
- (void)postProcessedStartMetricsFieldsWithCompletion:(id)a3;
- (void)postProcessedStopMetricsFieldsWithCompletion:(id)a3;
- (void)setPlaylistItem:(id)a3;
- (void)setType:(int64_t)a3;
- (void)startedAtOverallPosition:(unint64_t)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6 transitioningEventData:(id)a7;
- (void)stoppedAtOverallPosition:(unint64_t)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6 transitioningEventData:(id)a7;
@end

@implementation JEMediaActivity

- (int64_t)type
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___JEMediaActivity_type);
  swift_beginAccess();
  return *v2;
}

- (void)setType:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___JEMediaActivity_type);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (JEMediaPlaylistItem)playlistItem
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();
  return (JEMediaPlaylistItem *)v2;
}

- (void)setPlaylistItem:(id)a3
{
  v4 = (id *)((char *)&self->super.isa + OBJC_IVAR___JEMediaActivity_playlistItem);
  swift_beginAccess();
  id *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (BOOL)isStopped
{
  return (*(unsigned char **)((char *)&self->super.isa + OBJC_IVAR___JEMediaActivity_pipelineHandler))[216];
}

- (JEMediaActivity)initWithType:(int64_t)a3 playlistItem:(id)a4 pipeline:(id)a5 topic:(id)a6
{
  uint64_t v10 = sub_19F1DBD7C();
  uint64_t v12 = v11;
  swift_getObjectType();
  swift_unknownObjectRetain();
  id v13 = a5;
  return (JEMediaActivity *)sub_19F0AD554(a3, (uint64_t)a4, v13, v10, v12, (char *)self);
}

- (unint64_t)positionWithOverallPosition:(unint64_t)a3
{
  v4 = self;
  v5 = sub_19F0AB954(a3);

  return (unint64_t)v5;
}

- (void)startedAtOverallPosition:(unint64_t)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6 transitioningEventData:(id)a7
{
}

- (void)stoppedAtOverallPosition:(unint64_t)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6 transitioningEventData:(id)a7
{
}

- (id)eventDataForTransitioningEvents
{
  v2 = (void *)(*(void **)((char *)&self->super.isa + OBJC_IVAR___JEMediaActivity_pipelineHandler))[28];
  if (v2)
  {
    v3 = self;
    swift_retain();
    uint64_t v4 = sub_19F0AD40C((uint64_t)sub_19F0AC3DC, 0);
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E946CBB8);
    v12[3] = v5;
    swift_release();
    v12[0] = v4;

    if (v5)
    {
      v6 = __swift_project_boxed_opaque_existential_1(v12, v5);
      uint64_t v7 = *(void *)(v5 - 8);
      double v8 = MEMORY[0x1F4188790](v6);
      uint64_t v10 = (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, double))(v7 + 16))(v10, v8);
      v2 = (void *)sub_19F1DD42C();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v5);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
    }
    else
    {
      v2 = 0;
    }
  }
  return v2;
}

- (id)startMetricsFields
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_19F1DBB1C();
  swift_bridgeObjectRelease();
  return v2;
}

- (id)stopMetricsFields
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_19F1DBB1C();
  swift_bridgeObjectRelease();
  return v2;
}

- (void)postProcessedStartMetricsFieldsWithCompletion:(id)a3
{
}

- (void)postProcessedStopMetricsFieldsWithCompletion:(id)a3
{
}

- (JEMediaActivity)init
{
  result = (JEMediaActivity *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
}

@end