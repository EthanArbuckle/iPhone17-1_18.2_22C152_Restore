@interface CKDAddAnonymousShareToSharedDBOperationInfo
- (NSDictionary)encryptedAnonymousSharesToAdd;
- (id)anonymousShareSavedBlock;
- (void)setAnonymousShareSavedBlock:(id)a3;
- (void)setEncryptedAnonymousSharesToAdd:(id)a3;
@end

@implementation CKDAddAnonymousShareToSharedDBOperationInfo

- (NSDictionary)encryptedAnonymousSharesToAdd
{
  return self->_encryptedAnonymousSharesToAdd;
}

- (void)setEncryptedAnonymousSharesToAdd:(id)a3
{
}

- (id)anonymousShareSavedBlock
{
  return self->_anonymousShareSavedBlock;
}

- (void)setAnonymousShareSavedBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_anonymousShareSavedBlock, 0);
  objc_storeStrong((id *)&self->_encryptedAnonymousSharesToAdd, 0);
}

@end