@interface BRCPCSChainInfo
- (BOOL)aliasTargetZoneIsShared;
- (BRCItemID)itemID;
- (BRCItemID)parentID;
- (BRCPCSChainInfo)initWithItemID:(id)a3 parentID:(id)a4 structuralCKInfo:(id)a5 contentCKInfo:(id)a6 itemType:(char)a7 aliasTargetZoneIsShared:(BOOL)a8 chainState:(unsigned int)a9;
- (BRFieldCKInfo)contentCKInfo;
- (BRFieldCKInfo)structuralCKInfo;
- (char)itemType;
- (unsigned)chainState;
@end

@implementation BRCPCSChainInfo

- (BRCPCSChainInfo)initWithItemID:(id)a3 parentID:(id)a4 structuralCKInfo:(id)a5 contentCKInfo:(id)a6 itemType:(char)a7 aliasTargetZoneIsShared:(BOOL)a8 chainState:(unsigned int)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  v26.receiver = self;
  v26.super_class = (Class)BRCPCSChainInfo;
  v19 = [(BRCPCSChainInfo *)&v26 init];
  v20 = v19;
  if (v19)
  {
    id v24 = v17;
    objc_storeStrong((id *)&v19->_itemID, a3);
    objc_storeStrong((id *)&v20->_parentID, a4);
    v20->_itemType = a7;
    objc_storeStrong((id *)&v20->_structuralCKInfo, a5);
    objc_storeStrong((id *)&v20->_contentCKInfo, a6);
    v20->_chainState = a9;
    v20->_aliasTargetZoneIsShared = a8;
    if (!v15 || !v16)
    {
      v22 = brc_bread_crumbs();
      v23 = brc_default_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
        -[BRCPCSChainInfo initWithItemID:parentID:structuralCKInfo:contentCKInfo:itemType:aliasTargetZoneIsShared:chainState:]();
      }

      id v17 = v24;
    }
  }

  return v20;
}

- (BRCItemID)itemID
{
  return self->_itemID;
}

- (char)itemType
{
  return self->_itemType;
}

- (BRCItemID)parentID
{
  return self->_parentID;
}

- (BRFieldCKInfo)structuralCKInfo
{
  return self->_structuralCKInfo;
}

- (BRFieldCKInfo)contentCKInfo
{
  return self->_contentCKInfo;
}

- (unsigned)chainState
{
  return self->_chainState;
}

- (BOOL)aliasTargetZoneIsShared
{
  return self->_aliasTargetZoneIsShared;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentCKInfo, 0);
  objc_storeStrong((id *)&self->_structuralCKInfo, 0);
  objc_storeStrong((id *)&self->_parentID, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
}

- (void)initWithItemID:parentID:structuralCKInfo:contentCKInfo:itemType:aliasTargetZoneIsShared:chainState:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: itemID && parentID%@", v2, v3, v4, v5, v6);
}

@end