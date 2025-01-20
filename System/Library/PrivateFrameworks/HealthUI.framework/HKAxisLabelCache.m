@interface HKAxisLabelCache
- (BOOL)_axisLabel:(id)a3 insideModelRange:(id)a4;
- (HKAxisLabelCache)initWithLabelDataSource:(id)a3;
- (HKAxisLabelDataSource)axisLabelDataSource;
- (HKValueRange)lastRequestRange;
- (NSArray)lastRequestData;
- (NSCache)mainCache;
- (NSLock)axisLabelCacheLock;
- (id)_axisLabelsForPage:(id)a3 zoomScale:(double)a4;
- (id)allAxisLabelsForRange:(id)a3 zoomScale:(double)a4;
- (void)_handleTimeChangeNotification:(id)a3;
- (void)dealloc;
- (void)invalidateCache;
- (void)setLastRequestData:(id)a3;
- (void)setLastRequestRange:(id)a3;
- (void)setMainCache:(id)a3;
@end

@implementation HKAxisLabelCache

- (HKAxisLabelCache)initWithLabelDataSource:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKAxisLabelCache;
  v5 = [(HKAxisLabelCache *)&v15 init];
  if (v5)
  {
    v6 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    mainCache = v5->_mainCache;
    v5->_mainCache = v6;

    lastRequestRange = v5->_lastRequestRange;
    v5->_lastRequestRange = 0;

    lastRequestData = v5->_lastRequestData;
    v5->_lastRequestData = 0;

    objc_storeWeak((id *)&v5->_axisLabelDataSource, v4);
    v10 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    axisLabelCacheLock = v5->_axisLabelCacheLock;
    v5->_axisLabelCacheLock = v10;

    [(NSLock *)v5->_axisLabelCacheLock setName:@"HKAxisLabelCacheLock"];
    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v5 selector:sel__handleTimeChangeNotification_ name:*MEMORY[0x1E4FB2708] object:0];

    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:v5 selector:sel__handleTimeChangeNotification_ name:*MEMORY[0x1E4F1C370] object:0];
  }
  return v5;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HKAxisLabelCache;
  [(HKAxisLabelCache *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axisLabelCacheLock, 0);
  objc_destroyWeak((id *)&self->_axisLabelDataSource);
  objc_storeStrong((id *)&self->_lastRequestData, 0);
  objc_storeStrong((id *)&self->_lastRequestRange, 0);
  objc_storeStrong((id *)&self->_mainCache, 0);
}

