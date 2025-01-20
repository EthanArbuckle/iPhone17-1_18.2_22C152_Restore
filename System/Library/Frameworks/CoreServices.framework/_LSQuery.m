@interface _LSQuery
+ (BOOL)supportsSecureCoding;
- (BOOL)_canResolveLocallyWithoutMappingDatabase;
- (BOOL)_remoteResolutionIsExpensive;
- (BOOL)_requiresDatabaseMappingEntitlement;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLegacy;
- (_LSQuery)init;
- (id)_init;
- (id)resolveExpensiveQueryRemotelyUsingResolver:(id)a3 error:(id *)a4;
- (unint64_t)hash;
- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4;
- (void)setLegacy:(BOOL)a3;
@end

@implementation _LSQuery

- (id)_init
{
  if (!_LSCurrentProcessMayMapDatabase() && pluginQueryFault(void)::onceToken != -1) {
    dispatch_once(&pluginQueryFault(void)::onceToken, &__block_literal_global_64);
  }
  v4.receiver = self;
  v4.super_class = (Class)_LSQuery;
  return [(_LSQuery *)&v4 init];
}

- (_LSQuery)init
{
}

- (void)setLegacy:(BOOL)a3
{
  self->_legacy = a3;
  if (a3 && ([(id)__LSDefaultsGetSharedInstance() isServer] & 1) == 0)
  {
    __LAUNCH_SERVICES_IS_GENERATING_A_SANDBOX_EXCEPTION_BECAUSE_THIS_PROCESS_MAY_NOT_MAP_THE_DATABASE__();
    __LAUNCH_SERVICES_IS_ABORTING_BECAUSE_THIS_PROCESS_MAY_NOT_MAP_THE_DATABASE__();
    __LAUNCH_SERVICES_IS_GENERATING_A_SANDBOX_EXCEPTION_BECAUSE_THIS_PROCESS_IS_USING_INSECURE_SPI__();
  }
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4 = (_LSQuery *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v7) = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v6 = [(_LSQuery *)v5 isLegacy];
    int v7 = v6 ^ [(_LSQuery *)self isLegacy] ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(_LSQuery *)self isLegacy];
  v5.receiver = self;
  v5.super_class = (Class)_LSQuery;
  return [(_LSQuery *)&v5 hash] ^ v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isLegacy
{
  return self->_legacy;
}

- (BOOL)_canResolveLocallyWithoutMappingDatabase
{
  return 0;
}

- (BOOL)_remoteResolutionIsExpensive
{
  return 0;
}

- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4
{
  objc_super v5 = (void (**)(id, void, void *))a4;
  objc_super v4 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -4, (uint64_t)"-[_LSQuery(Internal) _enumerateWithXPCConnection:block:]", 122, 0);
  v5[2](v5, 0, v4);
}

- (BOOL)_requiresDatabaseMappingEntitlement
{
  return 0;
}

- (id)resolveExpensiveQueryRemotelyUsingResolver:(id)a3 error:(id *)a4
{
  return 0;
}

@end