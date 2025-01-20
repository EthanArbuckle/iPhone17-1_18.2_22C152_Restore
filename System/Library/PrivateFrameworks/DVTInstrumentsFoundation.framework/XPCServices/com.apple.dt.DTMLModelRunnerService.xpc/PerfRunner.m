@interface PerfRunner
- (_TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner)init;
- (_TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner)initWithConfig:(id)a3;
- (void)runWithModelLocation:(_TtC35com_apple_dt_DTMLModelRunnerService13ModelLocation *)a3 computeUnits:(int64_t)a4 perfRunConfig:(_TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig *)a5 completionHandler:(id)a6;
@end

@implementation PerfRunner

- (_TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner)initWithConfig:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000A268(v4, (uint64_t)v12);
  v6 = (_OWORD *)((char *)v5 + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner_timers);
  long long v7 = v12[1];
  _OWORD *v6 = v12[0];
  v6[1] = v7;
  long long v8 = v12[3];
  v6[2] = v12[2];
  v6[3] = v8;

  v11.receiver = v5;
  v11.super_class = (Class)type metadata accessor for PerfRunner();
  v9 = [(PerfRunner *)&v11 init];

  return v9;
}

- (void)runWithModelLocation:(_TtC35com_apple_dt_DTMLModelRunnerService13ModelLocation *)a3 computeUnits:(int64_t)a4 perfRunConfig:(_TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig *)a5 completionHandler:(id)a6
{
  sub_100008BE0(&qword_10003CAF8);
  __chkstk_darwin();
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a6);
  v14 = (void *)swift_allocObject();
  v14[2] = a3;
  v14[3] = a4;
  v14[4] = a5;
  v14[5] = v13;
  v14[6] = self;
  uint64_t v15 = sub_10002C5A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v12, 1, 1, v15);
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_10003CB08;
  v16[5] = v14;
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_10003CB18;
  v17[5] = v16;
  v18 = a3;
  v19 = a5;
  v20 = self;
  sub_100009610((uint64_t)v12, (uint64_t)&unk_10003CB28, (uint64_t)v17);
  swift_release();
}

- (_TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner)init
{
  result = (_TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v2 = *(void *)&self->timers[OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner_timers + 24];
  uint64_t v3 = *(void *)&self->timers[OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner_timers + 32];
  id v5 = *(id *)&self->timers[OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner_timers + 48];
  unsigned __int8 v4 = self->timers[OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner_timers + 40];
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  sub_1000088C0(v2, v3, v4);
}

@end