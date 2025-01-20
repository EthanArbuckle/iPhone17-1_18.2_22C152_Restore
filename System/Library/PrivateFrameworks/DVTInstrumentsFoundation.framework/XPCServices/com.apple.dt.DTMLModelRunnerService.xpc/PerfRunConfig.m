@interface PerfRunConfig
- (_TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig)init;
- (_TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig)initWithExperimentIterations:(int64_t)a3 loadCount:(int64_t)a4 predictionCount:(int64_t)a5 maxPredictionTime:(int64_t)a6 maxIterationTime:(int64_t)a7 functionName:(id)a8;
@end

@implementation PerfRunConfig

- (_TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig)initWithExperimentIterations:(int64_t)a3 loadCount:(int64_t)a4 predictionCount:(int64_t)a5 maxPredictionTime:(int64_t)a6 maxIterationTime:(int64_t)a7 functionName:(id)a8
{
  if (a8)
  {
    uint64_t v14 = sub_10002C480();
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v15 = 0;
  }
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig_experimentIterations) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig_loadCount) = (Class)a4;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig_predictionCount) = (Class)a5;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig_maxPredictionTime) = (Class)a6;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig_maxIterationTime) = (Class)a7;
  v16 = (uint64_t *)((char *)self + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig_functionName);
  uint64_t *v16 = v14;
  v16[1] = v15;
  v18.receiver = self;
  v18.super_class = (Class)type metadata accessor for PerfRunConfig();
  return [(PerfRunConfig *)&v18 init];
}

- (_TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig)init
{
  result = (_TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end