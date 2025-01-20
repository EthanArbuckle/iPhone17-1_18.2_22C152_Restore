@interface ClockUpdater
- (_TtC20ClockPosterExtension12ClockUpdater)init;
- (void)dealloc;
- (void)updateConfiguration:(id)a3 completion:(id)a4;
- (void)updateConfiguration:(id)a3 withSessionInfo:(id)a4 completion:(id)a5;
- (void)updateDescriptors:(id)a3 withSessionInfo:(id)a4 completion:(id)a5;
@end

@implementation ClockUpdater

- (_TtC20ClockPosterExtension12ClockUpdater)init
{
  return (_TtC20ClockPosterExtension12ClockUpdater *)ClockUpdater.init()();
}

- (void)dealloc
{
  uint64_t v3 = sub_10000C9D8();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000CA18();
  v7 = self;
  sub_10000C9A8();
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for ClockLogger.Role.update(_:), v3);
  sub_10000C9F8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v8 = (objc_class *)type metadata accessor for ClockUpdater();
  v9.receiver = v7;
  v9.super_class = v8;
  [(ClockUpdater *)&v9 dealloc];
}

- (void).cxx_destruct
{
}

- (void)updateDescriptors:(id)a3 withSessionInfo:(id)a4 completion:(id)a5
{
  v7 = _Block_copy(a5);
  sub_1000056E4();
  uint64_t v8 = sub_10000CBF8();
  _Block_copy(v7);
  id v9 = a4;
  v10 = self;
  sub_100006AE8(v8, (uint64_t)v10, (uint64_t)v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (void)updateConfiguration:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  v7 = (void (*)(void *, id, void))v6[2];
  id v8 = a3;
  id v9 = self;
  v7(v6, v8, 0);
  _Block_release(v6);
}

- (void)updateConfiguration:(id)a3 withSessionInfo:(id)a4 completion:(id)a5
{
  id v8 = _Block_copy(a5);
  id v9 = (void (*)(void *, id, void))v8[2];
  id v10 = a3;
  id v11 = a4;
  v12 = self;
  v9(v8, v10, 0);
  _Block_release(v8);
}

@end