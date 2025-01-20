@interface SASRequestOptions(AFUIUtilities)
- (uint64_t)afui_isTVFollowUpHearstActivation;
@end

@implementation SASRequestOptions(AFUIUtilities)

- (uint64_t)afui_isTVFollowUpHearstActivation
{
  if ([a1 requestSource] != 9) {
    return 0;
  }
  v2 = [a1 originalRequestOptions];
  v3 = [v2 requestInfo];
  uint64_t v4 = objc_msgSend(v3, "afui_isRemoteHeadsetActivation");

  return v4;
}

@end