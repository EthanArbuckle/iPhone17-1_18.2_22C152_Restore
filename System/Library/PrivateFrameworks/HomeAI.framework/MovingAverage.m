@interface MovingAverage
- (MovingAverage)initWithWindowSize:(unint64_t)a3;
- (NSMutableArray)queue;
- (double)movingAverage;
- (double)movingAverageForInterval:(double)a3 defaultValue:(double)a4;
- (unint64_t)windowSize;
- (void)addNumber:(id)a3;
- (void)setMovingAverage:(double)a3;
- (void)setQueue:(id)a3;
@end

@implementation MovingAverage

- (MovingAverage)initWithWindowSize:(unint64_t)a3
{
  v13.receiver = self;
  v13.super_class = (Class)MovingAverage;
  v4 = [(MovingAverage *)&v13 init];
  v5 = v4;
  if (v4)
  {
    if (!a3)
    {
      v9 = (void *)MEMORY[0x263EFF940];
      uint64_t v10 = *MEMORY[0x263EFF4A0];
      v11 = [NSString stringWithFormat:@"Invalid parameter for windowSize: %lu, windowSize must be > 0", 0];
      id v12 = [v9 exceptionWithName:v10 reason:v11 userInfo:0];

      objc_exception_throw(v12);
    }
    v4->_windowSize = a3;
    uint64_t v6 = [MEMORY[0x263EFF980] arrayWithCapacity:a3];
    queue = v5->_queue;
    v5->_queue = (NSMutableArray *)v6;

    v5->_movingAverage = 0.0;
    v5->_lock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

- (void)addNumber:(id)a3
{
  id v4 = a3;
  if ([(MovingAverage *)self windowSize])
  {
    os_unfair_lock_lock_with_options();
    v5 = [(MovingAverage *)self queue];
    unint64_t v6 = [v5 count];
    unint64_t v7 = [(MovingAverage *)self windowSize];

    if (v6 >= v7)
    {
      v8 = [(MovingAverage *)self queue];
      objc_msgSend(v8, "hmf_removeFirstObject");
    }
    v9 = [(MovingAverage *)self queue];
    uint64_t v10 = [[MovingAverageEntry alloc] initWithValue:v4];
    [v9 addObject:v10];

    uint64_t v15 = 0;
    v16 = (double *)&v15;
    uint64_t v17 = 0x2020000000;
    uint64_t v18 = 0;
    v11 = [(MovingAverage *)self queue];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __27__MovingAverage_addNumber___block_invoke;
    v14[3] = &unk_26477C138;
    v14[4] = &v15;
    objc_msgSend(v11, "na_each:", v14);

    double v12 = v16[3];
    objc_super v13 = [(MovingAverage *)self queue];
    -[MovingAverage setMovingAverage:](self, "setMovingAverage:", v12 / (double)(unint64_t)[v13 count]);

    _Block_object_dispose(&v15, 8);
    os_unfair_lock_unlock(&self->_lock);
  }
}

void __27__MovingAverage_addNumber___block_invoke(uint64_t a1, void *a2)
{
  id v4 = [a2 value];
  [v4 doubleValue];
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3
                                                              + *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
}

- (double)movingAverageForInterval:(double)a3 defaultValue:(double)a4
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v8 = [MEMORY[0x263EFF910] now];
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  int v25 = 0;
  uint64_t v18 = 0;
  v19 = (double *)&v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  v9 = [(MovingAverage *)self queue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __55__MovingAverage_movingAverageForInterval_defaultValue___block_invoke;
  v13[3] = &unk_26477C160;
  id v10 = v8;
  double v17 = a3;
  id v14 = v10;
  uint64_t v15 = &v18;
  v16 = &v22;
  objc_msgSend(v9, "na_each:", v13);

  int v11 = *((_DWORD *)v23 + 6);
  if (v11) {
    a4 = v19[3] / (double)v11;
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  os_unfair_lock_unlock(p_lock);
  return a4;
}

void __55__MovingAverage_movingAverageForInterval_defaultValue___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v10 = v3;
  v5 = [v3 date];
  [v4 timeIntervalSinceDate:v5];
  double v7 = v6;

  if (v7 < *(double *)(a1 + 56))
  {
    v8 = [v10 value];
    [v8 doubleValue];
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v9
                                                                + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 24);

    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
}

- (double)movingAverage
{
  return self->_movingAverage;
}

- (void)setMovingAverage:(double)a3
{
  self->_movingAverage = a3;
}

- (NSMutableArray)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (unint64_t)windowSize
{
  return self->_windowSize;
}

- (void).cxx_destruct
{
}

@end