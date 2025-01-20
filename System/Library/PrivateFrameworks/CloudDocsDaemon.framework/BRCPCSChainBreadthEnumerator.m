@interface BRCPCSChainBreadthEnumerator
- (BRCPCSChainBreadthEnumerator)initWithPCSChainInfo:(id)a3 clientZone:(id)a4;
- (id)chainInfo;
- (id)nextObject;
- (void)dealloc;
- (void)nextObject;
@end

@implementation BRCPCSChainBreadthEnumerator

- (BRCPCSChainBreadthEnumerator)initWithPCSChainInfo:(id)a3 clientZone:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)BRCPCSChainBreadthEnumerator;
  v9 = [(BRCPCSChainBreadthEnumerator *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_chainInfo, a3);
    v11 = [(BRCPCSChainInfo *)v10->_chainInfo itemID];
    uint64_t v12 = [v8 unchainedItemInfoInServerTruthEnumeratorParentedTo:v11];
    enumerator = v10->_enumerator;
    v10->_enumerator = (PQLEnumeration *)v12;
  }
  return v10;
}

- (id)nextObject
{
  v3 = [(PQLEnumeration *)self->_enumerator nextObject];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 itemID];

    if (!v5)
    {
      v6 = brc_bread_crumbs();
      id v7 = brc_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        -[BRCPCSChainBreadthEnumerator nextObject]();
      }
    }
  }
  else
  {
    enumerator = self->_enumerator;
    self->_enumerator = 0;
  }
  return v4;
}

- (id)chainInfo
{
  return self->_chainInfo;
}

- (void)dealloc
{
  [(PQLEnumeration *)self->_enumerator close];
  v3.receiver = self;
  v3.super_class = (Class)BRCPCSChainBreadthEnumerator;
  [(BRCPCSChainBreadthEnumerator *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enumerator, 0);
  objc_storeStrong((id *)&self->_chainInfo, 0);
}

- (void)nextObject
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: info.itemID%@", v2, v3, v4, v5, v6);
}

@end