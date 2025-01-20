@interface DOMNode(DDExtensions)
- (uint64_t)dd_searchForLinkRemovingExistingDDLinksWithEndNode:()DDExtensions didModifyDOM:;
@end

@implementation DOMNode(DDExtensions)

- (uint64_t)dd_searchForLinkRemovingExistingDDLinksWithEndNode:()DDExtensions didModifyDOM:
{
  id v6 = a3;
  id v7 = a1;
  v8 = v7;
  if (a4) {
    *a4 = 0;
  }
  if (!v7)
  {
LABEL_28:
    uint64_t v18 = 0;
    goto LABEL_31;
  }
  id v9 = v7;
  while (1)
  {
    if (_isLinkNode(v9))
    {
      if (!_isDataDetectorLinkNode(v9))
      {
LABEL_29:
        uint64_t v18 = 1;
        goto LABEL_30;
      }
      _removeDataDetectorLinkInNode(v9);
      if (a4) {
        *a4 = 1;
      }
    }
    if (v9 == v6)
    {
      id v9 = [v8 parentNode];

      if (!v9) {
        goto LABEL_28;
      }
      do
      {
        if (_isLinkNode(v9))
        {
          if (!_isDataDetectorLinkNode(v9)) {
            goto LABEL_29;
          }
          _removeDataDetectorLinkInNode(v9);
          if (a4) {
            *a4 = 1;
          }
        }
        uint64_t v19 = [v9 parentNode];

        id v9 = (id)v19;
      }
      while (v19);
LABEL_27:
      uint64_t v18 = 0;
      goto LABEL_30;
    }
    v10 = [v9 childNodes];
    if (![v10 length]) {
      break;
    }
    uint64_t v11 = [v10 item:0];
LABEL_18:

    id v9 = (id)v11;
    if (!v11) {
      goto LABEL_27;
    }
  }
  v12 = [v9 nextSibling];
  id v13 = v9;
  v14 = v13;
  v15 = v13;
  if (v12)
  {
LABEL_17:
    id v9 = v12;

    uint64_t v11 = (uint64_t)v9;
    goto LABEL_18;
  }
  v15 = v13;
  while (1)
  {
    v16 = v15;
    v15 = [v15 parentNode];

    if (!v15) {
      break;
    }
    uint64_t v17 = [v15 nextSibling];
    if (v17)
    {
      v12 = (void *)v17;
      goto LABEL_17;
    }
  }

  uint64_t v18 = 0;
  id v9 = v14;
LABEL_30:

LABEL_31:
  return v18;
}

@end