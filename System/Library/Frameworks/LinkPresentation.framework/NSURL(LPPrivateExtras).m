@interface NSURL(LPPrivateExtras)
- (uint64_t)_lp_hasAllowedNonHTTPScheme;
@end

@implementation NSURL(LPPrivateExtras)

- (uint64_t)_lp_hasAllowedNonHTTPScheme
{
  v2 = [a1 scheme];
  if (objc_msgSend(v2, "_lp_isEqualIgnoringCase:", @"prefs")) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = objc_msgSend(a1, "_lp_hasWalletRelatedScheme");
  }

  return v3;
}

@end