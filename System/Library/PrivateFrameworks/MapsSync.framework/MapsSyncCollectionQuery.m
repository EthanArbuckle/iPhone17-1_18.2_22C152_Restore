@interface MapsSyncCollectionQuery
+ (NSArray)additionalNotificationTypes;
+ (OS_os_log)signpostLog;
- (_TtC8MapsSync23MapsSyncCollectionQuery)initWithDelegate:(id)a3;
- (_TtC8MapsSync23MapsSyncCollectionQuery)initWithOptions:(id)a3 delegate:(id)a4;
- (_TtC8MapsSync23MapsSyncCollectionQuery)initWithQueryDelegate:(id)a3 predicate:(id)a4;
- (void)fetchContents:(id)a3;
- (void)fetchContentsWithCallbackQueue:(id)a3 completion:(id)a4;
- (void)fetchQueryContents:(id)a3;
- (void)fetchQueryContentsWithCallbackQueue:(id)a3 completion:(id)a4;
@end

@implementation MapsSyncCollectionQuery

- (_TtC8MapsSync23MapsSyncCollectionQuery)initWithOptions:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  return (_TtC8MapsSync23MapsSyncCollectionQuery *)MapsSyncCollectionQuery.init(options:delegate:)(a3, (uint64_t)a4);
}

- (_TtC8MapsSync23MapsSyncCollectionQuery)initWithDelegate:(id)a3
{
  return [(MapsSyncCollectionQuery *)self initWithOptions:0 delegate:a3];
}

- (void)fetchContents:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  id v6 = (void *)swift_allocObject();
  v6[2] = sub_1A6F75714;
  v6[3] = v5;
  v7 = self;
  swift_retain();
  sub_1A6F95778((void (*)(void, void))sub_1A6F75740, v6, 0);

  swift_release();
  swift_release();
}

- (void)fetchContentsWithCallbackQueue:(id)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  v8 = (void *)swift_allocObject();
  v8[2] = sub_1A6F755FC;
  v8[3] = v7;
  id v9 = a3;
  v10 = self;
  swift_retain();
  sub_1A6F95778((void (*)(void, void))sub_1A6F75740, v8, a3);

  swift_release();
  swift_release();
}

- (void)fetchQueryContents:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  id v6 = (void *)swift_allocObject();
  v6[2] = sub_1A6F75710;
  v6[3] = v5;
  uint64_t v7 = self;
  swift_retain();
  sub_1A6F95778((void (*)(void, void))sub_1A6F75744, v6, 0);

  swift_release();
  swift_release();
}

- (void)fetchQueryContentsWithCallbackQueue:(id)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  v8 = (void *)swift_allocObject();
  v8[2] = sub_1A6F755F4;
  v8[3] = v7;
  id v9 = a3;
  v10 = self;
  swift_retain();
  sub_1A6F95778((void (*)(void, void))sub_1A6F75744, v8, a3);

  swift_release();
  swift_release();
}

+ (NSArray)additionalNotificationTypes
{
  sub_1A6F74E28();
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1A70A5290;
  *(void *)(v2 + 32) = type metadata accessor for MapsSyncManagedCollectionItem();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6703E0);
  v3 = (void *)sub_1A709D4C8();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

+ (OS_os_log)signpostLog
{
  sub_1A6EE80D0(0, (unint64_t *)&qword_1EB671810);
  uint64_t v2 = (void *)sub_1A709D858();
  return (OS_os_log *)v2;
}

- (_TtC8MapsSync23MapsSyncCollectionQuery)initWithQueryDelegate:(id)a3 predicate:(id)a4
{
  swift_unknownObjectRetain();
  id v5 = a4;
  result = (_TtC8MapsSync23MapsSyncCollectionQuery *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end