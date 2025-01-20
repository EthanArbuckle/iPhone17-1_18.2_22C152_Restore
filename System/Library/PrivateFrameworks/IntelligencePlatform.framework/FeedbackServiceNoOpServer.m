@interface FeedbackServiceNoOpServer
- (BOOL)logWithFeedbackData:(id)a3 type:(id)a4 variant:(id)a5 eventId:(int64_t)a6 withTimestamp:(id)a7 shouldProcessImmediately:(BOOL)a8 error:(id *)a9;
- (_TtC20IntelligencePlatform25FeedbackServiceNoOpServer)init;
@end

@implementation FeedbackServiceNoOpServer

- (BOOL)logWithFeedbackData:(id)a3 type:(id)a4 variant:(id)a5 eventId:(int64_t)a6 withTimestamp:(id)a7 shouldProcessImmediately:(BOOL)a8 error:(id *)a9
{
  uint64_t v27 = sub_1B2E80668();
  uint64_t v14 = *(void *)(v27 - 8);
  MEMORY[0x1F4188790](v27);
  v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v17 = a3;
  id v18 = a4;
  id v19 = a7;
  v20 = self;
  id v21 = a5;
  uint64_t v22 = sub_1B2E80588();
  unint64_t v24 = v23;

  sub_1B2E82378();
  if (v21)
  {
    sub_1B2E82378();
  }
  sub_1B2E80618();

  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v27);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B29C34DC(v22, v24);
  return 1;
}

- (_TtC20IntelligencePlatform25FeedbackServiceNoOpServer)init
{
  return (_TtC20IntelligencePlatform25FeedbackServiceNoOpServer *)sub_1B2B4C744();
}

@end