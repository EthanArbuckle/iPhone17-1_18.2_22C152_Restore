@interface BMMessagesSharedWithYouFeedback_v3
- (int)feedbackType;
@end

@implementation BMMessagesSharedWithYouFeedback_v3

- (int)feedbackType
{
  v4.receiver = self;
  v4.super_class = (Class)BMMessagesSharedWithYouFeedback_v3;
  unsigned int v2 = [(BMMessagesSharedWithYouFeedback *)&v4 feedbackType];
  if (v2 < 0xB) {
    return v2 + 1;
  }
  else {
    return 0;
  }
}

@end