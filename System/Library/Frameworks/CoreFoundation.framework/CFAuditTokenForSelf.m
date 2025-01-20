@interface CFAuditTokenForSelf
@end

@implementation CFAuditTokenForSelf

uint64_t ___CFAuditTokenForSelf_block_invoke()
{
  uint64_t v2 = *(void *)off_1ECE0A5B0;
  mach_msg_type_number_t task_info_outCnt = 8;
  return task_info(*(_DWORD *)off_1ECE0A6C8, 0xFu, (task_info_t)&_CFAuditTokenForSelf_auditToken, &task_info_outCnt);
}

@end