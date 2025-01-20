@interface UIViewController(HUModalPresentation)
- (id)hu_delegateForModalPresentation;
@end

@implementation UIViewController(HUModalPresentation)

- (id)hu_delegateForModalPresentation
{
  id v1 = a1;
  if (v1)
  {
    v2 = v1;
    v3 = 0;
    do
    {
      if ([v2 conformsToProtocol:&unk_1F19CF158])
      {
        id v4 = v2;

        v3 = v4;
      }
      uint64_t v5 = [v2 parentViewController];

      v2 = (void *)v5;
    }
    while (v5);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end