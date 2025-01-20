@interface MapsSyncStoreServerRequestHandlingPolicy
- (_TtC9mapssyncd40MapsSyncStoreServerRequestHandlingPolicy)init;
- (id)processFaultForObjectWithID:(id)a3 fromClientWithContext:(id)a4 error:(id *)a5;
- (id)processRequest:(id)a3 fromClientWithContext:(id)a4 error:(id *)a5;
@end

@implementation MapsSyncStoreServerRequestHandlingPolicy

- (_TtC9mapssyncd40MapsSyncStoreServerRequestHandlingPolicy)init
{
  v2 = self;
  v2->NSXPCStoreServerRequestHandlingPolicy_opaque[OBJC_IVAR____TtC9mapssyncd40MapsSyncStoreServerRequestHandlingPolicy_mapsInstalled] = sub_100014934() & 1;

  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for MapsSyncStoreServerRequestHandlingPolicy();
  return [(MapsSyncStoreServerRequestHandlingPolicy *)&v4 init];
}

- (id)processRequest:(id)a3 fromClientWithContext:(id)a4 error:(id *)a5
{
  return sub_100009888(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(void *__return_ptr, void *, void *))sub_10000921C);
}

- (id)processFaultForObjectWithID:(id)a3 fromClientWithContext:(id)a4 error:(id *)a5
{
  return sub_100009888(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(void *__return_ptr, void *, void *))sub_100009694);
}

@end