@interface HFReorderableItemList
- (BOOL)isEmpty;
- (BOOL)sortedIdentifiersWithIdentifier1:(id)a3 identifier2:(id)a4;
- (BOOL)sortedItemsWithItem1:(id)a3 item2:(id)a4;
- (HFReorderableItemList)initWithApplicationDataContainer:(id)a3 category:(id)a4;
- (id)saveWithSender:(id)a3;
- (void)setSortedItems:(id)a3;
@end

@implementation HFReorderableItemList

- (HFReorderableItemList)initWithApplicationDataContainer:(id)a3 category:(id)a4
{
  sub_20BCE7620();
  v4 = (void *)swift_unknownObjectRetain();
  return (HFReorderableItemList *)ReorderableItemList.init(applicationDataContainer:category:)(v4);
}

- (BOOL)sortedItemsWithItem1:(id)a3 item2:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_20BA7E0CC(v6, v7);

  return v9 & 1;
}

- (BOOL)sortedIdentifiersWithIdentifier1:(id)a3 identifier2:(id)a4
{
  uint64_t v5 = sub_20BCE7620();
  uint64_t v7 = v6;
  uint64_t v8 = sub_20BCE7620();
  uint64_t v10 = v9;
  v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.super.isa)
                                                                     + 0xA8);
  v12 = self;
  char v13 = v11(v5, v7, v8, v10);
  if (v13 == 2)
  {
    if (v5 == v8 && v7 == v10)
    {
      swift_bridgeObjectRelease_n();
      char v14 = 0;
    }
    else
    {
      char v14 = sub_20BCE8000();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    char v15 = v13;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    char v14 = v15 & 1;
  }

  return v14 & 1;
}

- (BOOL)isEmpty
{
  return (*(void **)((char *)&self->super.super.isa + OBJC_IVAR___HFReorderableItemList_sortedIdentifiers))[2] == 0;
}

- (void)setSortedItems:(id)a3
{
  uint64_t v4 = sub_20BCE7710();
  uint64_t v5 = self;
  unint64_t v6 = sub_20BA7EE24(v4);
  if (v6)
  {
    *(Class *)((char *)&v5->super.super.isa + OBJC_IVAR___HFReorderableItemList_sortedIdentifiers) = (Class)sub_20BA7E9CC(v6);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {

    swift_bridgeObjectRelease();
  }
}

- (id)saveWithSender:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_20BCE7C00();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  id v6 = sub_20BA7F66C((uint64_t)v8);

  sub_20BA1FD90((uint64_t)v8, (uint64_t *)&unk_26AB2E690);
  return v6;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end