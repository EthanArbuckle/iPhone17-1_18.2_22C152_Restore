@interface RTITextOperations(AFUIExtras)
- (void)_assertOrInsertText:()AFUIExtras documentTraits:;
@end

@implementation RTITextOperations(AFUIExtras)

- (void)_assertOrInsertText:()AFUIExtras documentTraits:
{
  id v8 = a3;
  id v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v6 isSingleLineDocument]
    || ![v6 _isExplicitAutoFillInvocation])
  {
    [a1 setTextToAssert:v8];
  }
  else
  {
    v7 = [a1 keyboardOutput];
    [v7 insertText:v8];
  }
}

@end