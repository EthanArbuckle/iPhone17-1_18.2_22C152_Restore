@interface AsynchronousOperation
- (BOOL)isAsynchronous;
- (BOOL)isCancelled;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (NSString)description;
- (_TtC16HealthExperience21AsynchronousOperation)init;
- (void)cancel;
- (void)main;
- (void)start;
@end

@implementation AsynchronousOperation

- (_TtC16HealthExperience21AsynchronousOperation)init
{
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC16HealthExperience21AsynchronousOperation__autoFinishesOnCancel) = 1;
  uint64_t v3 = OBJC_IVAR____TtC16HealthExperience21AsynchronousOperation_operationState;
  sub_1C27C7920();
  int v8 = 0;
  swift_allocObject();
  v4 = self;
  *(Class *)((char *)&self->super.super.isa + v3) = (Class)sub_1C28CCB40();
  uint64_t v5 = OBJC_IVAR____TtC16HealthExperience21AsynchronousOperation_workLock;
  sub_1C28CC650();
  swift_allocObject();
  *(Class *)((char *)&v4->super.super.isa + v5) = (Class)sub_1C28CC640();

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for AsynchronousOperation();
  return [(AsynchronousOperation *)&v7 init];
}

- (BOOL)isExecuting
{
  v2 = self;
  sub_1C28CCB10();
  if (v5 && v5 == 1) {
    char v3 = 1;
  }
  else {
    char v3 = sub_1C28CE640();
  }

  swift_bridgeObjectRelease();
  return v3 & 1;
}

- (void)start
{
  sub_1C28CC650();
  sub_1C27D25DC();
  char v3 = self;
  swift_retain();
  sub_1C28CCBF0();

  swift_release();
}

- (BOOL)isFinished
{
  v2 = self;
  char v3 = sub_1C27D5DD0();

  return v3 & 1;
}

- (BOOL)isCancelled
{
  v2 = self;
  sub_1C28CCB10();

  return v4;
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)cancel
{
  sub_1C28CC650();
  sub_1C27D25DC();
  char v3 = self;
  swift_retain();
  sub_1C28CCBF0();

  swift_release();
}

- (void)main
{
  v2 = self;
  sub_1C28CE120();
  swift_bridgeObjectRelease();
  sub_1C28CE360();
  __break(1u);
}

- (NSString)description
{
  v2 = self;
  sub_1C27F3D0C();

  char v3 = (void *)sub_1C28CD6F0();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

@end