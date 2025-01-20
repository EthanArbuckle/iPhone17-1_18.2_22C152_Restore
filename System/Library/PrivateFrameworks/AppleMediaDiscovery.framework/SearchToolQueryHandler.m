@interface SearchToolQueryHandler
- (_TtC19AppleMediaDiscovery22SearchToolQueryHandler)init;
- (void)querySearchToolWithSearchtoolQueryConfig:(NSDictionary *)a3 completionHandler:(id)a4;
@end

@implementation SearchToolQueryHandler

- (void)querySearchToolWithSearchtoolQueryConfig:(NSDictionary *)a3 completionHandler:(id)a4
{
  v4 = a3;
  v9 = _Block_copy(a4);
  v5 = self;
  v6 = (void *)swift_allocObject();
  v6[2] = a3;
  v6[3] = v9;
  v6[4] = self;
  sub_20ACADA3C((uint64_t)&unk_267681088, (uint64_t)v6);
}

- (_TtC19AppleMediaDiscovery22SearchToolQueryHandler)init
{
  return (_TtC19AppleMediaDiscovery22SearchToolQueryHandler *)SearchToolQueryHandler.init()();
}

@end