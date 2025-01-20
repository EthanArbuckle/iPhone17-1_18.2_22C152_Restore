@interface CMSMAP
@end

@implementation CMSMAP

NSObject *__CMSMAP_StartDisconnectAirPlayScreenTimer_block_invoke(uint64_t a1)
{
  double v1 = *(float *)(a1 + 32);
  v2 = MXGetSerialQueue();
  result = FigRoutingManagerCreateOneShotTimer(v2, v1, (uint64_t)&__block_literal_global_26, 0, 0);
  qword_1E9359C50 = (uint64_t)result;
  return result;
}

void __CMSMAP_StopDisconnectAirPlayScreenTimer_block_invoke()
{
  if (qword_1E9359C50)
  {
    dispatch_source_cancel((dispatch_source_t)qword_1E9359C50);
    if (qword_1E9359C50)
    {
      dispatch_release((dispatch_object_t)qword_1E9359C50);
      qword_1E9359C50 = 0;
    }
  }
}

NSObject *__CMSMAP_StartRouteAwayFromAirPlayHandoffTimer_block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __CMSMAP_StartRouteAwayFromAirPlayHandoffTimer_block_invoke_2;
  v4[3] = &__block_descriptor_40_e5_v8__0l;
  v4[4] = *(void *)(a1 + 32);
  double v1 = *(float *)(a1 + 40);
  v2 = MXGetSerialQueue();
  result = FigRoutingManagerCreateOneShotTimer(v2, v1, (uint64_t)v4, 0, 0);
  qword_1E9359C58 = (uint64_t)result;
  return result;
}

uint64_t __CMSMAP_StartRouteAwayFromAirPlayHandoffTimer_block_invoke_2(uint64_t a1)
{
  return CMSMAP_MakeAirPlayHandOffPortRoutable(0, *(void *)(a1 + 32));
}

void __CMSMAP_StopRouteAwayFromAirPlayHandoffTimer_block_invoke()
{
  if (qword_1E9359C58)
  {
    dispatch_source_cancel((dispatch_source_t)qword_1E9359C58);
    if (qword_1E9359C58)
    {
      dispatch_release((dispatch_object_t)qword_1E9359C58);
      qword_1E9359C58 = 0;
    }
  }
}

@end