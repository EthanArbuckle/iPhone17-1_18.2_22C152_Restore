@interface CKDPCSCacheFetchOperationInfo
- (CKDPCSCache)cache;
- (CKSQLiteItem)itemID;
- (unint64_t)options;
- (void)setCache:(id)a3;
- (void)setItemID:(id)a3;
- (void)setOptions:(unint64_t)a3;
@end

@implementation CKDPCSCacheFetchOperationInfo

- (CKSQLiteItem)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
}

- (CKDPCSCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
}

@end