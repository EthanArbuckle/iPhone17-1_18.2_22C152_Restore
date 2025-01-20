@interface SASyncGetCachedSyncAnchors
- (BOOL)ad_sendReplyEvenIfCallbacksExist;
@end

@implementation SASyncGetCachedSyncAnchors

- (BOOL)ad_sendReplyEvenIfCallbacksExist
{
  return 1;
}

@end