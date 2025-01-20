@interface CKSQLiteObjecArchiveRefcountTableEntry
- (NSNumber)objectID;
- (NSNumber)refCount;
- (void)setObjectID:(id)a3;
- (void)setRefCount:(id)a3;
@end

@implementation CKSQLiteObjecArchiveRefcountTableEntry

- (NSNumber)objectID
{
  return self->_objectID;
}

- (void)setObjectID:(id)a3
{
}

- (NSNumber)refCount
{
  return self->_refCount;
}

- (void)setRefCount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refCount, 0);

  objc_storeStrong((id *)&self->_objectID, 0);
}

@end