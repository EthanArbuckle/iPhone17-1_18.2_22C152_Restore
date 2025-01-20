@interface UIView(DOCExtensions)
- (id)doc_nearestAncestorViewController;
- (id)doc_presentingViewController;
- (uint64_t)doc_owningViewController;
@end

@implementation UIView(DOCExtensions)

- (id)doc_nearestAncestorViewController
{
  id v1 = a1;
  if (v1)
  {
    v2 = v1;
    while (1)
    {
      uint64_t v3 = objc_msgSend(v2, "doc_owningViewController");
      if (v3) {
        break;
      }
      v4 = [v2 superview];

      v2 = v4;
      if (!v4) {
        goto LABEL_8;
      }
    }
    v4 = (void *)v3;
  }
  else
  {
    v4 = 0;
  }
LABEL_8:
  return v4;
}

- (uint64_t)doc_owningViewController
{
  return [MEMORY[0x263F1CB68] viewControllerForView:a1];
}

- (id)doc_presentingViewController
{
  id v1 = objc_msgSend(a1, "doc_nearestAncestorViewController");
  v2 = [v1 presentingViewController];

  return v2;
}

@end