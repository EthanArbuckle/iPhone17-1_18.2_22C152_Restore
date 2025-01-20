@interface XPCClient
- (_TtC22ManagedAppDistribution9XPCClient)init;
- (void)handleMessages:(id)a3;
@end

@implementation XPCClient

- (_TtC22ManagedAppDistribution9XPCClient)init
{
  return (_TtC22ManagedAppDistribution9XPCClient *)sub_2445D6B04();
}

- (void)handleMessages:(id)a3
{
  id v4 = a3;
  v8 = self;
  uint64_t v5 = sub_2445EEF48();
  unint64_t v7 = v6;

  XPCClient.handleMessages(_:)(v5, v7);
  sub_244599358(v5, v7);
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC22ManagedAppDistribution9XPCClient_id;
  uint64_t v3 = sub_2445EEF88();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);

  swift_release();
}

@end