- (id)allAxisLabelsForRange:(id)a3 zoomScale:(double)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(HKAxisLabelCache *)self axisLabelCacheLock];
  [v7 lock];

  v8 = [(HKAxisLabelCache *)self lastRequestRange];
  int v9 = [v6 isEqual:v8];

  if (v9)
  {
    id v10 = [(HKAxisLabelCache *)self lastRequestData];
    v11 = [(HKAxisLabelCache *)self axisLabelCacheLock];
    [v11 unlock];
  }
  else
  {
    v12 = [(HKAxisLabelCache *)self axisLabelDataSource];
    v13 = [v12 cacheKeysForModelRange:v6 zoomScale:a4];

    if (v13)
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      v28 = v13;
      id obj = v13;
      uint64_t v31 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
      v14 = 0;
      if (v31)
      {
        uint64_t v30 = *(void *)v38;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v38 != v30) {
              objc_enumerationMutation(obj);
            }
            uint64_t v32 = v15;
            v16 = [(HKAxisLabelCache *)self _axisLabelsForPage:*(void *)(*((void *)&v37 + 1) + 8 * v15) zoomScale:a4];
            long long v33 = 0u;
            long long v34 = 0u;
            long long v35 = 0u;
            long long v36 = 0u;
            uint64_t v17 = [v16 countByEnumeratingWithState:&v33 objects:v41 count:16];
            if (v17)
            {
              uint64_t v18 = v17;
              uint64_t v19 = *(void *)v34;
              char v20 = 1;
              do
              {
                for (uint64_t i = 0; i != v18; ++i)
                {
                  if (*(void *)v34 != v19) {
                    objc_enumerationMutation(v16);
                  }
                  v22 = *(void **)(*((void *)&v33 + 1) + 8 * i);
                  if ([(HKAxisLabelCache *)self _axisLabel:v22 insideModelRange:v6])
                  {
                    if (v20 & 1) != 0 && ([v22 isEqual:v14])
                    {
                      char v20 = 0;
                    }
                    else
                    {
                      [v10 addObject:v22];
                      id v23 = v22;

                      char v20 = 0;
                      v14 = v23;
                    }
                  }
                }
                uint64_t v18 = [v16 countByEnumeratingWithState:&v33 objects:v41 count:16];
              }
              while (v18);
            }

            uint64_t v15 = v32 + 1;
          }
          while (v32 + 1 != v31);
          uint64_t v31 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
        }
        while (v31);
      }

      [(HKAxisLabelCache *)self setLastRequestRange:v6];
      [(HKAxisLabelCache *)self setLastRequestData:v10];
      v24 = [(HKAxisLabelCache *)self axisLabelCacheLock];
      [v24 unlock];

      v13 = v28;
    }
    else
    {
      v25 = [(HKAxisLabelCache *)self axisLabelDataSource];
      id v10 = [v25 findAxisLabelsInModelRange:v6 zoomScale:a4];

      [(HKAxisLabelCache *)self setLastRequestRange:v6];
      [(HKAxisLabelCache *)self setLastRequestData:v10];
      v26 = [(HKAxisLabelCache *)self axisLabelCacheLock];
      [v26 unlock];
    }
  }

  return v10;
}

- (BOOL)_axisLabel:(id)a3 insideModelRange:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [v6 location];
  v8 = [v5 minValue];
  uint64_t v9 = [v7 compare:v8];

  id v10 = [v6 location];

  v11 = [v5 maxValue];

  uint64_t v12 = [v10 compare:v11];
  return v9 != -1 && v12 != 1;
}

- (id)_axisLabelsForPage:(id)a3 zoomScale:(double)a4
{
  id v6 = a3;
  v7 = [(HKAxisLabelCache *)self mainCache];
  v8 = [v7 objectForKey:v6];

  if (!v8)
  {
    uint64_t v9 = [(HKAxisLabelCache *)self axisLabelDataSource];
    v8 = [v9 findAxisLabelsInModelRange:v6 zoomScale:a4];

    id v10 = [(HKAxisLabelCache *)self mainCache];
    [v10 setObject:v8 forKey:v6];
  }
  return v8;
}

- (void)invalidateCache
{
  v3 = [(HKAxisLabelCache *)self axisLabelCacheLock];
  [v3 lock];

  [(NSCache *)self->_mainCache removeAllObjects];
  [(HKAxisLabelCache *)self setLastRequestRange:0];
  [(HKAxisLabelCache *)self setLastRequestData:0];
  id v4 = [(HKAxisLabelCache *)self axisLabelCacheLock];
  [v4 unlock];
}

- (void)_handleTimeChangeNotification:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__HKAxisLabelCache__handleTimeChangeNotification___block_invoke;
  block[3] = &unk_1E6D50ED8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __50__HKAxisLabelCache__handleTimeChangeNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidateCache];
}

- (NSCache)mainCache
{
  return self->_mainCache;
}

- (void)setMainCache:(id)a3
{
}

- (HKValueRange)lastRequestRange
{
  return self->_lastRequestRange;
}

- (void)setLastRequestRange:(id)a3
{
}

- (NSArray)lastRequestData
{
  return self->_lastRequestData;
}

- (void)setLastRequestData:(id)a3
{
}

- (HKAxisLabelDataSource)axisLabelDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_axisLabelDataSource);
  return (HKAxisLabelDataSource *)WeakRetained;
}

- (NSLock)axisLabelCacheLock
{
  return self->_axisLabelCacheLock;
}

@end