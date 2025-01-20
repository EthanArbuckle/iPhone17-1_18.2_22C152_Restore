@interface CKConversationListCollectionViewController(DataSource)
@end

@implementation CKConversationListCollectionViewController(DataSource)

- (void)applyConversationListSnapshot:()DataSource animatingDifferences:completion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18EF18000, log, OS_LOG_TYPE_FAULT, "FATAL: Attempting to apply snapshot even though another snapshot application is already in flight. This is unexpected and would have caused a crash in UIKit. Blocking this snapshot application until the current one completes.", v1, 2u);
}

@end