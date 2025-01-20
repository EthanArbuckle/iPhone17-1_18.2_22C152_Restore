@interface CGColorTRCGetFunction
@end

@implementation CGColorTRCGetFunction

uint64_t (*__CGColorTRCGetFunction_block_invoke())()
{
  if (CGLibraryLoadColorSyncDYLD_once != -1) {
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_21589);
  }
  result = (uint64_t (*)())CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle) {
    result = (uint64_t (*)())dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "ColorSyncTRCGetFunction");
  }
  if (result) {
    v1 = result;
  }
  else {
    v1 = colorsync_smart_null_791;
  }
  CGColorTRCGetFunction_f = v1;
  return result;
}

@end