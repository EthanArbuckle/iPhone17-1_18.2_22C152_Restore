@interface NSFileProviderMovingResponse
+ (BOOL)supportsSecureCoding;
+ (id)providingNotRequiredResponseWithSyncRootID:(unint64_t)a3;
+ (id)providingRequiredResponse;
- (BOOL)requiresAccessorBlockMaterializationPolicy;
- (BOOL)requiresProviding;
- (NSFileProviderMovingResponse)initWithCoder:(id)a3;
- (NSNumber)syncRootID;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setRequiresAccessorBlockMaterializationPolicy:(BOOL)a3;
@end

@implementation NSFileProviderMovingResponse

+ (id)providingRequiredResponse
{
  v2 = (_WORD *)objc_opt_new();
  v2[4] = 257;

  return v2;
}

+ (id)providingNotRequiredResponseWithSyncRootID:(unint64_t)a3
{
  uint64_t v4 = objc_opt_new();
  *(_WORD *)(v4 + 8) = 0;
  *(void *)(v4 + 16) = a3;

  return (id)v4;
}

- (NSNumber)syncRootID
{
  if (self->_syncRootID) {
    return +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
  }
  else {
    return 0;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"NSFileProviderMovingResponse instances should only ever be encoded by XPC" userInfo:0]);
  }
  [a3 encodeBool:self->_requiresProviding forKey:@"requiresProviding"];
  [a3 encodeBool:self->_requiresAccessorBlockMaterializationPolicy forKey:@"requiresMaterialization"];
  v5 = [(NSFileProviderMovingResponse *)self syncRootID];

  [a3 encodeObject:v5 forKey:@"syncRootID"];
}

- (NSFileProviderMovingResponse)initWithCoder:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"NSFileProviderMovingResponse should only ever be decoded by XPC" userInfo:0]);
  }
  self->_requiresProviding = [a3 decodeBoolForKey:@"requiresProviding"];
  self->_requiresAccessorBlockMaterializationPolicy = [a3 decodeBoolForKey:@"requiresMaterialization"];
  self->_syncRootID = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"syncRootID"), "unsignedLongLongValue");
  return self;
}

- (id)description
{
  return +[NSString stringWithFormat:@"Requires providing: %@, syncRootID: %llu", NSStringFromBOOL(self->_requiresProviding), self->_syncRootID];
}

- (BOOL)requiresProviding
{
  return self->_requiresProviding;
}

- (BOOL)requiresAccessorBlockMaterializationPolicy
{
  return self->_requiresAccessorBlockMaterializationPolicy;
}

- (void)setRequiresAccessorBlockMaterializationPolicy:(BOOL)a3
{
  self->_requiresAccessorBlockMaterializationPolicy = a3;
}

@end