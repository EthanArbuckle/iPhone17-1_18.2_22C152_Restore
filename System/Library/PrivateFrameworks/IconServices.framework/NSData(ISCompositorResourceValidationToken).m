@interface NSData(ISCompositorResourceValidationToken)
+ (id)_is_invalidToken;
+ (id)_is_staleToken;
+ (id)_is_validToken;
- (id)_is_databaseUUID;
- (id)_is_getSequenceNumber:()ISCompositorResourceValidationToken andUUID:;
- (id)_is_persistentIdentifierDigest;
- (uint64_t)_is_SequenceNumber;
@end

@implementation NSData(ISCompositorResourceValidationToken)

+ (id)_is_validToken
{
  if (_is_validToken_onceToken != -1) {
    dispatch_once(&_is_validToken_onceToken, &__block_literal_global_72);
  }
  v0 = (void *)_is_validToken_validToken;
  return v0;
}

+ (id)_is_staleToken
{
  if (_is_staleToken_onceToken != -1) {
    dispatch_once(&_is_staleToken_onceToken, &__block_literal_global_67);
  }
  v0 = (void *)_is_staleToken_staleToken;
  return v0;
}

+ (id)_is_invalidToken
{
  if (_is_invalidToken_onceToken != -1) {
    dispatch_once(&_is_invalidToken_onceToken, &__block_literal_global_16);
  }
  v0 = (void *)_is_invalidToken_invalidToken;
  return v0;
}

- (id)_is_getSequenceNumber:()ISCompositorResourceValidationToken andUUID:
{
  id result = (id)[a1 length];
  if (result == (id)40)
  {
    uint64_t v8 = [a1 bytes];
    *a3 = *(void *)(v8 + 16);
    id result = (id)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v8];
    *a4 = result;
  }
  return result;
}

- (id)_is_databaseUUID
{
  if ([a1 length] == 40)
  {
    uint64_t v2 = [a1 bytes];
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v2];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (uint64_t)_is_SequenceNumber
{
  if ([a1 length] == 40) {
    return *(void *)([a1 bytes] + 16);
  }
  else {
    return 0;
  }
}

- (id)_is_persistentIdentifierDigest
{
  if ([a1 length] == 40)
  {
    uint64_t v2 = [a1 bytes];
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v2 + 24];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

@end