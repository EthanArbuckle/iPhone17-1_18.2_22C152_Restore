@interface SASConfirmEndpoint
- (BOOL)ad_sendReplyEvenIfCallbacksExist;
@end

@implementation SASConfirmEndpoint

- (BOOL)ad_sendReplyEvenIfCallbacksExist
{
  return 1;
}

@end