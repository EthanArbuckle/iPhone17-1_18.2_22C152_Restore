@interface CPPreformatter
+ (void)preformatInPage:(id)a3;
- (void)preformatIn:(id)a3;
- (void)preformatInParagraph:(id)a3;
@end

@implementation CPPreformatter

- (void)preformatIn:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(CPPreformatter *)self preformatInParagraph:a3];
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
          [(CPPreformatter *)self preformatIn:v8];
        }
        uint64_t v7 = (v7 + 1);
      }
      while (v6 != v7);
    }
  }
}

- (void)preformatInParagraph:(id)a3
{
  uint64_t v11 = 0;
  if ([a3 isPreformattedWithUnitWidth:&v11])
  {
    objc_msgSend((id)objc_msgSend(a3, "parent"), "bounds");
    uint64_t v5 = v4;
    unsigned int v6 = [a3 count];
    if (v6)
    {
      unsigned int v7 = v6;
      uint64_t v8 = 0;
      do
      {
        v9 = (void *)[a3 childAtIndex:v8];
        v10[0] = v9;
        v10[1] = v11;
        v10[2] = v5;
        [v9 mapToWordsWithIndex:insertSpacesBefore passing:v10];
        uint64_t v8 = (v8 + 1);
        if (v8 < v7) {
          [v9 setLineBreakAfter:1];
        }
      }
      while (v7 != v8);
    }
  }
}

+ (void)preformatInPage:(id)a3
{
  uint64_t v4 = objc_alloc_init(CPPreformatter);
  [(CPPreformatter *)v4 preformatIn:a3];
}

@end