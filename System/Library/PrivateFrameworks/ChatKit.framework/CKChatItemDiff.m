@interface CKChatItemDiff
- (CKChatItemDiff)init;
- (NSIndexSet)inserted;
- (NSIndexSet)parentItemsToReload;
- (NSIndexSet)removed;
- (void)setInserted:(id)a3;
- (void)setParentItemsToReload:(id)a3;
- (void)setRemoved:(id)a3;
@end

@implementation CKChatItemDiff

- (NSIndexSet)inserted
{
  return (NSIndexSet *)sub_18F6081A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CKChatItemDiff_inserted);
}

- (void)setInserted:(id)a3
{
}

- (NSIndexSet)removed
{
  return (NSIndexSet *)sub_18F6081A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CKChatItemDiff_removed);
}

- (void)setRemoved:(id)a3
{
}

- (NSIndexSet)parentItemsToReload
{
  return (NSIndexSet *)sub_18F6081A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CKChatItemDiff_parentItemsToReload);
}

- (void)setParentItemsToReload:(id)a3
{
}

- (CKChatItemDiff)init
{
  result = (CKChatItemDiff *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___CKChatItemDiff_inserted;
  uint64_t v4 = sub_18F7B63C0();
  v6 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  ((void (*)(void *__return_ptr, char *, uint64_t))v6)((void *)(v4 - 8), v3, v4);
  v6((char *)self + OBJC_IVAR___CKChatItemDiff_removed, v4);
  v5 = (char *)self + OBJC_IVAR___CKChatItemDiff_parentItemsToReload;

  v6(v5, v4);
}

@end