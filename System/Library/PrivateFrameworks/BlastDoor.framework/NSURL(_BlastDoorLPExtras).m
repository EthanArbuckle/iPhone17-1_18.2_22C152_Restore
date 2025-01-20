@interface NSURL(_BlastDoorLPExtras)
- (BOOL)_bd_lp_hasAllowedNonHTTPScheme;
- (BOOL)_bd_lp_isHTTPFamilyURL;
@end

@implementation NSURL(_BlastDoorLPExtras)

- (BOOL)_bd_lp_isHTTPFamilyURL
{
  v1 = [a1 scheme];
  if ([v1 compare:@"http" options:3]) {
    BOOL v2 = [v1 compare:@"https" options:3] == 0;
  }
  else {
    BOOL v2 = 1;
  }

  return v2;
}

- (BOOL)_bd_lp_hasAllowedNonHTTPScheme
{
  v1 = [a1 scheme];
  BOOL v2 = v1;
  if (v1) {
    BOOL v3 = ![v1 caseInsensitiveCompare:@"shoebox"]
  }
      || ![v2 caseInsensitiveCompare:@"wallet"]
      || [v2 caseInsensitiveCompare:@"prefs"] == 0;
  else {
    BOOL v3 = 0;
  }

  return v3;
}

@end