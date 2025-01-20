@interface ACXRemoteAppListObserver
- (ACXRemoteAppListObserver)initWithObserver:(id)a3 queue:(id)a4;
- (ACXRemoteAppListObserver)observer;
- (BOOL)isEqual:(id)a3;
- (OS_dispatch_queue)queue;
- (unint64_t)hash;
- (unint64_t)hashValue;
@end

@implementation ACXRemoteAppListObserver

- (ACXRemoteAppListObserver)initWithObserver:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ACXRemoteAppListObserver;
  v8 = [(ACXRemoteAppListObserver *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_observer, v6);
    objc_storeStrong((id *)&v9->_queue, a4);
    uint64_t v10 = [(ACXRemoteAppListObserver *)v9 observer];
    uint64_t v11 = [(ACXRemoteAppListObserver *)v9 queue];
    v9->_hashValue = v11 ^ v10;
  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [v5 observer];
    id v7 = [(ACXRemoteAppListObserver *)self observer];

    if (v6 == v7)
    {
      v9 = [v5 queue];
      uint64_t v10 = [(ACXRemoteAppListObserver *)self queue];
      BOOL v8 = v9 == v10;
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return [(ACXRemoteAppListObserver *)self hashValue];
}

- (ACXRemoteAppListObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);

  return (ACXRemoteAppListObserver *)WeakRetained;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (unint64_t)hashValue
{
  return self->_hashValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_observer);
}

@end