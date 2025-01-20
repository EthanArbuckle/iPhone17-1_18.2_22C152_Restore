@interface BRCSharedServerItem
- (BOOL)isSharedToMeChildItem;
- (BOOL)isSharedToMeTopLevelItem;
- (id)aliasDerivedStructure;
- (id)aliasDerivedStructureForDescription;
- (id)fallbackParentAppLibraryOnFS;
- (id)fallbackParentItemIDOnFS;
- (id)fallbackParentItemOnFS;
- (id)fallbackParentServerItemOnFS;
- (id)parentItemIDOnFS;
- (id)parentItemIDOnFSInDB:(id)a3;
- (id)parentItemOnFS;
- (id)parentLocalItemOnFS;
- (id)parentZoneOnFS;
- (void)fallbackParentItemOnFS;
@end

@implementation BRCSharedServerItem

- (BOOL)isSharedToMeTopLevelItem
{
  v2 = [(BRCServerItem *)self parentItemIDOnServer];
  char v3 = [v2 isSharedZoneRoot];

  return v3;
}

- (BOOL)isSharedToMeChildItem
{
  return ![(BRCSharedServerItem *)self isSharedToMeTopLevelItem];
}

- (id)fallbackParentAppLibraryOnFS
{
  session = self->super._session;
  v4 = [(BRCServerItem *)self clientZone];
  v5 = [v4 asSharedClientZone];
  v6 = [(BRCSharedServerItem *)self st];
  v7 = [v6 logicalName];
  v8 = objc_msgSend(v7, "br_pathExtension");
  v9 = [v8 lowercaseString];
  v10 = [(BRCAccountSession *)session fallbackAppLibraryForClientZone:v5 extension:v9];

  return v10;
}

- (id)fallbackParentItemOnFS
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  char v3 = [(BRCSharedServerItem *)self fallbackParentAppLibraryOnFS];
  v4 = [v3 defaultClientZone];
  v5 = [(BRCSharedServerItem *)self fallbackParentItemIDOnFS];
  v6 = [v4 itemByItemID:v5];

  if (v6)
  {
    v7 = v3;
  }
  else
  {
    v9 = brc_bread_crumbs();
    v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      v15 = [(BRCSharedServerItem *)self fallbackParentItemIDOnFS];
      v16 = [v3 mangledID];
      int v17 = 138412802;
      v18 = v15;
      __int16 v19 = 2112;
      v20 = v16;
      __int16 v21 = 2112;
      v22 = v9;
      _os_log_fault_impl(&dword_1D353B000, v10, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: can't find %@ in %@%@", (uint8_t *)&v17, 0x20u);
    }
    v7 = [(BRCAccountSession *)self->super._session appLibraryByID:*MEMORY[0x1E4F59418]];

    v11 = [v7 defaultClientZone];
    v12 = [v7 documentsFolderItemID];
    v6 = [v11 itemByItemID:v12];

    if (!v6)
    {
      v13 = brc_bread_crumbs();
      v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        [(BRCSharedServerItem *)(uint64_t)v13 fallbackParentItemOnFS];
      }

      v6 = 0;
    }
  }

  return v6;
}

- (id)fallbackParentServerItemOnFS
{
  return 0;
}

- (id)fallbackParentItemIDOnFS
{
  char v3 = [(BRCSharedServerItem *)self fallbackParentAppLibraryOnFS];
  db = self->super._db;
  v5 = [(BRCServerItem *)self session];
  v6 = [v5 clientDB];

  if (db == v6) {
    [v3 recreateDocumentsFolderIfNeededOnDisk];
  }
  v7 = [v3 documentsFolderItemID];

  return v7;
}

- (id)parentItemOnFS
{
  if ([(BRCSharedServerItem *)self isSharedToMeChildItem])
  {
    char v3 = [(BRCServerItem *)self clientZone];
    v4 = [(BRCServerItem *)self parentItemIDOnServer];
    v5 = [v3 serverItemByItemID:v4];
LABEL_5:

    goto LABEL_7;
  }
  v6 = [(BRCAccountSession *)self->super._session serverAliasItemForSharedItem:self];
  char v3 = v6;
  if (v6)
  {
    v4 = [v6 clientZone];
    v7 = [v3 itemID];
    v5 = [v4 serverItemByItemID:v7 db:self->super._db];

    goto LABEL_5;
  }
  v5 = [(BRCSharedServerItem *)self fallbackParentServerItemOnFS];
LABEL_7:

  return v5;
}

