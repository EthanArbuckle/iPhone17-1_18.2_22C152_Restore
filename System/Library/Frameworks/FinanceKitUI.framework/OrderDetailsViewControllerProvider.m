@interface OrderDetailsViewControllerProvider
+ (id)makeViewControllerWithOrderTypeIdentifier:(id)a3 orderIdentifier:(id)a4 fulfillmentIdentifier:(id)a5;
- (_TtC12FinanceKitUI34OrderDetailsViewControllerProvider)init;
@end

@implementation OrderDetailsViewControllerProvider

+ (id)makeViewControllerWithOrderTypeIdentifier:(id)a3 orderIdentifier:(id)a4 fulfillmentIdentifier:(id)a5
{
  uint64_t v6 = sub_243DFE910();
  uint64_t v8 = v7;
  uint64_t v9 = sub_243DFE910();
  uint64_t v11 = v10;
  if (a5)
  {
    uint64_t v12 = sub_243DFE910();
    a5 = v13;
  }
  else
  {
    uint64_t v12 = 0;
  }
  v14 = (char *)objc_allocWithZone((Class)type metadata accessor for OrderDetailsViewController());
  v15 = (uint64_t *)&v14[qword_268E1E390];
  uint64_t *v15 = v6;
  v15[1] = v8;
  v16 = (uint64_t *)&v14[qword_268E1E398];
  uint64_t *v16 = v9;
  v16[1] = v11;
  v17 = (uint64_t *)&v14[qword_268E1E3A0];
  uint64_t *v17 = v12;
  v17[1] = (uint64_t)a5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v18 = sub_243D24FE8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v18;
}

- (_TtC12FinanceKitUI34OrderDetailsViewControllerProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for OrderDetailsViewControllerProvider();
  return [(OrderDetailsViewControllerProvider *)&v3 init];
}

@end