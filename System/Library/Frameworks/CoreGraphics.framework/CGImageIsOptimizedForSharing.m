@interface CGImageIsOptimizedForSharing
@end

@implementation CGImageIsOptimizedForSharing

uint64_t (*__CGImageIsOptimizedForSharing_block_invoke_3())()
{
  if (CGLibraryLoadColorSyncDYLD_once != -1) {
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_21589);
  }
  result = (uint64_t (*)())CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle) {
    result = (uint64_t (*)())dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "ColorSyncProfileContainsTag");
  }
  if (result) {
    v1 = result;
  }
  else {
    v1 = colorsync_smart_null_5103;
  }
  CGImageIsOptimizedForSharing_f_53 = (uint64_t (*)(void, void))v1;
  return result;
}

uint64_t (*__CGImageIsOptimizedForSharing_block_invoke_2())()
{
  if (CGLibraryLoadColorSyncDYLD_once != -1) {
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_21589);
  }
  result = (uint64_t (*)())CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle) {
    result = (uint64_t (*)())dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "ColorSyncProfileCreate");
  }
  if (result) {
    v1 = result;
  }
  else {
    v1 = colorsync_smart_null_5103;
  }
  CGImageIsOptimizedForSharing_f = (uint64_t (*)(void, void))v1;
  return result;
}

@end