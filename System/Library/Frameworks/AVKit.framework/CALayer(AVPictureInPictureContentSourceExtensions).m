@interface CALayer(AVPictureInPictureContentSourceExtensions)
- (double)avkit_visibleRectForRect:()AVPictureInPictureContentSourceExtensions inLayer:;
- (id)avkit_findFirstCALayerHost;
- (id)avkit_window;
@end

@implementation CALayer(AVPictureInPictureContentSourceExtensions)

- (id)avkit_window
{
  id v1 = a1;
  if (v1)
  {
    v2 = v1;
    do
    {
      v3 = [v2 delegate];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        v5 = [v2 delegate];
        v6 = [v5 window];
      }
      else
      {
        v6 = 0;
      }
      v7 = [v2 superlayer];

      if (v6) {
        break;
      }
      v2 = v7;
    }
    while (v7);
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }

  return v6;
}

- (double)avkit_visibleRectForRect:()AVPictureInPictureContentSourceExtensions inLayer:
{
  id v12 = a7;
  double v13 = *MEMORY[0x1E4F1DB28];
  if (v12)
  {
    if (([a1 isHidden] & 1) == 0)
    {
      v22.origin.x = x;
      v22.origin.y = y;
      v22.size.width = width;
      v22.size.height = height;
      if (!CGRectIsEmpty(v22))
      {
        v14 = [a1 superlayer];

        if (a1 == v12 || !v14)
        {
          double v13 = x;
        }
        else
        {
          if ([a1 masksToBounds])
          {
            [a1 bounds];
            objc_msgSend(v12, "convertRect:fromLayer:", a1);
            v25.origin.x = v15;
            v25.origin.y = v16;
            v25.size.width = v17;
            v25.size.height = v18;
            v23.origin.x = x;
            v23.origin.y = y;
            v23.size.width = width;
            v23.size.height = height;
            CGRect v24 = CGRectIntersection(v23, v25);
            x = v24.origin.x;
            y = v24.origin.y;
            width = v24.size.width;
            height = v24.size.height;
          }
          v19 = [a1 superlayer];
          objc_msgSend(v19, "avkit_visibleRectForRect:inLayer:", v12, x, y, width, height);
          double v13 = v20;
        }
      }
    }
  }

  return v13;
}

- (id)avkit_findFirstCALayerHost
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = a1;
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v3 = objc_msgSend(a1, "sublayers", 0);
    v4 = [v3 reverseObjectEnumerator];

    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "avkit_findFirstCALayerHost");
          if (v9)
          {
            id v2 = (id)v9;
            goto LABEL_13;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    id v2 = 0;
LABEL_13:
  }

  return v2;
}

@end