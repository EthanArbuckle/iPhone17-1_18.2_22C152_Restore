@interface PQ
@end

@implementation PQ

uint64_t *__color_space_state_create_p3_PQ_block_invoke_2()
{
  if (CGLibraryLoadColorSyncDYLD_once != -1) {
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_21589);
  }
  result = (uint64_t *)CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle
    && (result = (uint64_t *)dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "kColorSyncDisplayP3_PQProfile")) != 0)
  {
    uint64_t v1 = *result;
  }
  else
  {
    uint64_t v1 = 0;
  }
  color_space_state_create_p3_PQ_s = v1;
  return result;
}

uint64_t *__color_space_state_create_itur_2100_PQ_block_invoke_2()
{
  if (CGLibraryLoadColorSyncDYLD_once != -1) {
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_21589);
  }
  result = (uint64_t *)CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle
    && (result = (uint64_t *)dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "kColorSyncITUR2100_PQProfile")) != 0)
  {
    uint64_t v1 = *result;
  }
  else
  {
    uint64_t v1 = 0;
  }
  color_space_state_create_itur_2100_PQ_s = v1;
  return result;
}

uint64_t (*__color_space_state_create_p3_PQ_block_invoke())()
{
  if (CGLibraryLoadColorSyncDYLD_once != -1) {
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_21589);
  }
  result = (uint64_t (*)())CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle) {
    result = (uint64_t (*)())dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "ColorSyncProfileCreateWithName");
  }
  if (result) {
    uint64_t v1 = result;
  }
  else {
    uint64_t v1 = colorsync_smart_null_1748;
  }
  color_space_state_create_p3_PQ_f = v1;
  return result;
}

uint64_t (*__color_space_state_create_itur_2100_PQ_block_invoke())()
{
  if (CGLibraryLoadColorSyncDYLD_once != -1) {
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_21589);
  }
  result = (uint64_t (*)())CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle) {
    result = (uint64_t (*)())dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "ColorSyncProfileCreateWithName");
  }
  if (result) {
    uint64_t v1 = result;
  }
  else {
    uint64_t v1 = colorsync_smart_null_1748;
  }
  color_space_state_create_itur_2100_PQ_f = v1;
  return result;
}

@end