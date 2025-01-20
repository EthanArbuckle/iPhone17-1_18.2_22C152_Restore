@interface RTIDocumentTraits(AFUIExtras)
- (uint64_t)_afui_isSingleLineDocument;
- (uint64_t)_isExplicitAutoFillInvocation;
@end

@implementation RTIDocumentTraits(AFUIExtras)

- (uint64_t)_isExplicitAutoFillInvocation
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  uint64_t result = [a1 isExplicitAutoFillMode];
  if (result)
  {
    unint64_t v3 = [a1 autofillMode];
    if (v3 <= 9) {
      return (0x282u >> v3) & 1;
    }
    else {
      return 0;
    }
  }
  return result;
}

- (uint64_t)_afui_isSingleLineDocument
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }

  return [a1 isSingleLineDocument];
}

@end