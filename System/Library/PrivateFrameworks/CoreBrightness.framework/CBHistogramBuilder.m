@interface CBHistogramBuilder
- (CBHistogramBuilder)initWithEdges:(id)a3;
- (NSArray)edges;
- (NSMutableArray)bins;
- (void)dealloc;
- (void)enumerateBinsUsingBlock:(id)a3;
- (void)pushNumber:(double)a3;
- (void)pushNumberWeighted:(double)a3 withWeight:(double)a4;
- (void)reset;
@end

@implementation CBHistogramBuilder

- (void)pushNumberWeighted:(double)a3 withWeight:(double)a4
{
  context = (void *)MEMORY[0x1BA9ECAE0]();
  unint64_t v11 = [(NSMutableArray *)self->_bins count];
  for (unint64_t i = 0; i < v11; ++i)
  {
    if (i + 1 != v11)
    {
      objc_msgSend(-[NSArray objectAtIndex:](self->_edges, "objectAtIndex:", i), "doubleValue");
      if (a3 >= v4) {
        continue;
      }
    }
    v9 = (void *)[(NSMutableArray *)self->_bins objectAtIndex:i];
    bins = self->_bins;
    v6 = NSNumber;
    [v9 doubleValue];
    -[NSMutableArray setObject:atIndexedSubscript:](bins, "setObject:atIndexedSubscript:", [v6 numberWithDouble:v5 + a4], i);
    break;
  }
}

- (CBHistogramBuilder)initWithEdges:(id)a3
{
  v12 = self;
  SEL v11 = a2;
  v10 = (NSArray *)a3;
  v9.receiver = self;
  v9.super_class = (Class)CBHistogramBuilder;
  v12 = [(CBHistogramBuilder *)&v9 init];
  if (v12)
  {
    context = (void *)MEMORY[0x1BA9ECAE0]();
    v3 = v10;
    v12->_edges = v10;
    unint64_t v8 = [(NSArray *)v10 count] + 1;
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v8];
    v12->_bins = (NSMutableArray *)v4;
    for (unint64_t i = 0; i < v8; ++i)
      [(NSMutableArray *)v12->_bins insertObject:&unk_1F1417990 atIndex:i];
  }
  return v12;
}

- (void)pushNumber:(double)a3
{
}

- (void)enumerateBinsUsingBlock:(id)a3
{
  v16 = self;
  SEL v15 = a2;
  id v14 = a3;
  context = (void *)MEMORY[0x1BA9ECAE0]();
  uint64_t v13 = 0;
  uint64_t v13 = [(NSMutableArray *)v16->_bins count];
  bins = v16->_bins;
  uint64_t v5 = MEMORY[0x1E4F143A8];
  int v6 = -1073741824;
  int v7 = 0;
  unint64_t v8 = __46__CBHistogramBuilder_enumerateBinsUsingBlock___block_invoke;
  objc_super v9 = &unk_1E6218F28;
  v10 = v16;
  uint64_t v12 = v13;
  id v11 = v14;
  -[NSMutableArray enumerateObjectsUsingBlock:](bins, "enumerateObjectsUsingBlock:");
}

uint64_t __46__CBHistogramBuilder_enumerateBinsUsingBlock___block_invoke(void *a1, uint64_t a2, unint64_t a3)
{
  if (a3)
  {
    if (a3 >= a1[6] - 1) {
      objc_msgSend(NSString, "stringWithFormat:", @">=%d", objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 16), "objectAtIndexedSubscript:", a1[6] - 2), "intValue"));
    }
    else {
      objc_msgSend(NSString, "stringWithFormat:", @"%d-%d", objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 16), "objectAtIndexedSubscript:", a3 - 1), "intValue"), objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 16), "objectAtIndexedSubscript:", a3), "intValue")- 1);
    }
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"0-%d", objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 16), "objectAtIndexedSubscript:", 0), "intValue")- 1);
  }
  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

- (void)reset
{
  context = (void *)MEMORY[0x1BA9ECAE0]();
  unint64_t v4 = [(NSMutableArray *)self->_bins count];
  [(NSMutableArray *)self->_bins removeAllObjects];
  for (unint64_t i = 0; i < v4; ++i)
    [(NSMutableArray *)self->_bins insertObject:&unk_1F1417990 atIndex:i];
}

- (void)dealloc
{
  unint64_t v4 = self;
  SEL v3 = a2;

  v2.receiver = v4;
  v2.super_class = (Class)CBHistogramBuilder;
  [(CBHistogramBuilder *)&v2 dealloc];
}

- (NSMutableArray)bins
{
  return self->_bins;
}

- (NSArray)edges
{
  return self->_edges;
}

@end