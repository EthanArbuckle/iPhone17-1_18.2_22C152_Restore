@interface DKQueryLoggingEnabled
@end

@implementation DKQueryLoggingEnabled

void ___DKQueryLoggingEnabled_block_invoke()
{
  id v0 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.CoreDuet"];
  _DKQueryLoggingEnabled_disableQueryLogging = [v0 BOOLForKey:@"KnowledgeStoreQueryLoggingDisabled"];
}

@end