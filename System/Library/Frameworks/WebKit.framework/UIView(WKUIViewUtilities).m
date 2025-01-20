@interface UIView(WKUIViewUtilities)
- (void)_web_setSubviews:()WKUIViewUtilities;
@end

@implementation UIView(WKUIViewUtilities)

- (void)_web_setSubviews:()WKUIViewUtilities
{
  unint64_t v5 = objc_msgSend((id)objc_msgSend(a1, "subviews"), "count");
  unint64_t v6 = [a3 count];
  if (v6)
  {
    for (unint64_t i = 0; i != v6; ++i)
    {
      uint64_t v8 = [a3 objectAtIndex:i];
      if (i >= v5 || objc_msgSend((id)objc_msgSend(a1, "subviews"), "objectAtIndex:", i) != v8) {
        [a1 insertSubview:v8 atIndex:i];
      }
    }
  }
  unint64_t v9 = objc_msgSend((id)objc_msgSend(a1, "subviews"), "count");
  if (v6 < v9)
  {
    id v10 = 0;
    do
    {
      v11 = objc_msgSend((id)objc_msgSend(a1, "subviews"), "objectAtIndex:", v6);
      if ([v11 conformsToProtocol:&unk_1EEA75C48])
      {
        if (!v10) {
          id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        }
        [v10 addObject:v11];
      }
      ++v6;
    }
    while (v9 != v6);
    if (v10)
    {
      [v10 makeObjectsPerformSelector:sel_removeFromSuperview];
      CFRelease(v10);
    }
  }
}

@end