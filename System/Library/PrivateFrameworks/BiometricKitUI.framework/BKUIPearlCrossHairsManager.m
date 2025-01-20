@interface BKUIPearlCrossHairsManager
- (BKUIPearlCrossHairsManager)init;
- (BOOL)grayscale;
- (InstanceInfo)instanceData;
- (NSMutableArray)springInstances;
- (id).cxx_construct;
- (void)addInstance:(id)a3;
- (void)setGrayscale:(BOOL)a3;
- (void)setSpringsStates:(unint64_t)a3;
- (void)setTarget:(BKUIPearlCrossHairsManager *)self;
- (void)setValue:(BKUIPearlCrossHairsManager *)self;
- (void)update:(double)a3;
@end

@implementation BKUIPearlCrossHairsManager

- (BKUIPearlCrossHairsManager)init
{
  v19.receiver = self;
  v19.super_class = (Class)BKUIPearlCrossHairsManager;
  v2 = [(BKUIPearlCrossHairsManager *)&v19 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    springInstances = v2->_springInstances;
    v2->_springInstances = v3;

    p_instanceVector = &v2->_instanceVector;
    begin = v2->_instanceVector.__begin_;
    if (begin)
    {
      v2->_instanceVector.__end_ = begin;
      operator delete(begin);
      p_instanceVector->__begin_ = 0;
      v2->_instanceVector.__end_ = 0;
      v2->_instanceVector.__end_cap_.__value_ = 0;
    }
    p_instanceVector->__begin_ = 0;
    v2->_instanceVector.__end_ = 0;
    v2->_instanceVector.__end_cap_.__value_ = 0;
    if (kinstancePerAxisCount >= 1)
    {
      int v7 = 0;
      __asm { FMOV            V0.4S, #1.0 }
      double v18 = *(double *)&_Q0;
      uint64_t v13 = MEMORY[0x1E4F50560];
      do
      {
        v14 = [[BKUIPearlSpringInstance alloc] initWithInitialRotation:0.0078125 color:v18];
        [(BKUIPearlSpringInstance *)v14 setAxisOrientation:1];
        -[BKUIPearlSpringInstance setParameters:](v14, "setParameters:", *(double *)&kinitialDamping + *(double *)&kdampingOffset * (double)v7, *(double *)(v13 + 8), *(double *)&kinitialResponse + *(double *)&kresponseOffset * (double)v7, *(double *)(v13 + 24));
        [(BKUIPearlCrossHairsManager *)v2 addInstance:v14];

        ++v7;
      }
      while (v7 < kinstancePerAxisCount);
      if (kinstancePerAxisCount >= 1)
      {
        int v15 = 0;
        do
        {
          v16 = [[BKUIPearlSpringInstance alloc] initWithInitialRotation:0.0078125 color:v18];
          [(BKUIPearlSpringInstance *)v16 setAxisOrientation:2];
          -[BKUIPearlSpringInstance setParameters:](v16, "setParameters:", *(double *)&kinitialDamping + *(double *)&kdampingOffset * (double)v15, *(double *)(v13 + 8), *(double *)&kinitialResponse + *(double *)&kresponseOffset * (double)v15, *(double *)(v13 + 24));
          [(BKUIPearlCrossHairsManager *)v2 addInstance:v16];

          ++v15;
        }
        while (v15 < kinstancePerAxisCount);
      }
    }
  }
  return v2;
}

- (void)setGrayscale:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v4 = [(BKUIPearlCrossHairsManager *)self springInstances];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) setGrayscale:v3];
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (BOOL)grayscale
{
  v2 = [(BKUIPearlCrossHairsManager *)self springInstances];
  BOOL v3 = [v2 firstObject];
  char v4 = [v3 grayscale];

  return v4;
}

