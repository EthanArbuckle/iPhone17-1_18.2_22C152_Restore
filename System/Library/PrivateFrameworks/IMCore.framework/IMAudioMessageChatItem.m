@interface IMAudioMessageChatItem
- (BOOL)isAttachmentContiguousWithChatItem:(id)a3;
- (BOOL)supportsSuggestedActionsMenu;
@end

@implementation IMAudioMessageChatItem

- (BOOL)isAttachmentContiguousWithChatItem:(id)a3
{
  return 0;
}

- (BOOL)supportsSuggestedActionsMenu
{
  return 1;
}

@end