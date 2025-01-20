@interface CPLineBreaker
+ (void)breakLinesInPage:(id)a3;
- (void)breakLinesIn:(id)a3;
- (void)breakLinesInParagraph:(id)a3;
@end

@implementation CPLineBreaker

- (void)breakLinesIn:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(CPLineBreaker *)self breakLinesInParagraph:a3];
  }
  else
  {
    int v5 = [a3 count];
    if (v5)
    {
      int v6 = v5;
      uint64_t v7 = 0;
      do
      {
        uint64_t v8 = [a3 childAtIndex:v7];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(CPLineBreaker *)self breakLinesIn:v8];
        }
        uint64_t v7 = (v7 + 1);
      }
      while (v6 != v7);
    }
  }
}

- (void)breakLinesInParagraph:(id)a3
{
  [a3 bounds];
  double v5 = v4;
  double v7 = v6;
  int v8 = [a3 count];
  if (v8)
  {
    int v9 = v8;
    v10 = 0;
    uint64_t v11 = 0;
    double v12 = v5 + v7;
    do
    {
      v13 = v10;
      v10 = (void *)[a3 childAtIndex:v11];
      if (v11)
      {
        v14 = (void *)[v13 charSequence];
        if (v14)
        {
          v15 = v14;
          int v16 = [v14 length];
          if (v16)
          {
            uint64_t v17 = [v15 charAtIndex:(v16 - 1)];
            v18 = *(void **)(*(void *)(v17 + 160) + 64);
            if (v18)
            {
              [v18 spaceWidth];
              double v20 = v19 * *(double *)(*(void *)(v17 + 160) + 72);
            }
            else
            {
              double v20 = 0.0;
            }
            uint64_t v21 = [v10 firstWord];
            if (v21)
            {
              uint64_t v22 = v21;
              [v13 bounds];
              if (*(double *)(v22 + 32) + v20 + v23 + v24 <= v12) {
                [v13 setLineBreakAfter:1];
              }
            }
          }
        }
      }
      uint64_t v11 = (v11 + 1);
    }
    while (v9 != v11);
  }
}

+ (void)breakLinesInPage:(id)a3
{
  double v4 = objc_alloc_init(CPLineBreaker);
  [(CPLineBreaker *)v4 breakLinesIn:a3];
}

@end