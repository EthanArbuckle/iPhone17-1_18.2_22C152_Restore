@interface NSObject(CCUIGroupRenderingSupport)
- (id)_ccui_punchOutRenderingViews;
- (uint64_t)ccui_configureForGroupRenderingMode:()CCUIGroupRenderingSupport;
@end

@implementation NSObject(CCUIGroupRenderingSupport)

- (id)_ccui_punchOutRenderingViews
{
  if (objc_opt_respondsToSelector())
  {
    v2 = [a1 punchOutRenderingViews];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (uint64_t)ccui_configureForGroupRenderingMode:()CCUIGroupRenderingSupport
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a3 <= 1 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v5 = objc_msgSend(a1, "_ccui_punchOutRenderingViews", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      int v8 = 0;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v5);
          }
          v8 |= objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "ccui_configureForPunchOutRendering:", a3 == 1);
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8 & 1;
}

@end