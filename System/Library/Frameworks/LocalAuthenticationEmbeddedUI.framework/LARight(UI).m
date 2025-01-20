@interface LARight(UI)
- (void)authorizeWithLocalizedReason:()UI inPresentationContext:completion:;
@end

@implementation LARight(UI)

- (void)authorizeWithLocalizedReason:()UI inPresentationContext:completion:
{
  id v11 = a4;
  id v8 = a5;
  id v9 = a3;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v10 = -[LARight _authOptionsWithLocalizedReason:presentationContext:](a1, v9, v11);

    [a1 authorizeWithOptions:v10 completion:v8];
    id v9 = (id)v10;
  }
  else
  {
    [a1 authorizeWithLocalizedReason:v9 completion:v8];
  }
}

@end