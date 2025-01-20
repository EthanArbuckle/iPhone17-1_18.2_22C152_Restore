@interface NSProcessInfo(IntentsFoundation)
- (uint64_t)if_auditToken;
@end

@implementation NSProcessInfo(IntentsFoundation)

- (uint64_t)if_auditToken
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  mach_msg_type_number_t task_info_outCnt = 8;
  return task_info(*MEMORY[0x1E4F14960], 0xFu, (task_info_t)a1, &task_info_outCnt);
}

@end