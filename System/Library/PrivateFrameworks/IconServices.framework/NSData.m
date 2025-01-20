@interface NSData
@end

@implementation NSData

void __61__NSData_ISCompositorResourceValidationToken___is_staleToken__block_invoke()
{
  v0 = objc_msgSend(MEMORY[0x1E4F29128], "_IF_nullUUID", 0, 0, 0, 0, 0, *MEMORY[0x1E4F143B8]);
  [v0 getUUIDBytes:&v4];

  uint64_t v5 = -1;
  v1 = objc_msgSend(MEMORY[0x1E4F29128], "_IF_UUIDWithString:", @"stale_token");
  [v1 getUUIDBytes:&v6];

  uint64_t v2 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v4 length:40];
  v3 = (void *)_is_staleToken_staleToken;
  _is_staleToken_staleToken = v2;
}

void __63__NSData_ISCompositorResourceValidationToken___is_invalidToken__block_invoke()
{
  v0 = objc_msgSend(MEMORY[0x1E4F29128], "_IF_nullUUID", 0, 0, 0, 0, 0, *MEMORY[0x1E4F143B8]);
  [v0 getUUIDBytes:&v4];

  uint64_t v5 = -1;
  v1 = objc_msgSend(MEMORY[0x1E4F29128], "_IF_UUIDWithString:", @"invalid_token");
  [v1 getUUIDBytes:&v6];

  uint64_t v2 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v4 length:40];
  v3 = (void *)_is_invalidToken_invalidToken;
  _is_invalidToken_invalidToken = v2;
}

void __61__NSData_ISCompositorResourceValidationToken___is_validToken__block_invoke()
{
  v0 = objc_msgSend(MEMORY[0x1E4F29128], "_IF_nullUUID", 0, 0, 0, 0, 0, *MEMORY[0x1E4F143B8]);
  [v0 getUUIDBytes:&v4];

  uint64_t v5 = -1;
  v1 = objc_msgSend(MEMORY[0x1E4F29128], "_IF_UUIDWithString:", @"valid_token");
  [v1 getUUIDBytes:&v6];

  uint64_t v2 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v4 length:40];
  v3 = (void *)_is_validToken_validToken;
  _is_validToken_validToken = v2;
}

void __62__NSData_ISStoreIndex_BlobTable___ISStoreIndex_blobDataForID___block_invoke(uint64_t a1)
{
}

@end