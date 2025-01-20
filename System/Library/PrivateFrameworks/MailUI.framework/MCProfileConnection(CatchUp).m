@interface MCProfileConnection(CatchUp)
- (uint64_t)mf_isMailSummaryAllowed;
@end

@implementation MCProfileConnection(CatchUp)

- (uint64_t)mf_isMailSummaryAllowed
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }
  return [a1 isMailSummaryAllowed];
}

@end