- (void)addInstance:(id)a3
{
  id v30 = a3;
  -[NSMutableArray addObject:](self->_springInstances, "addObject:");
  [v30 matrix];
  long long v26 = v4;
  long long v27 = v5;
  long long v28 = v6;
  long long v29 = v7;
  [v30 color];
  long long v25 = v8;
  value = self->_instanceVector.__end_cap_.__value_;
  end = self->_instanceVector.__end_;
  if (end >= value)
  {
    begin = self->_instanceVector.__begin_;
    unint64_t v13 = 0xCCCCCCCCCCCCCCCDLL * ((end - begin) >> 4);
    unint64_t v14 = v13 + 1;
    if (v13 + 1 > 0x333333333333333) {
      std::vector<InstanceInfo>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v15 = 0xCCCCCCCCCCCCCCCDLL * ((value - begin) >> 4);
    if (2 * v15 > v14) {
      unint64_t v14 = 2 * v15;
    }
    if (v15 >= 0x199999999999999) {
      unint64_t v16 = 0x333333333333333;
    }
    else {
      unint64_t v16 = v14;
    }
    if (v16) {
      v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<InstanceInfo>>((uint64_t)&self->_instanceVector.__end_cap_, v16);
    }
    else {
      v17 = 0;
    }
    double v18 = &v17[80 * v13];
    objc_super v19 = (InstanceInfo *)&v17[80 * v16];
    *(_OWORD *)double v18 = v26;
    *((_OWORD *)v18 + 1) = v27;
    *((_OWORD *)v18 + 2) = v28;
    *((_OWORD *)v18 + 3) = v29;
    *((_OWORD *)v18 + 4) = v25;
    long long v11 = (InstanceInfo *)(v18 + 80);
    v21 = self->_instanceVector.__begin_;
    v20 = self->_instanceVector.__end_;
    if (v20 != v21)
    {
      do
      {
        *((_OWORD *)v18 - 5) = *((_OWORD *)v20 - 5);
        long long v22 = *((_OWORD *)v20 - 4);
        long long v23 = *((_OWORD *)v20 - 3);
        long long v24 = *((_OWORD *)v20 - 1);
        *((_OWORD *)v18 - 2) = *((_OWORD *)v20 - 2);
        *((_OWORD *)v18 - 1) = v24;
        *((_OWORD *)v18 - 4) = v22;
        *((_OWORD *)v18 - 3) = v23;
        v18 -= 80;
        v20 = (InstanceInfo *)((char *)v20 - 80);
      }
      while (v20 != v21);
      v20 = self->_instanceVector.__begin_;
    }
    self->_instanceVector.__begin_ = (InstanceInfo *)v18;
    self->_instanceVector.__end_ = v11;
    self->_instanceVector.__end_cap_.__value_ = v19;
    if (v20) {
      operator delete(v20);
    }
  }
  else
  {
    *(_OWORD *)end = v26;
    *((_OWORD *)end + 1) = v27;
    *((_OWORD *)end + 2) = v28;
    *((_OWORD *)end + 3) = v29;
    long long v11 = (InstanceInfo *)((char *)end + 80);
    *((_OWORD *)end + 4) = v8;
  }
  self->_instanceVector.__end_ = v11;
}

- (void)setTarget:(BKUIPearlCrossHairsManager *)self
{
  long long v7 = v2;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v3 = self->_springInstances;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6++), "setTarget:", *(double *)&v7, v7, (void)v8);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)setValue:(BKUIPearlCrossHairsManager *)self
{
  long long v7 = v2;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v3 = self->_springInstances;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6++), "setValue:", *(double *)&v7, v7, (void)v8);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)setSpringsStates:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = self->_springInstances;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "setSpringState:", a3, (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)update:(double)a3
{
  uint64_t v5 = 0;
  for (unint64_t i = 0; ; ++i)
  {
    uint64_t v7 = [(BKUIPearlCrossHairsManager *)self springInstances];
    unint64_t v8 = [v7 count];

    if (v8 <= i) {
      break;
    }
    long long v9 = [(BKUIPearlCrossHairsManager *)self springInstances];
    long long v10 = [v9 objectAtIndexedSubscript:i];

    [v10 step:a3];
    [v10 matrix];
    long long v19 = v12;
    long long v20 = v11;
    long long v17 = v14;
    long long v18 = v13;
    [v10 color];
    unint64_t v15 = (_OWORD *)((char *)self->_instanceVector.__begin_ + v5);
    *unint64_t v15 = v20;
    v15[1] = v19;
    v15[2] = v18;
    v15[3] = v17;
    v15[4] = v16;

    v5 += 80;
  }
}

- (InstanceInfo)instanceData
{
  return self->_instanceVector.__begin_;
}

- (NSMutableArray)springInstances
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_springInstances, 0);
  begin = self->_instanceVector.__begin_;
  if (begin)
  {
    self->_instanceVector.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end