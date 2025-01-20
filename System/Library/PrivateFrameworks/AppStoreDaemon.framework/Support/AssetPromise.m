@interface AssetPromise
- (BOOL)isCancelled;
- (BOOL)isFinished;
- (NSUUID)requestID;
- (_TtC9appstored12AssetPromise)init;
- (_TtC9appstored12AssetPromise)initWithRequestID:(id)a3 promiseBlock:(id)a4;
- (id)progress;
- (void)addErrorBlock:(id)a3;
- (void)addFinishBlock:(id)a3;
- (void)addSuccessBlock:(id)a3;
- (void)cancel;
- (void)finishWithError:(id)a3;
- (void)finishWithResult:(id)a3;
- (void)setProgress:(id)a3;
@end

@implementation AssetPromise

- (NSUUID)requestID
{
  v2.super.isa = UUID._bridgeToObjectiveC()().super.isa;
  return (NSUUID *)v2.super.isa;
}

- (id)progress
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored12AssetPromise__progress);
  v3 = (uint64_t *)(v2 + 16);
  v4 = (os_unfair_lock_s *)(v2 + 32);
  v5 = self;
  os_unfair_lock_lock(v4);
  sub_1000395EC(v3, &aBlock);
  os_unfair_lock_unlock(v4);
  if ((void)aBlock)
  {
    long long v9 = aBlock;
    uint64_t v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = v9;

    v13 = sub_10003B7F4;
    uint64_t v14 = v6;
    *(void *)&long long aBlock = _NSConcreteStackBlock;
    *((void *)&aBlock + 1) = 1107296256;
    v11 = sub_10003948C;
    v12 = &unk_100512220;
    v7 = _Block_copy(&aBlock);
    swift_release();
  }
  else
  {

    v7 = 0;
  }
  return v7;
}

- (void)setProgress:(id)a3
{
  uint64_t v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v5;
    uint64_t v6 = sub_10003B7D4;
  }
  else
  {
    uint64_t v6 = 0;
  }
  __chkstk_darwin(v4);
  v8 = (uint64_t *)(v7 + 16);
  long long v9 = (os_unfair_lock_s *)(v7 + 32);
  v10 = self;
  os_unfair_lock_lock(v9);
  sub_10003B7B8(v8);
  os_unfair_lock_unlock(v9);
  sub_100018DD4((uint64_t)v6);
}

- (BOOL)isCancelled
{
  uint64_t v2 = *(os_unfair_lock_s **)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored12AssetPromise_state);
  uint64_t v3 = (uint64_t)&v2[4];
  uint64_t v4 = v2 + 9;
  uint64_t v5 = self;
  os_unfair_lock_lock(v4);
  sub_1000397E8(v3, &v7);
  os_unfair_lock_unlock(v4);
  LOBYTE(v3) = v7;

  return v3;
}

- (BOOL)isFinished
{
  uint64_t v2 = *(os_unfair_lock_s **)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored12AssetPromise_state);
  uint64_t v3 = (uint64_t)&v2[4];
  uint64_t v4 = v2 + 9;
  uint64_t v5 = self;
  os_unfair_lock_lock(v4);
  sub_100039998(v3, &v7);
  os_unfair_lock_unlock(v4);
  LOBYTE(v3) = v7;

  return v3;
}

- (_TtC9appstored12AssetPromise)initWithRequestID:(id)a3 promiseBlock:(id)a4
{
  uint64_t v5 = type metadata accessor for UUID();
  __chkstk_darwin(v5 - 8);
  BOOL v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  return (_TtC9appstored12AssetPromise *)sub_1000399AC((uint64_t)v7, (uint64_t)sub_10003B7A4, v9);
}

- (void)addErrorBlock:(id)a3
{
}

- (void)addFinishBlock:(id)a3
{
}

- (void)addSuccessBlock:(id)a3
{
}

- (void)cancel
{
  type metadata accessor for CancellationError();
  sub_10003ACC8();
  uint64_t v3 = swift_allocError();
  uint64_t v4 = self;
  CancellationError.init()();
  sub_10003A1BC(v3, 1);
  swift_errorRelease();
}

- (void)finishWithError:(id)a3
{
  id v6 = a3;
  uint64_t v5 = self;
  sub_10003A1BC((uint64_t)a3, 1);
}

- (void)finishWithResult:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_10003A1BC((uint64_t)a3, 0);
}

- (_TtC9appstored12AssetPromise)init
{
  result = (_TtC9appstored12AssetPromise *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC9appstored12AssetPromise_requestID;
  uint64_t v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
}

@end