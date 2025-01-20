@interface UIViewController(DOCExtensions)
- (BOOL)doc_hasAppeared;
- (BOOL)doc_hasDisappeared;
- (BOOL)doc_isAppearing;
- (BOOL)doc_isDisappearing;
- (uint64_t)doc_hasAppearedOrIsAppearing;
- (uint64_t)doc_hasDisappearedOrIsDisappearing;
@end

@implementation UIViewController(DOCExtensions)

- (BOOL)doc_isDisappearing
{
  return [a1 _appearState] == 3;
}

- (uint64_t)doc_hasDisappearedOrIsDisappearing
{
  if (objc_msgSend(a1, "doc_hasDisappeared")) {
    return 1;
  }
  return objc_msgSend(a1, "doc_isDisappearing");
}

- (BOOL)doc_hasDisappeared
{
  return [a1 _appearState] == 0;
}

- (uint64_t)doc_hasAppearedOrIsAppearing
{
  if (objc_msgSend(a1, "doc_hasAppeared")) {
    return 1;
  }
  return objc_msgSend(a1, "doc_isAppearing");
}

- (BOOL)doc_isAppearing
{
  return [a1 _appearState] == 1;
}

- (BOOL)doc_hasAppeared
{
  return [a1 _appearState] == 2;
}

@end