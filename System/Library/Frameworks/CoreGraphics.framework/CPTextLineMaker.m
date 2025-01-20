@interface CPTextLineMaker
- (id)textLines;
- (unsigned)makeTextLines:(id)a3;
- (void)dealloc;
- (void)splitByGraphic:(id)a3 with:(CPPDFContext *)a4;
- (void)zOrderSplitLines:(id)a3;
@end

@implementation CPTextLineMaker

- (unsigned)makeTextLines:(id)a3
{
  v5 = (void *)[a3 charactersInZone];
  unsigned int result = [v5 length];
  if (result)
  {
    unsigned int v7 = result;
    self->textLines = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ([a3 hasRotatedCharacters]) {
      [v5 sortByAnchorYDecreasingXIncreasingApprox];
    }
    else {
      [v5 sortByAnchorYDecreasingXIncreasing];
    }
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v7];
    [v5 splitToSubsequences:v8 whereTrue:compareBaseline passing:0];
    unsigned int v9 = [v8 count];
    if (!v9) {
      __assert_rtn("-[CPTextLineMaker makeTextLines:]", "CPTextLineMaker.m", 213, "count>0");
    }
    v10 = (void *)[v8 objectAtIndex:0];
    [(NSMutableArray *)self->textLines addObject:v10];
    if (v9 != 1)
    {
      uint64_t v11 = v9;
      for (uint64_t i = 1; i != v11; ++i)
      {
        v13 = (void *)[v8 objectAtIndex:i];
        double v14 = 0.0;
        double v15 = 0.0;
        if ([v10 length])
        {
          uint64_t v16 = [v10 charAtIndex:0];
          if (v16) {
            double v15 = *(double *)(v16 + 104);
          }
        }
        if ([v13 length])
        {
          uint64_t v17 = [v13 charAtIndex:0];
          if (v17) {
            double v14 = *(double *)(v17 + 104);
          }
        }
        double v18 = 0.0;
        double v19 = 0.0;
        if ([v10 length])
        {
          uint64_t v20 = [v10 charAtIndex:0];
          if (v20) {
            double v19 = *(double *)(v20 + 168);
          }
        }
        if ([v13 length])
        {
          uint64_t v21 = [v13 charAtIndex:0];
          if (v21) {
            double v18 = *(double *)(v21 + 168);
          }
        }
        double v22 = vabdd_f64(v15, v14);
        double v23 = vabdd_f64(v19, v18);
        double v24 = vabdd_f64(v19 + -360.0, v18);
        if (v23 >= v24) {
          double v23 = v24;
        }
        double v25 = vabdd_f64(v19, v18 + -360.0);
        if (v23 >= v25) {
          double v23 = v25;
        }
        if (v22 >= 1.2 || v23 >= 0.5)
        {
          -[NSMutableArray addObject:](self->textLines, "addObject:", v13, v23);
          v10 = v13;
        }
        else
        {
          [v10 mergeByAnchorXIncreasingYDecreasing:v13];
        }
      }
    }

    v26 = objc_alloc_init(CPTextLineMerge);
    [(CPTextLineMerge *)v26 mergeLinesIn:self->textLines];

    int v27 = [(NSMutableArray *)self->textLines count];
    uint64_t v28 = (v27 - 1);
    if (v27 - 1 >= 0)
    {
      do
      {
        if (!objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->textLines, "objectAtIndex:", v28), "length"))-[NSMutableArray removeObjectAtIndex:](self->textLines, "removeObjectAtIndex:", v28); {
      }
        }
      while (v28-- > 0);
    }
    -[CPTextLineMaker zOrderSplitLines:](self, "zOrderSplitLines:", [a3 page]);
    return [(NSMutableArray *)self->textLines count];
  }
  return result;
}

- (void)zOrderSplitLines:(id)a3
{
  uint64_t v5 = [(NSMutableArray *)self->textLines count];
  if (v5)
  {
    uint64_t v6 = 0;
    do
    {
      unsigned int v7 = (void *)[(NSMutableArray *)self->textLines objectAtIndex:v6];
      uint64_t v10 = 0xFFFFFFFFLL;
      [v7 map:MinMax passing:&v10];
      int v9 = v10;
      int v8 = HIDWORD(v10);
      if ([v7 length] != v8 - v9 + 1) {
        -[CPTextLineMaker splitByGraphic:with:](self, "splitByGraphic:with:", v7, [a3 PDFContext]);
      }
      ++v6;
    }
    while (v5 != v6);
  }
}

- (void)splitByGraphic:(id)a3 with:(CPPDFContext *)a4
{
}

- (id)textLines
{
  return self->textLines;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CPTextLineMaker;
  [(CPTextLineMaker *)&v3 dealloc];
}

@end