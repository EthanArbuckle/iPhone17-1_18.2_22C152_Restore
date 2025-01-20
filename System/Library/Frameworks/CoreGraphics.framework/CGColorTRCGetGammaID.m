@interface CGColorTRCGetGammaID
@end

@implementation CGColorTRCGetGammaID

uint64_t (*__CGColorTRCGetGammaID_block_invoke())()
{
  if (CGLibraryLoadColorSyncDYLD_once != -1) {
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_21589);
  }
  result = (uint64_t (*)())CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle) {
    result = (uint64_t (*)())dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "ColorSyncTRCGetGammaID");
  }
  if (result) {
    v1 = result;
  }
  else {
    v1 = colorsync_smart_null_791;
  }
  CGColorTRCGetGammaID_f = v1;
  return result;
}

@end