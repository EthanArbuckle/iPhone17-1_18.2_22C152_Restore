@interface CGHasRequiredColorSyncVersion
@end

@implementation CGHasRequiredColorSyncVersion

uint64_t (*__CGHasRequiredColorSyncVersion_block_invoke_2())()
{
  if (CGLibraryLoadColorSyncDYLD_once != -1) {
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_21589);
  }
  result = (uint64_t (*)())CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle) {
    result = (uint64_t (*)())dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "ColorSyncPrivateAPIVersion");
  }
  if (result) {
    v1 = result;
  }
  else {
    v1 = colorsync_smart_null_17160;
  }
  CGHasRequiredColorSyncVersion_f_21 = v1;
  return result;
}

uint64_t (*__CGHasRequiredColorSyncVersion_block_invoke())()
{
  if (CGLibraryLoadColorSyncDYLD_once != -1) {
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_21589);
  }
  result = (uint64_t (*)())CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle) {
    result = (uint64_t (*)())dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "ColorSyncAPIVersion");
  }
  if (result) {
    v1 = result;
  }
  else {
    v1 = colorsync_smart_null_17160;
  }
  CGHasRequiredColorSyncVersion_f = v1;
  return result;
}

@end