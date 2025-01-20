@interface IATextInputActionsSessionPasteAction
- (BOOL)changedContent;
- (BOOL)isCapableOfTextInsertion;
@end

@implementation IATextInputActionsSessionPasteAction

- (BOOL)changedContent
{
  return 1;
}

- (BOOL)isCapableOfTextInsertion
{
  return 1;
}

@end