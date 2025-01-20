@interface DOMNode(DDCleanupExtensions)
- (void)dd_removeResultLinks;
@end

@implementation DOMNode(DDCleanupExtensions)

- (void)dd_removeResultLinks
{
  if ([a1 nodeType] == 1)
  {
    id v7 = a1;
    v2 = [v7 getElementsByTagName:@"A"];
    v3 = _DDArrayWithList(v2);

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v4 = [v3 arrayByAddingObject:v7];

      v3 = (void *)v4;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      _DDRemoveResultLinksFromArrayOfAnchors(v3, 0);
    }
  }
  else
  {
    id v7 = [a1 childNodes];
    if ([v7 length])
    {
      uint64_t v5 = 0;
      do
      {
        v6 = [v7 item:v5];
        objc_msgSend(v6, "dd_removeResultLinks");

        uint64_t v5 = (v5 + 1);
      }
      while (v5 < [v7 length]);
    }
  }
}

@end