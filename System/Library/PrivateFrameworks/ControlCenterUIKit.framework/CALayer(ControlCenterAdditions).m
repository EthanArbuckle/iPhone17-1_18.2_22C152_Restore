@interface CALayer(ControlCenterAdditions)
- (uint64_t)ccuiEnumerateSubtreeUsingBlock:()ControlCenterAdditions;
- (void)_ccuiEnumerateSubtreeUsingBlock:()ControlCenterAdditions stop:;
@end

@implementation CALayer(ControlCenterAdditions)

- (void)_ccuiEnumerateSubtreeUsingBlock:()ControlCenterAdditions stop:
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = v6;
  if (v6)
  {
    if (a4)
    {
      if (*a4) {
        goto LABEL_15;
      }
      (*((void (**)(id, void *, unsigned char *))v6 + 2))(v6, a1, a4);
      if (*a4) {
        goto LABEL_15;
      }
    }
    else
    {
      (*((void (**)(id, void *, void))v6 + 2))(v6, a1, 0);
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v8 = objc_msgSend(a1, "sublayers", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v13 + 1) + 8 * i) _ccuiEnumerateSubtreeUsingBlock:v7 stop:a4];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
LABEL_15:
}

- (uint64_t)ccuiEnumerateSubtreeUsingBlock:()ControlCenterAdditions
{
  char v4 = 0;
  return [a1 _ccuiEnumerateSubtreeUsingBlock:a3 stop:&v4];
}

@end