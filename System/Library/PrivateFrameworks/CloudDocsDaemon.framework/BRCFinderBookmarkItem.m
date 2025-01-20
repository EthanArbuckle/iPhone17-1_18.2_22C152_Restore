@interface BRCFinderBookmarkItem
- (BOOL)isFinderBookmark;
- (BOOL)isShareableItem;
- (id)asShareableItem;
- (id)documentRecordID;
- (void)asShareableItem;
- (void)isFinderBookmark;
@end

@implementation BRCFinderBookmarkItem

- (BOOL)isFinderBookmark
{
  if ([(BRCStatInfo *)self->super.super._st type] != 6
    && [(BRCStatInfo *)self->super.super._st type] != 7)
  {
    v4 = brc_bread_crumbs();
    v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      [(BRCFinderBookmarkItem *)(uint64_t)v4 isFinderBookmark];
    }
  }
  return 1;
}

- (BOOL)isShareableItem
{
  return 0;
}

- (id)asShareableItem
{
  v2 = brc_bread_crumbs();
  v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    [(BRCFinderBookmarkItem *)(uint64_t)v2 asShareableItem];
  }

  return 0;
}

- (id)documentRecordID
{
  v3 = [(BRCItemID *)self->super.super._itemID itemIDString];
  v4 = [@"finderBookmark/" stringByAppendingString:v3];

  id v5 = objc_alloc(MEMORY[0x1E4F1A2F8]);
  v6 = [(BRCServerZone *)self->super.super._serverZone zoneID];
  v7 = (void *)[v5 initWithRecordName:v4 zoneID:v6];

  return v7;
}

- (void)isFinderBookmark
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D353B000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: _st.type == BRC_ITEM_TYPE_FINDER_BOOKMARK || _st.type == BRC_ITEM_TYPE_FINDER_BOOKMARK_FAULT%@", (uint8_t *)&v2, 0xCu);
}

- (void)asShareableItem
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D353B000, a2, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: -asShareableItem called on a non-shareable item%@", (uint8_t *)&v2, 0xCu);
}

@end