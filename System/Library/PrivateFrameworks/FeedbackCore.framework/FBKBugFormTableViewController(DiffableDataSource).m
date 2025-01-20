@interface FBKBugFormTableViewController(DiffableDataSource)
@end

@implementation FBKBugFormTableViewController(DiffableDataSource)

- (void)_updateUI:()DiffableDataSource canDismissKeyboard:overrideWindowCheck:withCompletion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_22A36D000, log, OS_LOG_TYPE_DEBUG, "Snapshot end", v1, 2u);
}

- (void)_updateUI:()DiffableDataSource canDismissKeyboard:overrideWindowCheck:withCompletion:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_22A36D000, log, OS_LOG_TYPE_DEBUG, "Snapshot begin", v1, 2u);
}

- (void)_updateUI:()DiffableDataSource canDismissKeyboard:overrideWindowCheck:withCompletion:.cold.3(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_22A36D000, log, OS_LOG_TYPE_FAULT, "Invalid bug form configuration. Will not display legal text", v1, 2u);
}

@end