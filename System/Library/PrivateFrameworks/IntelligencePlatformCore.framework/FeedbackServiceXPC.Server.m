@interface FeedbackServiceXPC.Server
- (_TtCC24IntelligencePlatformCore18FeedbackServiceXPC6Server)init;
- (void)logFeedback:(id)a3 ofType:(id)a4 ofVariant:(id)a5 forEvent:(int64_t)a6 withTimestamp:(id)a7 shouldProcessImmediately:(BOOL)a8 completion:(id)a9;
@end

@implementation FeedbackServiceXPC.Server

- (void)logFeedback:(id)a3 ofType:(id)a4 ofVariant:(id)a5 forEvent:(int64_t)a6 withTimestamp:(id)a7 shouldProcessImmediately:(BOOL)a8 completion:(id)a9
{
  BOOL v33 = a8;
  uint64_t v34 = a6;
  uint64_t v14 = sub_1C791F620();
  uint64_t v35 = *(void *)(v14 - 8);
  uint64_t v36 = v14;
  MEMORY[0x1F4188790](v14);
  v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = _Block_copy(a9);
  id v18 = a3;
  id v19 = a4;
  id v20 = a7;
  v32 = self;
  id v21 = a5;
  uint64_t v22 = sub_1C791F3C0();
  unint64_t v24 = v23;

  uint64_t v31 = sub_1C7925E60();
  uint64_t v26 = v25;

  if (v21)
  {
    uint64_t v27 = sub_1C7925E60();
    uint64_t v29 = v28;
  }
  else
  {
    uint64_t v27 = 0;
    uint64_t v29 = 0;
  }
  sub_1C791F5C0();

  _Block_copy(v17);
  v30 = v32;
  sub_1C718AA70(v22, v24, v31, v26, v27, v29, v34, (uint64_t)v16, v33, (uint64_t)v32, (void (**)(void, uint64_t, void))v17);
  _Block_release(v17);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1C6E355F8(v22, v24);

  (*(void (**)(char *, uint64_t))(v35 + 8))(v16, v36);
}

- (_TtCC24IntelligencePlatformCore18FeedbackServiceXPC6Server)init
{
}

- (void).cxx_destruct
{
  sub_1C718C0B8((uint64_t)self + OBJC_IVAR____TtCC24IntelligencePlatformCore18FeedbackServiceXPC6Server_config, (void (*)(void))type metadata accessor for Configuration);
  swift_release();
  swift_bridgeObjectRelease();
}

@end