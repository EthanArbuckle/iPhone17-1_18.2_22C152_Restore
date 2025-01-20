@interface CKChatItemController
- (CKChatItemController)init;
- (NSArray)associatedChatItems;
- (NSArray)chatItems;
- (id)initForCollectionView:(id)a3 chatItems:(id)a4 delegate:(id)a5;
- (id)setChatItems:(id)a3 completion:(id)a4;
- (void)addChatItem:(id)a3 at:(int64_t)a4;
- (void)removeChatItemAt:(int64_t)a3;
- (void)setAssociatedChatItems:(id)a3;
- (void)setChatItems:(id)a3;
- (void)setChatItemsUsingReloadDataWithoutAnimation:(id)a3;
@end

@implementation CKChatItemController

- (NSArray)chatItems
{
  return (NSArray *)sub_18F5E9974((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___CKChatItemController_chatItems, (unint64_t *)&qword_1E922BBE0);
}

- (void)setChatItems:(id)a3
{
  sub_18EF3528C(0, (unint64_t *)&qword_1E922BBE0);
  uint64_t v4 = sub_18F7B99C0();
  v5 = self;
  sub_18F5E98A0(v4);
}

- (NSArray)associatedChatItems
{
  return (NSArray *)sub_18F5E9974((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___CKChatItemController_associatedChatItems, &qword_1E922BC10);
}

- (void)setAssociatedChatItems:(id)a3
{
  sub_18EF3528C(0, &qword_1E922BC10);
  uint64_t v4 = sub_18F7B99C0();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___CKChatItemController_associatedChatItems);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (id)initForCollectionView:(id)a3 chatItems:(id)a4 delegate:(id)a5
{
  sub_18EF3528C(0, (unint64_t *)&qword_1E922BBE0);
  uint64_t v6 = sub_18F7B99C0();
  id v7 = a3;
  swift_unknownObjectRetain();
  id v8 = sub_18F5EB098(v7, v6);

  swift_unknownObjectRelease();
  return v8;
}

- (id)setChatItems:(id)a3 completion:(id)a4
{
  v5 = (void (*)(uint64_t))_Block_copy(a4);
  sub_18EF3528C(0, (unint64_t *)&qword_1E922BBE0);
  unint64_t v6 = sub_18F7B99C0();
  if (v5)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v5;
    v5 = (void (*)(uint64_t))sub_18F4C1E94;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = self;
  v9 = (void *)sub_18F5E9D40(v6, v5, v7);
  sub_18EF6E880((uint64_t)v5);

  swift_bridgeObjectRelease();

  return v9;
}

- (void)setChatItemsUsingReloadDataWithoutAnimation:(id)a3
{
  sub_18EF3528C(0, (unint64_t *)&qword_1E922BBE0);
  unint64_t v4 = sub_18F7B99C0();
  v5 = self;
  sub_18F5EA7E8(v4);

  swift_bridgeObjectRelease();
}

- (void)addChatItem:(id)a3 at:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_18F5EA91C(v6, a4);
}

- (void)removeChatItemAt:(int64_t)a3
{
  unint64_t v4 = self;
  sub_18F5EAAF0(a3);
}

- (CKChatItemController)init
{
  result = (CKChatItemController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_18F4C25DC((uint64_t)self + OBJC_IVAR___CKChatItemController_delegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CKChatItemController_collectionView);
}

@end