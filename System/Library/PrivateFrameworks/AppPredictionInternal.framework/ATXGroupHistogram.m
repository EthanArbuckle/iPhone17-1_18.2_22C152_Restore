@interface ATXGroupHistogram
- (ATXGroupHistogram)init;
- (double)_getTotalScore;
- (double)getScoreForGroup:(id)a3;
- (void)addScore:(double)a3 group:(id)a4;
- (void)dealloc;
@end

@implementation ATXGroupHistogram

- (ATXGroupHistogram)init
{
  v6.receiver = self;
  v6.super_class = (Class)ATXGroupHistogram;
  v2 = [(ATXGroupHistogram *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    histogram = v2->_histogram;
    v2->_histogram = (NSMutableDictionary *)v3;

    v2->_total = 0.0;
    v2->_isTotalScoreValid = 1;
    pthread_mutex_init(&v2->_lock, 0);
  }
  return v2;
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)ATXGroupHistogram;
  [(ATXGroupHistogram *)&v3 dealloc];
}

- (void)addScore:(double)a3 group:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v9 = v6;
    pthread_mutex_lock(&self->_lock);
    self->_isTotalScoreValid = 0;
    v7 = [(NSMutableDictionary *)self->_histogram objectForKeyedSubscript:v9];

    if (v7)
    {
      v8 = [(NSMutableDictionary *)self->_histogram objectForKeyedSubscript:v9];
      [(ATXGroupHistogramEntry *)v8 addScore:a3];
    }
    else
    {
      v8 = [[ATXGroupHistogramEntry alloc] initWithScore:a3];
      [(NSMutableDictionary *)self->_histogram setObject:v8 forKeyedSubscript:v9];
    }

    pthread_mutex_unlock(&self->_lock);
    id v6 = v9;
  }
}

- (double)getScoreForGroup:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    p_lock = &self->_lock;
    pthread_mutex_lock(&self->_lock);
    [(ATXGroupHistogram *)self _getTotalScore];
    if (v6 == 0.0)
    {
      double v10 = 0.0;
    }
    else
    {
      double v7 = v6;
      v8 = [(NSMutableDictionary *)self->_histogram objectForKeyedSubscript:v4];
      [v8 score];
      double v10 = v9 / v7;
    }
    pthread_mutex_unlock(p_lock);
  }
  else
  {
    double v10 = 0.0;
  }

  return v10;
}

- (double)_getTotalScore
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!self->_isTotalScoreValid)
  {
    self->_total = 0.0;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    objc_super v3 = [(NSMutableDictionary *)self->_histogram objectEnumerator];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v3);
          }
          v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          double v9 = (double)(int)[v8 count];
          [v8 score];
          self->_total = self->_total + v9 * v10;
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v5);
    }

    self->_isTotalScoreValid = 1;
  }
  return self->_total;
}

- (void).cxx_destruct
{
}

@end