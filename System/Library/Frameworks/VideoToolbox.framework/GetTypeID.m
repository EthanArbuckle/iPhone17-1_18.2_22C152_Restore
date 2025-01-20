@interface GetTypeID
@end

@implementation GetTypeID

uint64_t __dssxpc_dscr_GetTypeID_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  dssxpc_dscr_GetTypeID_sTypeID = result;
  return result;
}

@end