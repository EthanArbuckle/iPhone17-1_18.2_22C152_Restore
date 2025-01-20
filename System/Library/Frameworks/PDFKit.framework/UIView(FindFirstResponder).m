@interface UIView(FindFirstResponder)
- (id)findFirstResponder;
@end

@implementation UIView(FindFirstResponder)

- (id)findFirstResponder
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ([a1 isFirstResponder])
  {
    id v2 = a1;
  }
  else
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v3 = objc_msgSend(a1, "subviews", 0);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = [*(id *)(*((void *)&v10 + 1) + 8 * i) findFirstResponder];
          if (v8)
          {
            id v2 = (id)v8;

            goto LABEL_13;
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }

    id v2 = 0;
  }
LABEL_13:

  return v2;
}

@end