@interface SACFAbstractClientCommand
- (BOOL)ad_sendReplyEvenIfCallbacksExist;
@end

@implementation SACFAbstractClientCommand

- (BOOL)ad_sendReplyEvenIfCallbacksExist
{
  return 1;
}

@end