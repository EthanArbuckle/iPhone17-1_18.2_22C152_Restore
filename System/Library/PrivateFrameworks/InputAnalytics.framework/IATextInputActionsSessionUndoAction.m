@interface IATextInputActionsSessionUndoAction
- (BOOL)changedContent;
- (BOOL)isCapableOfTextInsertion;
@end

@implementation IATextInputActionsSessionUndoAction

- (BOOL)changedContent
{
  return 1;
}

- (BOOL)isCapableOfTextInsertion
{
  return 1;
}

@end