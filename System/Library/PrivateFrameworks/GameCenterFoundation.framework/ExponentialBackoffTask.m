@interface ExponentialBackoffTask
- (_TtC20GameCenterFoundation22ExponentialBackoffTask)init;
- (_TtC20GameCenterFoundation22ExponentialBackoffTask)initWithName:(id)a3 queue:(id)a4 initialDelay:(double)a5 maxDelay:(double)a6 maxRetryCount:(int64_t)a7;
- (_TtP20GameCenterFoundation30ExponentialBackoffTaskDelegate_)delegate;
- (void)cancel;
- (void)setDelegate:(id)a3;
- (void)startWithTask:(id)a3 successCondition:(id)a4;
@end

@implementation ExponentialBackoffTask

- (_TtP20GameCenterFoundation30ExponentialBackoffTaskDelegate_)delegate
{
  v2 = (void *)sub_1C2E4D1C8();

  return (_TtP20GameCenterFoundation30ExponentialBackoffTaskDelegate_ *)v2;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1C2E4D26C();
}

- (_TtC20GameCenterFoundation22ExponentialBackoffTask)initWithName:(id)a3 queue:(id)a4 initialDelay:(double)a5 maxDelay:(double)a6 maxRetryCount:(int64_t)a7
{
  uint64_t v11 = sub_1C2E922F8();
  return (_TtC20GameCenterFoundation22ExponentialBackoffTask *)ExponentialBackoffTask.init(name:queue:initialDelay:maxDelay:maxRetryCount:)(v11, v12, a4, a7, a5, a6);
}

- (void)startWithTask:(id)a3 successCondition:(id)a4
{
  v6 = _Block_copy(a3);
  v7 = _Block_copy(a4);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v6;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  v10 = self;
  sub_1C2E4D5E0((uint64_t)sub_1C2E4F784, v8, (uint64_t)sub_1C2E4F78C, v9);

  swift_release();

  swift_release();
}

- (void)cancel
{
  v2 = self;
  sub_1C2E4EC74();
}

- (_TtC20GameCenterFoundation22ExponentialBackoffTask)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  v3 = (char *)self + OBJC_IVAR____TtC20GameCenterFoundation22ExponentialBackoffTask_delegate;

  sub_1C2E0D6DC((uint64_t)v3);
}

@end