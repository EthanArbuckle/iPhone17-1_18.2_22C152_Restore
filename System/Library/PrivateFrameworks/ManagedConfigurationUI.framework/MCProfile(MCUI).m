@interface MCProfile(MCUI)
- (uint64_t)isHRNProfile;
- (uint64_t)shouldHideUnstrustedLabel;
- (uint64_t)shouldUseTrustedNomenclature;
@end

@implementation MCProfile(MCUI)

- (uint64_t)isHRNProfile
{
  v1 = [a1 payloadsWithClass:objc_opt_class()];
  v2 = [v1 firstObject];

  uint64_t v3 = [v2 pollingIntervalMinutes];
  v4 = (void *)v3;
  if (v2) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    uint64_t v7 = 0;
  }
  else
  {
    v6 = [NSNumber numberWithInt:0];
    uint64_t v7 = [v4 isEqualToNumber:v6] ^ 1;
  }
  return v7;
}

- (uint64_t)shouldHideUnstrustedLabel
{
  return 0;
}

- (uint64_t)shouldUseTrustedNomenclature
{
  return 0;
}

@end