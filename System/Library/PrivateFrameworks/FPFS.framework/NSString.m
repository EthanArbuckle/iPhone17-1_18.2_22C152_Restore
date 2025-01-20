@interface NSString
@end

@implementation NSString

uint64_t __60__NSString_FSPathAdditions__fpfs_extractFSEventsBarrierUUID__block_invoke()
{
  fpfs_extractFSEventsBarrierUUID_regexp = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"\\.rendez-vous\\.([0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12})\\.nosync" options:1 error:0];

  return MEMORY[0x270F9A758]();
}

uint64_t __59__NSString_FSPathAdditions__fpfs_extractFSEventsNotifyUUID__block_invoke()
{
  fpfs_extractFSEventsNotifyUUID_regexp = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"\\.notify\\.([0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12})\\.nosync" options:1 error:0];

  return MEMORY[0x270F9A758]();
}

@end