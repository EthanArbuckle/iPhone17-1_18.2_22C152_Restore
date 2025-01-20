@interface NTAWorldClockPreferencesListenerObserver
- (BOOL)isEqual:(id)a3;
- (NSOperationQueue)queue;
- (NTAWorldClockPreferencesListenerObserver)initWithQueue:(id)a3 block:(id)a4;
- (id)block;
- (unint64_t)hash;
- (void)setBlock:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation NTAWorldClockPreferencesListenerObserver

- (NTAWorldClockPreferencesListenerObserver)initWithQueue:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)NTAWorldClockPreferencesListenerObserver;
  v8 = [(NTAWorldClockPreferencesListenerObserver *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(NTAWorldClockPreferencesListenerObserver *)v8 setQueue:v6];
    [(NTAWorldClockPreferencesListenerObserver *)v9 setBlock:v7];
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (NTAWorldClockPreferencesListenerObserver *)a3;
  if (v4 == self)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = [(NTAWorldClockPreferencesListenerObserver *)v5 queue];
      id v7 = [(NTAWorldClockPreferencesListenerObserver *)self queue];
      if ([v6 isEqual:v7])
      {
        v8 = [(NTAWorldClockPreferencesListenerObserver *)v5 block];
        v9 = [(NTAWorldClockPreferencesListenerObserver *)self block];
        BOOL v10 = v8 == v9;
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  v2 = [(NTAWorldClockPreferencesListenerObserver *)self queue];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end