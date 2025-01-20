@interface CKDRemoveAnonymousShareFromSharedDBOperationInfo
- (NSDictionary)encryptedAnonymousSharesToRemove;
- (id)anonymousShareRemovedBlock;
- (void)setAnonymousShareRemovedBlock:(id)a3;
- (void)setEncryptedAnonymousSharesToRemove:(id)a3;
@end

@implementation CKDRemoveAnonymousShareFromSharedDBOperationInfo

- (NSDictionary)encryptedAnonymousSharesToRemove
{
  return self->_encryptedAnonymousSharesToRemove;
}

- (void)setEncryptedAnonymousSharesToRemove:(id)a3
{
}

- (id)anonymousShareRemovedBlock
{
  return self->_anonymousShareRemovedBlock;
}

- (void)setAnonymousShareRemovedBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_anonymousShareRemovedBlock, 0);
  objc_storeStrong((id *)&self->_encryptedAnonymousSharesToRemove, 0);
}

@end