- (id)parentLocalItemOnFS
{
  if ([(BRCSharedServerItem *)self isSharedToMeChildItem])
  {
    char v3 = [(BRCServerItem *)self clientZone];
    v4 = [(BRCServerItem *)self parentItemIDOnServer];
    v5 = [v3 itemByItemID:v4];
LABEL_5:

    goto LABEL_7;
  }
  v6 = [(BRCAccountSession *)self->super._session serverAliasItemForSharedItem:self];
  char v3 = v6;
  if (v6)
  {
    v4 = [v6 clientZone];
    v7 = [v3 parentItemIDOnFS];
    v5 = [v4 itemByItemID:v7 db:self->super._db];

    goto LABEL_5;
  }
  v5 = [(BRCSharedServerItem *)self fallbackParentItemOnFS];
LABEL_7:

  return v5;
}

- (id)parentItemIDOnFSInDB:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  memset(v17, 0, sizeof(v17));
  __brc_create_section(0, (uint64_t)"-[BRCSharedServerItem parentItemIDOnFSInDB:]", 110, v17);
  v5 = brc_bread_crumbs();
  v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = v17[0];
    v16 = [(BRCServerItem *)self itemID];
    *(_DWORD *)buf = 134218498;
    uint64_t v19 = v15;
    __int16 v20 = 2112;
    __int16 v21 = v16;
    __int16 v22 = 2112;
    uint64_t v23 = v5;
    _os_log_debug_impl(&dword_1D353B000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx computing the parent item id of %@%@", buf, 0x20u);
  }
  if ([(BRCSharedServerItem *)self isSharedToMeChildItem])
  {
    v7 = [(BRCServerItem *)self parentItemIDOnServer];
  }
  else
  {
    v8 = [(BRCAccountSession *)self->super._session serverAliasItemForSharedItem:self db:v4];
    if (v8)
    {
      v9 = brc_bread_crumbs();
      v10 = brc_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        [(BRCSharedServerItem *)(uint64_t)v8 parentItemIDOnFSInDB:v10];
      }

      v7 = [v8 parentItemIDOnFS];
    }
    else
    {
      v7 = [(BRCSharedServerItem *)self fallbackParentItemIDOnFS];
      v11 = brc_bread_crumbs();
      v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v13 = [v7 debugItemIDString];
        -[BRCSharedServerItem parentItemIDOnFSInDB:](v13, (uint64_t)v11, buf, v12);
      }
    }
  }
  __brc_leave_section(v17);

  return v7;
}

- (id)aliasDerivedStructure
{
  v15.receiver = self;
  v15.super_class = (Class)BRCSharedServerItem;
  char v3 = [(BRCServerItem *)&v15 st];
  if ([(BRCSharedServerItem *)self isSharedToMeTopLevelItem])
  {
    id v4 = [(BRCAccountSession *)self->super._session serverAliasItemForSharedItem:self db:self->super._db];
    id v5 = (id)[v3 copy];
    v6 = [v4 st];
    v7 = [v6 ckInfo];
    [v5 setCkInfo:v7];

    v8 = [v4 st];
    objc_msgSend(v5, "setLastUsedTime:", objc_msgSend(v8, "lastUsedTime"));

    v9 = [v4 st];
    v10 = [v9 finderTags];
    [v5 setFinderTags:v10];

    v11 = [v4 st];
    objc_msgSend(v5, "setFavoriteRank:", objc_msgSend(v11, "favoriteRank"));

    v12 = [v4 st];
    v13 = [v12 logicalName];

    if (v13) {
      [v5 setLogicalName:v13];
    }
    objc_storeStrong((id *)&self->_aliasDerivedStructureForDescription, v5);
  }
  else
  {
    id v5 = v3;
  }

  return v5;
}

- (id)aliasDerivedStructureForDescription
{
  return self->_aliasDerivedStructureForDescription;
}

- (id)parentItemIDOnFS
{
  return [(BRCSharedServerItem *)self parentItemIDOnFSInDB:self->super._db];
}

- (id)parentZoneOnFS
{
  if ([(BRCSharedServerItem *)self isSharedToMeChildItem])
  {
    char v3 = [(BRCServerItem *)self serverZone];
  }
  else
  {
    id v4 = [(BRCAccountSession *)self->super._session serverAliasItemForSharedItem:self];
    id v5 = v4;
    if (v4)
    {
      char v3 = [v4 serverZone];
    }
    else
    {
      v6 = [(BRCSharedServerItem *)self fallbackParentAppLibraryOnFS];
      v7 = [v6 defaultClientZone];
      char v3 = [v7 serverZone];
    }
  }
  return v3;
}

- (void).cxx_destruct
{
}

- (void)fallbackParentItemOnFS
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D353B000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: fallbackItem%@", (uint8_t *)&v2, 0xCu);
}

- (void)parentItemIDOnFSInDB:(uint8_t *)buf .cold.1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_1D353B000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] falling back to an app library documents root: %@%@", buf, 0x16u);
}

- (void)parentItemIDOnFSInDB:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_1D353B000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] found the alias representing this item: %@%@", (uint8_t *)&v3, 0x16u);
}

@end