@interface CBHistogramBuilder2D
- (CBHistogramBuilder2D)initWithFirstDim:(id)a3 andSecondDim:(id)a4;
- (void)dealloc;
- (void)enumerateBinsUsingBlock:(id)a3;
- (void)pushNumberWeighted:(double)a3 withWeight:(double)a4 forFirstDimValue:(float)a5;
- (void)reset;
@end

@implementation CBHistogramBuilder2D

- (CBHistogramBuilder2D)initWithFirstDim:(id)a3 andSecondDim:(id)a4
{
  v15 = self;
  SEL v14 = a2;
  id v13 = a3;
  id v12 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CBHistogramBuilder2D;
  v15 = [(CBHistogramBuilder2D *)&v11 init];
  if (!v15) {
    return v15;
  }
  if (v13 && v12)
  {
    v4 = (NSArray *)v13;
    v15->_firstDimEdges = v4;
    id v9 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v5 = objc_msgSend(v9, "initWithCapacity:", -[NSArray count](v15->_firstDimEdges, "count") + 1);
    v15->_histograms = (NSMutableArray *)v5;
    for (int i = 0; i < [(NSArray *)v15->_firstDimEdges count] + 1; ++i)
    {
      histograms = v15->_histograms;
      v6 = [CBHistogramBuilder alloc];
      [(NSMutableArray *)histograms insertObject:[(CBHistogramBuilder *)v6 initWithEdges:v12] atIndex:i];
    }
    return v15;
  }
  return 0;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;

  v2.receiver = v4;
  v2.super_class = (Class)CBHistogramBuilder2D;
  [(CBHistogramBuilder2D *)&v2 dealloc];
}

- (void)pushNumberWeighted:(double)a3 withWeight:(double)a4 forFirstDimValue:(float)a5
{
  for (int i = 0; i < (unint64_t)[(NSMutableArray *)self->_histograms count]; ++i)
  {
    if (i + 1 != [(NSMutableArray *)self->_histograms count])
    {
      objc_msgSend(-[NSArray objectAtIndex:](self->_firstDimEdges, "objectAtIndex:", i), "doubleValue");
      if (a5 >= v5) {
        continue;
      }
    }
    objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_histograms, "objectAtIndex:", i), "pushNumberWeighted:withWeight:", a3, a4);
    return;
  }
}

- (void)enumerateBinsUsingBlock:(id)a3
{
  v16 = self;
  SEL v15 = a2;
  id v14 = a3;
  context = (void *)MEMORY[0x1BA9ECAE0]();
  uint64_t v13 = 0;
  uint64_t v13 = [(NSMutableArray *)v16->_histograms count];
  histograms = v16->_histograms;
  uint64_t v5 = MEMORY[0x1E4F143A8];
  int v6 = -1073741824;
  int v7 = 0;
  v8 = __48__CBHistogramBuilder2D_enumerateBinsUsingBlock___block_invoke;
  id v9 = &unk_1E6218F78;
  v10 = v16;
  uint64_t v12 = v13;
  id v11 = v14;
  -[NSMutableArray enumerateObjectsUsingBlock:](histograms, "enumerateObjectsUsingBlock:");
}

uint64_t __48__CBHistogramBuilder2D_enumerateBinsUsingBlock___block_invoke(void *a1, void *a2, unint64_t a3, uint64_t a4)
{
  v19 = a1;
  id v18 = a2;
  unint64_t v17 = a3;
  uint64_t v16 = a4;
  SEL v15 = a1;
  uint64_t v14 = 0;
  if (a3)
  {
    if (v17 >= a1[6] - 1) {
      uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @">=%d", objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 8), "objectAtIndexedSubscript:", a1[6] - 2), "intValue"));
    }
    else {
      uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"%d-%d", objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 8), "objectAtIndexedSubscript:", v17 - 1), "intValue"), objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 8), "objectAtIndexedSubscript:", v17), "intValue")- 1);
    }
  }
  else
  {
    uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"0-%d", objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 8), "objectAtIndexedSubscript:", 0), "intValue")- 1);
  }
  uint64_t v6 = MEMORY[0x1E4F143A8];
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = __48__CBHistogramBuilder2D_enumerateBinsUsingBlock___block_invoke_2;
  v10 = &unk_1E6218F50;
  uint64_t v12 = a1[5];
  unint64_t v13 = v17;
  uint64_t v11 = v14;
  return objc_msgSend(v18, "enumerateBinsUsingBlock:");
}

uint64_t __48__CBHistogramBuilder2D_enumerateBinsUsingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)reset
{
}

uint64_t __29__CBHistogramBuilder2D_reset__block_invoke(uint64_t a1, void *a2)
{
  return [a2 reset];
}

@end