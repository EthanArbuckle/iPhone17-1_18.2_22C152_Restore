@interface CKDetonatedChatItem
- (BOOL)canAttachStickers;
- (BOOL)canCopy;
- (BOOL)canExport;
- (BOOL)canForward;
- (BOOL)canPerformQuickAction;
- (BOOL)canSendAsTextMessage;
- (BOOL)isSensitive;
- (Class)balloonViewClass;
- (id)dragItemProvider;
- (id)momentShareURL;
- (id)rtfDocumentItemsWithFormatString:(id)a3 selectedTextRange:(_NSRange)a4;
- (unint64_t)balloonCorners;
@end

@implementation CKDetonatedChatItem

- (Class)balloonViewClass
{
  return (Class)objc_opt_class();
}

- (BOOL)canCopy
{
  return 0;
}

- (BOOL)isSensitive
{
  return 0;
}

- (BOOL)canForward
{
  return 0;
}

- (BOOL)canExport
{
  return 0;
}

- (BOOL)canPerformQuickAction
{
  return 0;
}

- (unint64_t)balloonCorners
{
  unsigned int v2 = [(CKChatItem *)self attachmentContiguousType];

  return CKBalloonCornersForAttachmentContiguousType(v2);
}

- (id)rtfDocumentItemsWithFormatString:(id)a3 selectedTextRange:(_NSRange)a4
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)dragItemProvider
{
  return 0;
}

- (id)momentShareURL
{
  return 0;
}

- (BOOL)canAttachStickers
{
  return 0;
}

- (BOOL)canSendAsTextMessage
{
  return 0;
}

@end