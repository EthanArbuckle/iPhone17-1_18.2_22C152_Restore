@interface MapsSyncReviewedPlaceQuery
+ (OS_os_log)signpostLog;
- (_TtC8MapsSync26MapsSyncReviewedPlaceQuery)initWithDelegate:(id)a3;
- (_TtC8MapsSync26MapsSyncReviewedPlaceQuery)initWithOptions:(id)a3 delegate:(id)a4;
- (_TtC8MapsSync26MapsSyncReviewedPlaceQuery)initWithQueryDelegate:(id)a3 predicate:(id)a4;
- (void)fetchContents:(id)a3;
- (void)fetchContentsWithCallbackQueue:(id)a3 completion:(id)a4;
- (void)fetchQueryContents:(id)a3;
- (void)fetchQueryContentsWithCallbackQueue:(id)a3 completion:(id)a4;
@end

@implementation MapsSyncReviewedPlaceQuery

- (_TtC8MapsSync26MapsSyncReviewedPlaceQuery)initWithOptions:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  return (_TtC8MapsSync26MapsSyncReviewedPlaceQuery *)MapsSyncReviewedPlaceQuery.init(options:delegate:)(a3, (uint64_t)a4);
}

- (_TtC8MapsSync26MapsSyncReviewedPlaceQuery)initWithDelegate:(id)a3
{
  return [(MapsSyncReviewedPlaceQuery *)self initWithOptions:0 delegate:a3];
}

- (void)fetchContents:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  id v6 = (void *)swift_allocObject();
  v6[2] = sub_1A6FA7C5C;
  v6[3] = v5;
  v7 = self;
  swift_retain();
  sub_1A6F95778((void (*)(void, void))sub_1A6FA7C88, v6, 0);

  swift_release();
  swift_release();
}

- (void)fetchContentsWithCallbackQueue:(id)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  v8 = (void *)swift_allocObject();
  v8[2] = sub_1A6FA7B88;
  v8[3] = v7;
  id v9 = a3;
  v10 = self;
  swift_retain();
  sub_1A6F95778((void (*)(void, void))sub_1A6FA7C88, v8, a3);

  swift_release();
  swift_release();
}

- (void)fetchQueryContents:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  id v6 = (void *)swift_allocObject();
  v6[2] = sub_1A6FA7C58;
  v6[3] = v5;
  uint64_t v7 = self;
  swift_retain();
  sub_1A6F95778((void (*)(void, void))sub_1A6FA7C8C, v6, 0);

  swift_release();
  swift_release();
}

- (void)fetchQueryContentsWithCallbackQueue:(id)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  v8 = (void *)swift_allocObject();
  v8[2] = sub_1A6F15374;
  v8[3] = v7;
  id v9 = a3;
  v10 = self;
  swift_retain();
  sub_1A6F95778((void (*)(void, void))sub_1A6FA7C8C, v8, a3);

  swift_release();
  swift_release();
}

+ (OS_os_log)signpostLog
{
  sub_1A6EE80D0(0, (unint64_t *)&qword_1EB671810);
  v2 = (void *)sub_1A709D858();
  return (OS_os_log *)v2;
}

- (_TtC8MapsSync26MapsSyncReviewedPlaceQuery)initWithQueryDelegate:(id)a3 predicate:(id)a4
{
  swift_unknownObjectRetain();
  id v5 = a4;
  result = (_TtC8MapsSync26MapsSyncReviewedPlaceQuery *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end