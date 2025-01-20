@interface BRCZoneRootItem
- (BOOL)isDirectoryFault;
- (BOOL)isFSRoot;
- (BOOL)isShareableItem;
- (BOOL)isUserVisible;
- (BOOL)isZoneRoot;
- (BOOL)saveToDB;
- (BRCZoneRootItem)initWithZoneRootItemID:(id)a3 session:(id)a4;
- (id)extendedAttributes;
- (id)fileID;
- (id)parentItemID;
- (id)parentItemOnFS;
- (id)st;
- (unsigned)itemScope;
- (void)fileID;
- (void)parentItemID;
- (void)parentItemOnFS;
- (void)saveToDB;
- (void)st;
@end

@implementation BRCZoneRootItem

- (BRCZoneRootItem)initWithZoneRootItemID:(id)a3 session:(id)a4
{
  id v7 = a3;
  v8 = (BRCAccountSession *)a4;
  v22.receiver = self;
  v22.super_class = (Class)BRCZoneRootItem;
  v9 = [(BRCZoneRootItem *)&v22 init];
  if (!v9)
  {
LABEL_9:
    v12 = v9;
    goto LABEL_10;
  }
  if (([v7 isNonDesktopRoot] & 1) == 0)
  {
    v18 = brc_bread_crumbs();
    v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      -[BRCZoneRootItem initWithZoneRootItemID:session:]();
    }
  }
  objc_storeStrong((id *)&v9->super.super._itemID, a3);
  v9->super.super._session = v8;
  if (![v7 isSharedZoneRoot])
  {
    v13 = [v7 appLibraryRowID];
    v14 = [(BRCAccountSession *)v8 appLibraryByRowID:v13];

    if (!v14)
    {
      v20 = brc_bread_crumbs();
      v21 = brc_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
        -[BRCItemID(CKConversions) structureRecordIDForItemType:zone:aliasTargetZoneIsShared:]();
      }
    }
    [(BRCLocalItem *)v9 setAppLibrary:v14];
    uint64_t v15 = [v14 defaultClientZone];
    clientZone = v9->super.super._clientZone;
    v9->super.super._clientZone = (BRCClientZone *)v15;

    v9->super.super._serverZone = (BRCServerZone *)[(BRCClientZone *)v9->super.super._clientZone serverZone];
    goto LABEL_9;
  }
  v10 = brc_bread_crumbs();
  v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
    -[BRCZoneRootItem initWithZoneRootItemID:session:]();
  }

  v12 = 0;
LABEL_10:

  return v12;
}

- (BOOL)isFSRoot
{
  return 1;
}

- (BOOL)isDirectoryFault
{
  v2 = [(BRCLocalItem *)self appLibrary];
  BOOL v3 = ([v2 state] & 0x2000000) == 0;

  return v3;
}

- (BOOL)isZoneRoot
{
  return 1;
}

- (BOOL)saveToDB
{
  v2 = brc_bread_crumbs();
  BOOL v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    -[BRCZoneRootItem saveToDB]();
  }

  return 0;
}

- (id)fileID
{
  BOOL v3 = [(BRCLocalItem *)self appLibrary];
  v4 = [v3 fileID];

  if (!v4)
  {
    v8 = brc_bread_crumbs();
    v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[BRCZoneRootItem fileID]();
    }
  }
  v5 = [(BRCLocalItem *)self appLibrary];
  v6 = [v5 fileID];

  return v6;
}

- (id)parentItemOnFS
{
  v2 = brc_bread_crumbs();
  BOOL v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    -[BRCZoneRootItem parentItemOnFS]();
  }

  return 0;
}

- (id)parentItemID
{
  BOOL v3 = brc_bread_crumbs();
  v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    -[BRCZoneRootItem parentItemID]();
  }

  v5 = [(BRCLocalItem *)self itemID];
  return v5;
}

- (id)st
{
  BOOL v3 = brc_bread_crumbs();
  v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    -[BRCZoneRootItem st]();
  }

  v7.receiver = self;
  v7.super_class = (Class)BRCZoneRootItem;
  v5 = [(BRCLocalItem *)&v7 st];
  return v5;
}

- (BOOL)isShareableItem
{
  return 0;
}

- (id)extendedAttributes
{
  return 0;
}

- (BOOL)isUserVisible
{
  v2 = [(BRCLocalItem *)self appLibrary];
  char v3 = [v2 includesDataScope] ^ 1;

  return v3;
}

- (unsigned)itemScope
{
  v2 = [(BRCLocalItem *)self appLibrary];
  int v3 = [v2 includesDataScope];

  if (v3) {
    return 1;
  }
  else {
    return 2;
  }
}

- (void)initWithZoneRootItemID:session:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_fault_impl(&dword_1D353B000, v1, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Constructing shared zone root item for itemID %@ is not supported%@", v2, 0x16u);
}

- (void)initWithZoneRootItemID:session:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: itemID.isNonDesktopRoot%@", v2, v3, v4, v5, v6);
}

- (void)saveToDB
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] API MISUSE: can't save a zone root item%@", v2, v3, v4, v5, v6);
}

- (void)fileID
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: self.appLibrary.fileID%@", v2, v3, v4, v5, v6);
}

- (void)parentItemOnFS
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: asking the parent item of a root item%@", v2, v3, v4, v5, v6);
}

- (void)parentItemID
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: asking the parent item ID of a root item%@", v2, v3, v4, v5, v6);
}

- (void)st
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: asking the structural bit of a zone root is not supported%@", v2, v3, v4, v5, v6);
}

@end