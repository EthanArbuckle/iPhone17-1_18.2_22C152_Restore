@interface GEOGetSharedTileDB
@end

@implementation GEOGetSharedTileDB

void ___GEOGetSharedTileDB_block_invoke()
{
  v0 = +[GEOTileLoader modernLoader];
  v1 = [v0 proxy];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = [v1 tileCache];
    v3 = (void *)_MergedGlobals_213;
    _MergedGlobals_213 = v2;
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: [tileServerProxy isKindOfClass:GEOTileServerLocalProxy.class]", v4, 2u);
  }
}

@end