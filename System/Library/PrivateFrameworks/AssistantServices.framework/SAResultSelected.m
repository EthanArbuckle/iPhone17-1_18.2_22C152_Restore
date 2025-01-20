@interface SAResultSelected
- (BOOL)ad_sendReplyEvenIfCallbacksExist;
- (int64_t)resultCallbackCode;
@end

@implementation SAResultSelected

- (int64_t)resultCallbackCode
{
  return 0;
}

- (BOOL)ad_sendReplyEvenIfCallbacksExist
{
  return 1;
}

@end