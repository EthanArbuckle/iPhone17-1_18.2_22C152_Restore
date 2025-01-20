@interface MUPassthroughView
- (BOOL)_isTransparentFocusRegion;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation MUPassthroughView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v8 = [(MUPassthroughView *)self subviews];
  v9 = [v8 reverseObjectEnumerator];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ([v14 isUserInteractionEnabled])
        {
          if (([v14 isHidden] & 1) == 0)
          {
            [v14 alpha];
            if (v15 >= 0.01)
            {
              objc_msgSend(v14, "convertPoint:fromView:", self, x, y);
              double v17 = v16;
              double v19 = v18;
              if (objc_msgSend(v14, "pointInside:withEvent:", v7))
              {
                uint64_t v20 = objc_msgSend(v14, "hitTest:withEvent:", v7, v17, v19);
                if (v20)
                {
                  v21 = (void *)v20;
                  goto LABEL_15;
                }
              }
            }
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  v21 = 0;
LABEL_15:

  return v21;
}

- (BOOL)_isTransparentFocusRegion
{
  return 1;
}

@end