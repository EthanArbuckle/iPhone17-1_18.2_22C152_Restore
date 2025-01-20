@interface PDFDocument
- (id)_stitchPageImages:(id)a3;
- (id)asImage;
@end

@implementation PDFDocument

- (id)asImage
{
  if ([(PDFDocument *)self pageCount])
  {
    v3 = +[NSMutableArray array];
    NSUInteger v4 = [(PDFDocument *)self pageCount];
    if (v4)
    {
      NSUInteger v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        v7 = [(PDFDocument *)self pageAtIndex:i];
        v8 = [v7 imageWithBox:1];
        [v3 addObject:v8];
      }
    }
    v9 = [(PDFDocument *)self _stitchPageImages:v3];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_stitchPageImages:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    if ([v3 count] == (id)1)
    {
      NSUInteger v4 = [v3 firstObject];
    }
    else
    {
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v5 = v3;
      id v6 = [v5 countByEnumeratingWithState:&v37 objects:v42 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v38;
        double v9 = 0.0;
        double v10 = 0.0;
        do
        {
          for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v38 != v8) {
              objc_enumerationMutation(v5);
            }
            v12 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            [v12 size];
            double v14 = v13;
            [v12 scale];
            double v16 = v14 * v15;
            [v12 size];
            double v18 = v17;
            [v12 scale];
            double v20 = v18 * v19;
            if (v16 > v10) {
              double v10 = v16;
            }
            double v9 = v9 + v20;
          }
          id v7 = [v5 countByEnumeratingWithState:&v37 objects:v42 count:16];
        }
        while (v7);
      }
      else
      {
        double v9 = 0.0;
        double v10 = 0.0;
      }

      v44.width = v10;
      v44.height = v9;
      UIGraphicsBeginImageContext(v44);
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v21 = v5;
      id v22 = [v21 countByEnumeratingWithState:&v33 objects:v41 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v34;
        double v25 = 0.0;
        do
        {
          for (j = 0; j != v23; j = (char *)j + 1)
          {
            if (*(void *)v34 != v24) {
              objc_enumerationMutation(v21);
            }
            v27 = *(void **)(*((void *)&v33 + 1) + 8 * (void)j);
            [v27 size];
            [v27 scale];
            [v27 size];
            double v29 = v28;
            [v27 scale];
            double v31 = v29 * v30;
            [v27 drawInRect:0.0, v25, v10, v31];
            double v25 = v25 + v31;
          }
          id v23 = [v21 countByEnumeratingWithState:&v33 objects:v41 count:16];
        }
        while (v23);
      }

      NSUInteger v4 = UIGraphicsGetImageFromCurrentImageContext();
      UIGraphicsEndImageContext();
    }
  }
  else
  {
    NSUInteger v4 = 0;
  }

  return v4;
}

@end