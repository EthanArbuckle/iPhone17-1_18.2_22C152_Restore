@interface HFActivityEventStatusItem
- (HFActivityEventStatusItem)initWithHome:(id)a3 room:(id)a4 valueSource:(id)a5;
- (HFActivityLogCoordinator_Swift)activityLogCoordinator;
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HFActivityEventStatusItem

- (HFActivityLogCoordinator_Swift)activityLogCoordinator
{
  v2 = (void *)swift_retain();
  return (HFActivityLogCoordinator_Swift *)v2;
}

- (HFActivityEventStatusItem)initWithHome:(id)a3 room:(id)a4 valueSource:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  v9 = (HFActivityEventStatusItem *)sub_20BAB44C0(v7, (uint64_t)a4, (uint64_t)a5);

  swift_unknownObjectRelease();
  return v9;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  if (a3) {
    uint64_t v4 = sub_20BCE7520();
  }
  else {
    uint64_t v4 = 0;
  }
  v5 = self;
  v6 = (void *)sub_20BAAF800(v4);

  swift_bridgeObjectRelease();
  return v6;
}

- (void).cxx_destruct
{
  swift_release();
  v3 = (char *)self + OBJC_IVAR___HFActivityEventStatusItem_midnightToday;
  uint64_t v4 = sub_20BCE6540();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end