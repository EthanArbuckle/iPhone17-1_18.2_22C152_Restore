@interface IAMLogCategoryDefault
@end

@implementation IAMLogCategoryDefault

uint64_t __IAMLogCategoryDefault_Oversize_block_invoke()
{
  IAMLogCategoryDefault_Oversize__log = (uint64_t)os_log_create("com.apple.amp.inappmessages", "Default_Oversize");
  return MEMORY[0x270F9A758]();
}

@end