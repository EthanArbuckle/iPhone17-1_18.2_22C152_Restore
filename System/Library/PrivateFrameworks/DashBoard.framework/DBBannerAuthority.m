@interface DBBannerAuthority
- (int64_t)shouldOverlapPresentable:(id)a3 withPresentable:(id)a4;
- (int64_t)shouldPresentPresentable:(id)a3 withPresentedPresentables:(id)a4 responsiblePresentable:(id *)a5;
@end

@implementation DBBannerAuthority

- (int64_t)shouldPresentPresentable:(id)a3 withPresentedPresentables:(id)a4 responsiblePresentable:(id *)a5
{
  if (objc_msgSend(a4, "count", a3)) {
    return -1;
  }
  else {
    return 1;
  }
}

- (int64_t)shouldOverlapPresentable:(id)a3 withPresentable:(id)a4
{
  return -1;
}

@end