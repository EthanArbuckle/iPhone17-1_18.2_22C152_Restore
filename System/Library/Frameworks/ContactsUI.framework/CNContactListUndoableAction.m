@interface CNContactListUndoableAction
- (BOOL)shouldReloadListOnCompletion;
@end

@implementation CNContactListUndoableAction

- (BOOL)shouldReloadListOnCompletion
{
  return 0;
}

@end