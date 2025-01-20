@interface XPCClient
- (_TtC21_MarketplaceKit_UIKit9XPCClient)init;
- (void)handleMessages:(id)a3;
@end

@implementation XPCClient

- (void)handleMessages:(id)a3
{
  id v4 = a3;
  v8 = self;
  uint64_t v5 = sub_2465BDD18();
  unint64_t v7 = v6;

  sub_2465B6B24(v5, v7);
}

- (_TtC21_MarketplaceKit_UIKit9XPCClient)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(XPCClient *)&v3 init];
}

@end