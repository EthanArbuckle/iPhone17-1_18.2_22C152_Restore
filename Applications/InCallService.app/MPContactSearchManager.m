@interface MPContactSearchManager
- (MPContactSearchManager)init;
- (MPContactSearchManager)initWithType:(int64_t)a3 contactStore:(id)a4;
- (NSArray)contacts;
- (void)cancelPreviousSearch;
- (void)searchFor:(NSString *)a3 shouldRefreshResult:(BOOL)a4 completionHandler:(id)a5;
@end

@implementation MPContactSearchManager

- (MPContactSearchManager)initWithType:(int64_t)a3 contactStore:(id)a4
{
  id v6 = a4;
  return (MPContactSearchManager *)sub_1001A8198(a3, a4);
}

- (NSArray)contacts
{
  v2 = self;
  sub_1001A85A8();

  sub_100123340(0, &qword_1003218B8);
  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (void)searchFor:(NSString *)a3 shouldRefreshResult:(BOOL)a4 completionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a3;
  *(unsigned char *)(v9 + 24) = a4;
  *(void *)(v9 + 32) = v8;
  *(void *)(v9 + 40) = self;
  v10 = a3;
  v11 = self;

  sub_1001BB654((uint64_t)&unk_100323FD8, v9);
}

- (void)cancelPreviousSearch
{
  v2 = self;
  sub_1001AA4C8();
}

- (MPContactSearchManager)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  NSArray v3 = (char *)self + OBJC_IVAR___MPContactSearchManager_logger;
  uint64_t v4 = type metadata accessor for Logger();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end