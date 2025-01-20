@interface CKTranscriptChatItemRules
- (BOOL)shouldShowRaiseMessageStatus;
@end

@implementation CKTranscriptChatItemRules

- (BOOL)shouldShowRaiseMessageStatus
{
  return +[CKRaiseGesture isRaiseGestureEnabled];
}

@end