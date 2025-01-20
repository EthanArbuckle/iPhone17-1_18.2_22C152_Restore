@interface LSCurrentProcessMayMapDatabase
@end

@implementation LSCurrentProcessMayMapDatabase

uint64_t ___LSCurrentProcessMayMapDatabase_block_invoke()
{
  if ([(id)__LSDefaultsGetSharedInstance() isServer])
  {
    uint64_t result = 1;
  }
  else
  {
    if (_LSGetAuditTokenForSelf::once != -1) {
      dispatch_once(&_LSGetAuditTokenForSelf::once, &__block_literal_global_183);
    }
    uint64_t result = _LSAuditTokenMayMapDatabase(_LSGetAuditTokenForSelf::result);
  }
  atomic_store(result, mayMapDatabase);
  return result;
}

@end