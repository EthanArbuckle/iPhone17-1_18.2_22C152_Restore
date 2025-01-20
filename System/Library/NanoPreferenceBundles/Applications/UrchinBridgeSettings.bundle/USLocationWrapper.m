@interface USLocationWrapper
+ (USLocationWrapper)shared;
- (USLocationWrapper)init;
- (void)loadLocationsWithCompletion:(id)a3;
- (void)setWithSelectedLocation:(id)a3;
@end

@implementation USLocationWrapper

+ (USLocationWrapper)shared
{
  if (qword_11840 != -1) {
    swift_once();
  }
  v2 = (void *)qword_11970;

  return (USLocationWrapper *)v2;
}

- (USLocationWrapper)init
{
  return (USLocationWrapper *)sub_5E8C();
}

- (void)loadLocationsWithCompletion:(id)a3
{
  sub_7C48(&qword_11780);
  __chkstk_darwin();
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = _Block_copy(a3);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  uint64_t v9 = sub_9590();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v6, 1, 1, v9);
  v10 = (void *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = self;
  v10[5] = sub_826C;
  v10[6] = v8;
  v11 = self;
  swift_retain();
  sub_6E70((uint64_t)v6, (uint64_t)&unk_117B0, (uint64_t)v10);

  swift_release();
  swift_release();
}

- (void)setWithSelectedLocation:(id)a3
{
  sub_7C48(&qword_11780);
  __chkstk_darwin();
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_9590();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = self;
  v8[5] = a3;
  id v9 = a3;
  v10 = self;
  id v11 = v9;
  sub_6E70((uint64_t)v6, (uint64_t)&unk_11790, (uint64_t)v8);

  swift_release();
}

- (void).cxx_destruct
{
  sub_927C((uint64_t)self + OBJC_IVAR___USLocationWrapper_staticLocationProvider);
  sub_927C((uint64_t)self + OBJC_IVAR___USLocationWrapper_currentLocationProvider);
  swift_release();
  v3 = (char *)self + OBJC_IVAR___USLocationWrapper_logger;
  uint64_t v4 = sub_9410();
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end