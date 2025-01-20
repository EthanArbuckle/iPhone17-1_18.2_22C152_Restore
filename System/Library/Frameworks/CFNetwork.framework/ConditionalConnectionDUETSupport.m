@interface ConditionalConnectionDUETSupport
@end

@implementation ConditionalConnectionDUETSupport

uint64_t ____ConditionalConnectionDUETSupport_StartActivity_block_invoke(uint64_t a1, uint64_t a2)
{
  int v3 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  double Helper_x8__OBJC_CLASS____DASScheduler = gotLoadHelper_x8__OBJC_CLASS____DASScheduler(v4);
  v7 = objc_msgSend(*(id *)(v6 + 2648), "sharedScheduler", Helper_x8__OBJC_CLASS____DASScheduler);
  if (v3)
  {
    return [v7 activityStarted:a2];
  }
  else
  {
    return [v7 activityCompleted:a2];
  }
}

@end