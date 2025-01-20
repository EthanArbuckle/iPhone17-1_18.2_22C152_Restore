@interface IATextInputActionsSessionRedoAction
- (BOOL)changedContent;
- (BOOL)isCapableOfTextInsertion;
@end

@implementation IATextInputActionsSessionRedoAction

- (BOOL)changedContent
{
  return 1;
}

- (BOOL)isCapableOfTextInsertion
{
  return 1;
}

@end