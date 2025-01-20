@interface CKSQLiteTableSearchEnumeratorSetupHelper
- (NSArray)fetchedProperties;
- (NSArray)searchProperties;
- (NSNumber)limit;
- (NSNumber)offset;
- (NSPredicate)searchPredicate;
- (void)orderAscendingByProperty:(id)a3;
- (void)orderDescendingByProperty:(id)a3;
- (void)setFetchedProperties:(id)a3;
- (void)setLimit:(id)a3;
- (void)setOffset:(id)a3;
- (void)setSearchPredicate:(id)a3;
- (void)setSearchProperties:(id)a3;
- (void)setupStatement:(id)a3;
@end

@implementation CKSQLiteTableSearchEnumeratorSetupHelper

- (void)orderAscendingByProperty:(id)a3
{
  id v11 = a3;
  orderByProperties = self->_orderByProperties;
  if (!orderByProperties)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v8 = self->_orderByProperties;
    self->_orderByProperties = v7;

    orderByProperties = self->_orderByProperties;
  }
  objc_msgSend_addObject_(orderByProperties, v4, MEMORY[0x1E4F1CC38], v5);
  objc_msgSend_addObject_(self->_orderByProperties, v9, (uint64_t)v11, v10);
}

- (void)orderDescendingByProperty:(id)a3
{
  id v11 = a3;
  orderByProperties = self->_orderByProperties;
  if (!orderByProperties)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v8 = self->_orderByProperties;
    self->_orderByProperties = v7;

    orderByProperties = self->_orderByProperties;
  }
  objc_msgSend_addObject_(orderByProperties, v4, MEMORY[0x1E4F1CC28], v5);
  objc_msgSend_addObject_(self->_orderByProperties, v9, (uint64_t)v11, v10);
}

- (void)setupStatement:(id)a3
{
  id v23 = a3;
  uint64_t v7 = objc_msgSend_count(self->_orderByProperties, v4, v5, v6);
  if (v7 >= 1)
  {
    uint64_t v10 = v7;
    for (uint64_t i = 0; i < v10; i += 2)
    {
      v12 = objc_msgSend_objectAtIndex_(self->_orderByProperties, v8, i, v9);
      uint64_t v16 = objc_msgSend_BOOLValue(v12, v13, v14, v15);

      v19 = objc_msgSend_objectAtIndex_(self->_orderByProperties, v17, i + 1, v18);
      objc_msgSend_orderByProperty_ascending_(v23, v20, (uint64_t)v19, v16);
    }
  }
  objc_msgSend_setLimit_(v23, v8, (uint64_t)self->_limit, v9);
  objc_msgSend_setOffset_(v23, v21, (uint64_t)self->_offset, v22);
}

- (NSArray)fetchedProperties
{
  return self->_fetchedProperties;
}

- (void)setFetchedProperties:(id)a3
{
}

- (NSArray)searchProperties
{
  return self->_searchProperties;
}

- (void)setSearchProperties:(id)a3
{
}

- (NSPredicate)searchPredicate
{
  return self->_searchPredicate;
}

- (void)setSearchPredicate:(id)a3
{
}

- (NSNumber)limit
{
  return self->_limit;
}

- (void)setLimit:(id)a3
{
}

- (NSNumber)offset
{
  return self->_offset;
}

- (void)setOffset:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offset, 0);
  objc_storeStrong((id *)&self->_limit, 0);
  objc_storeStrong((id *)&self->_searchPredicate, 0);
  objc_storeStrong((id *)&self->_searchProperties, 0);
  objc_storeStrong((id *)&self->_fetchedProperties, 0);

  objc_storeStrong((id *)&self->_orderByProperties, 0);
}

@end