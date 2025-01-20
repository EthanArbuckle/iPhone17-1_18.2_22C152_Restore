@interface ClosableActionCardViewFactory
+ (id)createWithTitle:(id)a3 subtitle:(id)a4 actionTitle:(id)a5 action:(id)a6 close:(id)a7;
- (_TtC14BatteryUsageUI29ClosableActionCardViewFactory)init;
@end

@implementation ClosableActionCardViewFactory

+ (id)createWithTitle:(id)a3 subtitle:(id)a4 actionTitle:(id)a5 action:(id)a6 close:(id)a7
{
  v8 = _Block_copy(a6);
  v9 = _Block_copy(a7);
  uint64_t v10 = sub_90020();
  uint64_t v12 = v11;
  uint64_t v13 = sub_90020();
  uint64_t v15 = v14;
  uint64_t v16 = sub_90020();
  uint64_t v18 = v17;
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v8;
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v9;
  id v21 = sub_4D530(v10, v12, v13, v15, v16, v18, (uint64_t)sub_4E36C, v19, (uint64_t)sub_4E644, v20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return v21;
}

- (_TtC14BatteryUsageUI29ClosableActionCardViewFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ClosableActionCardViewFactory();
  return [(ClosableActionCardViewFactory *)&v3 init];
}

@end